Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C05B12310
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 19:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058310.1425942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMNt-0007Um-PC; Fri, 25 Jul 2025 17:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058310.1425942; Fri, 25 Jul 2025 17:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMNt-0007Ru-LL; Fri, 25 Jul 2025 17:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1058310;
 Fri, 25 Jul 2025 17:39:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1AR=2G=bounce.vates.tech=bounce-md_30504962.6883c134.v1-bd896dd9970f4bbbb2e8d23c3f5953e2@srs-se1.protection.inumbo.net>)
 id 1ufMNs-0007Rm-Ir
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 17:39:04 +0000
Received: from mail180-9.suw31.mandrillapp.com
 (mail180-9.suw31.mandrillapp.com [198.2.180.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 404435ab-697e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 19:39:02 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-9.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4bpZqS4wSYzK5vr6m
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 17:39:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bd896dd9970f4bbbb2e8d23c3f5953e2; Fri, 25 Jul 2025 17:39:00 +0000
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
X-Inumbo-ID: 404435ab-697e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753465140; x=1753735140;
	bh=GT3QJrpakU+VtqlNttQz4ZILcHz+gnBrU7ZyIXVbxjk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jjhnTN+HrxAsu7a9dPsQTyYwTnpY6zwmHWr12BqraAnU65qn0F9as4qD9hk5iWstm
	 UFOKEZAfGwVHDJgv3JOTp0VMbeWxng+JEchUpw9ky/7kF0KivNEu25px4T6A3N5+3Y
	 qpszhgu4VSoGcRuMEGuvp9XQsRXSBb3dfJgdF9cquz3YIWA2kt+GbVJ0IpWL2SJhvh
	 Li/RyJwGg+Sf6UVxHLTh6eajrhvxyjJQF5RqQUkWx6W2BCpSmeyFx0cNcGm66n5nx2
	 ziamVMo0qJXNMWHYfR5KG1qi0QQH8xRKww3ujprl54FwXb1RNfPBBpULoFgy0s3Uxk
	 faAeS6AXcDJuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753465140; x=1753725640; i=teddy.astie@vates.tech;
	bh=GT3QJrpakU+VtqlNttQz4ZILcHz+gnBrU7ZyIXVbxjk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jYWAmYDu3japXefSg1trNTEZLzMNa7OeloR09F/2xAnvxM8mgamBYoJkLTrF/volc
	 BjwDXoyv+Toq5GBWL87AluwJtCy4Im7c3Sav25dRE8/2IGmel3rSS45EYU4/8oq5ps
	 SLJFsbDZ+zzN07Zg1tJYpANzuBwOvxmT1Nl5/7Tyj44Qv3Hjtd21trhpn/d9sa4Ct3
	 n5AmCq5nEjDYZB3zIABTOx9GMo1DJj/C8g3vgG05XwtdXdAwFyoeFnvi7UgrNiDyxe
	 dEQYYcKUwCJpsv3hCk7Ack48TDkaAZT9EJJdrsU9gTzFX4IdX/rgG/OJNuMQwbkhp0
	 rBVdS7HDQQmwg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=204/6]=20vpci:=20add=20SR-IOV=20support=20for=20PVH=20Dom0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753465138685
Message-Id: <2e0f2a59-f0ff-45d1-8b0a-17e93c9ebc5d@vates.tech>
To: "Mykyta Poturai" <Mykyta_Poturai@epam.com>, xen-devel@lists.xenproject.org
Cc: "Stewart Hildebrand" <stewart.hildebrand@amd.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <cover.1753450965.git.mykyta_poturai@epam.com> <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bd896dd9970f4bbbb2e8d23c3f5953e2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250725:md
Date: Fri, 25 Jul 2025 17:39:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25/07/2025 =C3=A0 16:26, Mykyta Poturai a =C3=A9crit=C2=A0:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> for possible changes in the system page size register.
> 
> Relies on dom0 to enable SR-IOV and PHYSDEVOP to inform Xen about
> addition/removal of VFs.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   CHANGELOG.md              |   3 +-
>   SUPPORT.md                |   2 -
>   xen/drivers/vpci/Makefile |   2 +-
>   xen/drivers/vpci/header.c |   3 +
>   xen/drivers/vpci/sriov.c  | 235 ++++++++++++++++++++++++++++++++++++++
>   xen/drivers/vpci/vpci.c   |   1 +
>   xen/include/xen/vpci.h    |   7 +-
>   7 files changed, 247 insertions(+), 6 deletions(-)
>   create mode 100644 xen/drivers/vpci/sriov.c
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..7b0e8beb76 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,8 +23,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>    - On x86:
>      - Option to attempt to fixup p2m page-faults on PVH dom0.
>      - Resizable BARs is supported for PVH dom0.
> -   - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
> -     capability usage is not yet supported on PVH dom0).
> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
>      - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>   
>    - On Arm:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6a82a92189..830b598714 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
>   
>   At least the following features are missing on a PVH dom0:
>   
> -  * PCI SR-IOV.
> -
>     * Native NMI forwarding (nmi=3Ddom0 command line option).
>   
>     * MCE handling.

