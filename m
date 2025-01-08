Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3AA05FE3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867489.1279096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpy-0002JU-RP; Wed, 08 Jan 2025 15:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867489.1279096; Wed, 08 Jan 2025 15:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpy-0002DT-HZ; Wed, 08 Jan 2025 15:19:14 +0000
Received: by outflank-mailman (input) for mailman id 867489;
 Wed, 08 Jan 2025 15:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpv-0008Lg-Ro
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e99c4ecb-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:11 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso3100450766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:11 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:10 -0800 (PST)
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
X-Inumbo-ID: e99c4ecb-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349550; x=1736954350; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1o5uv9Ja6v4/kcOJ8sZumXTXa5wvZv/gHrWxF6fu20=;
        b=ImEbpo7Rpm9n0aWOQ9skx4qvVdzUoRCxEVh9CJM1cOhiTmZ3YGJG/jEKeXF2dB8evM
         7vVqq5EZZz7UO/tm1NJL5Dr0+RldfOxPXv10MXFKHyTXWDEOr+zmxrAX5PKObJJJMUef
         +7ylvgud9kTo/yml/lHomVdIwtIgSiG2/o6mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349550; x=1736954350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1o5uv9Ja6v4/kcOJ8sZumXTXa5wvZv/gHrWxF6fu20=;
        b=dP93HiOXpi0H6LLmRwfRKdolD2BBd3giREzMBgbhMx+52WFVM0yMVJ8r5kmmjPvXCY
         hr/0BUfGeGuOKLBnxX8k+5WIuXUdc0X4sVwwbXJIGTWl4e9y6YmsUmIQGGHjnNK0fPvz
         OUF6DunkzmTD9xSqCoqDIjAPUxPkzwIc3CPOTsrntp0IJ8brAHHzN+yts0pYQqMTXUNK
         BYYKMNq9L/TrTe0SpkgxADW+0taEr0YxX+r4IEUEIkllt6VPMB1wUm+enZRNfp4SQy/D
         XuFMzbu6vkdE+XHPQuFolt2nynLCEUcsoBTTRdovO2hdtYkM4D1hajeHbqFozTOc01L4
         D91Q==
X-Gm-Message-State: AOJu0YzPT4VQd+yZKP5l7V46F83y/+6bHCADx5UXAPjN47VMmv1cEKcj
	KdYaZcmA63eZijJh4M0p1jYVyMiq7hC5iHll2iLViFPEMIqi+FZ6WS0ioMtAZWbQKemUnCO6tNq
	vzIqtOA==
X-Gm-Gg: ASbGnct0WZ5HM5U2i1ScDyyP222JB3RDyb1siH5NE9FBUJshrKsw4zkysKFjp4psLSc
	0bosRp91DVG2wSTOimSpf1irCO3UNy1/5pJ57fOInR9+IQyWL6RUe/+UnYVpPMmaaO37egbRCM3
	AKRQfkg7WpvVywWBrlrKEUg/hXUFji7CGr6v9424wVTOduJ2ak7M+OBElhSJXhRXspOxkP2joIg
	GkOHG/YfXSjJZCx0dRcl7p1SxpS7lD4YibvyjYuO0/BpobfP59E3ScuHOYhL8plki+Vl+8VZclv
	55s=
X-Google-Smtp-Source: AGHT+IFmAfbrkaRmO1XEvxpuHTtJZiGpHLiJR0cpXNNmmNnQWLh9ejYwG1frtDsro+4RNSQ6b49m0g==
X-Received: by 2002:a17:907:7286:b0:aa6:89b9:e9c0 with SMTP id a640c23a62f3a-ab2ab6a7624mr229884666b.8.1736349550502;
        Wed, 08 Jan 2025 07:19:10 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 09/15] x86/setup: Leave early boot slightly earlier
Date: Wed,  8 Jan 2025 15:18:16 +0000
Message-ID: <20250108151822.16030-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * No changes.

v3->v4:
  * Fix indentation
  * Refactor the code to reduce code duplication
---
 xen/arch/x86/setup.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ebe5a9443f3..609ec4cf07f2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1831,6 +1831,22 @@ void asmlinkage __init noreturn __start_xen(void)
 
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
@@ -1862,8 +1878,6 @@ void asmlinkage __init noreturn __start_xen(void)
     else
         end_boot_allocator();
 
-    system_state = SYS_STATE_boot;
-
     bsp_stack = cpu_alloc_stack(0);
     if ( !bsp_stack )
         panic("No memory for BSP stack\n");
-- 
2.47.1


