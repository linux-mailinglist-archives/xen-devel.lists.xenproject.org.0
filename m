Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25A22EE79C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 22:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63128.112087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxckm-0007oA-1W; Thu, 07 Jan 2021 21:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63128.112087; Thu, 07 Jan 2021 21:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxckl-0007nl-UA; Thu, 07 Jan 2021 21:23:31 +0000
Received: by outflank-mailman (input) for mailman id 63128;
 Thu, 07 Jan 2021 21:23:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfVD=GK=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kxckk-0007ne-Nn
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 21:23:30 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33b59fea-dba2-4016-b88f-8aece29019ee;
 Thu, 07 Jan 2021 21:23:28 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107L9qUN157941;
 Thu, 7 Jan 2021 21:21:52 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35wftxdyp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 21:21:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107LASx6174620;
 Thu, 7 Jan 2021 21:19:51 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 35w3qu9kyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 21:19:51 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107LJcni003821;
 Thu, 7 Jan 2021 21:19:38 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 21:19:38 +0000
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 3F3FD6A010C; Thu,  7 Jan 2021 16:19:37 -0500 (EST)
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
X-Inumbo-ID: 33b59fea-dba2-4016-b88f-8aece29019ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=c9kjhiPaRcgOzWstQJHEKUIH/U+Km3Fjzp7KkmlSZjc=;
 b=rKYVHRBU6NO1rtuG37bqZjZCK6xmxGbYy0AsyG/XUttowywJr9+V7ezApjVzpWtJ13Y5
 3G9p/wvcTEewjEr/2DCY1Yf6AVruqXotBoUQgjKYun298vJlx2gRKh1u7lGAwbac4rLd
 BYWr2fcfuqXZDIGaafVjEG6mz8GDnxVIm5kAAtxIMvLa+4GNYE3gnRv6RwMFs4ZX1tcD
 fi4NOxKKyN47kdzcafOqy2rEvxswHIxc67dH2oD2nIc655e6a+1QpeXN26qBzNIRAApc
 CNcwaIbofYPZxp/INyde860tR49n8Bh9IDhLdaIW7LGk47AmYuhdzr9+mGRHjfQSevdx PQ== 
Date: Thu, 7 Jan 2021 16:19:37 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>, will@kernel.org,
        Frank Rowand <frowand.list@gmail.com>, boris.ostrovsky@oracle.com,
        jgross@suse.com, sstabellini@kernel.org,
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
        xen-devel@lists.xenproject.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210107211937.GA19460@char.us.oracle.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <20210106185241.GA109735@localhost.localdomain>
 <CALiNf2-HDf6tFcvVgCttr-ta=88ZMH=OvB5XoryTPc6MNvwV+Q@mail.gmail.com>
 <20210107175740.GA16519@char.us.oracle.com>
 <aa5af7d1-779e-f0f6-e6ba-8040e603523f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa5af7d1-779e-f0f6-e6ba-8040e603523f@gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070123

On Thu, Jan 07, 2021 at 10:09:14AM -0800, Florian Fainelli wrote:
> On 1/7/21 9:57 AM, Konrad Rzeszutek Wilk wrote:
> > On Fri, Jan 08, 2021 at 01:39:18AM +0800, Claire Chang wrote:
> >> Hi Greg and Konrad,
> >>
> >> This change is intended to be non-arch specific. Any arch that lacks DMA access
> >> control and has devices not behind an IOMMU can make use of it. Could you share
> >> why you think this should be arch specific?
> > 
> > The idea behind non-arch specific code is it to be generic. The devicetree
> > is specific to PowerPC, Sparc, and ARM, and not to x86 - hence it should
> > be in arch specific code.
> 
> In premise the same code could be used with an ACPI enabled system with
> an appropriate service to identify the restricted DMA regions and unlock
> them.

Which this patchset is not.

> 
> More than 1 architecture requiring this function (ARM and ARM64 are the
> two I can think of needing this immediately) sort of calls for making
> the code architecture agnostic since past 2, you need something that scales.

I believe the use-case is for ARM64 at this moment.

> 
> There is already code today under kernel/dma/contiguous.c that is only
> activated on a CONFIG_OF=y && CONFIG_OF_RESERVED_MEM=y system, this is
> no different.
> -- 
> Florian

