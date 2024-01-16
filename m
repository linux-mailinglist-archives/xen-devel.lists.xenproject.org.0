Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BAB82F54D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668091.1040065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp59-0005tQ-FC; Tue, 16 Jan 2024 19:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668091.1040065; Tue, 16 Jan 2024 19:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp58-0005fZ-Sk; Tue, 16 Jan 2024 19:26:42 +0000
Received: by outflank-mailman (input) for mailman id 668091;
 Tue, 16 Jan 2024 19:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp56-0002iI-F5
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:40 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b30fbf2-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:38 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-d8e96288.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:36 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1d-m6i4x-d8e96288.us-east-1.amazon.com (Postfix)
 with ESMTPS id A011584E30; Tue, 16 Jan 2024 19:26:34 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:62111]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.3.20:2525] with
 esmtp (Farcaster)
 id 526f3352-96b2-47dc-b68e-3f4b8bfe2e83; Tue, 16 Jan 2024 19:26:34 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:30 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:30 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:29 +0000
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
X-Inumbo-ID: 2b30fbf2-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433198; x=1736969198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sWVxwHwgKXZxnYvHw7QOCApWITjaKrfn/x6fPGCt35k=;
  b=QdA1Y0FEmSd7CJBzyGz7QvuahXbB+fbPso/yE90GReTaTIXe3Ky2cMlI
   DW/Rrvm9HBo8MmeZMnJHeTej8adbIycZEdK7J+RANC50cRLnwCr+z7gXj
   4LDPzreTMdKbWDyhkz3bNbMkdacgWamMuVeXrztcPvpBcR8EQ4x3irTpP
   g=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="58701500"
X-Farcaster-Flow-ID: 526f3352-96b2-47dc-b68e-3f4b8bfe2e83
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 12/27] x86/mapcache: Initialise the mapcache for the idle domain
Date: Tue, 16 Jan 2024 19:25:56 +0000
Message-ID: <20240116192611.41112-13-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

From: Hongyan Xia <hongyxia@amazon.com>

In order to use the mapcache in the idle domain, we also have to
populate its page tables in the PERDOMAIN region, and we need to move
mapcache_domain_init() earlier in arch_domain_create().

Note, commit 'x86: lift mapcache variable to the arch level' has
initialised the mapcache for HVM domains. With this patch, PV, HVM,
idle domains now all initialise the mapcache.

Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

	Changes in V2:
          * Free resources if mapcache initialisation fails
          * Remove `is_idle_domain()` check from `create_perdomain_mappings()`

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8ef3f7746f..d4c125bc14 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -750,9 +750,16 @@ int arch_domain_create(struct domain *d,
 
     spin_lock_init(&d->arch.e820_lock);
 
+    if ( (rc = mapcache_domain_init(d)) != 0)
+    {
+        free_perdomain_mappings(d);
+        return rc;
+    }
+
     /* Minimal initialisation for the idle domain. */
     if ( unlikely(is_idle_domain(d)) )
     {
+        struct page_info *pg = d->arch.perdomain_l3_pg;
         static const struct arch_csw idle_csw = {
             .from = paravirt_ctxt_switch_from,
             .to   = paravirt_ctxt_switch_to,
@@ -763,6 +770,9 @@ int arch_domain_create(struct domain *d,
 
         d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
 
+        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
+            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
+
         return 0;
     }
 
@@ -843,8 +853,6 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
-    mapcache_domain_init(d);
-
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
-- 
2.40.1


