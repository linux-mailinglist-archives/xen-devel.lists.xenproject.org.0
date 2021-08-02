Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F83DD632
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 14:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163006.298724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXWd-0004rq-Ve; Mon, 02 Aug 2021 12:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163006.298724; Mon, 02 Aug 2021 12:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXWd-0004or-SO; Mon, 02 Aug 2021 12:58:35 +0000
Received: by outflank-mailman (input) for mailman id 163006;
 Mon, 02 Aug 2021 12:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zvSH=MZ=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1mAXWb-0004oR-Nd
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 12:58:33 +0000
Received: from theia.8bytes.org (unknown [81.169.241.247])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afa09f6b-0175-4485-bd39-379bdac5b72e;
 Mon, 02 Aug 2021 12:58:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9AD29379; Mon,  2 Aug 2021 14:58:30 +0200 (CEST)
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
X-Inumbo-ID: afa09f6b-0175-4485-bd39-379bdac5b72e
Date: Mon, 2 Aug 2021 14:58:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
	kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
	arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, thomas.lendacky@amd.com,
	brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
	rientjes@google.com, martin.b.radev@gmail.com,
	akpm@linux-foundation.org, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
	keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
Subject: Re: [PATCH 07/13] HV/Vmbus: Add SNP support for VMbus channel
 initiate message
Message-ID: <YQfr8lsaghth8Zix@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-8-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-8-ltykernel@gmail.com>

On Wed, Jul 28, 2021 at 10:52:22AM -0400, Tianyu Lan wrote:
> +	if (hv_is_isolation_supported()) {
> +		vmbus_connection.monitor_pages_va[0]
> +			= vmbus_connection.monitor_pages[0];
> +		vmbus_connection.monitor_pages[0]
> +			= memremap(msg->monitor_page1, HV_HYP_PAGE_SIZE,
> +				   MEMREMAP_WB);
> +		if (!vmbus_connection.monitor_pages[0])
> +			return -ENOMEM;
> +
> +		vmbus_connection.monitor_pages_va[1]
> +			= vmbus_connection.monitor_pages[1];
> +		vmbus_connection.monitor_pages[1]
> +			= memremap(msg->monitor_page2, HV_HYP_PAGE_SIZE,
> +				   MEMREMAP_WB);
> +		if (!vmbus_connection.monitor_pages[1]) {
> +			memunmap(vmbus_connection.monitor_pages[0]);
> +			return -ENOMEM;
> +		}
> +
> +		memset(vmbus_connection.monitor_pages[0], 0x00,
> +		       HV_HYP_PAGE_SIZE);
> +		memset(vmbus_connection.monitor_pages[1], 0x00,
> +		       HV_HYP_PAGE_SIZE);
> +	}

Okay, let me see if I got this right. In Hyper-V Isolation VMs, when the
guest wants to make memory shared, it does":

	- Call to the Hypervisor the mark the pages shared. The
	  Hypervisor will do the RMP update and remap the pages at
	  (VTOM + pa)

	- The guest maps the memory again into its page-table, so that
	  the entries point to the correct GPA (which is above VTOM
	  now).

Or in other words, Hyper-V implements a hardware-independent and
configurable c-bit position, as the VTOM value is always power-of-two
aligned. Is that correct?
This would at least explain why there is no separate
allocation/dealloction of memory for the shared range.

Thanks,

	Joerg

