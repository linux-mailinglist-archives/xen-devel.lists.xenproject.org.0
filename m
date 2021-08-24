Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8063F5A25
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 10:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170740.311638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIS7q-0001nn-QD; Tue, 24 Aug 2021 08:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170740.311638; Tue, 24 Aug 2021 08:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIS7q-0001m0-My; Tue, 24 Aug 2021 08:49:42 +0000
Received: by outflank-mailman (input) for mailman id 170740;
 Tue, 24 Aug 2021 08:49:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tbfa=NP=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mIS7o-0001lq-PZ
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 08:49:40 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91bb3ec2-2dde-4797-81ff-a1b7b7d7e52b;
 Tue, 24 Aug 2021 08:49:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6100567373; Tue, 24 Aug 2021 10:49:35 +0200 (CEST)
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
X-Inumbo-ID: 91bb3ec2-2dde-4797-81ff-a1b7b7d7e52b
Date: Tue, 24 Aug 2021 10:49:34 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mikelley@microsoft.com>
Cc: "hch@lst.de" <hch@lst.de>, Tianyu Lan <ltykernel@gmail.com>,
	KY Srinivasan <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"brijesh.singh@amd.com" <brijesh.singh@amd.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"saravanand@fb.com" <saravanand@fb.com>,
	"krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"rientjes@google.com" <rientjes@google.com>,
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	"tj@kernel.org" <tj@kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	vkuznets <vkuznets@redhat.com>,
	"parri.andrea@gmail.com" <parri.andrea@gmail.com>,
	"dave.hansen@intel.com" <dave.hansen@intel.com>,
	linux-rdma@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com
Subject: min_align_mask Re: [PATCH V3 13/13] HV/Storvsc: Add Isolation VM
 support for storvsc driver
Message-ID: <20210824084934.GC29844@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com> <20210809175620.720923-14-ltykernel@gmail.com> <MWHPR21MB1593EEF30FFD5C60ED744985D7C09@MWHPR21MB1593.namprd21.prod.outlook.com> <20210820043237.GC26450@lst.de> <CY4PR21MB1586FEB6F6ADD592C04E541BD7C19@CY4PR21MB1586.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR21MB1586FEB6F6ADD592C04E541BD7C19@CY4PR21MB1586.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Aug 20, 2021 at 03:40:08PM +0000, Michael Kelley wrote:
> I see that the swiotlb code gets and uses the min_align_mask field.  But
> the NVME driver is the only driver that ever sets it, so the value is zero
> in all other cases.  Does swiotlb just use PAGE_SIZE in that that case?  I
> couldn't tell from a quick glance at the swiotlb code.

The encoding isn't all that common.  I only know it for the RDMA memory
registration format, and RDMA in general does not interact very well
with swiotlb (although the in-kernel drivers should work fine, it is
userspace RDMA that is the problem).  It seems recently a new driver
using the format (mpi3mr) also showed up.  All these should probably set
the min_align_mask.

