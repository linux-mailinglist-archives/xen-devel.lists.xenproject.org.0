Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED486D800
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 00:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687471.1071006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3v-0003jX-9l; Thu, 29 Feb 2024 23:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687471.1071006; Thu, 29 Feb 2024 23:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfq3v-0003gl-6f; Thu, 29 Feb 2024 23:43:39 +0000
Received: by outflank-mailman (input) for mailman id 687471;
 Thu, 29 Feb 2024 23:43:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnTJ=KG=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rfq3t-0002pa-Qz
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 23:43:37 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a97006e-d75c-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 00:43:36 +0100 (CET)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e59bbdd8c7so997186b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 15:43:36 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::5:8f17])
 by smtp.gmail.com with ESMTPSA id
 r8-20020aa79ec8000000b006e50cedb59bsm1850608pfq.16.2024.02.29.15.43.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Feb 2024 15:43:33 -0800 (PST)
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
X-Inumbo-ID: 5a97006e-d75c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709250214; x=1709855014; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGmuzG0BuzfpsyKgKDkTT6Enikl3D6AjMcJQdJLpWcI=;
        b=l2E3fNaajwujBe9DCGj69BvfC3VHTNVd4Xud9rR9o6BqgGx3OHagpwPaohBqjCWXUg
         jOUrgiYPAT/nFqF305EjfqbpW7e5Kyp3KsqyW2SAcyoCFs0z5roqhrAMiGUtZS8xBvJp
         UBpqzf19MUa8AJidNH6jMAEjh7uMVhe+XVm95rPsiVO3ohKxpAOYeH/r5NJQhc8u4WT2
         kp0rC7UOeuzLxv9lJQtgclwDTce/xuLY7o3OUionhSs1Xw4o52LyiSm6KBuB+ejf+STJ
         ZVEgLii/DOLZjwZcmMqTrxLUlhETuubrKPOF1zgjn+z3ZOAcqVOyTSu63tRQEQ6vnJhL
         13RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709250214; x=1709855014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGmuzG0BuzfpsyKgKDkTT6Enikl3D6AjMcJQdJLpWcI=;
        b=xRNgxi74oTeCqH4klNgHBCoR/7P2biFt4g92j39BT8aq1kCd822iQThaD6ng0Xqei6
         2ZJ7lSOUaSODpm/5jnMk5pMBlbtEFzycd5Yo4osrfjlvtgJnVqtkWaSLbv1RplyumgJd
         fbxKDYykOR8M1odpNyCEM3nuvouG7zAGrQJjn0Vk7p1UKkSF8lqu5nnFyTYZdHfB0EYn
         lsL3/BBh6k0pJgntbx++YkruDVFO2VbPvx5nI1dmuEVmun32RDu2bka3o2SQbEUTnh0t
         x/7FmaS6qQsMq5Au580bpiWTaY+Xg8E+CRuKNziM6y1yd1XjNnLesR5bYm2oYJnfUQJp
         W8hA==
X-Forwarded-Encrypted: i=1; AJvYcCVtCKG0FiA1SnBWgZFXOB8Y9b6WSsmpDROZlN2LW/2uGU1BqKiTdlLCzXj6jU484488aFx0P/mBkMttAbHRXIngGNdfk7rvSRvuVrFjZcg=
X-Gm-Message-State: AOJu0Yx231nhX0lzkgIPcctbkTy+x/BqiUBO/xKKHAmXPoeccEz7Hhvs
	MRWyoBUZLtwedQpSO1QlbWKCiEjYT7OzAZfqp6Gz0cax1CCv31jR
X-Google-Smtp-Source: AGHT+IHI1rET3Z0/K8864m6GkWZwYbKsdcM+bbhi3ZQPOLm9p/XFzMkvrTJzDnJ+bGJeFJuwnOye6Q==
X-Received: by 2002:a05:6a00:92a2:b0:6e4:84db:e30e with SMTP id jw34-20020a056a0092a200b006e484dbe30emr186581pfb.32.1709250214399;
        Thu, 29 Feb 2024 15:43:34 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 3/3] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
Date: Thu, 29 Feb 2024 15:43:16 -0800
Message-Id: <20240229234316.44409-4-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
References: <20240229234316.44409-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

vmap/vmalloc APIs are used to map a set of pages into contiguous kernel
virtual space.

get_vm_area() with appropriate flag is used to request an area of kernel
address range. It'se used for vmalloc, vmap, ioremap, xen use cases.
- vmalloc use case dominates the usage. Such vm areas have VM_ALLOC flag.
- the areas created by vmap() function should be tagged with VM_MAP.
- ioremap areas are tagged with VM_IOREMAP.
- xen use cases are VM_XEN.

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
index 71075ece0ed2..dfbcfb9f9a08 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -29,6 +29,7 @@ struct iov_iter;		/* in uio.h */
 #define VM_MAP_PUT_PAGES	0x00000200	/* put pages and free array in vfree */
 #define VM_ALLOW_HUGE_VMAP	0x00000400      /* Allow for huge pages on archs with HAVE_ARCH_HUGE_VMALLOC */
 #define VM_XEN			0x00000800	/* xen grant table and xenbus use cases */
+#define VM_SPARSE		0x00001000	/* sparse vm_area. not all pages are present. */
 
 #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
 	!defined(CONFIG_KASAN_VMALLOC)
@@ -233,6 +234,10 @@ static inline bool is_vm_area_hugepages(const void *addr)
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
index d53ece3f38ee..dae98b1f78a8 100644
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
-		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_XEN))))
+		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_XEN | VM_SPARSE))))
 			copied = aligned_vread_iter(iter, addr, n);
-		else /* IOREMAP | XEN area is treated as memory hole */
+		else /* IOREMAP | XEN | SPARSE area is treated as memory hole */
 			copied = zero_iter(iter, n);
 
 		addr += copied;
@@ -4418,6 +4470,9 @@ static int s_show(struct seq_file *m, void *p)
 	if (v->flags & VM_XEN)
 		seq_puts(m, " xen");
 
+	if (v->flags & VM_SPARSE)
+		seq_puts(m, " sparse");
+
 	if (v->flags & VM_ALLOC)
 		seq_puts(m, " vmalloc");
 
-- 
2.34.1


