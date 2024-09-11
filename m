Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EED975B30
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 21:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796852.1206557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soTU8-0005Ng-41; Wed, 11 Sep 2024 19:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796852.1206557; Wed, 11 Sep 2024 19:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soTU8-0005Ll-1S; Wed, 11 Sep 2024 19:58:40 +0000
Received: by outflank-mailman (input) for mailman id 796852;
 Wed, 11 Sep 2024 19:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2J2y=QJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1soTU7-0005Lf-3g
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 19:58:39 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b53101e-7078-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 21:58:37 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5de8a3f1cc6so86072eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 12:58:37 -0700 (PDT)
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
X-Inumbo-ID: 3b53101e-7078-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726084716; x=1726689516; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z2gELrwdyPWsAuF//XcE0fFmRoOhML/Gxrdze9vXWQ=;
        b=XVauQ5MA8DvfqpRVG50sup02QO1FVvocwPK1/0mFXN8D8VH/tmCIXjndD6XbX4AExS
         DaZvS8FHzAHdxu3Izlg+TryOs7IfGJuROD14MTtH2H78mzymfq1C56nMdwwGDK8asDJD
         TacdFptHh8sts3XPdDeQK36qEl/pY6b/dnApc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726084716; x=1726689516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z2gELrwdyPWsAuF//XcE0fFmRoOhML/Gxrdze9vXWQ=;
        b=wo/qho2ymxc2CaC9il/NiNgmys9kBpkY33kzI+XPwiTiRUVs0DVMPiT4uIDilWEN17
         RsmWxGEq2FKJ8AdmPJwLnzNe3VcRZcgReYiPiTze9oMYR+FHJGxLcep2+6BeumaCTsw5
         QfEpLfylEbO1IVXMVCmhibBnmeFiULdbhz2Y0WqU+VRkzuNtWIKGgLNmcgH8Pu2PVtw9
         /hUjdP+eXhH5eoRF88lOJLSiAQ3MhY2+QKhiq8D4qM4bjA4ZRHkaVwaO7O8dVz5ryOEY
         wlYgTpkC7spfXAXhvldRIBbzJQqGzTa5yXQQ57bx9z57bAaoIzkZN2zECD/of2KYkwKh
         qztw==
X-Gm-Message-State: AOJu0YwBTzNPSPeObqffAjO52fMETh5uceo4BVoV4QoWs8hpfdY2zwox
	uR+N/Q03dC53qqNI7l5faBVuuAAt8eayuOnD6zQcvJDSWRLnuu5nFOfHI+EPGYduVo6d1+Nob88
	XEon43dYgv4kc6/yJndtYCL2dxHWapRbNraZ6nQ==
X-Google-Smtp-Source: AGHT+IGBV8SMBUyuUcdB/uWKLxEwVZgDNoL3pxoiFiRSHa8BFlOr/6wF+Z7TkF3lMEZwv3ASWhoPGeOmOkQJeiprM7g=
X-Received: by 2002:a05:6820:60a:b0:5e1:c6ae:d93 with SMTP id
 006d021491bc7-5e201435089mr180113eaf.2.1726084715904; Wed, 11 Sep 2024
 12:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240911145823.12066-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20240911145823.12066-1-alejandro.vallejo@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 11 Sep 2024 20:58:22 +0100
Message-ID: <CACHz=Zgd6kRt3-YGFNA=fNAZ7fZ2xyjfQ6SELUEGowGB-uKonw@mail.gmail.com>
Subject: Re: [PATCH] x86/traps: Re-enable IRQs after reading cr2 in the #PF handler
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 3:58=E2=80=AFPM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> Moves sti directly after the cr2 read and immediately after the #PF
> handler.
>
> While in the area, remove redundant q suffix to a movq in entry.S
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I don't think this is a bug as much as an accident about to happen. Even =
if
> there's no cases at the moment in which the IRQ handler may page fault, t=
hat
> might change in the future.
>
> Note: I haven't tested it extensively beyond running it on GitLab.
>
> pipeline:
>     https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/14491=
82525
>
> ---
>  xen/arch/x86/traps.c        |  2 ++
>  xen/arch/x86/x86_64/entry.S | 11 +++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 708136f625..1c04c03d9f 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1600,6 +1600,8 @@ void asmlinkage do_page_fault(struct cpu_user_regs =
*regs)
>
>      addr =3D read_cr2();
>
> +    local_irq_enable();
> +
>      /* fixup_page_fault() might change regs->error_code, so cache it her=
e. */
>      error_code =3D regs->error_code;
>
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index b8482de8ee..ef803f6288 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -844,8 +844,7 @@ handle_exception_saved:
>  #elif !defined(CONFIG_PV)
>          ASSERT_CONTEXT_IS_XEN
>  #endif /* CONFIG_PV */
> -        sti
> -1:      movq  %rsp,%rdi
> +1:      mov   %rsp,%rdi
>          movzbl UREGS_entry_vector(%rsp),%eax
>  #ifdef CONFIG_PERF_COUNTERS
>          lea   per_cpu__perfcounters(%rip), %rcx
> @@ -866,7 +865,15 @@ handle_exception_saved:
>          jmp   .L_exn_dispatch_done;    \
>  .L_ ## vec ## _done:
>
> +        /*
> +         * IRQs kept off to derisk being hit by a nested interrupt befor=
e
> +         * reading %cr2. Otherwise a page fault in the nested interrupt =
hadnler


Minor, typo: hadnler -> handler

>
> +         * would corrupt %cr2.
> +         */
>          DISPATCH(X86_EXC_PF, do_page_fault)
> +
> +        sti
> +
>          DISPATCH(X86_EXC_GP, do_general_protection)
>          DISPATCH(X86_EXC_UD, do_invalid_op)
>          DISPATCH(X86_EXC_NM, do_device_not_available)
>

Frediano

