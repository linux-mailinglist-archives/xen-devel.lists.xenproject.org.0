Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF559862188
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 02:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685002.1065359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYO-0006A4-V9; Sat, 24 Feb 2024 01:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685002.1065359; Sat, 24 Feb 2024 01:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYO-0005zc-OW; Sat, 24 Feb 2024 01:10:12 +0000
Received: by outflank-mailman (input) for mailman id 685002;
 Fri, 23 Feb 2024 23:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFrk=KA=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rdfQJ-0005zS-Gf
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:57:47 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 567fba97-d2a7-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 00:57:45 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1dc0d11d1b7so8497715ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 15:57:45 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::4:45de])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170902728b00b001dc23e877c1sm6175189pll.265.2024.02.23.15.57.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Feb 2024 15:57:43 -0800 (PST)
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
X-Inumbo-ID: 567fba97-d2a7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708732664; x=1709337464; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T/JxyeGclar7cIIHLQMvHUD6oGOKffCuXl9nke3dJg=;
        b=PVL2fwFX95asjvNqbgQ4wubZN/VAg0zoG27fW6SMbPx1rcE70rz2V+qpivYsSlXEyA
         xY8KU3Q3i1kPlkuFNf+3C4vjS/lm+AErX/bOzj2Fe6eIDYBGJl36vixok6HxomnqQ+r0
         t5ZFdwcgwDVt+82A+HvZJWgRdGxV3ADiQv728xmmNCG9jUb+ADloHUaKpBH6Q/4PDjDh
         RmSrsCW674acpRIjmQljvipaswO2ZUm1f8w7n/3ptc7QKrPdzHZuyvRoT0/XZV9ZD/4t
         mB/nMU01mll89/elTukKrvud1za2bhIhgNyypTKmMFS8CKGVn05Yyb1fhuxCUnHBODhT
         nXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708732664; x=1709337464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T/JxyeGclar7cIIHLQMvHUD6oGOKffCuXl9nke3dJg=;
        b=OAWPTBHY4dKwq7YvW76b0RE/ga+bjyHeutKw6IDziRrBL40jmElMaSgQ5OwA0Dex39
         7f/CeR2o5oOyNKy1+6a/ku+e8cUm5oI+V2Vbycc64IVw4zk9uNlmagYXHL2A3ICTSgTr
         5dldtCFpSGhaTnXPwssip8QP1CHXb1lvAVnAK5qAn12oMyXZ+jsZ6yiXZk4tGBCslj8B
         S2TesUcIHKjn7Cu0GS/LnCTgppZwjEHj9eEDEDnIY3hBDvNZ4ZQdFrBOhMX/Zm2nQZOM
         EoIyDdF1+qnpn+p86XsHu5Gqfz7V0n0Ji2W8wzk0iqr7TUIlpoOyEOVKWsnCw04eirqi
         XoWA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjDdd5hQYBGin0C7nUSCWsggiSGKps3jy+PLOM5xVCk0OqIfszD9a7MxxbtZbLVedn2NHD9z5DF5XlNLNIonQcNGRAv//ynPA6KRKcbs=
X-Gm-Message-State: AOJu0YyaSoqO9tCiMwaXg3RDKjZW2pu+lK+a8cjCk9+a6UN+J2VBkHGk
	Zq37xYs0njE1unJweFf/6TyKKosJZj1vprzXD189vTU9BbPkYGQQ8w+sK1wQ
X-Google-Smtp-Source: AGHT+IGrC0E10ADJh+Q28iXnJRIwpr5YwuUUqZaBfkmopbBhR99u1mcgLWatOYemqm7CQuFVwzUw8A==
X-Received: by 2002:a17:902:c40d:b0:1d9:d341:b150 with SMTP id k13-20020a170902c40d00b001d9d341b150mr1582992plk.40.1708732664121;
        Fri, 23 Feb 2024 15:57:44 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 3/3] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
Date: Fri, 23 Feb 2024 15:57:28 -0800
Message-Id: <20240223235728.13981-4-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

vmap/vmalloc APIs are used to map a set of pages into contiguous kernel virtual space.

get_vm_area() with appropriate flag is used to request an area of kernel address range.
It'se used for vmalloc, vmap, ioremap, xen use cases.
- vmalloc use case dominates the usage. Such vm areas have VM_ALLOC flag.
- the areas created by vmap() function should be tagged with VM_MAP.
- ioremap areas are tagged with VM_IOREMAP.
- xen use cases are VM_XEN.

BPF would like to extend the vmap API to implement a lazily-populated
sparse, yet contiguous kernel virtual space.
Introduce VM_SPARSE vm_area flag and
vm_area_map_pages(area, start_addr, count, pages) API to map a set
of pages within a given area.
It has the same sanity checks as vmap() does.
It also checks that get_vm_area() was created with VM_SPARSE flag
which identifies such areas in /proc/vmallocinfo
and returns zero pages on read through /proc/kcore.

