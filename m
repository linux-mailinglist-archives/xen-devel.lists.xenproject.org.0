Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C564C30ED54
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 08:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81169.149451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Z5Q-0001Oe-1s; Thu, 04 Feb 2021 07:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81169.149451; Thu, 04 Feb 2021 07:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Z5P-0001OF-Uw; Thu, 04 Feb 2021 07:29:55 +0000
Received: by outflank-mailman (input) for mailman id 81169;
 Thu, 04 Feb 2021 07:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VauU=HG=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1l7Z5O-0001OA-RC
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 07:29:54 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37150ad6-5a02-4b42-ac84-c856080971dd;
 Thu, 04 Feb 2021 07:29:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DD16068AFE; Thu,  4 Feb 2021 08:29:47 +0100 (CET)
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
X-Inumbo-ID: 37150ad6-5a02-4b42-ac84-c856080971dd
Date: Thu, 4 Feb 2021 08:29:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
	akpm@linux-foundation.org, benh@kernel.crashing.org,
	bskeggs@redhat.com, bhelgaas@google.com, bp@alien8.de,
	boris.ostrovsky@oracle.com, hch@lst.de, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, hpa@zytor.com, mingo@kernel.org,
	mingo@redhat.com, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, jgross@suse.com,
	konrad.wilk@oracle.com, m.szyprowski@samsung.com,
	matthew.auld@intel.com, mpe@ellerman.id.au, rppt@kernel.org,
	paulus@samba.org, peterz@infradead.org, robin.murphy@arm.com,
	rodrigo.vivi@intel.com, sstabellini@kernel.org,
	bauerman@linux.ibm.com, tsbogend@alpha.franken.de,
	tglx@linutronix.de, ulf.hansson@linaro.org, joe.jin@oracle.com,
	thomas.lendacky@amd.com, Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH RFC v1 2/6] swiotlb: convert variables to arrays
Message-ID: <20210204072947.GA29812@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com> <20210203233709.19819-3-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203233709.19819-3-dongli.zhang@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Feb 03, 2021 at 03:37:05PM -0800, Dongli Zhang wrote:
> This patch converts several swiotlb related variables to arrays, in
> order to maintain stat/status for different swiotlb buffers. Here are
> variables involved:
> 
> - io_tlb_start and io_tlb_end
> - io_tlb_nslabs and io_tlb_used
> - io_tlb_list
> - io_tlb_index
> - max_segment
> - io_tlb_orig_addr
> - no_iotlb_memory
> 
> There is no functional change and this is to prepare to enable 64-bit
> swiotlb.

Claire Chang (on Cc) already posted a patch like this a month ago,
which looks much better because it actually uses a struct instead
of all the random variables. 

