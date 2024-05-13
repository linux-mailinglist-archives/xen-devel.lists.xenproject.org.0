Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403D8C421C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720927.1124001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvW-00048k-Gc; Mon, 13 May 2024 13:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720927.1124001; Mon, 13 May 2024 13:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VvW-00040w-AG; Mon, 13 May 2024 13:41:14 +0000
Received: by outflank-mailman (input) for mailman id 720927;
 Mon, 13 May 2024 13:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6VvU-0002lY-P7
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:12 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7461a6a4-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:10 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:06 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:8888]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.42.97:2525]
 with esmtp (Farcaster)
 id 7a338e33-2920-4928-86c0-716608c0b7ff; Mon, 13 May 2024 13:41:06 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:02 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:01 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:00 +0000
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
X-Inumbo-ID: 7461a6a4-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607670; x=1747143670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TyQ1NOFs+JBNhEZ9nul6mULL97GoHUzPHp2fRNIcmm8=;
  b=HNwzFK4Nk+oVDM9J24x97/R7AEqYlxqBWwIL7yypUJW3j0WNpa2VFi5k
   sO5yIl6/aBtYDh3apEP75oCoR07ij6kpD9KGmDRFyA1xdo7Wh6NDWeRdS
   BmDKdUABdX69Alxlkw7TkU2ryzvzIAgvZ1MuKFDBMTX7k7HMA446kFnwG
   g=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="88857716"
X-Farcaster-Flow-ID: 7a338e33-2920-4928-86c0-716608c0b7ff
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Wang <wawei@amazon.de>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 (resend) 05/19] x86/mapcache: Initialise the mapcache for the idle domain
Date: Mon, 13 May 2024 13:40:32 +0000
Message-ID: <20240513134046.82605-6-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
index 507d704f16..3303bdb53e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -758,9 +758,16 @@ int arch_domain_create(struct domain *d,
 
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
@@ -771,6 +778,9 @@ int arch_domain_create(struct domain *d,
 
         d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
 
+        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
+            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
+
         return 0;
     }
 
@@ -851,8 +861,6 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
-    mapcache_domain_init(d);
-
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
-- 
2.40.1


