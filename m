Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47286D7FF
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 00:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687470.1070997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3r-0003QT-2b; Thu, 29 Feb 2024 23:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687470.1070997; Thu, 29 Feb 2024 23:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3q-0003Mh-V1; Thu, 29 Feb 2024 23:43:34 +0000
Received: by outflank-mailman (input) for mailman id 687470;
 Thu, 29 Feb 2024 23:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnTJ=KG=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rfq3p-0002pa-JQ
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 23:43:33 +0000
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [2607:f8b0:4864:20::d2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58391cc9-d75c-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 00:43:32 +0100 (CET)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c7476a11e0so85423139f.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 15:43:31 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:8f17])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78453000000b006e4dad633e1sm1850278pfn.177.2024.02.29.15.43.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Feb 2024 15:43:30 -0800 (PST)
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
X-Inumbo-ID: 58391cc9-d75c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709250210; x=1709855010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fSQQtv9Pdd1jRnQzOfB2+LAkUYgIfVtnLn4umtyxEI=;
        b=NSaokjsAWAl7udivLZ4z2OBEEW7b44fsKBXpvFhP7Y//L9NwnUrHQZK2tTpXSkRWVQ
         qKYmLhGkCCHCFOJ/2QuP+kDKMPWSw4FjkvFOQsjYjuFUfb3bFaB5FiVqfvino21p7n0x
         EIswM0HWCVW9RsRAZZFoei2wjfNwQq+1L2wAsn+JrpDiTRfQLWKLsQbmI7zqFybku8dS
         Qcv+qyDuoeEbMpB8KV6tM4CkVDD2WyoJ9UogJo5mg1cM02SYEeGLyIIM9J0Y/+4lDjxF
         pjaXOlPwjY78r/3flkdM0/T9smh34vG+6pipdO6Cf5Oj5g7iB5lozkijJKXYeDJkvyQJ
         SjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709250210; x=1709855010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fSQQtv9Pdd1jRnQzOfB2+LAkUYgIfVtnLn4umtyxEI=;
        b=Tw6FnB5OInUCs7+VDvSxkgaPYdMNV1unmA5Naxi8rHA7WHnxeEZfr8znuuRzKATKUK
         vM2CrfnKnj23dRtfBbj7l1ThQdJzol/0hvTjnIoTtNosj7KfnWjxgGfTAaczuK/HKH53
         fvLjDxQuS6L63P6D7cRUADfio4OPUTFKIwO9B7BIrOsBZ5WcFX9VPZVPUIPK09WSm1Wq
         hkDx16mKIo5CK3qHlz+0TA6qHcv+mYitXFNX+Ek6u6joNvkPW54hUgc9JAn3ubghKTm1
         18eNpkpRWnuImHKUDwB8rn4xQtGNGbSQut0WN1KV82MsPTh4WMTpngxhzEezOHRP8EF7
         QDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWlcfg9U6j7ODRz+8JupM5Kiq5mXvhRbWm63GQ9VehpJz6xcFFXiV6ccnbWR38Ii3bm0skFR5TatHZ7a1ghARr9mx8vFXLIp6ddzJ8aOY=
X-Gm-Message-State: AOJu0YxYFMp+WOilbpeNvzH+U+zSOXNfBmfPooUTIXTAKFTBhJVm92KW
	ikyA3a51tjLGGs5dP/c32MI5r8R/7XPlpEDhFzGlRRv8DQNU+r+U
X-Google-Smtp-Source: AGHT+IEjOcNXmJRmdRJJTTrs5fHGw0wy4T92DO/fjxQ1ryFJYxgxzO1wRU4PulyZo16hmDAMpzbQcA==
X-Received: by 2002:a05:6e02:148e:b0:365:a6a2:24b with SMTP id n14-20020a056e02148e00b00365a6a2024bmr273922ilk.17.1709250210665;
        Thu, 29 Feb 2024 15:43:30 -0800 (PST)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	torvalds@linux-foundation.org,
	brho@google.com,
	hannes@cmpxchg.org,
	lstoakes@gmail.com,
	akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	kernel-team@fb.com
Subject: [PATCH v3 bpf-next 2/3] mm, xen: Separate xen use cases from ioremap.
Date: Thu, 29 Feb 2024 15:43:15 -0800
Message-Id: <20240229234316.44409-3-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
References: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

xen grant table and xenbus ring are not ioremap the way arch specific code
is using it, so let's add VM_XEN flag to separate these use cases from
VM_IOREMAP users. xen will not and should not be calling
ioremap_page_range() on that range. /proc/vmallocinfo will print such
regions as "xen" instead of "ioremap".

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 arch/x86/xen/grant-table.c         | 2 +-
 drivers/xen/xenbus/xenbus_client.c | 2 +-
 include/linux/vmalloc.h            | 1 +
 mm/vmalloc.c                       | 7 +++++--
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index 1e681bf62561..b816db0349c4 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -104,7 +104,7 @@ static int arch_gnttab_valloc(struct gnttab_vm_area *area, unsigned nr_frames)
 	area->ptes = kmalloc_array(nr_frames, sizeof(*area->ptes), GFP_KERNEL);
 	if (area->ptes == NULL)
 		return -ENOMEM;
-	area->area = get_vm_area(PAGE_SIZE * nr_frames, VM_IOREMAP);
+	area->area = get_vm_area(PAGE_SIZE * nr_frames, VM_XEN);
 	if (!area->area)
 		goto out_free_ptes;
 	if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 32835b4b9bc5..b9c81a2d578b 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -758,7 +758,7 @@ static int xenbus_map_ring_pv(struct xenbus_device *dev,
 	bool leaked = false;
 	int err = -ENOMEM;
 
-	area = get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_IOREMAP);
+	area = get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_XEN);
 	if (!area)
 		return -ENOMEM;
 	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index c720be70c8dd..71075ece0ed2 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -28,6 +28,7 @@ struct iov_iter;		/* in uio.h */
 #define VM_FLUSH_RESET_PERMS	0x00000100	/* reset direct map and flush TLB on unmap, can't be freed in atomic context */
 #define VM_MAP_PUT_PAGES	0x00000200	/* put pages and free array in vfree */
 #define VM_ALLOW_HUGE_VMAP	0x00000400      /* Allow for huge pages on archs with HAVE_ARCH_HUGE_VMALLOC */
+#define VM_XEN			0x00000800	/* xen grant table and xenbus use cases */
 
 #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
 	!defined(CONFIG_KASAN_VMALLOC)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f42f98a127d5..d53ece3f38ee 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3822,9 +3822,9 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
 
 		if (flags & VMAP_RAM)
 			copied = vmap_ram_vread_iter(iter, addr, n, flags);
-		else if (!(vm && (vm->flags & VM_IOREMAP)))
+		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_XEN))))
 			copied = aligned_vread_iter(iter, addr, n);
-		else /* IOREMAP area is treated as memory hole */
+		else /* IOREMAP | XEN area is treated as memory hole */
 			copied = zero_iter(iter, n);
 
 		addr += copied;
@@ -4415,6 +4415,9 @@ static int s_show(struct seq_file *m, void *p)
 	if (v->flags & VM_IOREMAP)
 		seq_puts(m, " ioremap");
 
+	if (v->flags & VM_XEN)
+		seq_puts(m, " xen");
+
 	if (v->flags & VM_ALLOC)
 		seq_puts(m, " vmalloc");
 
-- 
2.34.1