I would prefer changelog/support changes to be a separate patch or 
alternatively at the last patch as I don't think SR-IOV is fully working 
without the 2 remaining ones.

> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index a7c8a30a89..fe1e57b64d 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,2 @@
> -obj-y +=3D vpci.o header.o rebar.o
> +obj-y +=3D vpci.o header.o rebar.o sriov.o
>   obj-$(CONFIG_HAS_PCI_MSI) +=3D msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f947f652cd..0a840c6dcc 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -839,6 +839,9 @@ static int cf_check init_header(struct pci_dev *pdev)
>   
>       ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>   
> +    if ( pdev->info.is_virtfn )
> +        return 0;
> +
>       switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>       {
>       case PCI_HEADER_TYPE_NORMAL:
> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> new file mode 100644
> index 0000000000..640430e3e9
> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Handlers for accesses to the SR-IOV capability structure.
> + *
> + * Copyright (C) 2018 Citrix Systems R&D
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +static int vf_init_bars(const struct pci_dev *vf_pdev)
> +{
> +    unsigned int i, sriov_pos;
> +    int vf_idx, rc;
> +    const struct pci_dev *pf_pdev =3D vf_pdev->pf_pdev;
> +    uint16_t offset, stride;
> +    struct vpci_bar *bars =3D vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars =3D pf_pdev->vpci->sriov->vf_bars;
> +
> +    sriov_pos =3D pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_=
SRIOV);
> +    offset =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_VF_O=
FFSET);
> +    stride =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_VF_S=
TRIDE);
> +
> +    vf_idx =3D vf_pdev->sbdf.sbdf;
> +    vf_idx -=3D pf_pdev->sbdf.sbdf + offset;

We can probably rewrite it as

vf_idx =3D vf_pdev->sbdf.sbdf - (pf_pdev->sbdf.sbdf + offset);

especially with sbdf being potentially not representable as a int (even 
though very unlikely).

