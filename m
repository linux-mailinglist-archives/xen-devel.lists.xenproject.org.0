Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8536A922
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117309.223206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8N-0001sq-AG; Sun, 25 Apr 2021 20:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117309.223206; Sun, 25 Apr 2021 20:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8M-0001r4-UJ; Sun, 25 Apr 2021 20:13:38 +0000
Received: by outflank-mailman (input) for mailman id 117309;
 Sun, 25 Apr 2021 20:13:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal8K-0001mW-IE
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8K-0000pC-8v; Sun, 25 Apr 2021 20:13:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8K-0005m7-0R; Sun, 25 Apr 2021 20:13:36 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Moqxyc1ZPjrdBFjtAzt9LgU5Lw+fiLu9r1elfDAEKcE=; b=yM5oyAyjNFkRoriEbAu8nWkgg
	UlBONVmOVRgQO+sDd02/RWxitSO8BTbZai7UE596NzmhmJKm7Nt9Ga0ZR0gKc7Fy7I76MQp4D/2eJ
	e8q1+blNljXuHofnGkUdwe60An/1k1cLI+uGyXeIIuczJV16/QlepsBcue5JTfx0B6QOU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 09/15] xen/arm32: mm: Re-implement setup_xenheap_mappings() using map_pages_to_xen()
Date: Sun, 25 Apr 2021 21:13:12 +0100
Message-Id: <20210425201318.15447-10-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Now that map_pages_to_xen() has been extended to support 2MB mappings,
we can replace the create_mappings() call by map_pages_to_xen() call.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch

    TODOs:
        - add support for contiguous mapping
---
 xen/arch/arm/mm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 5c17cafff847..19ecf73542ce 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -806,7 +806,12 @@ void mmu_init_secondary_cpu(void)
 void __init setup_xenheap_mappings(unsigned long base_mfn,
                                    unsigned long nr_mfns)
 {
-    create_mappings(xen_second, XENHEAP_VIRT_START, base_mfn, nr_mfns, MB(32));
+    int rc;
+
+    rc = map_pages_to_xen(XENHEAP_VIRT_START, base_mfn, nr_mfns,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the xenheap mappings.\n");
 
     /* Record where the xenheap is, for translation routines. */
     xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
-- 
2.17.1


