Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074BB0FE4B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 03:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054986.1423585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uekKD-0007qB-G8; Thu, 24 Jul 2025 01:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054986.1423585; Thu, 24 Jul 2025 01:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uekKD-0007mk-DD; Thu, 24 Jul 2025 01:00:45 +0000
Received: by outflank-mailman (input) for mailman id 1054986;
 Thu, 24 Jul 2025 01:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BvLp=2F=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uekKC-0007VY-M9
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 01:00:44 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f57a608-6829-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 03:00:42 +0200 (CEST)
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
X-Inumbo-ID: 9f57a608-6829-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753318841; x=1753578041;
	bh=RqgZLjWTOesvR2EFPUiBStQvT7ZysLkE7IjKGDW1BlA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DhIcFtUzWbeLrsz/GQDO1ieii6Q/zI9/9SF61kvqj7mYCOSraMxXU5nDY+3g38ceC
	 wYMQO7GRLm91iPpyvWVbVCwcKVkw6NnOncGi5rKvBbr4YW0xuc4IqpiBg7SGyvZ6+J
	 cvaOPwKkvd/h1kzEsAgXYH9qpW5xQeKgUD8WQo1sdeNdH3fA+tlCeFVjI62yoJ+/LA
	 VyGLZokvchwyOft/h2b+zU56yueJsyL3ryLzPeUsnOQ9tU3EeVt2CwLGsZJU1u5VUT
	 iAR4t/QIoEN7QXLruQe2nApI/KfyhuW3OOs9kNLGDB7GRc8Se6wFI5zjSi18MFS2gf
	 ks4AwR/lEyb7g==
Date: Thu, 24 Jul 2025 01:00:39 +0000
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: fix xl pci-assignable-remove
Message-ID: <aIGFsy88qvMj4bTB@kraken>
In-Reply-To: <20250723225422.116387-2-stewart.hildebrand@amd.com>
References: <20250723225422.116387-1-stewart.hildebrand@amd.com> <20250723225422.116387-2-stewart.hildebrand@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e59c4b94b6a0f8dcb14a243e7eb5362e973afd42
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 06:54:20PM -0400, Stewart Hildebrand wrote:
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
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index db08d3c04269..9312bb3c72d8 100644
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
> +=09=09dev_err(dev, " not attached to domain %d\n", d->domain_id);

Use %pd?

        dev_err(dev, " not attached to %pd\n", d);

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


