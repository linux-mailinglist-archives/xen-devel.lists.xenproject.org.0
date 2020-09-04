Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2225E169
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 20:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEGIm-0002Xn-Bz; Fri, 04 Sep 2020 18:19:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGI=CN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kEGIk-0002XE-TI
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 18:19:06 +0000
X-Inumbo-ID: b1aaa85f-ed41-4092-8ec9-45face49991d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1aaa85f-ed41-4092-8ec9-45face49991d;
 Fri, 04 Sep 2020 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599243545;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=h2fDhsVdGusw5v5GgN1UDDuObQLtUu5dl2VEhS9jMqc=;
 b=ZrxQ8CS0dPYAXTCDMWOVJA2vO7nlPbwlz9RI0Ski9hmxkIt9YSCExDee
 ymENuraO2eVUEyvzZlYgZpmDhzlxPGQyhZH6tRCjUAQRMvJOBuGIzf0tt
 YnasHDO+T9TYIfQkMtuy+qj8Oq0U8PuSmxOqhHE9K63M+SXtTJETOwXio s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 300TaCYtoTB417JwW29/S7bYUUSk/ki1Os2aCMZU/QdaE3fxSZXCP4hzhP4nEHipwZiQeexLL1
 gSVz26PDlLvDHMNKLh12/Yj7MDZXEGr11Da/n5XZhq/Amog2lpvUiq9jj7/9z1mnxsQvmHzRXn
 N3hnEfBLC4CDrPwT1fjL7ioUFG+vcqbTbDYFVj51kZMs5Fn6VmIsLZuk+hlqxctSdBuM98DRbJ
 8djB4hZl9DLla2IbjijhnPj7ofQ46dGi+rfJ1jpgryinPxaFom6llrkBQcuQjH5aiL5WSwCvwv
 OtU=
X-SBRS: 2.7
X-MesageID: 26369831
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,390,1592884800"; d="scan'208";a="26369831"
Subject: Re: [PATCH] x86: guard against straight-line speculation past RET
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <deb41469-37b1-f2da-cc76-70720fe85dbe@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <38aaf96b-1235-b205-71d6-16aee057c402@citrix.com>
Date: Fri, 4 Sep 2020 19:18:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <deb41469-37b1-f2da-cc76-70720fe85dbe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 24/08/2020 13:50, Jan Beulich wrote:
> --- a/xen/include/asm-x86/asm-defns.h
> +++ b/xen/include/asm-x86/asm-defns.h
> @@ -50,3 +50,19 @@
>  .macro INDIRECT_JMP arg:req
>      INDIRECT_BRANCH jmp \arg
>  .endm
> +
> +/*
> + * To guard against speculation past RET, insert a breakpoint insn
> + * immediately after them.
> + */
> +.macro ret operand:vararg
> +    ret$ \operand
> +.endm
> +.macro ret$ operand:vararg
> +    .purgem ret
> +    ret \operand
> +    int $3
> +    .macro ret operand:vararg
> +        ret$ \\(operand)
> +    .endm
> +.endm

Several observations.  First, clang chokes on this:

<instantiation>:2:9: error: unknown token in expression
    ret \\(operand)
        ^

Second, you mean int3 rather than int $3.  By convention, they are
synonymous, but the second one really ought to be the two byte encoding,
rather than the single byte encoding, and we really want the single byte
version for code volume reasons.

Third, there is a huge quantity of complexity for a form of the
instruction we don't use.  Instead:

.macro ret operand:vararg
    .ifnb \operand
        .error "TODO - speculation safety for 'ret $imm'"
    .endif

    .byte 0xc3
    int3
.endm

is much simpler, and compatible with both GCC and Clang.

Almost...

Clang doesn't actually expand the macro for ret instructions, so a Clang
build of Xen only ends up getting protected in the assembly files.

The following experiment demonstrates the issue:

$ cat ret.c
asm (".macro ret\n\t"
     ".error \"foo\"\n\t"
     ".endm\n\t");
void foo(void) {}

$ gcc -O3 -c ret.c -o ret.o && objdump -d ret.o
/tmp/ccf8hkyN.s: Assembler messages:
/tmp/ccf8hkyN.s:16: Error: foo

$ clang-10 -O3 -c ret.c -o ret.o && objdump -d ret.o

ret.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <foo>:
   0:    c3                       retq


Worse, -no-integrated-as doesn't immediately help, even though it
invokes $(AS).

I tracked that down to the difference between ret and retq, which
highlights an assumption about GCC which may not remain true in the future.

Adding a second macro covering retq fixes the scenario in combination
with -no-integrated-as.

So overall I think we can make a safe binary with a clang build. 
However, it is at the expense of the integrated assembler, which I
believe is now mandatory for LTO, and control-flow integrity, neither of
which we want to lose in the long term.

~Andrew

