Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42582F546
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668081.1039996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp51-0003ve-81; Tue, 16 Jan 2024 19:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668081.1039996; Tue, 16 Jan 2024 19:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp51-0003sR-1W; Tue, 16 Jan 2024 19:26:35 +0000
Received: by outflank-mailman (input) for mailman id 668081;
 Tue, 16 Jan 2024 19:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp4z-0003Xv-LJ
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:33 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26e12f07-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:32 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-3ef535ca.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:29 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2a-m6i4x-3ef535ca.us-west-2.amazon.com (Postfix)
 with ESMTPS id 624BD609EA; Tue, 16 Jan 2024 19:26:26 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:34536]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.3.20:2525] with
 esmtp (Farcaster)
 id 5204e9b5-4ffe-4f9b-a668-3a37bda75b90; Tue, 16 Jan 2024 19:26:25 +0000 (UTC)
Received: from EX19D008UEA003.ant.amazon.com (10.252.134.116) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:22 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA003.ant.amazon.com (10.252.134.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:22 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 26e12f07-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433193; x=1736969193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FgFciMpLuDVe/Ws8Mo0D+wl9Af+6on00mUDD4ztD+mE=;
  b=a0gy08PIcgQAWR60qQaCwATt2HxbGCqrIxwZOio+y+p9WUUoo1K398Pq
   TB8nsB2y+Fju4iUQNXj9/Nz3cEJtxXSIvYZn8CinyHguiN33sFletCKFB
   MGWUAaq2cYUXtPjnG+UprRSepf0g/GLoWS8V7uTDnFaHekPL5572KWhup
   4=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="266414239"
X-Farcaster-Flow-ID: 5204e9b5-4ffe-4f9b-a668-3a37bda75b90
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 05/27] xen/numa: vmap the pages for memnodemap
Date: Tue, 16 Jan 2024 19:25:49 +0000
Message-ID: <20240116192611.41112-6-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

This avoids the assumption that there is a direct map and boot pages
fall inside the direct map.

Clean up the variables so that mfn actually stores a type-safe mfn.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    See the discussion in the next patch about using panic().

    Changes in v2:
        * vmap_contig_pages() was renamed to vmap_contig()
        * Replace the BUG_ON() with a panic()

    Changes compare to Hongyan's version:
        * The function modified was moved to common code. So rebase it
        * vmap_boot_pages() was renamed to vmap_contig_pages()

diff --git a/xen/common/numa.c b/xen/common/numa.c
index f454c4d894..ef13ec2255 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -424,13 +424,14 @@ static int __init populate_memnodemap(const struct node *nodes,
 static int __init allocate_cachealigned_memnodemap(void)
 {
     unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+    mfn_t mfn = alloc_boot_pages(size, 1);
 
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
+    memnodemap = vmap_contig(mfn, size);
+    if ( !memnodemap )
+        panic("Unable to map the ACPI SLIT. Retry with numa=off");
     size <<= PAGE_SHIFT;
     printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
+           mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
     memnodemapsize = size / sizeof(*memnodemap);
 
     return 0;
-- 
2.40.1


