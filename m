Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DC82F505
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668030.1039885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPonH-0000Lc-Ra; Tue, 16 Jan 2024 19:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668030.1039885; Tue, 16 Jan 2024 19:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPonH-0000JU-OV; Tue, 16 Jan 2024 19:08:15 +0000
Received: by outflank-mailman (input) for mailman id 668030;
 Tue, 16 Jan 2024 19:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXl-0002UD-53
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:13 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ad9fea8-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:52:11 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-1cca8d67.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:08 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2a-m6i4x-1cca8d67.us-west-2.amazon.com (Postfix)
 with ESMTPS id 4764D80E1C; Tue, 16 Jan 2024 18:52:07 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:15676]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.15.248:2525]
 with esmtp (Farcaster)
 id 2b428ad9-19ac-49b7-8226-125e1f8e03f0; Tue, 16 Jan 2024 18:52:06 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:56 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:51:56 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:51:54 +0000
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
X-Inumbo-ID: 5ad9fea8-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431132; x=1736967132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sWVxwHwgKXZxnYvHw7QOCApWITjaKrfn/x6fPGCt35k=;
  b=WqU4X38TULWbRoI6rpsRX5dtgvECEk5hTgFWQQVYaJLx2EUZ1wRm3lZ1
   g+B4OFvZxifpJ0Kfc55WCntgKyJR9CGlSPn6QvetY4J6NToDRza6gxdT2
   Yt7BZEYb8UW24uzI6K01cILWsM69+dn/bBSUVA6gMI1h0cwHeBQ3Uz+C0
   o=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="627976400"
X-Farcaster-Flow-ID: 2b428ad9-19ac-49b7-8226-125e1f8e03f0
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] x86/mapcache: Initialise the mapcache for the idle domain
Date: Tue, 16 Jan 2024 18:50:41 +0000
Message-ID: <20240116185056.15000-13-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
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


