Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C7551F48D
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 08:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324231.546190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnwwL-0002OW-6V; Mon, 09 May 2022 06:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324231.546190; Mon, 09 May 2022 06:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnwwL-0002Mi-3i; Mon, 09 May 2022 06:32:17 +0000
Received: by outflank-mailman (input) for mailman id 324231;
 Mon, 09 May 2022 06:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BShC=VR=bombadil.srs.infradead.org=BATV+4b7c9b612f3e40150011+6833+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nnwwI-0001pV-T4
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 06:32:14 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3123db9-cf61-11ec-a406-831a346695d4;
 Mon, 09 May 2022 08:32:14 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nnwve-00Ch7b-DM; Mon, 09 May 2022 06:31:34 +0000
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
X-Inumbo-ID: c3123db9-cf61-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=jDAHALn3z0Emv+RGmX479eTK4G
	TkPNPwyX6ucjzOI85+8H3QueAzXGbLUYDfEaUHHVsbZU/e0hr1Lz5vXKUYhR7P+cl+7ZL12iDj6Y5
	OkOaOgHGZDQCx4NrGi7cbp/uecHLpDTMZqNd54+eNuluCp93IsXuau33dF9WDqqvECfh/pBWHktN5
	H64KFA8elJFZUtTvkUZPQfodC94Gu76Tv121FTsCCfmYmcht3AXwhyx1oM48WCaP3EOI2k4IIGMA4
	DAfYiU10yoTxDec4sp6qN+OfqhCT06RbgLPuydxhAf7Na+/KLsXuOktEYqlZSkyuPfaXFRejdTgEE
	8bFe3qVQ==;
Date: Sun, 8 May 2022 23:31:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, x86@kernel.org,
	linux-s390@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v3 2/2] virtio: replace
 arch_has_restricted_virtio_memory_access()
Message-ID: <Yni1RtXtEQPwD5NZ@infradead.org>
References: <20220504155703.13336-1-jgross@suse.com>
 <20220504155703.13336-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504155703.13336-3-jgross@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

