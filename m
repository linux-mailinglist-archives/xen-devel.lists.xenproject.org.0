Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C125FC2F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:40:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIJe-0002KM-C7; Mon, 07 Sep 2020 14:40:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFIJc-0002KG-9w
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:40:16 +0000
X-Inumbo-ID: f5e0c74e-e566-4680-92f0-294371474e6c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5e0c74e-e566-4680-92f0-294371474e6c;
 Mon, 07 Sep 2020 14:40:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D72F8AF37;
 Mon,  7 Sep 2020 14:40:14 +0000 (UTC)
Subject: Re: [PATCH] x86: guard against straight-line speculation past RET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <deb41469-37b1-f2da-cc76-70720fe85dbe@suse.com>
 <38aaf96b-1235-b205-71d6-16aee057c402@citrix.com>
 <d0a5df1b-8e8c-e650-9cfc-183d48e87a47@suse.com>
 <90617363-0dc8-83b3-4b23-8007b969564e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fb5cc5b-b266-28f3-4168-839b8d80d96b@suse.com>
Date: Mon, 7 Sep 2020 16:40:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <90617363-0dc8-83b3-4b23-8007b969564e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 15:50, Andrew Cooper wrote:
> On 07/09/2020 10:25, Jan Beulich wrote:
>> On 04.09.2020 20:18, Andrew Cooper wrote:
>>> Third, there is a huge quantity of complexity for a form of the
>>> instruction we don't use.
>> The complexity isn't with handling the possible immediate operand,
>> but with the need to override the "ret" insn, and then to transiently
>> cancel this override.
> 
> What is the purpose of transiently cancelling the override?

To have access to the underlying insn again.

> It's not possible to pull this trick twice, so its not as if you're
> falling back to a different macro rather than the plain instruction.

Not sure I understand what you're saying here. The helper macro
purging and then re-instating the insn surrogate macro can be
done any number of times.

>>> Clang doesn't actually expand the macro for ret instructions, so a Clang
>>> build of Xen only ends up getting protected in the assembly files.
>>>
>>> The following experiment demonstrates the issue:
>>>
>>> $ cat ret.c
>>> asm (".macro ret\n\t"
>>>      ".error \"foo\"\n\t"
>>>      ".endm\n\t");
>>> void foo(void) {}
>>>
>>> $ gcc -O3 -c ret.c -o ret.o && objdump -d ret.o
>>> /tmp/ccf8hkyN.s: Assembler messages:
>>> /tmp/ccf8hkyN.s:16: Error: foo
>>>
>>> $ clang-10 -O3 -c ret.c -o ret.o && objdump -d ret.o
>>>
>>> ret.o:     file format elf64-x86-64
>>>
>>>
>>> Disassembly of section .text:
>>>
>>> 0000000000000000 <foo>:
>>>    0:    c3                       retq
>>>
>>>
>>> Worse, -no-integrated-as doesn't immediately help, even though it
>>> invokes $(AS).
>>>
>>> I tracked that down to the difference between ret and retq, which
>>> highlights an assumption about GCC which may not remain true in the future.
>>>
>>> Adding a second macro covering retq fixes the scenario in combination
>>> with -no-integrated-as.
>> Ah, yes, I should of course have thought of retq. Albeit as per
>> above - generated code looks fine here when using clang 5.
>>
>>> So overall I think we can make a safe binary with a clang build. 
>>> However, it is at the expense of the integrated assembler, which I
>>> believe is now mandatory for LTO, and control-flow integrity, neither of
>>> which we want to lose in the long term.
>> Why at this expense? Are you saying that even when going the .byte
>> route and even with very new clang one has to force
>> -mno-integrated-as?
> 
> Yes, which was the whole point of providing the full transcript above.
> 
> You can't wrap an instruction with a macro with the integrated assembler.

Ugly. I can't currently think of a way to address this then, for clang,
other than by them offering a suitable command line option. Question is:
Do we consider it worthwhile then to still address for gcc? Or shall I
drop the patch?

Jan

