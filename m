Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FD77EB4D8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632935.987455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKF-000364-5F; Tue, 14 Nov 2023 16:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632935.987455; Tue, 14 Nov 2023 16:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKF-00032T-1Z; Tue, 14 Nov 2023 16:31:43 +0000
Received: by outflank-mailman (input) for mailman id 632935;
 Tue, 14 Nov 2023 16:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wKC-0002Oz-Qn
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:31:40 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49bc6004-830b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:31:40 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54553e4888bso8736942a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:31:40 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 d17-20020aa7c1d1000000b0052febc781bfsm5326899edp.36.2023.11.14.08.31.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:31:39 -0800 (PST)
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
X-Inumbo-ID: 49bc6004-830b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979499; x=1700584299; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmG1RvmEVqSdouF1EAJ1JhQ2v4iViVsF9xcNQ9FZB1E=;
        b=sLUq4ApkxaFV5M0N6k5rmOi/jNIwkaLCvcLA92qa1l+0O2wypPLVDp7wc1LRhtimvf
         NoVqbT1+6iqq7ymnZKVgwwZ3O5g3SpMkOsgaQ53qRCPGwzbE23cqQ+Ww4bSBWhJWcgif
         ghtAxjlE9CTKyMNXrJ4FOsoxehhJVrVfhxz9KgeihtCNMBrx6xdeKesBK63lD9usZ3lh
         m7piNZActxx5euhiY+H4Mi5hj6it2SjKWcdBrDhHqulHOF0VYSz690E/EpsUYmK+BAEJ
         pAyMs7XelfTMTgGwGnERkCNDsY1dHKUuq/+a0RR+guNVeUdFPkpZpSCi9LDOpz2ZoPSE
         tSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979499; x=1700584299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmG1RvmEVqSdouF1EAJ1JhQ2v4iViVsF9xcNQ9FZB1E=;
        b=Sh+V5h6ZCJ6otzxKAuPOzHd+bMuRm9ij+YXZjXi7SUQh3CCpdve1ljO6MSBWUGvuTv
         qkoxDeNrw1Q8Zx5aTqc7hBjtNuwnsUrK2f4ufyl36iam2TaZIM8YOANkZqqkqMmn85Ns
         39+0lvAL9YFjCwye9CadHjX2mbnQDS7gjRJHpqb4s74A6134uI+Z5+/fcClkoS4wHer2
         X0FC+LLDIQdUMYdXucBdeYlLZaaS8rHKyAYWOO6GSCOFNsog5wN49hmF8oSitKZ+lWqs
         E89M26QASEseNWLKmzubcL3cGixKcoVJOGoMNa8ZPa2agn1Cx2ASmDdUVdwNJXQWzJS/
         S/Mg==
X-Gm-Message-State: AOJu0YzKq8BfHq6+XQCmiVkZmGIfBX2fOieuweav+lRaEiFWtSC4nk4V
	ZNMBqRxaF1bNUTr4A0Liks244A==
X-Google-Smtp-Source: AGHT+IHL3uPIWo3k1FIfttqQPpxRZY2ZBH7YhX3W4Qy+3Zh4pc0MQhOvVP2dpnkHA2n+Lr+G86EpBQ==
X-Received: by 2002:aa7:c487:0:b0:547:cbc:e07d with SMTP id m7-20020aa7c487000000b005470cbce07dmr7903450edq.1.1699979499591;
        Tue, 14 Nov 2023 08:31:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 2/9] hw/xen/hvm: Propagate page_mask to a pair of functions
Date: Tue, 14 Nov 2023 17:31:16 +0100
Message-ID: <20231114163123.74888-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are going to replace TARGET_PAGE_MASK by a
runtime variable. In order to reduce code duplication,
propagate TARGET_PAGE_MASK to get_physmapping() and
xen_phys_offset_to_gaddr().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 8aa6a1ec3b..3b10425986 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -174,11 +174,12 @@ static void xen_ram_init(PCMachineState *pcms,
     }
 }
 
-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
+static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
+                                   int page_mask)
 {
     XenPhysmap *physmap = NULL;
 
-    start_addr &= TARGET_PAGE_MASK;
+    start_addr &= page_mask;
 
     QLIST_FOREACH(physmap, &xen_physmap, list) {
         if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
@@ -188,9 +189,10 @@ static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
     return NULL;
 }
 
-static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size)
+static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
+                                       int page_mask)
 {
-    hwaddr addr = phys_offset & TARGET_PAGE_MASK;
+    hwaddr addr = phys_offset & page_mask;
     XenPhysmap *physmap = NULL;
 
     QLIST_FOREACH(physmap, &xen_physmap, list) {
@@ -252,7 +254,7 @@ static int xen_add_to_physmap(XenIOState *state,
     hwaddr phys_offset = memory_region_get_ram_addr(mr);
     const char *mr_name;
 
-    if (get_physmapping(start_addr, size)) {
+    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
         return 0;
     }
     if (size <= 0) {
@@ -325,7 +327,7 @@ static int xen_remove_from_physmap(XenIOState *state,
     XenPhysmap *physmap = NULL;
     hwaddr phys_offset = 0;
 
-    physmap = get_physmapping(start_addr, size);
+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
     if (physmap == NULL) {
         return -1;
     }
@@ -373,7 +375,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
     int rc, i, j;
     const XenPhysmap *physmap = NULL;
 
-    physmap = get_physmapping(start_addr, size);
+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
     if (physmap == NULL) {
         /* not handled */
         return;
@@ -633,7 +635,7 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
         int rc;
         ram_addr_t start_pfn, nb_pages;
 
-        start = xen_phys_offset_to_gaddr(start, length);
+        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
 
         if (length == 0) {
             length = TARGET_PAGE_SIZE;
-- 
2.41.0