> +    if ( vf_idx < 0 )
> +        return -EINVAL;
> +    if ( stride )
> +    {
> +        if ( vf_idx % stride )
> +            return -EINVAL;
> +        vf_idx /=3D stride;
> +    }
> +
> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        bars[i].addr =3D physfn_vf_bars[i].addr + vf_idx * physfn_vf_bar=
s[i].size;
> +        bars[i].guest_addr =3D bars[i].addr;
> +        bars[i].size =3D physfn_vf_bars[i].size;
> +        bars[i].type =3D physfn_vf_bars[i].type;
> +        bars[i].prefetchable =3D physfn_vf_bars[i].prefetchable;
> +        rc =3D vpci_bar_add_rangeset(vf_pdev, &bars[i], i);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +static int map_vf(const struct pci_dev *vf_pdev, uint16_t cmd)
> +{
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    rc =3D vf_init_bars(vf_pdev);
> +    if ( rc )
> +        return rc;
> +
> +    return vpci_modify_bars(vf_pdev, cmd, false);
> +}
> +
> +static int size_vf_bars(struct pci_dev *pf_pdev, unsigned int sriov_pos)
> +{
> +    /*
> +     * NB: a non-const pci_dev of the PF is needed in order to update
> +     * vf_rlen.
> +     */
> +    struct vpci_bar *bars;
> +    unsigned int i;
> +    int rc =3D 0;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +    ASSERT(!pf_pdev->info.is_virtfn);
> +
> +    if ( !pf_pdev->vpci->sriov )
> +        return -EINVAL;
> +
> +    /* Read BARs for VFs out of PF's SR-IOV extended capability. */
> +    bars =3D pf_pdev->vpci->sriov->vf_bars;
> +    /* Set the BARs addresses and size. */
> +    for ( i =3D 0; i < PCI_SRIOV_NUM_BARS; i +=3D rc )
> +    {
> +        unsigned int idx =3D sriov_pos + PCI_SRIOV_BAR + i * 4;
> +        uint32_t bar;
> +        uint64_t addr, size;
> +
> +        bar =3D pci_conf_read32(pf_pdev->sbdf, idx);
> +
> +        rc =3D pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
> +                              PCI_BAR_VF |
> +                              ((i =3D=3D PCI_SRIOV_NUM_BARS - 1) ? PCI_B=
AR_LAST
> +                                                             : 0));
> +
> +        /*
> +         * Update vf_rlen on the PF. According to the spec the size of
> +         * the BARs can change if the system page size register is
> +         * modified, so always update rlen when enabling VFs.
> +         */
> +        pf_pdev->physfn.vf_rlen[i] =3D size;
> +
> +        if ( !size )
> +        {
> +            bars[i].type =3D VPCI_BAR_EMPTY;
> +            continue;
> +        }
> +
> +        bars[i].addr =3D addr;
> +        bars[i].guest_addr =3D addr;
> +        bars[i].size =3D size;
> +        bars[i].prefetchable =3D bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +        switch ( rc )
> +        {
> +        case 1:
> +            bars[i].type =3D VPCI_BAR_MEM32;
> +            break;
> +
> +        case 2:
> +            bars[i].type =3D VPCI_BAR_MEM64_LO;
> +            bars[i + 1].type =3D VPCI_BAR_MEM64_HI;
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +        }
> +    }
> +
> +    rc =3D rc > 0 ? 0 : rc;
> +
> +    return rc;
> +}
> +
> +static void cf_check control_write(const struct pci_dev *pdev, unsigned =
int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos =3D reg - PCI_SRIOV_CTRL;
> +    uint16_t control =3D pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled =3D control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled =3D val & PCI_SRIOV_CTRL_MSE;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_mem_enabled !=3D mem_enabled )
> +    {
> +        struct pci_dev *vf_pdev;
> +        if ( new_mem_enabled )
> +        {
> +            /* FIXME casting away const-ness to modify vf_rlen */
> +            size_vf_bars((struct pci_dev *)pdev, sriov_pos);
> +
> +            list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
> +                map_vf(vf_pdev, PCI_COMMAND_MEMORY);
> +        }
> +        else
> +        {
> +            list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
> +                map_vf(vf_pdev, 0);
> +        }
> +    }
> +
> +    pci_conf_write16(pdev->sbdf, reg, val);
> +}
> +
> +static int vf_init_header(struct pci_dev *vf_pdev)
> +{
> +    const struct pci_dev *pf_pdev;
> +    unsigned int sriov_pos;
> +    int rc =3D 0;
> +    uint16_t ctrl;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    if ( !vf_pdev->info.is_virtfn )
> +        return 0;
> +
> +    pf_pdev =3D vf_pdev->pf_pdev;
> +    ASSERT(pf_pdev);
> +
> +    sriov_pos =3D pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_=
SRIOV);
> +    ctrl =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( (pf_pdev->domain =3D=3D vf_pdev->domain) && (ctrl & PCI_SRIOV_C=
TRL_MSE) )
> +    {
> +        rc =3D map_vf(vf_pdev, PCI_COMMAND_MEMORY);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +static int init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    if ( pdev->info.is_virtfn )
> +        return vf_init_header(pdev);
> +
> +    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
> +
> +    if ( !pos )
> +        return 0;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return 0;
> +    }

Should it instead rely on xsm to know if it the operation is allowed or 
not for this domain ?

> +
> +    pdev->vpci->sriov =3D xzalloc(struct vpci_sriov);
> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, NULL);
> +}
> +
> +REGISTER_VPCI_INIT(init_sriov, VPCI_PRIORITY_LOW);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 09988f04c2..7af6651831 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -120,6 +120,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
>       for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
>           rangeset_destroy(pdev->vpci->header.bars[i].mem);
>   
> +    xfree(pdev->vpci->sriov);
>       xfree(pdev->vpci->msix);
>       xfree(pdev->vpci->msi);
>       xfree(pdev->vpci);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 06f7039f20..9e8dcab17e 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -138,7 +138,6 @@ struct vpci {
>            * upon to know whether BARs are mapped into the guest p2m.
>            */
>           bool bars_mapped      : 1;
> -        /* FIXME: currently there's no support for SR-IOV. */
>       } header;
>   
>       /* MSI data. */
> @@ -192,6 +191,12 @@ struct vpci {
>               struct vpci_arch_msix_entry arch;
>           } entries[];
>       } *msix;
> +
> +    struct vpci_sriov {
> +        /* PF only */
> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
> +    } *sriov;
> +
>   #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>       /* Guest SBDF of the device. */
>   #define INVALID_GUEST_SBDF ((pci_sbdf_t){ .sbdf =3D ~0U })



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



