Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E83AB3420
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981111.1367499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPtH-0004CN-05; Mon, 12 May 2025 09:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981111.1367499; Mon, 12 May 2025 09:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPtG-0004Av-Tb; Mon, 12 May 2025 09:56:06 +0000
Received: by outflank-mailman (input) for mailman id 981111;
 Mon, 12 May 2025 09:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmCO=X4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uEPtF-0004Ap-QJ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:56:05 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5146cd3a-2f17-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 11:56:05 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-603f54a6cb5so2332959eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:56:04 -0700 (PDT)
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
X-Inumbo-ID: 5146cd3a-2f17-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747043763; x=1747648563; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ru514p0VU8A70el8Z9O0WCBmp8aRtUjyz+oOmk0Y9Aw=;
        b=a6X31EL2A6DYUcWjdro25K+6sEtAuFPzAE48QGe1DIJcgmm5qMG1UhQ1MiOY0vyRUR
         aH+FIHQSU63yKQGFdh8ULbtXaFd55c5faTRqxit7/0FpLQIqLEwDjIAfjVe6tCJKykpd
         tuYe/Sree7BLI5BjshXFNoHhWPsHFwWznZbPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043763; x=1747648563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ru514p0VU8A70el8Z9O0WCBmp8aRtUjyz+oOmk0Y9Aw=;
        b=P0Au4YqtmkwA4ZIZKiS4fPguKAMarkrXakhqDuJ+hL9unt7WsMDlMl0fO8SEDmYLLv
         UK1Qm0y2hQiAqYpaXih6y6y+8aPU0Zfawammwn47+hp9sQZhlM27QnxEmY93DUKqN7BY
         kpxt0EEhoTm5NwNmuRdcdPeRPREZYXSydLzwWb60izGl2vYkU3Uc2ZzUGrnahxe4P4sS
         E8sM9fDBT/GEZwrzzfKQYnQ0200LxIbgK/vsR2klYpVjvZu9U3QoOFLQnchF00wa2fVq
         Htd8QnBq35kqUIqPZ9SccL0yqr2rZHMx2E+mIwfOpbxf6Z1Osx4MhqtE3ZDaM58j+VRi
         vlRA==
X-Gm-Message-State: AOJu0Yw/4qbC8ON+PWUFeU80y/uh/7qVB8rb+x+7bkjjScNPaaWEf92l
	lcsyUBFe5F3jHMaD+qCo9M+2bBbLmt6hURP836mM97SxyS9bVijBwo/9J3WI2HeBdAqH+MI538h
	Rj00l0wT6W6lTJcBNnimLj0EpO6j21moNKWI2
X-Gm-Gg: ASbGncsAoAf2tu0iBLEdwDwaKx0Cmstv2PqoMfQrMvLUBxGh6POevT03SFizraaddlT
	8KAsVncSuj3KPnnCfXpJOLsp7Tl5/L0jymhdBlzuc5aU9qpEYFqRiFeNdNMXTa/4uT7OtvoCRxZ
	XPPNXCeTJ2W4V4Mpn8Fv+5RNTdNE4fdaIDJyaLq1e6Dg==
X-Google-Smtp-Source: AGHT+IGgnaQJrJ33wsUSr8N3nzACdLB5RGAlbYC6WvOLtp7OUk4Yjli3/WSfJGLCe71HxNTH9f6HAMUgpM5f5sqIh9Y=
X-Received: by 2002:a05:6820:199a:b0:607:e15c:be07 with SMTP id
 006d021491bc7-6084c121a75mr7874360eaf.7.1747043763622; Mon, 12 May 2025
 02:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com> <20250509163212.2948359-3-andrew.cooper3@citrix.com>
In-Reply-To: <20250509163212.2948359-3-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 12 May 2025 10:55:52 +0100
X-Gm-Features: AX0GCFumObTO8T8ils2Fhg6RNBFLRU3PQMUZK3t6KADOyE_RXpoYZLGjmwsO1X0
Message-ID: <CAG7k0Eq8-C1MJFDkJ8kmUz5q832rtwDNtcu+Eez_eHXUm9gGBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xen/livepatch: Fix include hierarchy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:32=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> xen/livepatch.h includes public/sysctl.h twice, which can be deduplicated=
, and
> includes asm/livepatch.h meaning that each livepatch.c does not need to
> include both.
>
> Comment the #else and #endif cases to aid legibility.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/arm/arm32/livepatch.c |  1 -
>  xen/arch/arm/arm64/livepatch.c |  1 -
>  xen/arch/arm/livepatch.c       |  1 -
>  xen/arch/x86/livepatch.c       |  1 -
>  xen/include/xen/livepatch.h    | 10 +++++-----
>  5 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatc=
h.c
> index 134d07a175bb..8541c71d6e2e 100644
> --- a/xen/arch/arm/arm32/livepatch.c
> +++ b/xen/arch/arm/arm32/livepatch.c
> @@ -9,7 +9,6 @@
>  #include <xen/livepatch.h>
>
>  #include <asm/page.h>
> -#include <asm/livepatch.h>
>
>  void arch_livepatch_apply(const struct livepatch_func *func,
>                            struct livepatch_fstate *state)
> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatc=
h.c
> index e135bd5bf99a..39159ba8b5bf 100644
> --- a/xen/arch/arm/arm64/livepatch.c
> +++ b/xen/arch/arm/arm64/livepatch.c
> @@ -13,7 +13,6 @@
>
>  #include <asm/bitops.h>
>  #include <asm/insn.h>
> -#include <asm/livepatch.h>
>
>  void arch_livepatch_apply(const struct livepatch_func *func,
>                            struct livepatch_fstate *state)
> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> index 3805b2974663..2fbb7bce60bb 100644
> --- a/xen/arch/arm/livepatch.c
> +++ b/xen/arch/arm/livepatch.c
> @@ -11,7 +11,6 @@
>  #include <xen/vmap.h>
>
>  #include <asm/cpufeature.h>
> -#include <asm/livepatch.h>
>
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
> diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
> index be40f625d206..bdca355dc6cc 100644
> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -17,7 +17,6 @@
>  #include <asm/endbr.h>
>  #include <asm/fixmap.h>
>  #include <asm/nmi.h>
> -#include <asm/livepatch.h>
>  #include <asm/setup.h>
>
>  static bool has_active_waitqueue(const struct vm_event_domain *ved)
> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index d074a5bebecc..c1e76ef55404 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -14,12 +14,14 @@ struct xen_sysctl_livepatch_op;
>  #include <xen/elfstructs.h>
>  #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
>
> -#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
> +#include <public/sysctl.h>
>
>  #ifdef CONFIG_LIVEPATCH
>

Shouldn't the inclusion of sysctl.h be inside CONFIG_LIVEPATCH?

There is already a forward declaration for xen_sysctl_livepatch_op
which should cover the !CONFIG_LIVEPATCH side of things.

Ross

