Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EECF986C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 18:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196350.1514194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdATU-0007GO-QB; Tue, 06 Jan 2026 17:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196350.1514194; Tue, 06 Jan 2026 17:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdATU-0007EA-NF; Tue, 06 Jan 2026 17:04:04 +0000
Received: by outflank-mailman (input) for mailman id 1196350;
 Tue, 06 Jan 2026 17:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZbEL=7L=bounce.vates.tech=bounce-md_30504962.695d4081.v1-359c39a1b76b443caecc621e9aa905e3@srs-se1.protection.inumbo.net>)
 id 1vdATU-0007E2-4e
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 17:04:04 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f9add9-eb21-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 18:04:02 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4dlyDx0qqhzK5vrVM
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jan 2026 17:04:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 359c39a1b76b443caecc621e9aa905e3; Tue, 06 Jan 2026 17:04:01 +0000
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
X-Inumbo-ID: b2f9add9-eb21-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767719041; x=1767989041;
	bh=PsaykRCeu3N+wVHokhx8ZhkaU760h6d3CDcBgBZBAcc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QUAtvkjmKgDjiVwOmB8CrEto8BgZ0DTY/0HjSF+5E+aD0YD7y0vBQaOFL9MOXLxJb
	 Loe2UsBnwsrlf7jGfsgR55ORzNYT1fyE1qjLPPqOr6KhWwtu2z7PVD10Krqg0GihQd
	 /TNzpUoS/80N/ZK/VdB3Rj63C5A3/QzaRbbbfz8eEBtzHE/WZz0u7KVyF6cXVvsvUR
	 Z0F6PfbK/lWIAPOyi077VWHI6FJCgUWWA7HYqSH++GvX6zp87qHw1J6IdS2xHzhriJ
	 G71qyDQtB/xSiFNjzPahlDqplBqdPShgJqP3DXfjTt4PH6shNvLSy3E/Dn8oXKUkYT
	 0lTd9/yFB02/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767719041; x=1767979541; i=teddy.astie@vates.tech;
	bh=PsaykRCeu3N+wVHokhx8ZhkaU760h6d3CDcBgBZBAcc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N7WOgLkIjJxzUEdP6m0wYNwogwfotBoMpbL6iX3hgv7bcwaqk6dOyD2GSUMgykS4T
	 UzFMqdE0onXEc2j5kx37pcVkfheNV7vSMOnmZVXHyt27hoqOKqUKGzwrYJwLzeR5rH
	 A8L7qp4WfgJFzO27Qywp0YcWRAOkCVSthSZxdM2DY5/kMi5zV5HunPLmLO0ctyxT+9
	 Zl0+g/JyL84I7YwYo9wDvwdUSLBOHvfIVXOPhR4A3sL5TkWIedDcmf97bI/BgZAubb
	 8X32yIjWj0IqwEfUYYzJYXd+wQUuVFq6tD88x9HFhfCyihuF8btPZ/6UiaJZQj3bu5
	 R1SGbTb1MfeKA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/6]=20PCI:=20pass=20pdev=20to=20pci=5Ffind=5F{,next=5F}ext=5Fcapability()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767719039376
