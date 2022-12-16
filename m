Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4B64EB4E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464564.722999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69em-0007SG-4h; Fri, 16 Dec 2022 12:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464564.722999; Fri, 16 Dec 2022 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69em-0007Oq-0S; Fri, 16 Dec 2022 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 464564;
 Fri, 16 Dec 2022 12:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ej-0007LA-Kw
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-00033v-IY; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DD-0004sN-0C; Fri, 16 Dec 2022 11:49:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=rWiHN0PK4M1dxBlf4cLIlk8Mw8XPqON+Q0yvmpeDRiA=; b=5y2veP8n0mNPBioUEfM2I9JzxR
	a9/cOqrzsY2PqAPWw+z8PhCJOQK9CNylt1oihhCZTQOgbv0IGwvWeFRP/KV9pdvqAKhQQ39KA+vja
	UYWWGo5ovvJC5DtXjKEV0rRiB4C7edFjMVDcnetHgaxt/j382uz9MBH9PCKrdIRCP4C8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 10/22] x86/mapcache: initialise the mapcache for the idle domain
Date: Fri, 16 Dec 2022 11:48:41 +0000
Message-Id: <20221216114853.8227-11-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 xen/arch/x86/domain.c | 4 ++--
 xen/arch/x86/mm.c     | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 069b7d2af330..ec150f4fd144 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -732,6 +732,8 @@ int arch_domain_create(struct domain *d,
 
     spin_lock_init(&d->arch.e820_lock);
 
+    mapcache_domain_init(d);
+
     /* Minimal initialisation for the idle domain. */
     if ( unlikely(is_idle_domain(d)) )
     {
@@ -829,8 +831,6 @@ int arch_domain_create(struct domain *d,
 
     psr_domain_init(d);
 
-    mapcache_domain_init(d);
-
     if ( is_hvm_domain(d) )
     {
         if ( (rc = hvm_domain_initialise(d, config)) != 0 )
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8b9740f57519..041bd4cfde17 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5963,6 +5963,9 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
         l3tab = __map_domain_page(pg);
         clear_page(l3tab);
         d->arch.perdomain_l3_pg = pg;
+        if ( is_idle_domain(d) )
+            idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
+                l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
         if ( !nr )
         {
             unmap_domain_page(l3tab);
-- 
2.38.1


