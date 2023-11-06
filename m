Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7D7E28A4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628130.979328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01Vl-00014r-Gc; Mon, 06 Nov 2023 15:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628130.979328; Mon, 06 Nov 2023 15:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01Vl-00010J-Di; Mon, 06 Nov 2023 15:27:33 +0000
Received: by outflank-mailman (input) for mailman id 628130;
 Mon, 06 Nov 2023 14:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8vV=GT=redhat.com=mpatocka@srs-se1.protection.inumbo.net>)
 id 1r0151-0006Yn-FH
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:59:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23499a33-7cb5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 15:59:52 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-wo667hKyNIaLrPo-Wqz7rg-1; Mon, 06 Nov 2023 09:59:42 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D89F811001;
 Mon,  6 Nov 2023 14:59:40 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 270FE492BFA;
 Mon,  6 Nov 2023 14:59:40 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 0FFB830C72A7; Mon,  6 Nov 2023 14:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 0CADB3FD16; Mon,  6 Nov 2023 15:59:40 +0100 (CET)
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
X-Inumbo-ID: 23499a33-7cb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699282791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MvbDfj8UoB/iWWxf+0USaZxvp1nymUg9UUSbnVJnGJg=;
	b=RKdRArT3Saf3AaU17gzFv74+A9RcK7n3BSSdSbIr60XSQRVsO6GTlEQQEK011teO+5Y1Lx
	CwWF7JMg5vbhR5rC7udmRjlG7Oh+imVHfOD8H7BTmdBD8LWuebo7c0kdy/8FzVg79CMOD/
	sVQ//DD7opEhCdlHIuTCddx1D1v/6Aw=
X-MC-Unique: wo667hKyNIaLrPo-Wqz7rg-1
Date: Mon, 6 Nov 2023 15:59:40 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iommu@lists.linux.dev
cc: Keith Busch <kbusch@kernel.org>, 
    Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>, 
    Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>, 
    Jan Kara <jack@suse.cz>, Vlastimil Babka <vbabka@suse.cz>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
    stable@vger.kernel.org, regressions@lists.linux.dev, 
    Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    dm-devel@lists.linux.dev, linux-mm@kvack.org
Subject: [PATCH] swiotlb-xen: provide the "max_mapping_size" method
In-Reply-To: <20231106071008.GB17022@lst.de>
Message-ID: <928b5df7-fada-cf2f-6f6a-257a84547c3@redhat.com>
References: <ZULvkPhcpgAVyI8w@mail-itl> <ac5b5ac0-9e8-c1b0-a26-62f832f845f0@redhat.com> <ZUOL8kXVTF1OngeN@mail-itl> <3cb4133c-b6db-9187-a678-11ed8c9456e@redhat.com> <ZUUctamEFtAlSnSV@mail-itl> <ZUUlqJoS6_1IznzT@kbusch-mbp.dhcp.thefacebook.com>
 <ZUVYT1Xp4+hFT27W@mail-itl> <ZUV3TApYYoh_oiRR@kbusch-mbp.dhcp.thefacebook.com> <11a9886d-316c-edcd-d6da-24ad0b9a2b4@redhat.com> <ZUZOKitOAqqKiJ4n@kbusch-mbp.dhcp.thefacebook.com> <20231106071008.GB17022@lst.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="185210117-1402013940-1699282657=:1480693"
Content-ID: <affb703a-5868-3532-3764-a2a166f949ac@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185210117-1402013940-1699282657=:1480693
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <40c9ae7-22c6-db9f-f832-d2d54af8b3f9@redhat.com>

There's a bug that when using the XEN hypervisor with dm-crypt on NVMe, 
the kernel deadlocks [1].

The deadlocks are caused by inability to map a large bio vector -
dma_map_sgtable always returns an error, this gets propagated to the block
layer as BLK_STS_RESOURCE and the block layer retries the request
indefinitely.

XEN uses the swiotlb framework to map discontiguous pages into contiguous
runs that are submitted to the PCIe device. The swiotlb framework has a
limitation on the length of a mapping - this needs to be announced with
the max_mapping_size method to make sure that the hardware drivers do not
create larger mappings.

Without max_mapping_size, the NVMe block driver would create large
mappings that overrun the maximum mapping size.

[1] https://lore.kernel.org/stable/ZTNH0qtmint%2FzLJZ@mail-itl/

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Suggested-by: Keith Busch <kbusch@kernel.org>
Suggested-by: Christoph Hellwig <hch@lst.de>
Cc: stable@vger.kernel.org

---
 drivers/xen/swiotlb-xen.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-stable/drivers/xen/swiotlb-xen.c
===================================================================
--- linux-stable.orig/drivers/xen/swiotlb-xen.c	2023-11-03 17:57:18.000000000 +0100
+++ linux-stable/drivers/xen/swiotlb-xen.c	2023-11-06 15:30:59.000000000 +0100
@@ -405,4 +405,5 @@ const struct dma_map_ops xen_swiotlb_dma
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages = dma_common_alloc_pages,
 	.free_pages = dma_common_free_pages,
+	.max_mapping_size = swiotlb_max_mapping_size,
 };
--185210117-1402013940-1699282657=:1480693--


