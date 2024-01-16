Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD082F4A4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 19:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667946.1039667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXE-0002Wq-JI; Tue, 16 Jan 2024 18:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667946.1039667; Tue, 16 Jan 2024 18:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPoXE-0002UO-C7; Tue, 16 Jan 2024 18:51:40 +0000
Received: by outflank-mailman (input) for mailman id 667946;
 Tue, 16 Jan 2024 18:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXD-0002UD-1H
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:51:39 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453fce27-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:51:36 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:51:32 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2c-m6i4x-8c5b1df3.us-west-2.amazon.com (Postfix)
 with ESMTPS id 4DFBF40D9D; Tue, 16 Jan 2024 18:51:32 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:13275]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.89.133:2525]
 with esmtp (Farcaster)
 id 1e494742-426e-4592-aea5-4ca418fc1d55; Tue, 16 Jan 2024 18:51:31 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:31 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:30 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:29 +0000
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
X-Inumbo-ID: 453fce27-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431096; x=1736967096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v62iLnCTpjjwMqV4HyxrM90zKMQWzF/DsYPcQzLLs10=;
  b=gdvIBTShINXxxyP1DGUbwzYy2lI4QujNQKPIUCrIlmBPFxzaQhjAhbMR
   /pwlAVcc7mI7O3pTlTwPU1Qpe9GlNHuwE5VNBFEE9WvG8AHeF8igbSZGL
   nNiRJ4Yh20ejN0nmvNRJ81kFRIiFr96GrJ1cIQvmnTPaZcJBSYmLcI5UU
   g=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="267182047"
X-Farcaster-Flow-ID: 1e494742-426e-4592-aea5-4ca418fc1d55
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2] xen/vmap: Check the page has been mapped in vm_init_type()
Date: Tue, 16 Jan 2024 18:50:30 +0000
Message-ID: <20240116185056.15000-2-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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


