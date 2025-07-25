Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F86B12537
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 22:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058466.1426023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOrk-0001Or-BH; Fri, 25 Jul 2025 20:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058466.1426023; Fri, 25 Jul 2025 20:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOrk-0001NN-8S; Fri, 25 Jul 2025 20:18:04 +0000
Received: by outflank-mailman (input) for mailman id 1058466;
 Fri, 25 Jul 2025 20:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PByu=2G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ufOrj-0000pI-1b
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 20:18:03 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77241677-6994-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 22:18:02 +0200 (CEST)
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
X-Inumbo-ID: 77241677-6994-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753474680; x=1753733880;
	bh=glmWK8nkS3nU1seYQ7+FnFgeG+uFVBCKka9zpwHJftM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dnYteF2zBFFNvnPapKCduIAlBM15cyZmqTjK/JAYbNAZCvMiMgznO9sIQur6gEJ6R
	 FOYn7fyn4zzRMyS6rCW0kTVktMOYIQhAbH+sAm/JA28aH2TOqHnPhrI5rY5KThhHce
	 fpqR6YKqiCce10MPqhbYl4B18K/DRGAHlmpt7XnBAP+bTzzy/pjwBWlovBQ4mpcclA
	 +K8F3gekGSDsuINtbK/gi7j/wdrvvsIWMqi9arJQKXz54t8yRNQ5B9s/K8qD7i4/w6
	 BJukOwPQpW/JXsXpcf2p0NR2QPhQp7SMhYf/09ADU09kGhyxZlxJphR3IBD266GB6G
	 7hJ1MkISWI63w==
Date: Fri, 25 Jul 2025 20:17:55 +0000
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/arm: smmuv3: fix xl pci-assignable-remove
Message-ID: <aIPmbqTKFyl9p5HI@kraken>
In-Reply-To: <20250725174553.15322-2-stewart.hildebrand@amd.com>
References: <20250725174553.15322-1-stewart.hildebrand@amd.com> <20250725174553.15322-2-stewart.hildebrand@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 85955f89c0d4b6e6a520f06e53cbf08b64ddb013
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 01:45:51PM -0400, Stewart Hildebrand wrote:
> When attempting to xl pci-assignable-remove a PCI device, we encounter:
>=20
> $ xl pci-assignable-remove 00:01.0
> (XEN) SMMUv3: <no-node>:  not attached to domain 32753
> (XEN) d[IO]: deassign (0000:00:01.0) failed (-3)
> libxl: error: libxl_pci.c:910:libxl__device_pci_assignable_remove: failed=
 to de-quarantine 0000:00:01.0
>=20
> When a PCI device is being deassigned from domIO,
> arm_smmu_deassign_dev() should return before checking the smmu domain.
>=20
> Fixes: 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3=
")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
> v1->v2:
> * use %pd in print format
> * add Bertrand's A-b
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index db08d3c04269..5e9e3e048e34 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2747,11 +2747,6 @@ static int arm_smmu_deassign_dev(struct domain *d,=
 uint8_t devfn, struct device
>  =09struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(io_domain);
>  =09struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
>=20
> -=09if (!smmu_domain || smmu_domain->d !=3D d) {
> -=09=09dev_err(dev, " not attached to domain %d\n", d->domain_id);
> -=09=09return -ESRCH;
> -=09}
> -
>  #ifdef CONFIG_HAS_PCI
>  =09if ( dev_is_pci(dev) )
>  =09{
> @@ -2767,6 +2762,11 @@ static int arm_smmu_deassign_dev(struct domain *d,=
 uint8_t devfn, struct device
>  =09}
>  #endif
>=20
> +=09if (!smmu_domain || smmu_domain->d !=3D d) {
> +=09=09dev_err(dev, " not attached to %pd\n", d);
> +=09=09return -ESRCH;
> +=09}
> +
>  =09spin_lock(&xen_domain->lock);
>=20
>  =09arm_smmu_detach_dev(master);
> --
> 2.50.1
>=20
>=20


