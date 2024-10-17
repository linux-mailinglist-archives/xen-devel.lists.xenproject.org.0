Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48C9A2A32
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820862.1234522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Twm-0001j9-PR; Thu, 17 Oct 2024 17:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820862.1234522; Thu, 17 Oct 2024 17:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Twm-0001ga-Lb; Thu, 17 Oct 2024 17:06:00 +0000
Received: by outflank-mailman (input) for mailman id 820862;
 Thu, 17 Oct 2024 17:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Twl-00014B-B8
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12ce7763-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:05:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184634817591.1928959407942;
 Thu, 17 Oct 2024 10:03:54 -0700 (PDT)
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
X-Inumbo-ID: 12ce7763-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184637; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M4y3G8O6JKAiI5vqQXyZGSBHMpOQi9SRILP7EUkG1d3qbOcyyr9bqBStZmMSgHXr+Sl1WcFMnPm77pucsYelTNZijkaCMS22LXuvuUyJkxIqDHKfh6wi01dOQxsU+9s+TKJ6QmjQdEFtgN6Qd3mDFae47FYP0M5FwjOGjEW6j38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184637; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HqxZ6XJiXLCqmaSWp0mzQral5RGgZ8p3yBsfBpkK9gk=; 
	b=cFj3x4xlFQcRAzC8mUlTRHqwKRuPW4aHFMd2J93PkCwYdzr+h+hC9KUb+l+m/QKV95M9/kuf9XywA5gL/M1YTMatPJsNugJLHFg4tq/i+KMDpA2sUnTgue/+jxCCLooFscao35yCbfPjXSQ5CIYcxANcSfRoEno27Fc6sX0l530=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184637;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HqxZ6XJiXLCqmaSWp0mzQral5RGgZ8p3yBsfBpkK9gk=;
	b=kUz/DnUCHxdAWmKwQhTk8VJzXlt+TZeZsF59yAWSNZrgdDOcr/uqbP5629PRiXo7
	8rRPhKm1ck39Dy9T1R9FHqh4aO1hC9ZVcn651oBaxCA0gH7gg3gRic89kMWTWvtWwyy
	ZEfrwcjmHlTUPawNquEWUUkB/4IZdaQ8Rf78Q9gk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 16/44] x86/boot: split bootstrap_map_addr() out of bootstrap_map()
Date: Thu, 17 Oct 2024 13:02:56 -0400
Message-Id: <20241017170325.3842-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Andrew Cooper <andrew.cooper3@citrix.com>

Using an interface based on addresses directly, not modules.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- moved bootstrap_map_addr() to being static to setup.c
---
 xen/arch/x86/setup.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8261a87d9fb4..852454c161ee 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -442,24 +442,22 @@ static void __init normalise_cpu_order(void)
  * Ensure a given physical memory range is present in the bootstrap mappings.
  * Use superpage mappings to ensure that pagetable memory needn't be allocated.
  */
-void *__init bootstrap_map(const module_t *mod)
+static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
 {
     static unsigned long __initdata map_cur = BOOTSTRAP_MAP_BASE;
-    uint64_t start, end, mask = (1L << L2_PAGETABLE_SHIFT) - 1;
+    uint64_t mask = (1L << L2_PAGETABLE_SHIFT) - 1;
     void *ret;
 
     if ( system_state != SYS_STATE_early_boot )
-        return mod ? mfn_to_virt(mod->mod_start) : NULL;
+        return end ? maddr_to_virt(start) : NULL;
 
-    if ( !mod )
+    if ( !end )
     {
         destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
         map_cur = BOOTSTRAP_MAP_BASE;
         return NULL;
     }
 
-    start = (uint64_t)mod->mod_start << PAGE_SHIFT;
-    end = start + mod->mod_end;
     if ( start >= end )
         return NULL;
 
@@ -475,6 +473,15 @@ void *__init bootstrap_map(const module_t *mod)
     return ret;
 }
 
+void *__init bootstrap_map(const module_t *mod)
+{
+    if ( !mod )
+        return bootstrap_map_addr(0, 0);
+
+    return bootstrap_map_addr(pfn_to_paddr(mod->mod_start),
+                              pfn_to_paddr(mod->mod_start) + mod->mod_end);
+}
+
 static void __init move_memory(
     uint64_t dst, uint64_t src, unsigned int size)
 {
-- 
2.30.2


