Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CCB09524
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 21:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047331.1417793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUWZ-0000Jy-9N; Thu, 17 Jul 2025 19:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047331.1417793; Thu, 17 Jul 2025 19:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUWZ-0000H1-6X; Thu, 17 Jul 2025 19:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1047331;
 Thu, 17 Jul 2025 19:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8uVp=Z6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ucUWY-0000Gt-1S
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 19:44:10 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67aabb1b-6346-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 21:44:08 +0200 (CEST)
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
X-Inumbo-ID: 67aabb1b-6346-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752781447; x=1753040647;
	bh=ZPQdDt4PfUQ12OQwCNNfDBVo98hxRPyMfRx5Eecreug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Bu5MeaFy+sYAfqwRxJBz25J9DVy67z3OIiNIyAd2hUYQiayHUTXykRLjUhZX5ZrWB
	 Qpdnvn7z1MbbiI7aRfmXTjSKyUg4855iomkjyKcttwaPaGC5Cg+4kMvtLJaDxd2VmD
	 R3PuYnK3cY0gDxoAvd2AhNKZQgiQH8cOc1m56jX6f7SBuVXsA3oRLqKZ8G4vb9+tjg
	 48bxNg03WGSa3Y6nu7bwSOTw95g8uOjKMbfuH0FzTD9wLHJsW3Cwhf9jo4aAGefo/f
	 i7RqwtiQriOataRA+YHaO+dhsCPlEquTnUu+51nEpbsfmSZCyL6Bx3PvwwVsQz65VQ
	 CmNYUQdCbsYBA==
Date: Thu, 17 Jul 2025 19:44:05 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
Message-ID: <aHlSf/xNUlYrexYt@kraken>
In-Reply-To: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e84d0a17f01b47470fc405e3cbd9ead24627f778
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
> Later patches will keep refactoring create_dom0()
> until it can create arbitrary domains. This is one
> small step in that direction.
>=20
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
>  xen/arch/x86/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index c6890669b9..6943ffba79 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>=20
> -    init_dom0_cpuid_policy(d);
> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
> +        init_dom0_cpuid_policy(d);
>=20
>      if ( alloc_dom0_vcpu0(d) =3D=3D NULL )
>          panic("Error creating %pdv0\n", d);
>=20
> base-commit: 55719030b0bb0069fc8b57cd808dc98dc9d39add
> --
> 2.43.0
>=20
>=20


