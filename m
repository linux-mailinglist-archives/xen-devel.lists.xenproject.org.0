Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8698F2D3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809592.1222001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNyQ-0002mm-KQ; Thu, 03 Oct 2024 15:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809592.1222001; Thu, 03 Oct 2024 15:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNyQ-0002kg-HM; Thu, 03 Oct 2024 15:42:38 +0000
Received: by outflank-mailman (input) for mailman id 809592;
 Thu, 03 Oct 2024 15:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swNyO-0002ka-Um
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:42:37 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c57eff2-819e-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 17:42:36 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-27b7a1480bdso495648fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 08:42:35 -0700 (PDT)
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
X-Inumbo-ID: 1c57eff2-819e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727970154; x=1728574954; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TgMKQEUnWh0lDCfN36M+VOq1kl4DP/9LuG15M+vcAQ=;
        b=RLgdKwiATNaF5DMrSN7w45Ed2WNp9DD3g6vOaZOdr9JPgDYqw0+HoWlkMWWJOkYtgD
         XcvkV425g6J18gX1ZmbeKdSMyBCvr6eRJdzLgt/9NPWDhVYMBbYg1d+LF3G/HgUPnvqb
         DHbWuvOpqrtRUBzpIPKpYhNP7NF78eZs/kRB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970154; x=1728574954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TgMKQEUnWh0lDCfN36M+VOq1kl4DP/9LuG15M+vcAQ=;
        b=XW2hRijfr0/av/l0P9bMk6k64Ko7BfkZgWQDYTLKVYFh0GSuWyTr0Qr4D/vwkNcdat
         4iUCRjswXKyWy7+iFl26VkoUekdpRouW5F7/B5UzZdaCOz575fDB1TVnfvo78Ke0/fSa
         aDPjrSScMOGEUdjurUiySFvanFM7ix6s8lrVc5ZPs/jt3m4jrnhztmYfyFwb38vvoEAM
         Ac7oH9sFS861Qpn6Txu3kzmvYLle9+OeY4nK/R1cGRsgu9Zcw9dyXYVuDLVSpxXvN/50
         JaJwdu6i0ZKxGlRp3LCmT/Xg64wRFr5E6MaJ+UDmPzvp+VwKwcbbeJSVA5k8YBKIdT8z
         0rgg==
X-Gm-Message-State: AOJu0YzOoMwutQDiTOGGhI7XaC9jaxbKPfYi3T8DerfKryOlMtmrA9AM
	+V+yahD7UJxlelGnGNjCq4rdKeSdLp2TyDVrpDeiv0GYeKtxDirVtkiwFNeyyAUTtje1RL+WYt/
	EeqsBw6G0HAMvinvh8JYSXmtZ+snZqf92pGKjlQ==
X-Google-Smtp-Source: AGHT+IHBCCAxr5AemcMOmGd2TiquPoXpOZca8TY0SUXiGfkLYN2i12RVyeKqmF+zLlUc8upHOn+f1o0IB3Z+oIUSzCM=
X-Received: by 2002:a05:687c:2bea:b0:277:bc16:12c3 with SMTP id
 586e51a60fabf-28788a7378bmr4364244fac.17.1727970154620; Thu, 03 Oct 2024
 08:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241003145810.2217075-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241003145810.2217075-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 3 Oct 2024 16:42:23 +0100
Message-ID: <CACHz=ZhDuQd5CGY+05dCciu7K1xFKwpN1NORbqHdG4wijivzMQ@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Don't use INC to set defaults
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 3:58=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> __efi64_mb2_start() makes some bold assumptions about the efi_platform an=
d
> skip_realmode booleans.  Set them to 1 explicitly, which is more robust.
>
> Make the comment a little more consice.
>
> No practical change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/head.S | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index d1856d8012c9..af776c201a15 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -279,14 +279,12 @@ __efi64_mb2_start:
>          pop     %rbx
>          pop     %rax
>
> -        /* We are on EFI platform and EFI boot services are available. *=
/
> -        incb    efi_platform(%rip)
> -
>          /*
> -         * Disable real mode and other legacy stuff which should not
> -         * be run on EFI platforms.
> +         * efi_multiboot2_prelude() is happy that we're on EFI platform.=
  Skip
> +         * the BIOS initialisation path.
>           */
> -        incb    skip_realmode(%rip)
> +        movb    $1, efi_platform(%rip)
> +        movb    $1, skip_realmode(%rip)
>
>          /* Jump to trampoline_setup after switching CPU to x86_32 mode. =
*/
>          lea     trampoline_setup(%rip),%r15
>
> base-commit: eb21ce14d709ef0c0030d0625028a4868c81126f

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I like _Bool !

Frediano

