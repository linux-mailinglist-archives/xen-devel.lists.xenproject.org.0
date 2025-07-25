Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBEEB12532
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 22:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058457.1426013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOqu-0000r1-Vs; Fri, 25 Jul 2025 20:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058457.1426013; Fri, 25 Jul 2025 20:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOqu-0000pO-TI; Fri, 25 Jul 2025 20:17:12 +0000
Received: by outflank-mailman (input) for mailman id 1058457;
 Fri, 25 Jul 2025 20:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PByu=2G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ufOqs-0000pI-W4
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 20:17:11 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5640b1d3-6994-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 22:17:09 +0200 (CEST)
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
X-Inumbo-ID: 5640b1d3-6994-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753474626; x=1753733826;
	bh=xPcl+AGdE+fVx6piPuxzpRHhpYh23z4m+M3gKA9JLwA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UR13sjwpEcKxWbevfJRbdh1jeLspLcUDBNu9gKscQAVNka5pyXCrpkwmXKFT0p2vC
	 juJLJJpLcv558GSy3DYVg+j3kd7w4pkDj1YLyYcezrL2udo7GNcbtZmu2DQjYfDSI3
	 iv3bLdCziKMKQjXekGY5N1Z4D5Pa8Nx5/syYFzdHIZYlGx/bfEvLQyJ1Nwl6xsBisM
	 H34bdF78nXLqfUAbOmFzIMqFto7QMd6owmt0ZlJ9+9IoVoNxoPscvSq56Ge5qdLlOE
	 BB787UixoB1au8NzLPftALVYxos5qwByFAOxUNIc2dAvQSv6fNFaxGqELfKlbvkFUc
	 mEJY92QCUqYgw==
Date: Fri, 25 Jul 2025 20:17:02 +0000
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: smmuv3: fix UB during deassign
Message-ID: <aIPmOvYVId3r+3kO@kraken>
In-Reply-To: <20250725174553.15322-1-stewart.hildebrand@amd.com>
References: <20250725174553.15322-1-stewart.hildebrand@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c6d7dff86218b8eb82aa0e37374c538f72e5362c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 01:45:50PM -0400, Stewart Hildebrand wrote:
> In arm_smmu_deassign_dev(), the return value from to_smmu_domain() is
> NULL-checked. However, the implementation of to_smmu_domain() is a
> container_of lookup, so the return value is unlikely to ever be NULL. In
> case of a NULL argument to to_smmu_domain(), we will attempt to
> dereference the non-NULL return value and encounter undefined behavior
> and a crash:
>=20
> $ xl pci-assignable-remove 00:01.0
> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:221=
:9
> (XEN) applying non-zero offset ffffffffffffffc0 to null pointer
> (XEN) Xen WARN at common/ubsan/ubsan.c:174
> (XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy ubsan=3Dy  Tainted:   C  =
  ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a0000350b2c>] ubsan.c#ubsan_epilogue+0x14/0xf0 (PC)
> (XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c =
(LR)
> (XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c
> (XEN)    [<00000a0000392f9c>] smmu-v3.c#to_smmu_domain+0x3c/0x40
> (XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c
> (XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
> (XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
> (XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
> (XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
> (XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
> (XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
> (XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
> (XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
> (XEN)
> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) Data Abort Trap. Syndrome=3D0x4
> (XEN) Walking Hypervisor VA 0xfffffffffffffff8 on CPU1 via TTBR 0x0000000=
0406d0000
> (XEN) 0TH[0x1ff] =3D 0x0
> (XEN) CPU1: Unexpected Trap: Data Abort
> (XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy ubsan=3Dy  Tainted:   C  =
  ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a000039e494>] smmu-v3.c#arm_smmu_deassign_dev+0xc0/0x43c =
(PC)
> (XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c =
(LR)
> (XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
> (XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
> (XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
> (XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
> (XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
> (XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
> (XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
> (XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
>=20
> Fix by changing to_smmu_domain() to return NULL in case of a NULL
> argument.
>=20
> Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
> v1->v2:
> * add Bertrand's A-b
>=20
> I'm unsure if that's the right Fixes: tag since I'm not sure if it can
> be triggered prior to 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices
> support for SMMUv3").
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 58f3331520df..db08d3c04269 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -218,6 +218,9 @@ static struct arm_smmu_option_prop arm_smmu_options[]=
 =3D {
>=20
>  static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>  {
> +=09if ( !dom )
> +=09=09return NULL;
> +
>  =09return container_of(dom, struct arm_smmu_domain, domain);
>  }
>=20
>=20
> base-commit: 6cd9b9226c65c962b0f0e040e7d3d5c4053f8e06
> --
> 2.50.1
>=20
>=20


