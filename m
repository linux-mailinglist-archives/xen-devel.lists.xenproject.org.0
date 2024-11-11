Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DE9C3F5B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833738.1249015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDK-0001aO-8r; Mon, 11 Nov 2024 13:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833738.1249015; Mon, 11 Nov 2024 13:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDK-0001Vs-29; Mon, 11 Nov 2024 13:12:18 +0000
Received: by outflank-mailman (input) for mailman id 833738;
 Mon, 11 Nov 2024 13:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDI-0007pD-EM
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:16 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90d36f5a-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:13 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:13 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.29.78:50931]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.13.234:2525]
 with esmtp (Farcaster)
 id a1ffee9a-7842-4772-85e8-fde919810a08; Mon, 11 Nov 2024 13:12:12 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:08 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:08 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:08 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id B675042133; Mon, 11 Nov 2024 13:12:06 +0000 (UTC)
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
X-Inumbo-ID: 90d36f5a-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjk1LjQ5LjkwIiwiaGVsbyI6InNtdHAtZnctNjAwMi5hbWF6b24uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkwZDM2ZjVhLWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzMzLjU3MTAzNywic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330733; x=1762866733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uTEyDEzhij10JykQYqF4bj3lestatykDkvzvvdqANyk=;
  b=OrywVCXLTmknfn/B7LAXu7uitHOtfn497TWX2pN+cYNtlhMvqMuaLgCy
   9w5p5TwHX6g+bWGmfev2GVoOwIyVoBPiHrQorNafGOIqQhtAWr6kefE3T
   wOMXawbn2VTvIPl+GM9TS9G0nqoPS3tpKOWbLphm99WgomK+Vyncp7dl7
   A=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="447823638"
X-Farcaster-Flow-ID: a1ffee9a-7842-4772-85e8-fde919810a08
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 09/15] x86/setup: Leave early boot slightly earlier
Date: Mon, 11 Nov 2024 13:11:42 +0000
Message-ID: <20241111131148.52568-10-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

When we do not have a direct map, memory for metadata of heap nodes in
init_node_heap() is allocated from xenheap, which needs to be mapped and
unmapped on demand. However, we cannot just take memory from the boot
allocator to create the PTEs while we are passing memory to the heap
allocator.

To solve this race, we leave early boot slightly sooner so that Xen PTE
pages are allocated from the heap instead of the boot allocator. We can
do this because the metadata for the 1st node is statically allocated,
and by the time we need memory to create mappings for the 2nd node, we
already have enough memory in the heap allocator in the 1st node.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v4:
        * Fix indentation
        * Refactor the code to reduce code duplication

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a3c21ca05099..4e258419ac34 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1822,6 +1822,22 @@ void asmlinkage __init noreturn __start_xen(void)
 
     numa_initmem_init(0, raw_max_page);
 
+    /*
+     * When we do not have a direct map, memory for metadata of heap nodes in
+     * init_node_heap() is allocated from xenheap, which needs to be mapped and
+     * unmapped on demand. However, we cannot just take memory from the boot
+     * allocator to create the PTEs while we are passing memory to the heap
+     * allocator during end_boot_allocator().
+     *
+     * To solve this race, we need to leave early boot before
+     * end_boot_allocator() so that Xen PTE pages are allocated from the heap
+     * instead of the boot allocator. We can do this because the metadata for
+     * the 1st node is statically allocated, and by the time we need memory to
+     * create mappings for the 2nd node, we already have enough memory in the
+     * heap allocator in the 1st node.
+     */
+    system_state = SYS_STATE_boot;
+
     if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
     {
         unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
@@ -1853,8 +1869,6 @@ void asmlinkage __init noreturn __start_xen(void)
     else
         end_boot_allocator();
 
-    system_state = SYS_STATE_boot;
-
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
-- 
2.40.1


