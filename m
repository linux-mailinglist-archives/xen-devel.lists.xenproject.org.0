Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25229CF9854
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 18:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196341.1514184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdARf-0006lP-FR; Tue, 06 Jan 2026 17:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196341.1514184; Tue, 06 Jan 2026 17:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdARf-0006ir-CC; Tue, 06 Jan 2026 17:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1196341;
 Tue, 06 Jan 2026 17:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfJ0=7L=bounce.vates.tech=bounce-md_30504962.695d400c.v1-8cc4b391f3b146d5ac0f9bccd49f68b9@srs-se1.protection.inumbo.net>)
 id 1vdARd-0006ik-Kz
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 17:02:09 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dad9009-eb21-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 18:02:06 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4dlyBh74PPzK5vgVM
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jan 2026 17:02:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8cc4b391f3b146d5ac0f9bccd49f68b9; Tue, 06 Jan 2026 17:02:04 +0000
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
X-Inumbo-ID: 6dad9009-eb21-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767718925; x=1767988925;
	bh=egqjvhUVqm4ao1P2jtHT/8Qd8On7BJ1hb3Y7cTHD+O8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Rlrv6CeLYrGL2epincZPGgmYvftm0DkKsyyeltqANie/ndy1376m/lgA3zu8j8NpN
	 PJ6V+xKKqr+GfKg+XgAsRfaX8uBBYGCai3lKgIXQ/WUaV9AfFXzN50GsVuA3ghB3S4
	 PFJqrZU088I2a1z8bgNzk5ycTl+lVp6foDGXQqQfDW4/HNZsoGhAUwhXbf6R2EZvqT
	 BNU1SQ7aFA6mEyiNa/XndPtqv97KR+cxVtDqY+zishOqrDRnNhAhGWTbvVugk7WvJJ
	 60H/ODd3/O2lbTbJjkkGboWayw6FowzKsjEkJhSo5Ny8N4JTqnKpqyLQpILu8O5dn6
	 WIEEOJUZu5PKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767718925; x=1767979425; i=teddy.astie@vates.tech;
	bh=egqjvhUVqm4ao1P2jtHT/8Qd8On7BJ1hb3Y7cTHD+O8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yvWXeI6p0SHn/kovpIGMczh5V/7/aCb7N/xbw/1LkaxrMfRTDZTkJcPwobBPXjUet
	 mUvs2FfVb7c/XsNCZxCAqDSoX+t7qaBYbL2SYJP2GFC3fFK1TQKq+osH0NB+llH4cj
	 A86MJaMBxDaB2kIN2K8JR1dY9NuZr/sITBl/x9qU5XL2wM9qTiIaYI6IlYzik0ho5O
	 MpMrPivGt2YtGq3lFOsK7CkGMUaoliHxqxxbnxoNUm0zEPI1iQy/lurgoK8oaiqjeZ
	 0u6rCC1qSM8ADd3xqXSduNZalP5F1VBX4b+1nBa2sLFJ7SZvWmt45QJ3+LVWCO0ZxQ
	 0mJvIRH1VpExg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=203/6]=20x86/MSI:=20pass=20pdev=20to=20read=5Fpci=5Fmem=5Fbar()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767718923781
