Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF356258326
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 22:58:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCqrO-00013U-1t; Mon, 31 Aug 2020 20:57:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPao=CJ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kCqrN-00013P-0x
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 20:57:01 +0000
X-Inumbo-ID: e7d94460-0b9f-438e-842f-7a625d3e088c
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7d94460-0b9f-438e-842f-7a625d3e088c;
 Mon, 31 Aug 2020 20:56:58 +0000 (UTC)
IronPort-SDR: 7qfdt1XIHSaKP6evGgWpOo0UrtvtSjDA6G0tWd41pBX/I+U9Simn8GPfTm7FCHfY/6x5Ahjm2x
 KY0raj0yWfXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="241870791"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="241870791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 13:56:55 -0700
IronPort-SDR: t0PJjCuD1wtMFqkpi/FztVOjFZGZRijtNvTBBG6lxNyyHI/hyCERrhJlJXzQk2/5kzDmDwSPHq
 pOmLMXDREYiw==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="445865326"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 13:56:55 -0700
Date: Mon, 31 Aug 2020 13:56:55 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Johannes Thumshirn <jthumshirn@suse.de>,
 Logan Gunthorpe <logang@deltatee.com>, linux-nvdimm@lists.01.org,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 1/2] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
Message-ID: <20200831205655.GK1422350@iweiny-DESK2.sc.intel.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-2-roger.pau@citrix.com>
 <96e34f77-8f55-d8a2-4d1f-4f4b667b0472@redhat.com>
 <20200820113741.GV828@Air-de-Roger>
 <20200831101907.GA753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200831101907.GA753@Air-de-Roger>
User-Agent: Mutt/1.11.1 (2018-12-01)
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

On Mon, Aug 31, 2020 at 12:19:07PM +0200, Roger Pau Monné wrote:
> On Thu, Aug 20, 2020 at 01:37:41PM +0200, Roger Pau Monné wrote:
> > On Tue, Aug 11, 2020 at 11:07:36PM +0200, David Hildenbrand wrote:
> > > On 11.08.20 11:44, Roger Pau Monne wrote:
> > > > This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
> > > > being used by non DAX devices.
> > > > 
> > > > No functional change intended.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Dan is out on leave so I'll chime in.

I can't really justify keeping this as DEVDAX if there is another user who
needs the same type of mapping.

Sorry for the delay.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> > > > ---
> > > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > > Cc: Vishal Verma <vishal.l.verma@intel.com>
> > > > Cc: Dave Jiang <dave.jiang@intel.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: Ira Weiny <ira.weiny@intel.com>
> > > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> > > > Cc: Johannes Thumshirn <jthumshirn@suse.de>
> > > > Cc: Logan Gunthorpe <logang@deltatee.com>
> > > > Cc: linux-nvdimm@lists.01.org
> > > > Cc: xen-devel@lists.xenproject.org
> > > > Cc: linux-mm@kvack.org
> > > > ---
> > > >  drivers/dax/device.c     | 2 +-
> > > >  include/linux/memremap.h | 9 ++++-----
> > > >  mm/memremap.c            | 2 +-
> > > >  3 files changed, 6 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> > > > index 4c0af2eb7e19..1e89513f3c59 100644
> > > > --- a/drivers/dax/device.c
> > > > +++ b/drivers/dax/device.c
> > > > @@ -429,7 +429,7 @@ int dev_dax_probe(struct device *dev)
> > > >  		return -EBUSY;
> > > >  	}
> > > >  
> > > > -	dev_dax->pgmap.type = MEMORY_DEVICE_DEVDAX;
> > > > +	dev_dax->pgmap.type = MEMORY_DEVICE_GENERIC;
> > > >  	addr = devm_memremap_pages(dev, &dev_dax->pgmap);
> > > >  	if (IS_ERR(addr))
> > > >  		return PTR_ERR(addr);
> > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > index 5f5b2df06e61..e5862746751b 100644
> > > > --- a/include/linux/memremap.h
> > > > +++ b/include/linux/memremap.h
> > > > @@ -46,11 +46,10 @@ struct vmem_altmap {
> > > >   * wakeup is used to coordinate physical address space management (ex:
> > > >   * fs truncate/hole punch) vs pinned pages (ex: device dma).
> > > >   *
> > > > - * MEMORY_DEVICE_DEVDAX:
> > > > + * MEMORY_DEVICE_GENERIC:
> > > >   * Host memory that has similar access semantics as System RAM i.e. DMA
> > > > - * coherent and supports page pinning. In contrast to
> > > > - * MEMORY_DEVICE_FS_DAX, this memory is access via a device-dax
> > > > - * character device.
> > > > + * coherent and supports page pinning. This is for example used by DAX devices
> > > > + * that expose memory using a character device.
> > > >   *
> > > >   * MEMORY_DEVICE_PCI_P2PDMA:
> > > >   * Device memory residing in a PCI BAR intended for use with Peer-to-Peer
> > > > @@ -60,7 +59,7 @@ enum memory_type {
> > > >  	/* 0 is reserved to catch uninitialized type fields */
> > > >  	MEMORY_DEVICE_PRIVATE = 1,
> > > >  	MEMORY_DEVICE_FS_DAX,
> > > > -	MEMORY_DEVICE_DEVDAX,
> > > > +	MEMORY_DEVICE_GENERIC,
> > > >  	MEMORY_DEVICE_PCI_P2PDMA,
> > > >  };
> > > >  
> > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > index 03e38b7a38f1..006dace60b1a 100644
> > > > --- a/mm/memremap.c
> > > > +++ b/mm/memremap.c
> > > > @@ -216,7 +216,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
> > > >  			return ERR_PTR(-EINVAL);
> > > >  		}
> > > >  		break;
> > > > -	case MEMORY_DEVICE_DEVDAX:
> > > > +	case MEMORY_DEVICE_GENERIC:
> > > >  		need_devmap_managed = false;
> > > >  		break;
> > > >  	case MEMORY_DEVICE_PCI_P2PDMA:
> > > > 
> > > 
> > > No strong opinion (@Dan?), I do wonder if a separate type would make sense.
> > 
> > Gentle ping.
> 
> Sorry to ping again, but I would rather get this out of my queue if
> possible, seeing as the other patch is OK to go in but depends on this
> one going in first.
> 
> Thanks, Roger.

