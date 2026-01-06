Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EDCF97C6
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 17:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196329.1514173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdANA-0005DO-VB; Tue, 06 Jan 2026 16:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196329.1514173; Tue, 06 Jan 2026 16:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdANA-0005BS-SI; Tue, 06 Jan 2026 16:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1196329;
 Tue, 06 Jan 2026 16:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qf8+=7L=bounce.vates.tech=bounce-md_30504962.695d3ef7.v1-e4e5ddc247f74125bf560e26af8e0b56@srs-se1.protection.inumbo.net>)
 id 1vdAN9-0005BM-IB
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 16:57:31 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a08e50-eb20-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 17:57:29 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dly5M3pjfzlfcGn
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jan 2026 16:57:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e4e5ddc247f74125bf560e26af8e0b56; Tue, 06 Jan 2026 16:57:27 +0000
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
X-Inumbo-ID: c8a08e50-eb20-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767718647; x=1767988647;
	bh=y1DHwVnEK5SakP4fiqnEDnUD6SZeD8vTuVFiLGj8VJg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LaSHKnbbbChkcXy3T33zFzEknClH/i7HZeaaHtntSRNlow3k5iJDG7gJMRYPCbjYI
	 QqtrYUvGMrzEZKnmbI0u/uP07GmxrdN7czvfU7wSc/CvkneApMCJYotJ9/5f7wbK0H
	 VETsSQKFBuT755A9TgwlP3ccFduc5giyKd15o+RcF+w/yInhiByNL6wTE4oTQTq/p1
	 8LGeXvxcl3qRu57LYbzPEgASYmTXIEUP87Mjid3TgBg30ZhHdhtW5FgBobzc8+s4mD
	 ODf1ovS7wEr6C1g6eNy1AnLfZ8u1nmv6bpEMWOJXE3q43FeoGOCmAFsvmpby183yR9
	 GwfbgZUfax7Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767718647; x=1767979147; i=teddy.astie@vates.tech;
	bh=y1DHwVnEK5SakP4fiqnEDnUD6SZeD8vTuVFiLGj8VJg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YRnR6g4v5/yUHzpAfpYqsP3VDFnGxOCE8F5t1O8gLBIwfvdPQOoccSs9EPs2YMJj/
	 FrvORDbJvmU/lAOgtefo2rw9FgQDYlYEO8lwf+gpHU+/FzvX+IU53pAhLws1uyZBFs
	 iao6o4hCXlipG1c0hmeo2dPoAiTVLoCcwmTwMp2n0Xj+rr6vkTZvxPRhwdBd1pRdcI
	 yHbiaiS1JJWt3noN3jCvE22UCVHNuCu5ecbz7+Qs+t9zOwEFBD5pZRnGMHvPpBkwUo
	 I8ZFdxhrmYFeXioTML5mx+Z5RtUli2FejkRre5NFUjJdWJP1rHlxj+tP8G2TBQSTf0
	 DrqGQxHjiBEiQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/6]=20PCI:=20pass=20pdev=20to=20pci=5Fats=5F{device,enabled}()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767718645842
Message-Id: <a8f3f3cf-00f3-41e8-a238-e362b5140ac4@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stewart Hildebrand" <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com> <2ee53e39-997e-4bca-be57-ac51f75b471d@suse.com>
In-Reply-To: <2ee53e39-997e-4bca-be57-ac51f75b471d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e4e5ddc247f74125bf560e26af8e0b56?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260106:md
Date: Tue, 06 Jan 2026 16:57:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 06/01/2026 =C3=A0 14:51, Jan Beulich a =C3=A9crit=C2=A0:
> This not only brings both in sync with {en,dis}able_ats_device() but also
> prepares for doing the same to pci_find_{,next_}ext_capability().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -285,7 +285,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
>       if ( !ats_enabled )
>           return;
>   
> -    if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
> +    if ( !pci_ats_enabled(pdev) )
>           return;
>   
>       iommu =3D find_iommu_for_device(pdev->sbdf);
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -121,7 +121,7 @@ static bool use_ats(
>   {
>       return !ivrs_dev->block_ats &&
>              iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
> -           pci_ats_device(iommu->sbdf.seg, pdev->bus, pdev->devfn);
> +           pci_ats_device(pdev);
>   }
>   
>   static int __must_check amd_iommu_setup_domain_device(
> @@ -274,8 +274,7 @@ static int __must_check amd_iommu_setup_
>   
>       ASSERT(pcidevs_locked());
>   
> -    if ( use_ats(pdev, iommu, ivrs_dev) &&
> -         !pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
> +    if ( use_ats(pdev, iommu, ivrs_dev) && !pci_ats_enabled(pdev) )
>       {
>           if ( devfn =3D=3D pdev->devfn )
>               enable_ats_device(pdev, &iommu->ats_devices);
> @@ -418,8 +417,7 @@ static void amd_iommu_disable_domain_dev
>   
>       ASSERT(pcidevs_locked());
>   
> -    if ( pci_ats_device(iommu->sbdf.seg, bus, pdev->devfn) &&
> -         pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
> +    if ( pci_ats_device(pdev) && pci_ats_enabled(pdev) )
>           disable_ats_device(pdev);
>   
>       BUG_ON ( iommu->dev_table.buffer =3D=3D NULL );
> --- a/xen/drivers/passthrough/ats.h
> +++ b/xen/drivers/passthrough/ats.h
> @@ -27,27 +27,25 @@ extern bool ats_enabled;
>   int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)=
;
>   void disable_ats_device(struct pci_dev *pdev);
>   
> -static inline int pci_ats_enabled(int seg, int bus, int devfn)
> +static inline int pci_ats_enabled(const struct pci_dev *pdev)
>   {
>       u32 value;
>       int pos;
>   
> -    pos =3D pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
> -                                  PCI_EXT_CAP_ID_ATS);
> +    pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
>       BUG_ON(!pos);
>   
> -    value =3D pci_conf_read16(PCI_SBDF(seg, bus, devfn), pos + ATS_REG_C=
TL);
> +    value =3D pci_conf_read16(pdev->sbdf, pos + ATS_REG_CTL);
>   
>       return value & ATS_ENABLE;
>   }
>   
> -static inline int pci_ats_device(int seg, int bus, int devfn)
> +static inline int pci_ats_device(const struct pci_dev *pdev)
>   {
>       if ( !ats_enabled )
>           return 0;
>   
> -    return pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
> -                                   PCI_EXT_CAP_ID_ATS);
> +    return pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
>   }
>   
>   #endif /* DRIVERS__PASSTHROUGH__ATS_H */
> 
> 

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