Message-Id: <a6d3f64c-e296-4cea-a84a-45811f1f4f70@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stewart Hildebrand" <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com> <c7e18657-97fa-4fc6-bbea-826b7c64b86a@suse.com>
In-Reply-To: <c7e18657-97fa-4fc6-bbea-826b7c64b86a@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8cc4b391f3b146d5ac0f9bccd49f68b9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260106:md
Date: Tue, 06 Jan 2026 17:02:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/01/2026 =C3=A0 14:51, Jan Beulich a =C3=A9crit=C2=A0:
> This not only reduces the number of parameters and local variables, but
> also prepares for doing the same to pci_find_{,next_}ext_capability().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -662,11 +662,11 @@ static int msi_capability_init(struct pc
>       return 0;
>   }
>   
> -static uint64_t read_pci_mem_bar(pci_sbdf_t sbdf, uint8_t bir, int vf,
> -                                 const struct pf_info *pf_info)
> +static uint64_t read_pci_mem_bar(const struct pci_dev *pdev, uint8_t bir=
,
> +                                 int vf)
>   {
> -    uint16_t seg =3D sbdf.seg;
> -    uint8_t bus =3D sbdf.bus, slot =3D sbdf.dev, func =3D sbdf.fn;
> +    uint16_t seg =3D pdev->sbdf.seg;
> +    uint8_t bus =3D pdev->sbdf.bus, slot =3D pdev->sbdf.dev, func =3D pd=
ev->sbdf.fn;
>       u8 limit;
>       u32 addr, base =3D PCI_BASE_ADDRESS_0;
>       u64 disp =3D 0;
> @@ -676,20 +676,18 @@ static uint64_t read_pci_mem_bar(pci_sbd
>           unsigned int pos;
>           uint16_t ctrl, num_vf, offset, stride;
>   
> -        ASSERT(pf_info);
> -
> -        pos =3D pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
> -        ctrl =3D pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
> -        num_vf =3D pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
> -        offset =3D pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
> -        stride =3D pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
> +        pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV=
);
> +        ctrl =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
> +        num_vf =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
> +        offset =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET=
);
> +        stride =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE=
);
>   
>           if ( !pos ||
>                !(ctrl & PCI_SRIOV_CTRL_VFE) ||
>                !(ctrl & PCI_SRIOV_CTRL_MSE) ||
>                !num_vf || !offset || (num_vf > 1 && !stride) ||
>                bir >=3D PCI_SRIOV_NUM_BARS ||
> -             !pf_info->vf_rlen[bir] )
> +             !pdev->physfn.vf_rlen[bir] )
>               return 0;
>           base =3D pos + PCI_SRIOV_BAR;
>           vf -=3D PCI_BDF(bus, slot, func) + offset;
> @@ -703,8 +701,8 @@ static uint64_t read_pci_mem_bar(pci_sbd
>           }
>           if ( vf >=3D num_vf )
>               return 0;
> -        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) !=3D PCI_SRIOV_NUM_BAR=
S);
> -        disp =3D vf * pf_info->vf_rlen[bir];
> +        BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=3D PCI_SRIOV_NUM=
_BARS);
> +        disp =3D vf * pdev->physfn.vf_rlen[bir];
>           limit =3D PCI_SRIOV_NUM_BARS;
>       }
>       else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
> @@ -759,10 +757,6 @@ static int msix_capability_init(struct p
>       u16 control;
>       u64 table_paddr;
>       u32 table_offset;
> -    u16 seg =3D dev->seg;
> -    u8 bus =3D dev->bus;
> -    u8 slot =3D PCI_SLOT(dev->devfn);
> -    u8 func =3D PCI_FUNC(dev->devfn);
>       bool maskall =3D msix->host_maskall, zap_on_error =3D false;
>       unsigned int pos =3D dev->msix_pos;
>   
> @@ -809,32 +803,20 @@ static int msix_capability_init(struct p
>             (is_hardware_domain(current->domain) &&
>              (dev->domain =3D=3D current->domain || dev->domain =3D=3D do=
m_io))) )
>       {
> -        unsigned int bir =3D table_offset & PCI_MSIX_BIRMASK, pbus, pslo=
t, pfunc;
> -        int vf;
> +        unsigned int bir =3D table_offset & PCI_MSIX_BIRMASK;
> +        int vf =3D -1;
> +        const struct pci_dev *pf_dev =3D dev;
>           paddr_t pba_paddr;
>           unsigned int pba_offset;
> -        const struct pf_info *pf_info;
>   
> -        if ( !dev->info.is_virtfn )
> -        {
> -            pbus =3D bus;
> -            pslot =3D slot;
> -            pfunc =3D func;
> -            vf =3D -1;
> -            pf_info =3D NULL;
> -        }
> -        else
> +        if ( dev->info.is_virtfn )
>           {
> -            pbus =3D dev->info.physfn.bus;
> -            pslot =3D PCI_SLOT(dev->info.physfn.devfn);
> -            pfunc =3D PCI_FUNC(dev->info.physfn.devfn);
>               vf =3D dev->sbdf.bdf;
>               ASSERT(dev->pf_pdev);
> -            pf_info =3D &dev->pf_pdev->physfn;
> +            pf_dev =3D dev->pf_pdev;
>           }
>   
> -        table_paddr =3D read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfun=
c), bir,
> -                                       vf, pf_info);
> +        table_paddr =3D read_pci_mem_bar(pf_dev, bir, vf);
>           WARN_ON(msi && msi->table_base !=3D table_paddr);
>           if ( !table_paddr )
>           {
> @@ -857,8 +839,7 @@ static int msix_capability_init(struct p
>   
>           pba_offset =3D pci_conf_read32(dev->sbdf, msix_pba_offset_reg(p=
os));
>           bir =3D (u8)(pba_offset & PCI_MSIX_BIRMASK);
> -        pba_paddr =3D read_pci_mem_bar(PCI_SBDF(seg, pbus, pslot, pfunc)=
, bir, vf,
> -                                     pf_info);
> +        pba_paddr =3D read_pci_mem_bar(pf_dev, bir, vf);
>           WARN_ON(!pba_paddr);
>           pba_paddr +=3D pba_offset & ~PCI_MSIX_BIRMASK;
>   
> 
> 

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



