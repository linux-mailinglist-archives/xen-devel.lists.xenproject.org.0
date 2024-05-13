Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2C8C3F81
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720811.1123785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb4-00051D-Bf; Mon, 13 May 2024 11:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720811.1123785; Mon, 13 May 2024 11:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb4-0004yq-7P; Mon, 13 May 2024 11:11:58 +0000
Received: by outflank-mailman (input) for mailman id 720811;
 Mon, 13 May 2024 11:11:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tb2-00036L-Dh
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:11:56 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99746a71-1119-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 13:11:54 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:49 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:31352]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.4.17:2525] with
 esmtp (Farcaster)
 id 27d3b449-45c7-420e-af1d-caf6889650d5; Mon, 13 May 2024 11:11:49 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:48 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:48 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:47 +0000
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
X-Inumbo-ID: 99746a71-1119-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598714; x=1747134714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FfhF1uGZGyTejdo4gJox/0kvgwcb9PzofNFjsbGWbZM=;
  b=A/GDk4m5tw5i08QZifo33Ex5KhH+zWL+SAEcium2mEUqNrQB0mRSX1u3
   1ru4Yz8o5aVk1tqx0l7aTVCp2p5zwScAq7ESz5LHXWUAyjZgPbZMQS6kg
   VoE9Nt6BxgxReTkN7UsoOHwXjsakAV41aISV9VQyD/ArowpEgqjDoJTke
   g=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="88736852"
X-Farcaster-Flow-ID: 27d3b449-45c7-420e-af1d-caf6889650d5
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 11/19] x86/setup: Leave early boot slightly earlier
Date: Mon, 13 May 2024 11:11:09 +0000
Message-ID: <20240513111117.68828-12-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
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

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index bd6b1184f5..f26c9799e4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1751,6 +1751,22 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
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
@@ -1782,8 +1798,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     else
         end_boot_allocator();
 
-    system_state = SYS_STATE_boot;
-
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
-- 
2.40.1


