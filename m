Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B874325F669
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 11:26:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFDOs-0005S8-J3; Mon, 07 Sep 2020 09:25:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFDOr-0005S3-3R
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 09:25:21 +0000
X-Inumbo-ID: b4a488f3-4f5f-48d6-94aa-44320a93c939
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4a488f3-4f5f-48d6-94aa-44320a93c939;
 Mon, 07 Sep 2020 09:25:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31BEEAD1E;
 Mon,  7 Sep 2020 09:25:20 +0000 (UTC)
Subject: Re: [PATCH] x86: guard against straight-line speculation past RET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <deb41469-37b1-f2da-cc76-70720fe85dbe@suse.com>
 <38aaf96b-1235-b205-71d6-16aee057c402@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0a5df1b-8e8c-e650-9cfc-183d48e87a47@suse.com>
Date: Mon, 7 Sep 2020 11:25:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <38aaf96b-1235-b205-71d6-16aee057c402@citrix.com>
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

On 04.09.2020 20:18, Andrew Cooper wrote:
> On 24/08/2020 13:50, Jan Beulich wrote:
>> --- a/xen/include/asm-x86/asm-defns.h
>> +++ b/xen/include/asm-x86/asm-defns.h
>> @@ -50,3 +50,19 @@
>>  .macro INDIRECT_JMP arg:req
>>      INDIRECT_BRANCH jmp \arg
>>  .endm
>> +
>> +/*
>> + * To guard against speculation past RET, insert a breakpoint insn
>> + * immediately after them.
>> + */
>> +.macro ret operand:vararg
>> +    ret$ \operand
>> +.endm
>> +.macro ret$ operand:vararg
>> +    .purgem ret
>> +    ret \operand
>> +    int $3
>> +    .macro ret operand:vararg
>> +        ret$ \\(operand)
>> +    .endm
>> +.endm
> 
> Several observations.  First, clang chokes on this:
> 
> <instantiation>:2:9: error: unknown token in expression
>     ret \\(operand)
>         ^

Must be clang more recent than the 5.x one I've tested with; likely
because there we end up using -mno-integrated-as.

> Second, you mean int3 rather than int $3.  By convention, they are
> synonymous, but the second one really ought to be the two byte encoding,
> rather than the single byte encoding, and we really want the single byte
> version for code volume reasons.

Well, no, I didn't mean "int3", but I've switched nevertheless, just
for consistency with the earlier change of yours referenced in the
description. To me "int3" has only ever been a kludge. Assemblers
I've grown up with don't know such a mnemonic. Nor did Intel
originally document it, and AMD still doesn't.

> Third, there is a huge quantity of complexity for a form of the
> instruction we don't use.

The complexity isn't with handling the possible immediate operand,
but with the need to override the "ret" insn, and then to transiently
cancel this override.

>  Instead:
> 
> .macro ret operand:vararg
>     .ifnb \operand
>         .error "TODO - speculation safety for 'ret $imm'"
>     .endif
> 
>     .byte 0xc3
>     int3
> .endm
> 
> is much simpler, and compatible with both GCC and Clang.

I really wish to avoid .byte for code emission whenever possible.
It subverts the assembler applying sanity checks. This may not be
overly relevant here, but then we would still better avoid setting
precedents. However, if clang can't be made work without going
this route, so be it.

> Almost...
> 
> Clang doesn't actually expand the macro for ret instructions, so a Clang
> build of Xen only ends up getting protected in the assembly files.
> 
> The following experiment demonstrates the issue:
> 
> $ cat ret.c
> asm (".macro ret\n\t"
>      ".error \"foo\"\n\t"
>      ".endm\n\t");
> void foo(void) {}
> 
> $ gcc -O3 -c ret.c -o ret.o && objdump -d ret.o
> /tmp/ccf8hkyN.s: Assembler messages:
> /tmp/ccf8hkyN.s:16: Error: foo
> 
> $ clang-10 -O3 -c ret.c -o ret.o && objdump -d ret.o
> 
> ret.o:     file format elf64-x86-64
> 
> 
> Disassembly of section .text:
> 
> 0000000000000000 <foo>:
>    0:    c3                       retq
> 
> 
> Worse, -no-integrated-as doesn't immediately help, even though it
> invokes $(AS).
> 
> I tracked that down to the difference between ret and retq, which
> highlights an assumption about GCC which may not remain true in the future.
> 
> Adding a second macro covering retq fixes the scenario in combination
> with -no-integrated-as.

Ah, yes, I should of course have thought of retq. Albeit as per
above - generated code looks fine here when using clang 5.

> So overall I think we can make a safe binary with a clang build. 
> However, it is at the expense of the integrated assembler, which I
> believe is now mandatory for LTO, and control-flow integrity, neither of
> which we want to lose in the long term.

Why at this expense? Are you saying that even when going the .byte
route and even with very new clang one has to force
-mno-integrated-as?

Jan