The next commits will introduce bpf_arena which is a sparsely populated shared
memory region between bpf program and user space process. It will map
privately-managed pages into a sparse vm area with the following steps:

  area = get_vm_area(area_size, VM_SPARSE);  // at bpf prog verification time
  vm_area_map_pages(area, kaddr, 1, page);   // on demand
                    // it will return an error if kaddr is out of range
  vm_area_unmap_pages(area, kaddr, 1);
  free_vm_area(area);                        // after bpf prog is unloaded

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 include/linux/vmalloc.h |  4 +++
 mm/vmalloc.c            | 55 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 223e51c243bc..416bc7b0b4db 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -29,6 +29,7 @@ struct iov_iter;		/* in uio.h */
 #define VM_MAP_PUT_PAGES	0x00000200	/* put pages and free array in vfree */
 #define VM_ALLOW_HUGE_VMAP	0x00000400      /* Allow for huge pages on archs with HAVE_ARCH_HUGE_VMALLOC */
 #define VM_XEN			0x00000800	/* xen use cases */
+#define VM_SPARSE		0x00001000	/* sparse vm_area. not all pages are present. */
 
 #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
 	!defined(CONFIG_KASAN_VMALLOC)
@@ -233,6 +234,9 @@ static inline bool is_vm_area_hugepages(const void *addr)
 }
 
 #ifdef CONFIG_MMU
+int vm_area_map_pages(struct vm_struct *area, unsigned long addr, unsigned int count,
+		      struct page **pages);
+int vm_area_unmap_pages(struct vm_struct *area, unsigned long addr, unsigned int count);
 void vunmap_range(unsigned long addr, unsigned long end);
 static inline void set_vm_flush_reset_perms(void *addr)
 {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d769a65bddad..a05dfbbacb78 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -648,6 +648,54 @@ static int vmap_pages_range(unsigned long addr, unsigned long end,
 	return err;
 }
 
+/**
+ * vm_area_map_pages - map pages inside given vm_area
+ * @area: vm_area
+ * @addr: start address inside vm_area
+ * @count: number of pages
+ * @pages: pages to map (always PAGE_SIZE pages)
+ */
+int vm_area_map_pages(struct vm_struct *area, unsigned long addr, unsigned int count,
+		      struct page **pages)
+{
+	unsigned long size = ((unsigned long)count) * PAGE_SIZE;
+	unsigned long end = addr + size;
+
+	might_sleep();
+	if (WARN_ON_ONCE(area->flags & VM_FLUSH_RESET_PERMS))
+		return -EINVAL;
+	if (WARN_ON_ONCE(area->flags & VM_NO_GUARD))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!(area->flags & VM_SPARSE)))
+		return -EINVAL;
+	if (count > totalram_pages())
+		return -E2BIG;
+	if (addr < (unsigned long)area->addr || (void *)end > area->addr + area->size)
+		return -ERANGE;
+
+	return vmap_pages_range(addr, end, PAGE_KERNEL, pages, PAGE_SHIFT);
+}
+
+/**
+ * vm_area_unmap_pages - unmap pages inside given vm_area
+ * @area: vm_area
+ * @addr: start address inside vm_area
+ * @count: number of pages to unmap
+ */
+int vm_area_unmap_pages(struct vm_struct *area, unsigned long addr, unsigned int count)
+{
+	unsigned long size = ((unsigned long)count) * PAGE_SIZE;
+	unsigned long end = addr + size;
+
+	if (WARN_ON_ONCE(!(area->flags & VM_SPARSE)))
+		return -EINVAL;
+	if (addr < (unsigned long)area->addr || (void *)end > area->addr + area->size)
+		return -ERANGE;
+
+	vunmap_range(addr, end);
+	return 0;
+}
+
 int is_vmalloc_or_module_addr(const void *x)
 {
 	/*
@@ -3822,9 +3870,9 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
 
 		if (flags & VMAP_RAM)
 			copied = vmap_ram_vread_iter(iter, addr, n, flags);
-		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_XEN))))
+		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_XEN | VM_SPARSE))))
 			copied = aligned_vread_iter(iter, addr, n);
-		else /* IOREMAP|XEN area is treated as memory hole */
+		else /* IOREMAP|XEN|SPARSE area is treated as memory hole */
 			copied = zero_iter(iter, n);
 
 		addr += copied;
@@ -4418,6 +4466,9 @@ static int s_show(struct seq_file *m, void *p)
 	if (v->flags & VM_XEN)
 		seq_puts(m, " xen");
 
+	if (v->flags & VM_SPARSE)
+		seq_puts(m, " sparse");
+
 	if (v->flags & VM_ALLOC)
 		seq_puts(m, " vmalloc");
 
-- 
2.34.1


