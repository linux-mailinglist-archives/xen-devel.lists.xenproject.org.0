Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDC75A364
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566250.884822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHS1-0007xg-VU; Thu, 20 Jul 2023 00:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566250.884822; Thu, 20 Jul 2023 00:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHS1-0007uz-Rg; Thu, 20 Jul 2023 00:23:25 +0000
Received: by outflank-mailman (input) for mailman id 566250;
 Thu, 20 Jul 2023 00:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMHS0-0007up-Oe
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:23:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e2bda4-2693-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:23:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02BCE617DB;
 Thu, 20 Jul 2023 00:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82DDC433C8;
 Thu, 20 Jul 2023 00:23:18 +0000 (UTC)
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
X-Inumbo-ID: a1e2bda4-2693-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689812600;
	bh=QClN7fgNnxh+r8yNUtg6htkB5pfGF02mh3r8mdJWKY4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qDHV/2ueCFWw9fGyDDzDsIV8QaL84wqtk0IOzEkTJNpX3uZcmCOfYHDFLoV+rl1QI
	 C3uu6QYZnCzFOZHkRaG80bR+7Dtb0YJj3czwpdR/s3UxfxtixUFpzKjwlxIfC7GjXO
	 o15E7iiVkujhZeOzeMokU7S/NfwmtbirLZTkNv+7B5i8wQ55/C2a9GexEi1Ru/0DHr
	 xsOGafZf/nbTNpr9kHOIkTVDaODF6imYr9z7E67txDJcc64RmopR6QpKQetMaxE5II
	 2VC6yPWVHRC/INeyeg+D56C4+FUJCRjaVCEc+JE2JzayuGJYTDM70XsYnHEAQibBaW
	 0UvamxrJrKOlw==
Date: Wed, 19 Jul 2023 17:23:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH] xen: address MISRA C:2012 Rule 4.1
In-Reply-To: <378f18c287cfb65d25b42209c85645a2a10ff9b2.1689763253.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307191723090.3118466@ubuntu-linux-20-04-desktop>
References: <378f18c287cfb65d25b42209c85645a2a10ff9b2.1689763253.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jul 2023, Nicola Vetrini wrote:
> MISRA C:2012 Rule 4.1 has the following headline:
> "Octal and hexadecimal escape sequences shall be terminated."
> 
> The string literals modified by this patch contain octal or
> hexadecimal escape sequences that are neither terminated by the
> end of the literal, nor by the beginning of another escape sequence.
> 
> Therefore, such unterminated sequences have been split into a
> separate literal as a way to comply with the rule and preserve the
> semantics of the code.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> The choice whether to put a blank between the literals is up to
> the maintainers' preference, I chose to do so to improve legibility.
> ---
>  xen/arch/x86/hvm/hvm.c  | 2 +-
>  xen/common/decompress.c | 4 ++--
>  xen/common/xz/stream.h  | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 57363c2ae1..24ccf60d77 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3853,7 +3853,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>                                          cs, &addr) &&
>               (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>                                           walk, NULL) == HVMTRANS_okay) &&
> -             (memcmp(sig, "\xf\xbxen", sizeof(sig)) == 0) )
> +             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
>          {
>              regs->rip += sizeof(sig);
>              regs->eflags &= ~X86_EFLAGS_RF;
> diff --git a/xen/common/decompress.c b/xen/common/decompress.c
> index 989336983f..2c2c2ad877 100644
> --- a/xen/common/decompress.c
> +++ b/xen/common/decompress.c
> @@ -19,13 +19,13 @@ int __init decompress(void *inbuf, unsigned int len, void *outbuf)
>      if ( len >= 3 && !memcmp(inbuf, "\x42\x5a\x68", 3) )
>          return bunzip2(inbuf, len, NULL, NULL, outbuf, NULL, error);
>  
> -    if ( len >= 6 && !memcmp(inbuf, "\3757zXZ", 6) )
> +    if ( len >= 6 && !memcmp(inbuf, "\375" "7zXZ", 6) )
>          return unxz(inbuf, len, NULL, NULL, outbuf, NULL, error);
>  
>      if ( len >= 2 && !memcmp(inbuf, "\135\000", 2) )
>          return unlzma(inbuf, len, NULL, NULL, outbuf, NULL, error);
>  
> -    if ( len >= 5 && !memcmp(inbuf, "\x89LZO", 5) )
> +    if ( len >= 5 && !memcmp(inbuf, "\x89" "LZO", 5) )
>          return unlzo(inbuf, len, NULL, NULL, outbuf, NULL, error);
>  
>      if ( len >= 2 && !memcmp(inbuf, "\x02\x21", 2) )
> diff --git a/xen/common/xz/stream.h b/xen/common/xz/stream.h
> index d36d0fec64..8d9fbbe1b5 100644
> --- a/xen/common/xz/stream.h
> +++ b/xen/common/xz/stream.h
> @@ -18,7 +18,7 @@
>  
>  #define STREAM_HEADER_SIZE 12
>  
> -#define HEADER_MAGIC "\3757zXZ"
> +#define HEADER_MAGIC "\375" "7zXZ"
>  #define HEADER_MAGIC_SIZE 6
>  
>  #define FOOTER_MAGIC "YZ"
> -- 
> 2.34.1
> 

