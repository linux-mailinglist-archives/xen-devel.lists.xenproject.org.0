Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD797E2ABF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 18:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628232.979458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r039U-0002Ia-Ld; Mon, 06 Nov 2023 17:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628232.979458; Mon, 06 Nov 2023 17:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r039U-0002FH-I5; Mon, 06 Nov 2023 17:12:40 +0000
Received: by outflank-mailman (input) for mailman id 628232;
 Mon, 06 Nov 2023 17:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8vV=GT=redhat.com=mpatocka@srs-se1.protection.inumbo.net>)
 id 1r039S-0002En-G0
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 17:12:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adebd26b-7cc7-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 18:12:36 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-_45CrAGuNjOuxKLbB7FT_Q-1; Mon,
 06 Nov 2023 12:12:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 674ED3821568;
 Mon,  6 Nov 2023 17:12:30 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C5D1121308;
 Mon,  6 Nov 2023 17:12:30 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 3227530C72A7; Mon,  6 Nov 2023 17:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 2E33F3FD16; Mon,  6 Nov 2023 18:12:30 +0100 (CET)
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
X-Inumbo-ID: adebd26b-7cc7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699290755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtsXGyrCZBmUJfCxzrPKMMdVxxHur1sL8JecsuLgwa0=;
	b=Y+0xfMr2o5tCEnJaHnfqd7QUVxuT1ZZgxZs+imYKxly0YcZ/DEkMftE2YZBB7d0m3kIAZ/
	S8Pfphv0I1F7+uesArUFqzAuOaUh7tDy4ZR8RlcdyjQHab+0zecKpDpdK8Eia1QhtST6Md
	wWpQ9XED4ohq9YgBOEgLsuISksliftA=
X-MC-Unique: _45CrAGuNjOuxKLbB7FT_Q-1
Date: Mon, 6 Nov 2023 18:12:30 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <snitzer@kernel.org>
cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iommu@lists.linux.dev, 
    Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>, 
    Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>, 
    Jan Kara <jack@suse.cz>, Vlastimil Babka <vbabka@suse.cz>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
    stable@vger.kernel.org, regressions@lists.linux.dev, 
    Alasdair Kergon <agk@redhat.com>, dm-devel@lists.linux.dev, 
    linux-mm@kvack.org
Subject: [PATCH v2] swiotlb-xen: provide the "max_mapping_size" method
In-Reply-To: <ZUkGpblDX637QV9y@redhat.com>
Message-ID: <151bef41-e817-aea9-675-a35fdac4ed@redhat.com>
References: <3cb4133c-b6db-9187-a678-11ed8c9456e@redhat.com> <ZUUctamEFtAlSnSV@mail-itl> <ZUUlqJoS6_1IznzT@kbusch-mbp.dhcp.thefacebook.com> <ZUVYT1Xp4+hFT27W@mail-itl> <ZUV3TApYYoh_oiRR@kbusch-mbp.dhcp.thefacebook.com> <11a9886d-316c-edcd-d6da-24ad0b9a2b4@redhat.com>
 <ZUZOKitOAqqKiJ4n@kbusch-mbp.dhcp.thefacebook.com> <20231106071008.GB17022@lst.de> <928b5df7-fada-cf2f-6f6a-257a84547c3@redhat.com> <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com> <ZUkGpblDX637QV9y@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="185210117-1837111149-1699290694=:1497320"
Content-ID: <478c056-3a19-eb50-34da-911cf13fc558@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185210117-1837111149-1699290694=:1497320
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <4468b751-727c-3ffb-15cc-683422283a27@redhat.com>

From: Keith Busch <kbusch@kernel.org>

There's a bug that when using the XEN hypervisor with bios with large
multi-page bio vectors on NVMe, the kernel deadlocks [1].

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

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Link: https://lore.kernel.org/stable/ZTNH0qtmint%2FzLJZ@mail-itl/ [1]
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Suggested-by: Christoph Hellwig <hch@lst.de>
Cc: stable@vger.kernel.org
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

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
--185210117-1837111149-1699290694=:1497320--


