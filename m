Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6641D2E1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 07:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199372.353383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVovl-0001vr-Ht; Thu, 30 Sep 2021 05:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199372.353383; Thu, 30 Sep 2021 05:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVovl-0001u4-EM; Thu, 30 Sep 2021 05:48:29 +0000
Received: by outflank-mailman (input) for mailman id 199372;
 Thu, 30 Sep 2021 05:48:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tdhe=OU=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mVovk-0001ty-2i
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 05:48:28 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19f006ae-ef9a-487a-97f0-2b1379dc5eff;
 Thu, 30 Sep 2021 05:48:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 272C868AFE; Thu, 30 Sep 2021 07:48:22 +0200 (CEST)
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
X-Inumbo-ID: 19f006ae-ef9a-487a-97f0-2b1379dc5eff
Date: Thu, 30 Sep 2021 07:48:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	vkuznets <vkuznets@redhat.com>,
	"parri.andrea@gmail.com" <parri.andrea@gmail.com>,
	"dave.hansen@intel.com" <dave.hansen@intel.com>,
	Michael Kelley <mikelley@microsoft.com>,
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
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"brijesh.singh@amd.com" <brijesh.singh@amd.com>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"saravanand@fb.com" <saravanand@fb.com>,
	"krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"tj@kernel.org" <tj@kernel.org>,
	"rientjes@google.com" <rientjes@google.com>
Subject: Re: [PATCH V5 12/12] net: netvsc: Add Isolation VM support for
 netvsc driver
Message-ID: <20210930054821.GA22332@lst.de>
References: <20210914133916.1440931-1-ltykernel@gmail.com> <20210914133916.1440931-13-ltykernel@gmail.com> <MWHPR21MB15939A5D74CA1DF25EE816ADD7DB9@MWHPR21MB1593.namprd21.prod.outlook.com> <43e22b84-7273-4099-42ea-54b06f398650@gmail.com> <e379a60b-4d74-9167-983f-f70c96bb279e@gmail.com> <20210928053911.GA29208@lst.de> <de18b708-7252-642b-c60f-59e12ac27421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de18b708-7252-642b-c60f-59e12ac27421@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Sep 28, 2021 at 05:23:31PM +0800, Tianyu Lan wrote:
>>
>>   - the bare memremap usage in swiotlb looks strange and I'd
>>     definitively expect a well documented wrapper.
>
> OK. Should the wrapper in the DMA code? How about dma_map_decrypted() 
> introduced in the V4?

A mentioned then the name is a pretty bad choice as it touches the dma_map*
namespace that it is not related to.  I suspect just a little helper
in the swiotlb code that explains how it is used might be enogh for now.

