Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B36587738F
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690979.1076748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2ID-0004M9-Ix; Sat, 09 Mar 2024 19:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690979.1076748; Sat, 09 Mar 2024 19:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2ID-0004IA-Fb; Sat, 09 Mar 2024 19:23:37 +0000
Received: by outflank-mailman (input) for mailman id 690979;
 Sat, 09 Mar 2024 19:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2IC-0000Lp-3l
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:36 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 857f947f-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:23:34 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5682360e095so2919755a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:34 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a170906a41400b00a46163be639sm251749ejz.12.2024.03.09.11.23.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:33 -0800 (PST)
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
X-Inumbo-ID: 857f947f-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012214; x=1710617014; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjJ9Xc35+gwGwrFshf70kAsb/Zk8w4JUpjKATwEq64Y=;
        b=Cz93Ty6kH9Ww33ARglTIEs5esvgrOwNs6eu98xl9xRIsRJ6jCcEfkJE6TZGABnY0Os
         E4PDiRG9cwpEVowt3vdpdLBrQrx5iUnfoV5+QCBfkzvFA9IBs7C6CJgbFHPvVUfpqEmT
         TFVFArMbQHJCNcACjdkCUzoIwPO23jw9nMvh7QzlzuS5mD7zHwVipOkblYGa610SKEdx
         qVAQE7g0UyeiRz/Blb43JeXi7jV3hqZOKoUhkbcrd0+KXdf/5MlV4G7Kju/GZYFLRI56
         To0miIHACBrtgSWKHKCLXEpOFk+8QoxGUOJdGezwx/NftnIEwfcvtCTXgWi9K+KMN5Ij
         QLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012214; x=1710617014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjJ9Xc35+gwGwrFshf70kAsb/Zk8w4JUpjKATwEq64Y=;
        b=BLZRRsJ0pyyd5DPpoB9D5GvTVI+H35tMVqqz5P+V80GB3Dz9hrl8nLkP68gjk8KUeG
         E2L4e7jA752FK7DrbSxQKkkgeo0m4JzyIfPzcU6BDQxdY/rFDislBky92Y4STcuH1ABW
         ZNYiOrEX3owJYz4pKXS6Ix3JshsPreBZ8iRR+ctdKERJozhLUrVQW16ty/YnXroXhRF5
         A4OD+/GrtoNTV84fRNPPfV/vPvuf0AFdRxnYRMRN4v5QcOMq+f2gz8lCTyMAojXpAm4V
         c1Vx5bFVBzYYmItPD264+8loksaq6JWEIjSoUcpy/G69CBIZ+WLK6/WKdsIySH16zobN
         Irlw==
X-Forwarded-Encrypted: i=1; AJvYcCVwibozan0IzIMmNjCgIIXyu4zZFQy/x6l5wfD7jJYnRoaymQeaEsT4q3ga/2AFTxtPB6pq3b64clVhQZp4aXATr6PvzeZCEwYs7DgS0LY=
X-Gm-Message-State: AOJu0YwoL3oWPNf437Tbg7aiN9frHnmSL3D+ZPUIS0Ty+YYgY7ig+w64
	iYxRV78Ju4Xi7wO6BgVMWt40lkp6IHw2HTYN4ezVEBAu3NsbaHSyE6CZHE61Ap8=
X-Google-Smtp-Source: AGHT+IFUzNU4pC8ZaO+fIzpjlcMgyQZHUIXDLCwBTxfANDlJj9gCS9ZbhsgrrNnhXeKdaH05pNglXQ==
X-Received: by 2002:a17:907:d389:b0:a45:92c4:7892 with SMTP id vh9-20020a170907d38900b00a4592c47892mr1630790ejc.56.1710012214113;
        Sat, 09 Mar 2024 11:23:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PULL 13/43] hw/xen/hvm: Propagate page_mask to a pair of functions
Date: Sat,  9 Mar 2024 20:21:40 +0100
Message-ID: <20240309192213.23420-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are going to replace TARGET_PAGE_MASK by a
runtime variable. In order to reduce code duplication,
propagate TARGET_PAGE_MASK to get_physmapping() and
xen_phys_offset_to_gaddr().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Message-Id: <20231114163123.74888-3-philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 8235782ef7..844b11ae08 100644
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


