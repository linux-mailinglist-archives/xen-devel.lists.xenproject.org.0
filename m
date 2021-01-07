Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49DE2ED65B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 19:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63039.111898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZeb-0003br-BB; Thu, 07 Jan 2021 18:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63039.111898; Thu, 07 Jan 2021 18:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZeb-0003bS-7u; Thu, 07 Jan 2021 18:04:57 +0000
Received: by outflank-mailman (input) for mailman id 63039;
 Thu, 07 Jan 2021 18:04:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfVD=GK=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kxZeZ-0003bN-QP
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 18:04:55 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c10a5cc-b9c2-4e60-abcd-548336e9c226;
 Thu, 07 Jan 2021 18:04:54 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107HrhgY122489;
 Thu, 7 Jan 2021 18:02:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35wftxd6hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 18:02:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107HsxJ2096626;
 Thu, 7 Jan 2021 18:00:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35v1fbhu8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 18:00:39 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 107I0YBv019522;
 Thu, 7 Jan 2021 18:00:34 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 18:00:33 +0000
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 56A6B6A00C3; Thu,  7 Jan 2021 13:00:32 -0500 (EST)
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
X-Inumbo-ID: 7c10a5cc-b9c2-4e60-abcd-548336e9c226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ONFAFUzWR9/dYKX6R5UPSmvsMe/XM4yxSwwcXYnlluo=;
 b=k3kFeIEgW4vzaR4ZfvPTjVDuH82iItpQcMeLnIZSpNlBXO/nlBJ/2BedFegemuW7x/n9
 5T6zuoIODh1nvQIYNbV9vtdd0rkp3MUUvbNymJpULPQWthCaupOJ61QzYsXDU2hvVRhn
 qSOhtKNsApENoFNmZMg9EGRXgSsWsgqbyJEs0W+O4pQl3q7wgB3x2Tc1NIu0vNPjaYLF
 ahKo9px5Rnbgx2GNFk96Gn3MxndBpVBPpEgZqrkAzR0w7bYROrVdVAjXFF1piDy5oe49
 6/Q4bDILkejn3BnDHnJupHVRcGxIzzKa+mHpAQh45hxoZjVrh8Rc5ocBK4sOtLZhDO5Y lQ== 
Date: Thu, 7 Jan 2021 13:00:32 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        will@kernel.org, Frank Rowand <frowand.list@gmail.com>,
        boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com,
        xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>,
        mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>, rafael.j.wysocki@intel.com,
        heikki.krogerus@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        rdunlap@infradead.org, dan.j.williams@intel.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        xen-devel@lists.xenproject.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210107180032.GB16519@char.us.oracle.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210106185757.GB109735@localhost.localdomain>
 <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070105

On Fri, Jan 08, 2021 at 01:39:43AM +0800, Claire Chang wrote:
> On Thu, Jan 7, 2021 at 2:58 AM Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com> wrote:
> >
> > On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> > > Introduce the new compatible string, restricted-dma-pool, for restricted
> > > DMA. One can specify the address and length of the restricted DMA memory
> > > region by restricted-dma-pool in the device tree.
> > >
> > > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > > ---
> > >  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > index e8d3096d922c..44975e2a1fd2 100644
> > > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > @@ -51,6 +51,20 @@ compatible (optional) - standard definition
> > >            used as a shared pool of DMA buffers for a set of devices. It can
> > >            be used by an operating system to instantiate the necessary pool
> > >            management subsystem if necessary.
> > > +        - restricted-dma-pool: This indicates a region of memory meant to be
> > > +          used as a pool of restricted DMA buffers for a set of devices. The
> > > +          memory region would be the only region accessible to those devices.
> > > +          When using this, the no-map and reusable properties must not be set,
> > > +          so the operating system can create a virtual mapping that will be used
> > > +          for synchronization. The main purpose for restricted DMA is to
> > > +          mitigate the lack of DMA access control on systems without an IOMMU,
> > > +          which could result in the DMA accessing the system memory at
> > > +          unexpected times and/or unexpected addresses, possibly leading to data
> > > +          leakage or corruption. The feature on its own provides a basic level
> > > +          of protection against the DMA overwriting buffer contents at
> > > +          unexpected times. However, to protect against general data leakage and
> > > +          system memory corruption, the system needs to provide way to restrict
> > > +          the DMA to a predefined memory region.
> >
> > Heya!
> >
> > I think I am missing something obvious here so please bear with my
> > questions:
> >
> >  - This code adds the means of having the SWIOTLB pool tied to a specific
> >    memory correct?
> 
> It doesn't affect the existing SWIOTLB. It just utilizes the existing SWIOTLB
> code to create another DMA pool tied to a specific memory region for a given set
> of devices. It bounces the streaming DMA (map/unmap) in and out of that region
> and does the memory allocation (dma_direct_alloc) from the same region.

Right, so why can't it follow the same mechanism that Xen SWIOTLB does - which
had exactly the same problem (needed special handling on the pool) - and do
a similar code?

> 
> >
> >
> >  - Nothing stops the physical device from bypassing the SWIOTLB buffer.
> >    That is if an errant device screwed up the length or DMA address, the
> >    SWIOTLB would gladly do what the device told it do?
> 
> So the system needs to provide a way to lock down the memory access, e.g. MPU.

OK! Would it be prudent to have this in the description above perhaps?
> 
> >
> >  - This has to be combined with SWIOTLB-force-ish to always use the
> >    bounce buffer, otherwise you could still do DMA without using
> >    SWIOTLB (by not hitting the criteria for needing to use SWIOTLB)?
> 
> Since restricted DMA is for the devices that are not behind an IOMMU, I change
> the criteria
> `if (unlikely(swiotlb_force == SWIOTLB_FORCE))`
> to
> `if (unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dma_io_tlb_mem)`
> in dma_direct_map_page().
> 
> Also, even if SWIOTLB=force, the restricted DMA pool is preferred if available
> (get_io_tlb_mem in https://lore.kernel.org/patchwork/patch/1360995/).
> 
> Thanks!

