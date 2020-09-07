Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED025FBAA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 15:51:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFHXY-00056X-8H; Mon, 07 Sep 2020 13:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXUe=CQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFHXW-00056S-BN
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 13:50:34 +0000
X-Inumbo-ID: b558502f-49ab-4657-928c-0d83f0540d2d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b558502f-49ab-4657-928c-0d83f0540d2d;
 Mon, 07 Sep 2020 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599486633;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EvX1OJy9Fgh9Iz54J4UgCfcAe0SGuCH7OqzhFkP2HYA=;
 b=IlDpjoBFNtzJBwgaomiL4yXxoQ33v8kRc6HrEza/tB/gXR1lm/W0H3CU
 rts80NoPNnrFAefNke4v6d9ooflA5EL6j6lqAy2tZ6hy6PUD1ZQQ47K/5
 9jIit8nJ6xgIgEBhuY61h9OlM9NanpPtT6/LUifA8nyJ4rV7wR1vJVtTs s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ge9CDw390GoZansWk84JVvsebpZFLgeLC8OZ/xL31IXAJ0ZfD+HJWrZ9axUFMrnlsNgfwm4iOa
 lA5KEq9vXy1IJNr33L0/odR0GrS0x+dD8BLdh47pHyOT55j09jTjed58S+CkzLyWoBh5PmtWHs
 RIASp2dXWjZ9qBzBHh7wbNQojUE+yGc+lZy5SxvQMKU9JF1v/NJdTMx3ya7MEMJyXA0nmg6glC
 TAb03Jr8yZDd07bz0XyaQ5boaFbvaZkv4lBTPm2QDajRVYiafn1phXl3K+8VYcUxxBvTfnFTwb
 7EQ=
X-SBRS: 2.7
X-MesageID: 26111780
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26111780"
Subject: Re: [PATCH] x86: guard against straight-line speculation past RET
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <deb41469-37b1-f2da-cc76-70720fe85dbe@suse.com>
 <38aaf96b-1235-b205-71d6-16aee057c402@citrix.com>
 <d0a5df1b-8e8c-e650-9cfc-183d48e87a47@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <90617363-0dc8-83b3-4b23-8007b969564e@citrix.com>
Date: Mon, 7 Sep 2020 14:50:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0a5df1b-8e8c-e650-9cfc-183d48e87a47@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 07/09/2020 10:25, Jan Beulich wrote:
> On 04.09.2020 20:18, Andrew Cooper wrote:
>> On 24/08/2020 13:50, Jan Beulich wrote:
>>> --- a/xen/include/asm-x86/asm-defns.h
>>> +++ b/xen/include/asm-x86/asm-defns.h
>>> @@ -50,3 +50,19 @@
>>>  .macro INDIRECT_JMP arg:req
>>>      INDIRECT_BRANCH jmp \arg
>>>  .endm
>>> +
>>> +/*
>>> + * To guard against speculation past RET, insert a breakpoint insn
>>> + * immediately after them.
>>> + */
>>> +.macro ret operand:vararg
>>> +    ret$ \operand
>>> +.endm
>>> +.macro ret$ operand:vararg
>>> +    .purgem ret
>>> +    ret \operand
>>> +    int $3
>>> +    .macro ret operand:vararg
>>> +        ret$ \\(operand)
>>> +    .endm
>>> +.endm
>> Several observations.  First, clang chokes on this:
>>
>> <instantiation>:2:9: error: unknown token in expression
>>     ret \\(operand)
>>         ^
> Must be clang more recent than the 5.x one I've tested with; likely
> because there we end up using -mno-integrated-as.
>
>> Second, you mean int3 rather than int $3.  By convention, they are
>> synonymous, but the second one really ought to be the two byte encoding,
>> rather than the single byte encoding, and we really want the single byte
>> version for code volume reasons.
> Well, no, I didn't mean "int3", but I've switched nevertheless, just
> for consistency with the earlier change of yours referenced in the
> description. To me "int3" has only ever been a kludge.

Far less of a kludge than having `int $3` magically have a different
encoding to every other `int $n` instructions, which is how assemblers
behave in practice.

> Assemblers
> I've grown up with don't know such a mnemonic. Nor did Intel
> originally document it, and AMD still doesn't.

APM 3, page 413.

>> Third, there is a huge quantity of complexity for a form of the
>> instruction we don't use.
> The complexity isn't with handling the possible immediate operand,
> but with the need to override the "ret" insn, and then to transiently
> cancel this override.

What is the purpose of transiently cancelling the override?

It's not possible to pull this trick twice, so its not as if you're
falling back to a different macro rather than the plain instruction.

>>   Instead:
>>
>> .macro ret operand:vararg
>>     .ifnb \operand
>>         .error "TODO - speculation safety for 'ret $imm'"
>>     .endif
>>
>>     .byte 0xc3
>>     int3
>> .endm
>>
>> is much simpler, and compatible with both GCC and Clang.
> I really wish to avoid .byte for code emission whenever possible.
> It subverts the assembler applying sanity checks. This may not be
> overly relevant here, but then we would still better avoid setting
> precedents. However, if clang can't be made work without going
> this route, so be it.
>
>> Almost...
>>
>> Clang doesn't actually expand the macro for ret instructions, so a Clang
>> build of Xen only ends up getting protected in the assembly files.
>>
>> The following experiment demonstrates the issue:
>>
>> $ cat ret.c
>> asm (".macro ret\n\t"
>>      ".error \"foo\"\n\t"
>>      ".endm\n\t");
>> void foo(void) {}
>>
>> $ gcc -O3 -c ret.c -o ret.o && objdump -d ret.o
>> /tmp/ccf8hkyN.s: Assembler messages:
>> /tmp/ccf8hkyN.s:16: Error: foo
>>
>> $ clang-10 -O3 -c ret.c -o ret.o && objdump -d ret.o
>>
>> ret.o:     file format elf64-x86-64
>>
>>
>> Disassembly of section .text:
>>
>> 0000000000000000 <foo>:
>>    0:    c3                       retq
>>
>>
>> Worse, -no-integrated-as doesn't immediately help, even though it
>> invokes $(AS).
>>
>> I tracked that down to the difference between ret and retq, which
>> highlights an assumption about GCC which may not remain true in the future.
>>
>> Adding a second macro covering retq fixes the scenario in combination
>> with -no-integrated-as.
> Ah, yes, I should of course have thought of retq. Albeit as per
> above - generated code looks fine here when using clang 5.
>
>> So overall I think we can make a safe binary with a clang build. 
>> However, it is at the expense of the integrated assembler, which I
>> believe is now mandatory for LTO, and control-flow integrity, neither of
>> which we want to lose in the long term.
> Why at this expense? Are you saying that even when going the .byte
> route and even with very new clang one has to force
> -mno-integrated-as?

Yes, which was the whole point of providing the full transcript above.

You can't wrap an instruction with a macro with the integrated assembler.

~Andrew

