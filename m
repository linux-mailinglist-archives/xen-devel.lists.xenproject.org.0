Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE187141C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 04:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688571.1072889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhL7V-0004kv-Bo; Tue, 05 Mar 2024 03:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688571.1072889; Tue, 05 Mar 2024 03:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhL7V-0004iC-8T; Tue, 05 Mar 2024 03:05:33 +0000
Received: by outflank-mailman (input) for mailman id 688571;
 Tue, 05 Mar 2024 03:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjVz=KL=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhL7U-0004h8-1j
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 03:05:32 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 387f0d39-da9d-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 04:05:29 +0100 (CET)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e5eaf5bb3eso241187b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 19:05:29 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:9426])
 by smtp.gmail.com with ESMTPSA id
 ep2-20020a17090ae64200b0029932d175c3sm62083pjb.0.2024.03.04.19.05.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Mar 2024 19:05:27 -0800 (PST)
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
X-Inumbo-ID: 387f0d39-da9d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709607928; x=1710212728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3Uab1G5GTmyRpRg7HZiDcHzBw+gqXSTLydz3NAXDjw=;
        b=gOkNgpyRPvmrFVicUrkuIln4lBYJbQrChPJV2rMhHk6+5E2BdXIlJ7gpJmncLE1WNX
         +u6zUkRay2M5rJzl++bzhJUcaHKz8I8CHToEvissErl5pclIO+Kl0/81xc7xT05skV5i
         OCU4Y6XcT0Y5zmBTRwdgKrmnQbJhmytHv+PoQhKpKEO76qdhom+ZPOl+kH+/4Bmdgh1O
         ymTlfdpHcPyu/J/zm77wrVjKKp4pXB5jJhSfLfq9JSsO0bUvTjbRLSTm2y/zYEyaIDOl
         pF7cL9bUTE/BI0zbmzEhHUoF9kUw8joIusV27Ynmq+8eI3zBvuki8fqfBEKrICznVBql
         Zt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607928; x=1710212728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3Uab1G5GTmyRpRg7HZiDcHzBw+gqXSTLydz3NAXDjw=;
        b=N53SwW+Z1m3kwAt/YLKr9sjAZHoB861BUaKIIa7rWqM4uub4wYcrVTEYythAJ/WHM9
         3UAXceIraU1BasqVY071dGv4loxrrYCaEInCDqNutct3EKqLUVisnIoX4TirmqgVrlWM
         3aQOJ8MN7s4+gc9tTHzN2LFW9GPZ4my/P6gRztfC0OHILDyuofc8bPeK8KidgbW2SajJ
         VVlP671QCfz5patWuN73K5hUie9uz2bdbJ63ELK8VpNIbFIUdxy5hzmh1SXzzmkOm3Wi
         GWBGJvfHtlHSoWZc9xhhiVrFUz9arr1WCEKP+Q3sFvP2Ht63nbvo8m+UHXbwzfU9SRPV
         Gziw==
X-Forwarded-Encrypted: i=1; AJvYcCVNSOXRbQAgHPmW4aNwFhhycuSgzl51tbX+Wlh/NmdZNhqMdcuhmRvIlJh06HS2PRWtzS6yDcrwu0GHPOAP0izoWYxDWF/cru3vUsUJ4ys=
X-Gm-Message-State: AOJu0Ywemocp7ZpSQ22mEBvtf1UyX4sLzDrsU0saC3H1Au1j8EUkB9RG
	g1PWzEE8zMKFFdDwxvZl6tsQNOavkj53Nu6aAnbWhj0KY5xSMaWd
X-Google-Smtp-Source: AGHT+IHbzyFXZDmwTFXKOBQzhI/J5ZF4BBhSMJWYsXowuh6pvkssrM9sK35Jd24futLM3qVbKmDLRw==
X-Received: by 2002:a05:6a20:1da:b0:1a1:4d41:3570 with SMTP id 26-20020a056a2001da00b001a14d413570mr470241pzz.59.1709607927721;
        Mon, 04 Mar 2024 19:05:27 -0800 (PST)
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
	rppt@kernel.org,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	kernel-team@fb.com
Subject: [PATCH v4 bpf-next 2/2] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
Date: Mon,  4 Mar 2024 19:05:16 -0800
Message-Id: <20240305030516.41519-3-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

vmap/vmalloc APIs are used to map a set of pages into contiguous kernel
virtual space.

get_vm_area() with appropriate flag is used to request an area of kernel
address range. It's used for vmalloc, vmap, ioremap, xen use cases.
- vmalloc use case dominates the usage. Such vm areas have VM_ALLOC flag.
- the areas created by vmap() function should be tagged with VM_MAP.
- ioremap areas are tagged with VM_IOREMAP.

