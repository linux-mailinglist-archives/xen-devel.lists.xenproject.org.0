Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4730E5442F9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344595.570147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzATr-0003ox-9M; Thu, 09 Jun 2022 05:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344595.570147; Thu, 09 Jun 2022 05:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzATr-0003lk-66; Thu, 09 Jun 2022 05:13:15 +0000
Received: by outflank-mailman (input) for mailman id 344595;
 Thu, 09 Jun 2022 05:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmT3=WQ=bombadil.srs.infradead.org=BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nzAOH-0000o0-2N
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:07:29 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e8e3cef-e7b2-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 07:07:28 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzAOE-00GnS5-8r; Thu, 09 Jun 2022 05:07:26 +0000
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
X-Inumbo-ID: 0e8e3cef-e7b2-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=acG/hWi7Fz9ui2xVxpMoGeBP7vrmuNMLdX3ejzV7aPc=; b=MZhm3nf6mKFSlcr8dK8ijoBLa2
	MBmpr98pFWNa8b6ut+XZouG4H5T08bSJ23S8eyxslIMTr4C/O2zuvnG2/qsMxG0x37tmaxvgijfIb
	lGXyW4Q+2Io60XdLfGcV4rp/RIywa2u5fO9NieV0COBKOJzrFJhvVfmdj+5pSGWt/lb4HHj77Z/qa
	w661jXNSO/l+LgOue5Ca0yCP7G8O+ptXdbp8dSD1Vzdtm86SSvktBkKXYdbPsB22/xE+l3YTcUINL
	9HMTg+plhTcoM0gRCPZ1oapj04vRnOV9EHBOaOpaoHqGEW+z8Mh7/21uIp1vsKiXFvwHo2LUpgWRB
	KVKRCt6A==;
Date: Wed, 8 Jun 2022 22:07:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, hch@infradead.org,
	m.szyprowski@samsung.com, jgross@suse.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	sstabellini@kernel.org, mpe@ellerman.id.au, konrad.wilk@oracle.com,
	mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH RFC v1 7/7] swiotlb: fix the slot_addr() overflow
Message-ID: <YqGADnHAP7HYPvRr@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-8-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-8-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 08, 2022 at 05:55:53PM -0700, Dongli Zhang wrote:
> +#define slot_addr(start, idx)	((start) + \
> +				(((unsigned long)idx) << IO_TLB_SHIFT))

Please just convert it to an inline function.

