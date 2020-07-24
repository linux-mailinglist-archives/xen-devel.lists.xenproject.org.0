Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C0122CE69
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 21:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz33z-0000eH-2m; Fri, 24 Jul 2020 19:08:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tno1=BD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jz33w-0000eC-S2
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 19:08:56 +0000
X-Inumbo-ID: 1ec7a93e-cde1-11ea-8883-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ec7a93e-cde1-11ea-8883-bc764e2007e4;
 Fri, 24 Jul 2020 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595617735;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dTA0AOHWB+wTsIepH5Uey9aBnWll55Pv73riAbQys/o=;
 b=Qg+gbYYsdly0/7wU0C/VjP42rdACOZr2tR5rmcZLpgfeyWoT4qLyFUus
 mCPsCW3v/1pM3QSqyMlyryE7g5aXZPKVN/m1cGZJxgVq7qHA0hLh1JGU1
 jJfTX/FCvOegkUUqSkkS1iPFF2XTWQJmXrbnMwhZ6U/JMCSmFnB+FPNtb U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: G3N7AlhAc81cS/Q9iEDUhqxMnV1QBOYHf8RzEmgcTnjRWgNEKZxUx4U2hPDg066V2lzN6fX6qZ
 C+9RZRyd8gGdRqxOK+FzIlAROqBnLpvkyiHl49iLAs6hMlkMIwi8xj0K++HKy8X1gwaFI7p3hS
 kx17EbbajiMsMvHVk7FR4NbbFTwbH+eniPU3RkCEFEtAJH2DFbCjKJ2Km32n38Y2zO3/djQmOx
 82IzmhbIvDIAu9liFecI1x5lzvAJBFoP6rArMbQsikPaq7LrKAyo8hyslQELfbGTNqanW0W5LS
 GKM=
X-SBRS: 2.7
X-MesageID: 23346714
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23346714"
Subject: Re: [PATCH 6/6] iommu: stop calling IOMMU page tables 'p2m tables'
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-7-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4e1c2ed8-dfc4-812b-d341-04bc5eedad8e@citrix.com>
Date: Fri, 24 Jul 2020 20:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-7-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/07/2020 17:46, Paul Durrant wrote:
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 6a3803ff2c..5bc190bf98 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -535,12 +535,12 @@ static void iommu_dump_p2m_table(unsigned char key)
>  
>          if ( iommu_use_hap_pt(d) )
>          {
> -            printk("\ndomain%d IOMMU p2m table shared with MMU: \n", d->domain_id);
> +            printk("%pd: IOMMU page tables shared with MMU\n", d);

Change MMU to CPU?  MMU is very ambiguous in this context.

>              continue;
>          }
>  
> -        printk("\ndomain%d IOMMU p2m table: \n", d->domain_id);
> -        ops->dump_p2m_table(d);
> +        printk("%pd: IOMMU page tables: \n", d);

Drop the trailing whitespace?

~Andrew

