Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB01F9B34
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:00:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqae-0004vM-6v; Mon, 15 Jun 2020 15:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqac-0004vE-Nq
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:59:58 +0000
X-Inumbo-ID: e08f5784-af18-11ea-b807-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e08f5784-af18-11ea-b807-12813bfff9fa;
 Mon, 15 Jun 2020 14:59:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: o4ViAK7hESQ6SkCZ+/JEqLi/z5Zjg/YN7ficxMOhcvppD1ukBUk2P5kNEyd4p0Dh7moWWrzdIo
 WwXgPXP4A1SwrwlJCuHV+jftiChJEuGLVpAOMAe38p5yTg+J0lySjwwlUUqJogoFE4rhqnfuS3
 zVEf9uYY+Yb+Vq5qwBvSKm31JIrCkvPFRy/5QdTMbtON5X45u5JQwY39wdZkuduPKJnVWEjjq6
 XN4BlHkZ50Anmwvce44bKq9Jz0iuX3Nyz+Hs3RpPKpBNzaXDGO+ZCsM1l8KY31UM0qa25TpkLC
 qhM=
X-SBRS: 2.7
X-MesageID: 20415626
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20415626"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.36070.945693.791220@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:59:50 +0100
To: Grzegorz Uriasz <gorbak25@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, 
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] libxl: tooling expects wrong errno
In-Reply-To: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, "jakub@bartmin.ski" <jakub@bartmin.ski>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "j.nowak26@student.uw.edu.pl" <j.nowak26@student.uw.edu.pl>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "contact@puzio.waw.pl" <contact@puzio.waw.pl>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Grzegorz Uriasz writes ("[PATCH] libxl: tooling expects wrong errno"):
> When iommu is not enabled for a given domain then pci passthrough
> hypercalls such as xc_test_assign_device return EOPNOTSUPP.
> The code responsible for this is in "iommu_do_domctl" inside
> xen/drivers/passthrough/iommu.c
> This patch fixes the error message reported by libxl when assigning
> pci devices to domains without iommu.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
>  tools/libxl/libxl_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> index 957ff5c8e9..bc5843b137 100644
> --- a/tools/libxl/libxl_pci.c
> +++ b/tools/libxl/libxl_pci.c
> @@ -1561,7 +1561,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
>              LOGD(ERROR, domid,
>                   "PCI device %04x:%02x:%02x.%u %s?",
>                   pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
> -                 errno == ENOSYS ? "cannot be assigned - no IOMMU"
> +                 errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
>                   : "already assigned to a different guest");
>              goto out;
>          }

Thanks.  I have addressed some Xen IOMMU maintainers.  Can you confirm
whether this is right ?

Regards,
Ian.

