Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9509640347E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 08:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181449.328559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrOs-0000G6-46; Wed, 08 Sep 2021 06:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181449.328559; Wed, 08 Sep 2021 06:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrOs-0000Ck-0v; Wed, 08 Sep 2021 06:49:38 +0000
Received: by outflank-mailman (input) for mailman id 181449;
 Wed, 08 Sep 2021 06:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrOp-0000Ce-Dg
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 06:49:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71ccbeff-fed4-4b6c-9170-620336930e35;
 Wed, 08 Sep 2021 06:49:32 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrNu-008ZoP-Gv; Wed, 08 Sep 2021 06:48:55 +0000
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
X-Inumbo-ID: 71ccbeff-fed4-4b6c-9170-620336930e35
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OrzGM9PLHfbyfeiU5N8A74VHnUlyeQDz1745rBQSmpE=; b=JvLbZFDB8IlVYMmqnbPjeH0zpT
	RS6TMNs3DqCPi4wnv+3RN+BAWH5wMMsH5OIbUJGjC9c+FFCSx0qVUnY9l1pDwbtkGF0v1rdZSeqkv
	8XX7xKR06ZiLWC8KJX9Wc5cBfed6lBQRH62JfWIeV4NJjQStpPIefHWmFJFFjudwengFWX7O9+UKm
	JnPsIv35qqOOxV/brv/0P5TTjFwkO3aGrqtXxjiSYg3zvBlHIJhqDusKynHPkF+9LwnkgJSAZfb8p
	N72r4r40Aj7RwC/fkxH0CgbUafSPL2d56ee5y/Rj+rPHP+4/dH3Ce027JiYI5/vdK/Awy8PLopLbN
	sv0vmElA==;
Date: Wed, 8 Sep 2021 07:48:38 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/12] swiotlb-xen: avoid double free
Message-ID: <YThcxvBhQqOVX2X4@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <ce9c2adb-8a52-6293-982a-0d6ece943ac6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce9c2adb-8a52-6293-982a-0d6ece943ac6@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:04:25PM +0200, Jan Beulich wrote:
> Of the two paths leading to the "error" label in xen_swiotlb_init() one
> didn't allocate anything, while the other did already free what was
> allocated.
> 
> Fixes: b82776005369 ("xen/swiotlb: Use the swiotlb_late_init_with_tbl to init Xen-SWIOTLB late when PV PCI is used")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: stable@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

