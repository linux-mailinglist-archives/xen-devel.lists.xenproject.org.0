Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822686218B
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 02:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684999.1065351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYO-00060I-Hp; Sat, 24 Feb 2024 01:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684999.1065351; Sat, 24 Feb 2024 01:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdgYO-0005pG-Cc; Sat, 24 Feb 2024 01:10:12 +0000
Received: by outflank-mailman (input) for mailman id 684999;
 Fri, 23 Feb 2024 23:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFrk=KA=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rdfQE-0005yy-GZ
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:57:42 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5433a7fd-d2a7-11ee-8a57-1f161083a0e0;
 Sat, 24 Feb 2024 00:57:42 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1dc418fa351so5821525ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 15:57:41 -0800 (PST)
Received: from localhost.localdomain ([2620:10d:c090:400::4:45de])
 by smtp.gmail.com with ESMTPSA id
 bc7-20020a170902930700b001dc486f0cb2sm3796745plb.208.2024.02.23.15.57.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Feb 2024 15:57:39 -0800 (PST)
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
X-Inumbo-ID: 5433a7fd-d2a7-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708732660; x=1709337460; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgy7UuZvicma9Y2PX48aaJ5ZDCArBODZAL7mSlN3pk0=;
        b=YELVKYQWjyHrpXdKoo1gSdbC5UAdJBNpVzVnBN2J70KHFCWih4VpBXw7WQEgl3nmT2
         nduA1il6SF2NcgUXhTVhGhn/v81Rkbei1qlP/fG9aMJcOmUiqbYulE5aceVqzvtBGrIj
         4dNeVJ7NQXEzoh/qX1a5uGP+J/pdpXXNtIM4i0bNatk62/E2D+BAWwjC9JS+UNAP+S42
         tTjrfGSVLHluiVNOANYb+wUCaNe/2WDiOKgao2MwEqahk7RsAORibYqRuhkDu8zBX1/+
         NN+CVmW+DJZdy256fPVtU2I8/2mbKGtk8ohPdFd/DQFlc54LLdEiBJsOh+Rcr8MzxXCd
         OM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708732660; x=1709337460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgy7UuZvicma9Y2PX48aaJ5ZDCArBODZAL7mSlN3pk0=;
        b=of7Bl1ruXvOlC7p3+naVW5h3FtUgqb49JWrmXbpCvFfG0lW7pPsJigG5/QT1ehdrqc
         k0P5UXqPCOrU7PD+DyET44/WVow8g8BjPE2wqvbfarJvu9xjyrjHIDGFs6AaMADROtLt
         ucwSppxY6TTOyMecVR1TnjyOvjd7tUuztBR8xqHko9sEqD4SGdX9PZgoPG1d0eNvrZW6
         PNgKKfBwFd61fHl1/NrSyDSAJCjpBMYRbaWRng7pgNNWCLISF/EMviAdHnik+g9W5+DD
         HZi2C2wx1fysftAe8N9q/3M0IUi1bU8349XLSiiFmgwxHjfkYGvCCS0vuIDbngSOb3he
         3czQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmGqN0hB8yCtdvlji6npZkn1nPECxHPVo0gHLxMyeRZogWcw6Qws1tWsHyl+ojZVvS/ylr80kZS0k6F5y0L2iQTV9XA6WTm4JZen4OOOk=
X-Gm-Message-State: AOJu0YwMC6sMS/exdGpw5zXGrMAI1oUlytFV3fNP2rHnQC9/JeHswaOx
	xMt176HU8jFkPx+bvDbbRj1peBfzYpAoiGzd+pypoI/aUaGBHKh6
X-Google-Smtp-Source: AGHT+IGELhXnvr3n524zH97gDxBoJwFKXzefQUh+8dOBuQvkiJz95RKjpkB2JqjALLNdOQ3Mm4DyFA==
X-Received: by 2002:a17:902:f645:b0:1dc:b64:13cd with SMTP id m5-20020a170902f64500b001dc0b6413cdmr1551144plg.27.1708732660213;
        Fri, 23 Feb 2024 15:57:40 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 2/3] mm, xen: Separate xen use cases from ioremap.
Date: Fri, 23 Feb 2024 15:57:27 -0800
Message-Id: <20240223235728.13981-3-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexei Starovoitov <ast@kernel.org>

xen grant table and xenbus ring are not ioremap the way arch specific code is using it,
so let's add VM_XEN flag to separate them from VM_IOREMAP users.
xen will not and should not be calling ioremap_page_range() on that range.
/proc/vmallocinfo will print such region as "xen" instead of "ioremap" as well.

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
index c720be70c8dd..223e51c243bc 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -28,6 +28,7 @@ struct iov_iter;		/* in uio.h */
 #define VM_FLUSH_RESET_PERMS	0x00000100	/* reset direct map and flush TLB on unmap, can't be freed in atomic context */
 #define VM_MAP_PUT_PAGES	0x00000200	/* put pages and free array in vfree */
 #define VM_ALLOW_HUGE_VMAP	0x00000400      /* Allow for huge pages on archs with HAVE_ARCH_HUGE_VMALLOC */
+#define VM_XEN			0x00000800	/* xen use cases */
 
 #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
 	!defined(CONFIG_KASAN_VMALLOC)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f42f98a127d5..d769a65bddad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3822,9 +3822,9 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
 
 		if (flags & VMAP_RAM)
 			copied = vmap_ram_vread_iter(iter, addr, n, flags);
-		else if (!(vm && (vm->flags & VM_IOREMAP)))
+		else if (!(vm && (vm->flags & (VM_IOREMAP | VM_XEN))))
 			copied = aligned_vread_iter(iter, addr, n);
-		else /* IOREMAP area is treated as memory hole */
+		else /* IOREMAP|XEN area is treated as memory hole */
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


