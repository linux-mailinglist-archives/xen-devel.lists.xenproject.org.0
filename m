Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9282F545
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668078.1039964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4s-0002yY-6n; Tue, 16 Jan 2024 19:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668078.1039964; Tue, 16 Jan 2024 19:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4s-0002we-3L; Tue, 16 Jan 2024 19:26:26 +0000
Received: by outflank-mailman (input) for mailman id 668078;
 Tue, 16 Jan 2024 19:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp4q-0002iI-JR
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:24 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21666e67-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:22 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-d8e96288.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:20 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1d-m6i4x-d8e96288.us-east-1.amazon.com (Postfix)
 with ESMTPS id 08B1E84687; Tue, 16 Jan 2024 19:26:17 +0000 (UTC)
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:41703]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.89.133:2525]
 with esmtp (Farcaster)
 id 956fd52c-0e3e-43ce-a756-0aa56b33185c; Tue, 16 Jan 2024 19:26:17 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:17 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:16 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:16 +0000
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
X-Inumbo-ID: 21666e67-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433182; x=1736969182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v62iLnCTpjjwMqV4HyxrM90zKMQWzF/DsYPcQzLLs10=;
  b=jgwGGUet6Z1gmXBzynETUo1sj3rpTgLqPL6WiqGQl5FLYQycKyGmsNUx
   JYBWXZB7qeEvJdAgKZR1VvNtGroZRWn1ggFipPsx2C4MMctZLsH5Nk6KX
   hinESYAxo+CarT28x20CgoIDBcVd0PuR+NDogtg8uY9qFkol2CSVl3TmF
   U=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="627983541"
X-Farcaster-Flow-ID: 956fd52c-0e3e-43ce-a756-0aa56b33185c
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2 (resend) 01/27] xen/vmap: Check the page has been mapped in vm_init_type()
Date: Tue, 16 Jan 2024 19:25:45 +0000
Message-ID: <20240116192611.41112-2-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Julien Grall <jgrall@amazon.com>

The function map_pages_to_xen() could fail if it can't allocate the
underlying page tables or (at least on Arm) if the area was already
mapped.

The first error is caught by clear_page() because it would fault.
However, the second error while very unlikely is not caught at all.

As this is boot code, use BUG_ON() to check if map_pages_to_xen() has
succeeded.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        - New patch

diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 330e2ba897..830f64c5ef 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -35,8 +35,11 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
     for ( i = 0, va = (unsigned long)vm_bitmap(type); i < nr; ++i, va += PAGE_SIZE )
     {
         struct page_info *pg = alloc_domheap_page(NULL, 0);
+        int rc;
+
+        rc = map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
+        BUG_ON(rc);
 
-        map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
         clear_page((void *)va);
     }
     bitmap_fill(vm_bitmap(type), vm_low[type]);
-- 
2.40.1


