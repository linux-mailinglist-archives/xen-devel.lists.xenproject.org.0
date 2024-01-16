Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79D82F4AE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667952.1039720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXZ-0004CQ-51; Tue, 16 Jan 2024 18:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667952.1039720; Tue, 16 Jan 2024 18:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXZ-00049s-0w; Tue, 16 Jan 2024 18:52:01 +0000
Received: by outflank-mailman (input) for mailman id 667952;
 Tue, 16 Jan 2024 18:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXX-0002UD-5J
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:51:59 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5282b318-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:51:58 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-b404fda3.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:51:53 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1d-m6i4x-b404fda3.us-east-1.amazon.com (Postfix)
 with ESMTPS id 30D2380718; Tue, 16 Jan 2024 18:51:51 +0000 (UTC)
Received: from EX19MTAUEC002.ant.amazon.com [10.0.29.78:46358]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.89.133:2525]
 with esmtp (Farcaster)
 id 30b6ac54-b3b1-41eb-98bd-7e364c531f5a; Tue, 16 Jan 2024 18:51:50 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:41 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:41 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:39 +0000
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
X-Inumbo-ID: 5282b318-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431118; x=1736967118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FgFciMpLuDVe/Ws8Mo0D+wl9Af+6on00mUDD4ztD+mE=;
  b=PPkOaRVpZpcU+TtYPbkbsohqN77V345hXbeskyzRGOh5NpIsD0z22Kii
   G7n+1tl4mYEw9bUWezzfD312QoUoRAAWA81SjdONnZBTydyXzpUNlxUxo
   mvGb9wC2bIIh9Itv/4OOGZmKt0anpiGLS7Ph+nbyZUVLOVWJOOGkBHoXI
   Q=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="58691940"
X-Farcaster-Flow-ID: 30b6ac54-b3b1-41eb-98bd-7e364c531f5a
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] xen/numa: vmap the pages for memnodemap
Date: Tue, 16 Jan 2024 18:50:34 +0000
Message-ID: <20240116185056.15000-6-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
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