Message-Id: <d9620b32-023f-4dd7-91cd-3b9c18e54498@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stewart Hildebrand" <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com> <594cc7a9-710c-4863-b46f-f5e6bc0247de@suse.com>
In-Reply-To: <594cc7a9-710c-4863-b46f-f5e6bc0247de@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.359c39a1b76b443caecc621e9aa905e3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260106:md
Date: Tue, 06 Jan 2026 17:04:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/01/2026 =C3=A0 14:52, Jan Beulich a =C3=A9crit=C2=A0:
> This is in preparation of using attributes recorded for devices.
> Additionally locating (extended) capabilities of non-devices (e.g. phanto=
m
> functions) makes no sense.
> 
> While there also eliminate open-coding of PCI_CFG_SPACE_SIZE in adjacent
> code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -676,7 +676,7 @@ static uint64_t read_pci_mem_bar(const s
>           unsigned int pos;
>           uint16_t ctrl, num_vf, offset, stride;
>   
> -        pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV=
);
> +        pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
>           ctrl =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
>           num_vf =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
>           offset =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSE=
T);
> --- a/xen/drivers/passthrough/ats.c
> +++ b/xen/drivers/passthrough/ats.c
> @@ -26,7 +26,7 @@ int enable_ats_device(struct pci_dev *pd
>       u32 value;
>       int pos;
>   
> -    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
> +    pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS);
>       BUG_ON(!pos);
>   
>       if ( iommu_verbose )
> --- a/xen/drivers/passthrough/ats.h
> +++ b/xen/drivers/passthrough/ats.h
> @@ -32,7 +32,7 @@ static inline int pci_ats_enabled(const
>       u32 value;
>       int pos;
>   
> -    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
> +    pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS);
>       BUG_ON(!pos);
>   
>       value =3D pci_conf_read16(pdev->sbdf, pos + ATS_REG_CTL);
> @@ -45,7 +45,7 @@ static inline int pci_ats_device(const s
>       if ( !ats_enabled )
>           return 0;
>   
> -    return pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
> +    return pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS);
>   }
>   
>   #endif /* DRIVERS__PASSTHROUGH__ATS_H */
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -641,7 +641,7 @@ static void pci_enable_acs(struct pci_de
>       if ( !is_iommu_enabled(pdev->domain) )
>           return;
>   
> -    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ACS);
> +    pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ACS);
>       if (!pos)
>           return;
>   
> @@ -787,8 +787,7 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>   
>       if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
>       {
> -        unsigned int pos =3D pci_find_ext_capability(pdev->sbdf,
> -                                                   PCI_EXT_CAP_ID_SRIOV)=
;
> +        unsigned int pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_I=
D_SRIOV);
>           uint16_t ctrl =3D pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_C=
TRL);
>   
>           if ( !pos )
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -62,7 +62,7 @@ int ats_device(const struct pci_dev *pde
>           return 0;
>   
>       ats_drhd =3D find_ats_dev_drhd(drhd->iommu);
> -    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
> +    pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS);
>   
>       if ( pos && (ats_drhd =3D=3D NULL) )
>       {
> --- a/xen/drivers/passthrough/vtd/quirks.c
> +++ b/xen/drivers/passthrough/vtd/quirks.c
> @@ -531,10 +531,10 @@ void pci_vtd_quirk(const struct pci_dev
>       /* Sandybridge-EP (Romley) */
>       case 0x3c00: /* host bridge */
>       case 0x3c01 ... 0x3c0b: /* root ports */
> -        pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ERR);
> +        pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ERR);
>           if ( !pos )
>           {
> -            pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_V=
NDR);
> +            pos =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_VNDR);
>               while ( pos )
>               {
>                   val =3D pci_conf_read32(pdev->sbdf, pos + PCI_VNDR_HEAD=
ER);
> @@ -543,7 +543,7 @@ void pci_vtd_quirk(const struct pci_dev
>                       pos +=3D PCI_VNDR_HEADER;
>                       break;
>                   }
> -                pos =3D pci_find_next_ext_capability(pdev->sbdf, pos,
> +                pos =3D pci_find_next_ext_capability(pdev, pos,
>                                                      PCI_EXT_CAP_ID_VNDR)=
;
>               }
>               ff =3D 0;
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -89,9 +89,10 @@ unsigned int pci_find_next_cap(pci_sbdf_
>    * within the device's PCI configuration space or 0 if the device does
>    * not support it.
>    */
> -unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap)
> +unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
> +                                     unsigned int cap)
>   {
> -    return pci_find_next_ext_capability(sbdf, 0, cap);
> +    return pci_find_next_ext_capability(pdev, 0, cap);
>   }
>   
>   /**
> @@ -104,14 +105,15 @@ unsigned int pci_find_ext_capability(pci
>    * within the device's PCI configuration space or 0 if the device does
>    * not support it.
>    */
> -unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int =
start,
> +unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
> +                                          unsigned int start,
>                                             unsigned int cap)
>   {
>       u32 header;
>       int ttl =3D 480; /* 3840 bytes, minimum 8 bytes per capability */
> -    unsigned int pos =3D max(start, 0x100U);
> +    unsigned int pos =3D max(start, PCI_CFG_SPACE_SIZE + 0U);
>   
> -    header =3D pci_conf_read32(sbdf, pos);
> +    header =3D pci_conf_read32(pdev->sbdf, pos);
>   
>       /*
>        * If we have no capabilities, this is indicated by cap ID,
> @@ -125,9 +127,9 @@ unsigned int pci_find_next_ext_capabilit
>           if ( PCI_EXT_CAP_ID(header) =3D=3D cap && pos !=3D start )
>               return pos;
>           pos =3D PCI_EXT_CAP_NEXT(header);
> -        if ( pos < 0x100 )
> +        if ( pos < PCI_CFG_SPACE_SIZE )
>               break;
> -        header =3D pci_conf_read32(sbdf, pos);
> +        header =3D pci_conf_read32(pdev->sbdf, pos);
>       }
>       return 0;
>   }
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -53,7 +53,7 @@ static int cf_check init_rebar(struct pc
>   {
>       uint32_t ctrl;
>       unsigned int nbars;
> -    unsigned int rebar_offset =3D pci_find_ext_capability(pdev->sbdf,
> +    unsigned int rebar_offset =3D pci_find_ext_capability(pdev,
>                                                           PCI_EXT_CAP_ID_=
REBAR);
>   
>       if ( !rebar_offset )
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -196,7 +196,7 @@ static struct vpci_register *vpci_get_pr
>   static int vpci_ext_capability_hide(
>       const struct pci_dev *pdev, unsigned int cap)
>   {
> -    const unsigned int offset =3D pci_find_ext_capability(pdev->sbdf, ca=
p);
> +    const unsigned int offset =3D pci_find_ext_capability(pdev, cap);
>       struct vpci_register *r, *prev_r;
>       struct vpci *vpci =3D pdev->vpci;
>       uint32_t header, pre_header;
> @@ -264,7 +264,7 @@ static int vpci_init_capabilities(struct
>           if ( !is_ext )
>               pos =3D pci_find_cap_offset(pdev->sbdf, cap);
>           else if ( is_hardware_domain(pdev->domain) )
> -            pos =3D pci_find_ext_capability(pdev->sbdf, cap);
> +            pos =3D pci_find_ext_capability(pdev, cap);
>   
>           if ( !pos )
>               continue;
> @@ -333,7 +333,7 @@ void vpci_deassign_device(struct pci_dev
>           if ( !capability->is_ext )
>               pos =3D pci_find_cap_offset(pdev->sbdf, cap);
>           else if ( is_hardware_domain(pdev->domain) )
> -            pos =3D pci_find_ext_capability(pdev->sbdf, cap);
> +            pos =3D pci_find_ext_capability(pdev, cap);
>           if ( pos )
>           {
>               int rc =3D capability->cleanup(pdev, false);
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -263,8 +263,10 @@ unsigned int pci_find_next_cap_ttl(pci_s
>                                      unsigned int *ttl);
>   unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>                                  unsigned int cap);
> -unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
> -unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int =
start,
> +unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
> +                                     unsigned int cap);
> +unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
> +                                          unsigned int start,
>                                             unsigned int cap);
>   const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int =
*bus_p,
>                         unsigned int *dev_p, unsigned int *func_p);
> 
> 

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



