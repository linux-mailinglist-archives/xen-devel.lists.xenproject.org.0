Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8C1B0035
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 05:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQN6g-00066g-M2; Mon, 20 Apr 2020 03:28:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JSG1=6E=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jQN6f-00066Z-I7
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 03:28:25 +0000
X-Inumbo-ID: fc29dfe8-82b6-11ea-901c-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc29dfe8-82b6-11ea-901c-12813bfff9fa;
 Mon, 20 Apr 2020 03:28:22 +0000 (UTC)
IronPort-SDR: zt5TGFxK9GnJbilXOEaAUpbu6EMAmzBJVEK1BEVdvvFDuVinpjj/WEJoDf/GXG51c+n0iTsdR1
 RPz+YOrGzkhg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 20:28:20 -0700
IronPort-SDR: nxhYMr9cNGfvlA95hWQwrf4g4yVzsjvb1AIUKMWwKQOq2Ec2hAnXz1UwGfnucXsZp+FKZxt11P
 R5Dj35xqIZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; d="scan'208";a="456242835"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2020 20:28:20 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 19 Apr 2020 20:28:20 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 19 Apr 2020 20:28:20 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.138]) with mapi id 14.03.0439.000;
 Mon, 20 Apr 2020 11:28:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Brendan Kerrigan <brendank310@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/1] x86/vtd: Mask DMAR faults for IGD devices
Thread-Topic: [PATCH 1/1] x86/vtd: Mask DMAR faults for IGD devices
Thread-Index: AQHWFL1LsFJ5VBUZwEqsY3bDkrxGQKiBW4ZQ
Date: Mon, 20 Apr 2020 03:28:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D84C3FA@SHSMSX104.ccr.corp.intel.com>
References: <20200417133626.72302-1-brendank310@gmail.com>
 <20200417133626.72302-2-brendank310@gmail.com>
In-Reply-To: <20200417133626.72302-2-brendank310@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> From: Brendan Kerrigan <brendank310@gmail.com>
> Sent: Friday, April 17, 2020 9:36 PM
>=20
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>=20
> The Intel graphics device records DMAR faults regardless
> of the Fault Process Disable bit being set. When this fault

Since this is an errata for specific generations, let's describe
this way instead of stating it as a generic problem.

> occurs, enable the Interrupt Mask (IM) bit in the Fault
> Event Control (FECTL) register to prevent the continued
> recording of the fault.
>=20
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  xen/drivers/passthrough/vtd/iommu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/vtd/iommu.c
> b/xen/drivers/passthrough/vtd/iommu.c
> index 07d40b37fe..288399d816 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -41,6 +41,8 @@
>  #include "vtd.h"
>  #include "../ats.h"
>=20
> +#define IS_IGD(seg, id) (0 =3D=3D seg && 0 =3D=3D PCI_BUS(id) && 2 =3D=
=3D PCI_SLOT(id)
> && 0 =3D=3D PCI_FUNC(id))
> +
>  struct mapped_rmrr {
>      struct list_head list;
>      u64 base, end;
> @@ -872,6 +874,13 @@ static int iommu_page_fault_do_one(struct
> vtd_iommu *iommu, int type,
>      printk(XENLOG_G_WARNING VTDPREFIX "%s: reason %02x - %s\n",
>             kind, fault_reason, reason);
>=20
> +    if ( DMA_REMAP =3D=3D fault_type && type && IS_IGD(seg, source_id) )=
 {
> +        u32 fectl =3D dmar_readl(iommu->reg, DMAR_FECTL_REG);
> +        fectl |=3D DMA_FECTL_IM;
> +        dmar_writel(iommu->reg, DMAR_FECTL_REG, fectl);
> +        printk(XENLOG_G_WARNING VTDPREFIX "Disabling DMAR faults for
> IGD\n");
> +    }
> +

Several questions. First, I just note that FPD is not touched by any code
today. then how is this errata being caught? Second, we already have
pci_check_disable_device in place which stops DMAs from the problematic
device if it triggers excessive fault reports. why doesn't it work for your
case? Last, dma_msi_end just forces clearing the mask bit at end of handlin=
g
the fault interrupt, making above fix meaningless. Those questions just
make me wonder how you actually test this patch and whether it's necessary.=
..

Thanks
Kevin

>      if ( iommu_verbose && fault_type =3D=3D DMA_REMAP )
>          print_vtd_entries(iommu, PCI_BUS(source_id), PCI_DEVFN2(source_i=
d),
>                            addr >> PAGE_SHIFT);
> --
> 2.17.1