BPF would like to extend the vmap API to implement a lazily-populated
sparse, yet contiguous kernel virtual space. Introduce VM_SPARSE flag
and vm_area_map_pages(area, start_addr, count, pages) API to map a set
of pages within a given area.
It has the same sanity checks as vmap() does.
It also checks that get_vm_area() was created with VM_SPARSE flag
which identifies such areas in /proc/vmallocinfo
and returns zero pages on read through /proc/kcore.

The next commits will introduce bpf_arena which is a sparsely populated
shared memory region between bpf program and user space process. It will
map privately-managed pages into a sparse vm area with the following steps:

  // request virtual memory region during bpf prog verification
  area = get_vm_area(area_size, VM_SPARSE);

  // on demand
  vm_area_map_pages(area, kaddr, kend, pages);
  vm_area_unmap_pages(area, kaddr, kend);

  // after bpf program is detached and unloaded
  free_vm_area(area);

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 include/linux/vmalloc.h |  5 ++++
 mm/vmalloc.c            | 59 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index c720be70c8dd..0f72c85a377b 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -35,6 +35,7 @@ struct iov_iter;		/* in uio.h */
 #else
 #define VM_DEFER_KMEMLEAK	0
 #endif
+#define VM_SPARSE		0x00001000	/* sparse vm_area. not all pages are present. */
 
 /* bits [20..32] reserved for arch specific ioremap internals */
 
@@ -232,6 +233,10 @@ static inline bool is_vm_area_hugepages(const void *addr)
 }
 
 #ifdef CONFIG_MMU
+int vm_area_map_pages(struct vm_struct *area, unsigned long start,
+		      unsigned long end, struct page **pages);
+void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
+			 unsigned long end);
 void vunmap_range(unsigned long addr, unsigned long end);
 static inline void set_vm_flush_reset_perms(void *addr)
 {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f42f98a127d5..e5b8c70950bc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -648,6 +648,58 @@ static int vmap_pages_range(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static int check_sparse_vm_area(struct vm_struct *area, unsigned long start,
+				unsigned long end)
+{
+	might_sleep();
+	if (WARN_ON_ONCE(area->flags & VM_FLUSH_RESET_PERMS))
+		return -EINVAL;
+	if (WARN_ON_ONCE(area->flags & VM_NO_GUARD))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!(area->flags & VM_SPARSE)))
+		return -EINVAL;
+	if ((end - start) >> PAGE_SHIFT > totalram_pages())
+		return -E2BIG;
+	if (start < (unsigned long)area->addr ||
+	    (void *)end > area->addr + get_vm_area_size(area))
+		return -ERANGE;
+	return 0;
+}
+
+/**
+ * vm_area_map_pages - map pages inside given sparse vm_area
+ * @area: vm_area
+ * @start: start address inside vm_area
+ * @end: end address inside vm_area
+ * @pages: pages to map (always PAGE_SIZE pages)
+ */
+int vm_area_map_pages(struct vm_struct *area, unsigned long start,
+		      unsigned long end, struct page **pages)
+{
+	int err;
+
+	err = check_sparse_vm_area(area, start, end);
+	if (err)
+		return err;
+
+	return vmap_pages_range(start, end, PAGE_KERNEL, pages, PAGE_SHIFT);
+}
+
+/**
+ * vm_area_unmap_pages - unmap pages inside given sparse vm_area
+ * @area: vm_area
+ * @start: start address inside vm_area
+ * @end: end address inside vm_area
+ */
+void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
+			 unsigned long end)
+{
+	if (check_sparse_vm_area(area, start, end))
+		return;
+
+	vunmap_range(start, end);
+}
+
 int is_vmalloc_or_module_addr(const void *x)
 {
 	/*
@@ -3822,9 +3874,9 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
 
 		if (flags & VMAP_RAM)
 			copied = vmap_ram_vread_iter(iter, addr, n, flags);
-		else if (!(vm && (vm->flags & VM_IOREMAP)))
+		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_SPARSE))))
 			copied = aligned_vread_iter(iter, addr, n);
-		else /* IOREMAP area is treated as memory hole */
+		else /* IOREMAP | SPARSE area is treated as memory hole */
 			copied = zero_iter(iter, n);
 
 		addr += copied;
@@ -4415,6 +4467,9 @@ static int s_show(struct seq_file *m, void *p)
 	if (v->flags & VM_IOREMAP)
 		seq_puts(m, " ioremap");
 
+	if (v->flags & VM_SPARSE)
+		seq_puts(m, " sparse");
+
 	if (v->flags & VM_ALLOC)
 		seq_puts(m, " vmalloc");
 
-- 
2.43.0


