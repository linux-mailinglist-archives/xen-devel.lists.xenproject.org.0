Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640182F561
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668126.1040145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp9l-0008BF-5e; Tue, 16 Jan 2024 19:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668126.1040145; Tue, 16 Jan 2024 19:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp9l-00089g-2C; Tue, 16 Jan 2024 19:31:29 +0000
Received: by outflank-mailman (input) for mailman id 668126;
 Tue, 16 Jan 2024 19:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp5O-0003Xv-Ea
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:58 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3514ea24-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:26:55 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-a65ebc6e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:54 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1e-m6i4x-a65ebc6e.us-east-1.amazon.com (Postfix)
 with ESMTPS id 91C3168F61; Tue, 16 Jan 2024 19:26:51 +0000 (UTC)
Received: from EX19MTAUEC002.ant.amazon.com [10.0.0.204:14050]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.22.37:2525]
 with esmtp (Farcaster)
 id 4817dcb0-016b-443f-977f-5f3d3e04e4ed; Tue, 16 Jan 2024 19:26:51 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:39 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:38 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:37 +0000
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
X-Inumbo-ID: 3514ea24-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433216; x=1736969216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fVoEyNUTrAzw7YTY+W9724IaRNR5eJ6bcUYtN3Z0rYg=;
  b=hgrTjuOHKKkuAlrGJx3I6tz25MmYtYc6w7ZhnI2uw3v/62eHOpZgPfSe
   faY1hUVMIpC9pBd1s83sXBN5CkNYZqgfCEIFItffiqCQJAG6zM/p+joLg
   8Avz4uKQQbRN9R/ghvCmQrGvmjUoCLmg8PXZz1XXe6Y4MvOGNl7Oi3Fqb
   w=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="631577135"
X-Farcaster-Flow-ID: 4817dcb0-016b-443f-977f-5f3d3e04e4ed
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 19/27] x86/setup: Leave early boot slightly earlier
Date: Tue, 16 Jan 2024 19:26:03 +0000
Message-ID: <20240116192611.41112-20-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
index b813ea75b5..3b698c8c41 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1746,6 +1746,22 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
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
@@ -1777,8 +1793,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     else
         end_boot_allocator();
 
-    system_state = SYS_STATE_boot;
-
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
-- 
2.40.1


