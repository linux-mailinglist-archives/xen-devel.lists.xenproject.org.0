Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0C24B904
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:38:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8itE-0002B9-JK; Thu, 20 Aug 2020 11:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8itD-0002B4-Gw
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:37:51 +0000
X-Inumbo-ID: d0df7adf-1f1a-4a3a-b116-d3aba8c6fae4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0df7adf-1f1a-4a3a-b116-d3aba8c6fae4;
 Thu, 20 Aug 2020 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597923470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZAirrqoSKLQOVqqJWBpKueJlrlW7WlH8PvguimBoqcg=;
 b=USgWkIUa7F4+BEqsBiUuWl8Ky2/SRO+RkRMBNd1B8xwhlWeo/jjUm5Sa
 Up9mPHwu33dnpjz09eKVzNIMJ7yeylSn9iXidQINTH+00MIEsHTZzmPY3
 pgCKphBTBN1Ypod3YZs8whiOY7hEPzofDUMprdyLMskMp9jRxXMQRRTaE 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4nBaFLnRpBD3ly5eX58Un7Lg/gZ5xsv5/Atyb5KJyqp4Du0CE2K9eo3l0sHk6/iSuj0LcBplRs
 py/XsJnWH7CdQGPSyE9v0yfz1MTNlSBZRIqxId7A4BgJJP378Gr9g+yK8exusIK58eq7+ig1yE
 VMXT2qTxtvv93zngpqJ42vMERlxiMlDzOz7+ksKh5LNya7cBceZYtkNHTRCz2Wl8K1LVGTgB08
 DLgsy5wuMhnM/QCgRFDIz9M8mSd0hyZIKVqkd/EUnPb0uRZumstAnrPk+F9aHn+BCzwywOcY8+
 faw=
X-SBRS: 2.7
X-MesageID: 25271840
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,332,1592884800"; d="scan'208";a="25271840"
Date: Thu, 20 Aug 2020 13:37:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-kernel@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ira Weiny <ira.weiny@intel.com>, Aneesh Kumar K.V
 <aneesh.kumar@linux.ibm.com>, Johannes Thumshirn <jthumshirn@suse.de>, "Logan
 Gunthorpe" <logang@deltatee.com>, <linux-nvdimm@lists.01.org>,
 <xen-devel@lists.xenproject.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v4 1/2] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
Message-ID: <20200820113741.GV828@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-2-roger.pau@citrix.com>
 <96e34f77-8f55-d8a2-4d1f-4f4b667b0472@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96e34f77-8f55-d8a2-4d1f-4f4b667b0472@redhat.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 11, 2020 at 11:07:36PM +0200, David Hildenbrand wrote:
> On 11.08.20 11:44, Roger Pau Monne wrote:
> > This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
> > being used by non DAX devices.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Vishal Verma <vishal.l.verma@intel.com>
> > Cc: Dave Jiang <dave.jiang@intel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> > Cc: Johannes Thumshirn <jthumshirn@suse.de>
> > Cc: Logan Gunthorpe <logang@deltatee.com>
> > Cc: linux-nvdimm@lists.01.org
> > Cc: xen-devel@lists.xenproject.org
> > Cc: linux-mm@kvack.org
> > ---
> >  drivers/dax/device.c     | 2 +-
> >  include/linux/memremap.h | 9 ++++-----
> >  mm/memremap.c            | 2 +-
> >  3 files changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> > index 4c0af2eb7e19..1e89513f3c59 100644
> > --- a/drivers/dax/device.c
> > +++ b/drivers/dax/device.c
> > @@ -429,7 +429,7 @@ int dev_dax_probe(struct device *dev)
> >  		return -EBUSY;
> >  	}
> >  
> > -	dev_dax->pgmap.type = MEMORY_DEVICE_DEVDAX;
> > +	dev_dax->pgmap.type = MEMORY_DEVICE_GENERIC;
> >  	addr = devm_memremap_pages(dev, &dev_dax->pgmap);
> >  	if (IS_ERR(addr))
> >  		return PTR_ERR(addr);
> > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > index 5f5b2df06e61..e5862746751b 100644
> > --- a/include/linux/memremap.h
> > +++ b/include/linux/memremap.h
> > @@ -46,11 +46,10 @@ struct vmem_altmap {
> >   * wakeup is used to coordinate physical address space management (ex:
> >   * fs truncate/hole punch) vs pinned pages (ex: device dma).
> >   *
> > - * MEMORY_DEVICE_DEVDAX:
> > + * MEMORY_DEVICE_GENERIC:
> >   * Host memory that has similar access semantics as System RAM i.e. DMA
> > - * coherent and supports page pinning. In contrast to
> > - * MEMORY_DEVICE_FS_DAX, this memory is access via a device-dax
> > - * character device.
> > + * coherent and supports page pinning. This is for example used by DAX devices
> > + * that expose memory using a character device.
> >   *
> >   * MEMORY_DEVICE_PCI_P2PDMA:
> >   * Device memory residing in a PCI BAR intended for use with Peer-to-Peer
> > @@ -60,7 +59,7 @@ enum memory_type {
> >  	/* 0 is reserved to catch uninitialized type fields */
> >  	MEMORY_DEVICE_PRIVATE = 1,
> >  	MEMORY_DEVICE_FS_DAX,
> > -	MEMORY_DEVICE_DEVDAX,
> > +	MEMORY_DEVICE_GENERIC,
> >  	MEMORY_DEVICE_PCI_P2PDMA,
> >  };
> >  
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 03e38b7a38f1..006dace60b1a 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -216,7 +216,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
> >  			return ERR_PTR(-EINVAL);
> >  		}
> >  		break;
> > -	case MEMORY_DEVICE_DEVDAX:
> > +	case MEMORY_DEVICE_GENERIC:
> >  		need_devmap_managed = false;
> >  		break;
> >  	case MEMORY_DEVICE_PCI_P2PDMA:
> > 
> 
> No strong opinion (@Dan?), I do wonder if a separate type would make sense.

Gentle ping.

Thanks, Roger.

