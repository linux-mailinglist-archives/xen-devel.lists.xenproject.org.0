Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB6B07D46
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 20:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045607.1415745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc7LE-0002Aw-97; Wed, 16 Jul 2025 18:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045607.1415745; Wed, 16 Jul 2025 18:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc7LE-00028d-6J; Wed, 16 Jul 2025 18:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1045607;
 Wed, 16 Jul 2025 18:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fHv4=Z5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uc7LC-00028X-DL
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 18:58:55 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9fd2143-6276-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 20:58:52 +0200 (CEST)
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
X-Inumbo-ID: e9fd2143-6276-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=uxb3azjnqfcjjl5ek4dk5uyahe.protonmail; t=1752692330; x=1752951530;
	bh=1APmQTcXIoHhMTFB8b9yC2U6kXJ65aBqtyCw6lnCpko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QEUTohWSKiBy/n1+LQtMqoxY4+lIlr/bMFGr5McdXos5jOSog3NdYzghFqeTLgJz/
	 hL002f8tTwMnUJoj3aOOcvntCXbxhp779/G2dYjg0+ocjvhLjYIBG/EeYPBm9PF0xh
	 VcCDSUsWO+uNIUFkCwz5TKWQTyr2suSo8LK0LJgtpv/bvGBoRn1CvXZ6naYv5Kkd5i
	 66UXMAMWMXZr77SNXMTfwelup1fqDFnGM0+OQu1dFxdKzH8mtNYzGXYY2tja6VjJof
	 s8oHHGE1eTahSdTqwFsOuxbxF7wwRbpsCFGpfoPZV1VgIxzNC4hURfXQqBAdWs476F
	 95jUQ3cWm49kQ==
Date: Wed, 16 Jul 2025 18:58:42 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] dom0less: Fix LLC coloring when mixing colored and non-colored domains
Message-ID: <aHf2Xdd1RYuHvJuZ@kraken>
In-Reply-To: <20250716153504.77542-1-alejandro.garciavallejo@amd.com>
References: <20250716153504.77542-1-alejandro.garciavallejo@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 895079d14e02647dca733ed9eb07182965ad76a5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 05:35:03PM +0200, Alejandro Vallejo wrote:
> llc_colors_str being outside the main loop makes domains without
> explicit coloring inherit the colors of the last colored domain parsed.
>=20
> Move it inside so that's no longer the case.
>=20
> Fixes: 5948dc16759c("xen/arm: add support for cache coloring...")
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
> pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines=
/1930276681
> ---
>  xen/common/device-tree/dom0less-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 221b875a2f..87828d4d9d 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -829,11 +829,11 @@ void __init create_domUs(void)
>      bool iommu =3D false;
>      const struct dt_device_node *cpupool_node,
>                                  *chosen =3D dt_find_node_by_path("/chose=
n");
> -    const char *llc_colors_str =3D NULL;
>=20
>      BUG_ON(chosen =3D=3D NULL);
>      dt_for_each_child_node(chosen, node)
>      {
> +        const char *llc_colors_str =3D NULL;
>          struct domain *d;
>          struct xen_domctl_createdomain d_cfg =3D {0};
>          unsigned int flags =3D 0U;
>=20
> base-commit: dff462313fe0bfa273c54ffc9bff71f054c365af
> --
> 2.43.0
>=20
>=20


