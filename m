Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05F28CD84
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 14:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6172.16318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIyv-0003Va-IM; Tue, 13 Oct 2020 12:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6172.16318; Tue, 13 Oct 2020 12:00:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIyv-0003VB-F5; Tue, 13 Oct 2020 12:00:41 +0000
Received: by outflank-mailman (input) for mailman id 6172;
 Tue, 13 Oct 2020 12:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSIyt-0003V6-Tu
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:00:39 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee652bcc-c1e5-4ead-a737-9782639bd9d7;
 Tue, 13 Oct 2020 12:00:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSIyt-0003V6-Tu
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:00:39 +0000
X-Inumbo-ID: ee652bcc-c1e5-4ead-a737-9782639bd9d7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ee652bcc-c1e5-4ead-a737-9782639bd9d7;
	Tue, 13 Oct 2020 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602590438;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=E7GxwzWxftx+vIFUDU59arHjDwX2Rf4nqMamUhfigvo=;
  b=H4Trpl0boDZTq2mCUu6f3bGP1RofRtItfvTRSXkwctn9N3rwibT0hkLp
   n1qvv8MxQWRRLT0Beah1ZP3OjChThEp7H24CnoZk15b9EJxX8bZuMyDfX
   zeWsenqWkLGxQ5aff1+6ei0o2l6UUy+MKxVQIIq6Uqi6AdMRl/0d5Opvh
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0KwUKmoaGeWGStoNHrjZPXyYVUuFeZJbUlxYDi1D/EomSFlE7h0UjE0G2aInXYc5jb4PZqZVGC
 GkGJ2P87iarkbqLeBkkOPLJBFIePWeXX6NFr78ik7AQwpu2Sqtyy5WinvVCAVwj7w/onczLPH8
 ScBgtbdzF/gQThVZRnvtt9duVvHh5d8CsZsr0uj9mvNenZmkgkqTv3xV6Gx8vxqjIIYb0886pF
 T1r5mEtawDVRzYmrD7pjKxZwE3iKIwh80u+z29Mxl8j5xVv2ZE9xiF8z5Ip305PhWOIpAu64n6
 PrY=
X-SBRS: 2.5
X-MesageID: 29910251
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="29910251"
Subject: Re: [PATCH v2 5/6] x86: guard against straight-line speculation past
 RET
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <447525bc-662d-ff52-6b73-e6e1a61767ec@citrix.com>
Date: Tue, 13 Oct 2020 13:00:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 28/09/2020 13:31, Jan Beulich wrote:
> Under certain conditions CPUs can speculate into the instruction stream
> past a RET instruction. Guard against this just like 3b7dab93f240
> ("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
> did - by inserting an "INT $3" insn. It's merely the mechanics of how to
> achieve this that differ: A set of macros gets introduced to post-
> process RET insns issued by the compiler (or living in assembly files).
>
> Unfortunately for clang this requires further features their built-in
> assembler doesn't support: We need to be able to override insn mnemonics
> produced by the compiler (which may be impossible, if internally
> assembly mnemonics never get generated), and we want to use \(text)
> escaping / quoting in the auxiliary macro.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Should this depend on CONFIG_SPECULATIVE_HARDEN_BRANCH?
> TBD: Would be nice to avoid the additions in .init.text, but a query to
>      the binutils folks regarding the ability to identify the section
>      stuff is in (by Peter Zijlstra over a year ago:
>      https://sourceware.org/pipermail/binutils/2019-July/107528.html)
>      has been left without helpful replies.
> ---
> v2: Fix build with newer clang. Use int3 mnemonic. Also override retq.
>
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -145,7 +145,15 @@ t2 = $(call as-insn,$(CC) -I$(BASEDIR)/i
>  # https://bugs.llvm.org/show_bug.cgi?id=36110
>  t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
>  
> -CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
> +# Check whether \(text) escaping in macro bodies is supported.
> +t4 = $(call as-insn,$(CC),".macro m ret:req; \\(ret) $$\\ret; .endm; m 8",,-no-integrated-as)
> +
> +# Check whether macros can override insn mnemonics in inline assembly.
> +t5 = $(call as-insn,$(CC),".macro ret; .error; .endm; .macro retq; .error; .endm",-no-integrated-as)
> +
> +acc1 := $(call or,$(t1),$(t2),$(t3),$(t4))
> +
> +CLANG_FLAGS += $(call or,$(acc1),$(t5))

I'm not happy taking this until there is toolchain support visible in
the future.

We *cannot* rule out the use of IAS forever more, because there are
features far more important than ret speculation which depend on it.

>  endif
>  
>  CLANG_FLAGS += -Werror=unknown-warning-option
> --- a/xen/include/asm-x86/asm-defns.h
> +++ b/xen/include/asm-x86/asm-defns.h
> @@ -50,3 +50,22 @@
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
> +.macro retq operand:vararg
> +    ret$ \operand
> +.endm
> +.macro ret$ operand:vararg
> +    .purgem ret
> +    ret \operand

You're substituting retq for ret, which defeats the purpose of unwrapping.

I will repeat my previous feedback.  Do away with this
wrapping/unwrapping and just use a raw .byte.  Its simpler and faster.

~Andrew

