Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A43F259F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 06:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169207.309096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGvuc-0003Pp-U8; Fri, 20 Aug 2021 04:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169207.309096; Fri, 20 Aug 2021 04:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGvuc-0003Nt-Qy; Fri, 20 Aug 2021 04:13:46 +0000
Received: by outflank-mailman (input) for mailman id 169207;
 Fri, 20 Aug 2021 04:13:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Niul=NL=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mGvub-0003Nn-Kr
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 04:13:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01ce9250-016d-11ec-a67e-12813bfff9fa;
 Fri, 20 Aug 2021 04:13:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 816B46736F; Fri, 20 Aug 2021 06:13:40 +0200 (CEST)
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
X-Inumbo-ID: 01ce9250-016d-11ec-a67e-12813bfff9fa
Date: Fri, 20 Aug 2021 06:13:40 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mikelley@microsoft.com>
Cc: Tianyu Lan <ltykernel@gmail.com>, KY Srinivasan <kys@microsoft.com>,
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
	"arnd@arndb.de" <arnd@arndb.de>, "hch@lst.de" <hch@lst.de>,
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
	"dave.hansen@intel.com" <dave.hansen@intel.com>
Subject: Re: [PATCH V3 11/13] HV/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Message-ID: <20210820041340.GA26450@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com> <20210809175620.720923-12-ltykernel@gmail.com> <MWHPR21MB159315B335EB0B064B0B0F23D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR21MB159315B335EB0B064B0B0F23D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 19, 2021 at 06:11:30PM +0000, Michael Kelley wrote:
> This function is manipulating page tables in the guest VM.  It is not involved
> in communicating with Hyper-V, or passing PFNs to Hyper-V.  The pfn array
> contains guest PFNs, not Hyper-V PFNs.  So it should use PAGE_SIZE
> instead of HV_HYP_PAGE_SIZE, and similarly PAGE_SHIFT and virt_to_pfn().
> If this code were ever to run on ARM64 in the future with PAGE_SIZE other
> than 4 Kbytes, the use of PAGE_SIZE is correct choice.

Yes.  I just stumled over this yesterday.  I think we can actually use a
nicer helper ased around vmap_range() to simplify this exactly because it
always uses the host page size.  I hope I can draft up a RFC today.


