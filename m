Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C04B09521
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 21:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047325.1417783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUVR-0008Fp-1N; Thu, 17 Jul 2025 19:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047325.1417783; Thu, 17 Jul 2025 19:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUVQ-0008DM-TN; Thu, 17 Jul 2025 19:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1047325;
 Thu, 17 Jul 2025 19:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8uVp=Z6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ucUVO-0008DG-3t
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 19:42:59 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bfa58af-6346-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 21:42:55 +0200 (CEST)
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
X-Inumbo-ID: 3bfa58af-6346-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752781373; x=1753040573;
	bh=Mz0YkOpt5lUfkzlQaVtBUS8TR/GV8xd23EfoRM7FJjE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O0fkPaARtkeL6n3VIRfZtuKvNhkzOx3c2ohS4ZYZDAhDB81Wih4S4XwFHjl+GdAII
	 2P6fMyKaq0DsdsdOD3Ubt1iJSZM9t5Bq96RETdMKqtLyEE4nIJx+HPanlR/pRs741m
	 skCftKHqZv8t/nPEujelSEOGGExb9TvxRga/xO1UyszjyTfdjDnA0Qq3Z3YYyJ+9EK
	 tnWOYbfFkjBf2x1gPLyFVglksotEbjTDOcP8EmoJySydLgp97mOzyKVjjDBdvr700z
	 U7CWwsO7/8a8kpSi3b0IgAPvQBa7BPivnR2wkO16M9EgbuKT12OgHAKchiCpYkd5Py
	 ESlKqCX/gW5gA==
Date: Thu, 17 Jul 2025 19:42:48 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] dom0less: Move single-xenstore check from bindings to set_xs_domain()
Message-ID: <aHlSM8S87/FTGf/Z@kraken>
In-Reply-To: <20250717142806.257597-1-alejandro.garciavallejo@amd.com>
References: <20250717142806.257597-1-alejandro.garciavallejo@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0dad6c770cf27af6f8ca98394089f04ec691750a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 04:28:05PM +0200, Alejandro Vallejo wrote:
> Later patches extract the bindings to a separate file, where that global
> won't be available. Make the check when calling the function instead so
> the bindings remain agnostic.
>=20
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
>  xen/common/device-tree/dom0less-build.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 87828d4d9d..0012046574 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -38,6 +38,9 @@ static bool __initdata need_xenstore;
>=20
>  void __init set_xs_domain(struct domain *d)
>  {
> +    if ( xs_domid !=3D DOMID_INVALID )
> +        panic("Only 1 xenstore domain can be specified! (%u)", xs_domid)=
;
> +
>      xs_domid =3D d->domain_id;
>      set_global_virq_handler(d, VIRQ_DOM_EXC);
>  }
> @@ -876,10 +879,6 @@ void __init create_domUs(void)
>=20
>              if ( val & DOMAIN_CAPS_XENSTORE )
>              {
> -                if ( xs_domid !=3D DOMID_INVALID )
> -                    panic("Only 1 xenstore domain can be specified! (%u)=
\n",
> -                            xs_domid);
> -
>                  d_cfg.flags |=3D XEN_DOMCTL_CDF_xs_domain;
>                  d_cfg.max_evtchn_port =3D -1;
>              }
>=20
> base-commit: 14d96bd64d8b82cb7666005221c90fb0c93785a8
> --
> 2.43.0
>=20
>=20


