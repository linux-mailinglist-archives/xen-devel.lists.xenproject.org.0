Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763A5442D8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344557.570103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzALz-0000WI-IU; Thu, 09 Jun 2022 05:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344557.570103; Thu, 09 Jun 2022 05:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzALz-0000UE-FI; Thu, 09 Jun 2022 05:05:07 +0000
Received: by outflank-mailman (input) for mailman id 344557;
 Thu, 09 Jun 2022 05:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmT3=WQ=bombadil.srs.infradead.org=BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nzALx-0000U6-IG
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:05:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c45287-e7b1-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 07:05:02 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzALp-00Gmug-RP; Thu, 09 Jun 2022 05:04:57 +0000
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
X-Inumbo-ID: b6c45287-e7b1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wu8aFObH2hHSMKYcBRx522Iw5QK4xZIvlYeZFEP3Kk8=; b=AGFJ5yCS6ccyDZaWrHTtIENtg2
	ewgk3wbTcgyJwqkGBn/ECO0YkpnGr1nhlzroXQ0e44S3K0rloI9v7JC83sD3Y+DkscyzxXtRq6seC
	5BE4mdWoEqX0Vgn4MxsbbkI6XMr8CcpNWB7qMagiEN2yOqELMm7CRGAWlXy+QVLDeK0tjLXFZUb9J
	JzBYTt0lYEem70Oabsxdet520DwMot9ysqcapl0IQqwDDK88mt0arOXL0CrgBrBZzbntk0nnGmXJG
	u1dvlEEXt4AiKYNPte6f6uIgPw4n1FjwNUbg8QzgaLNbbJ2FvoFqCi6bB/hwjUaqIjVN/4DtjsKn3
	waLCjuCA==;
Date: Wed, 8 Jun 2022 22:04:57 -0700
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
Subject: Re: [PATCH RFC v1 1/7] swiotlb: introduce the highmem swiotlb buffer
Message-ID: <YqF/eZE9eozDURWz@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-2-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-2-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 08, 2022 at 05:55:47PM -0700, Dongli Zhang wrote:
> @@ -109,6 +109,7 @@ struct io_tlb_mem {
>  	} *slots;
>  };
>  extern struct io_tlb_mem io_tlb_default_mem;
> +extern struct io_tlb_mem io_tlb_high_mem;

Tis should not be exposed.

> +extern bool swiotlb_high_active(void);

And this should not even exist.

> +static unsigned long high_nslabs;

And I don't think "high" is a good name here to start with.  That
suggests highmem, which we are not using here.

