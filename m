Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF90BAA4D5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133118.1471313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgX-0001Zy-9N; Mon, 29 Sep 2025 18:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133118.1471313; Mon, 29 Sep 2025 18:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IgX-0001WP-5z; Mon, 29 Sep 2025 18:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1133118;
 Mon, 29 Sep 2025 18:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IgV-0001U2-Dm
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:15 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c241ef56-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:14 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso4274681f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb8811ae8sm19065012f8f.19.2025.09.29.11.33.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:13 -0700 (PDT)
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
X-Inumbo-ID: c241ef56-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170793; x=1759775593; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23QTyPjiy3YtVC18SQIGMGuPQmXq870ERJAMX9bHv6E=;
        b=yz9Ho+iW6Hem25yjL6Z5dyrPGX8O43ZKREqA0rfTjODo/DoG02AahpMhJdcVQ/V42Y
         C0rj3lcUzIcDiYG2RWTtwuUotRFGvOiXOtMwgJSJ3b5JPj9vIkXs2fM2qcWQzOOYUf9K
         rHHVL/nnJq8V/QfR8DtZxxYOSiOwE1VoH3h+7o0aLV+j3SMFzeUMvLfDT6Rq93VeWQzV
         6Ea7RplwNpv6wglQbxkgMhN6zapv1sfnd4v5Hqi88wVbdhtglB5iJ8rRcwJfMwUSgqQO
         kzn1WkqrSH/WAY5A7jy9u76iiBCuUgPlFddsa3hKkb2kqR6N94TrluD1mVJ71VgB42SA
         ZB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170793; x=1759775593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23QTyPjiy3YtVC18SQIGMGuPQmXq870ERJAMX9bHv6E=;
        b=O4G6VXDKwFxY8nkFwSWn+knRXlx/dw8Oe0G8XOHY701IrqLbYfe/q1ABThPCCWTjTc
         gRJafQ61mtiU8wk0TEyVBDc4jBPka/ZNfCboM/HwnjoyrDxBIc3JZR/bg/4P5tI7O5j2
         W58WX+uzrgTp9/4stGFZeNEXl0VZ+HICvH6zU4smZmSGYF2c1Xtr3AkdtyINP0lrZuob
         FZJSBtvB65zhBXKCaXNVjQ4D35NJznJrnUCL00yqUwG0EVNKe/QR9Kgjey7Kb24Q+YtS
         W9LBpTlboDRMf72m4J0/placJQRI5GPOy7PD9ydSWePBtgiHJGCbe6HMFKe5/rHF5FwJ
         TTcg==
X-Forwarded-Encrypted: i=1; AJvYcCUDRnW5lqXzifjfz0AUNJCo3jvRbxAOKV4LP8Cifp/70CW+f7ort3Lq/Fb9w+Guva8ShX2U72+kAag=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxkv391uu9tnlcrCa2+0j1SlFDO6LY0ScekUzZPkWi9Bxo5KWRN
	TbaNSMAScsq9lXVhNQRuCSS1yko9gb/bDItzsP+bVbrdpx+y7zG/CYid40er7ENjsbA=
X-Gm-Gg: ASbGncvcDljKzIz1d/PKUnOpyg2hf2Te+8z97NOMIlxm7IPra/C2uWx86lcLoMxVA/T
	JZo3sCN1d1M1BGV3G2/nJlwgbn/PiW89RGB5AleKmThPjZ+cn4UgMlURenIObwJPnOIOsa72ZWF
	BJIgRpiflZmVnapiPKqNxTa8hiefN06qCMozlvR5kEpwmL2G2kj+8LE2bj0DHy4OXJeUodxd0Fn
	mXWCVeBLKdzUDmjMCO7hiQrHhB09UNWeRfvc7MOkxdqwig/mpee6FFnorHVRx+7OwdNXV8isKPs
	Qmm/AlWvVwAjj7IXiFYidaE/svYtTr1hNXFMYUw8hh6DPFaIt5iSWWj0sEezRGKTW0+Kc156fM/
	QnOl2CJhEs1r6dRVcdvP8qGz7lG4Fm57XnIN7XzwubqeY+csoBPZf5etq9gcMV8Jf+QNSMGY0nq
	QeKO4vlaQ=
X-Google-Smtp-Source: AGHT+IEcDsohAJY1q22fsASxxAoYQtWlMdbA7XCLoeuebdYNdITcBiYeKjk+UAJn3Z9pxuCxt6ME3A==
X-Received: by 2002:a05:6000:2586:b0:3e7:65a6:dbf with SMTP id ffacd0b85a97d-40e429c9c42mr14229584f8f.6.1759170793465;
        Mon, 29 Sep 2025 11:33:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	Eric Farman <farman@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 03/15] target/i386/arch_memory_mapping: Use address_space_memory_is_io()
Date: Mon, 29 Sep 2025 20:32:42 +0200
Message-ID: <20250929183254.85478-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since all functions have an address space argument, it is
trivial to replace cpu_physical_memory_is_io() by
address_space_memory_is_io().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/arch_memory_mapping.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_mapping.c
index a2398c21732..d596aa91549 100644
--- a/target/i386/arch_memory_mapping.c
+++ b/target/i386/arch_memory_mapping.c
@@ -35,7 +35,7 @@ static void walk_pte(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = (pte & ~0xfff) & ~(0x1ULL << 63);
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_memory_is_io(as, start_paddr, 1)) {
             /* I/O region */
             continue;
         }
@@ -65,7 +65,7 @@ static void walk_pte2(MemoryMappingList *list, AddressSpace *as,
         }
 
         start_paddr = pte & ~0xfff;
-        if (cpu_physical_memory_is_io(start_paddr)) {
+        if (address_space_memory_is_io(as, start_paddr, 1)) {
             /* I/O region */
             continue;
         }
@@ -100,7 +100,7 @@ static void walk_pde(MemoryMappingList *list, AddressSpace *as,
         if (pde & PG_PSE_MASK) {
             /* 2 MB page */
             start_paddr = (pde & ~0x1fffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_memory_is_io(as, start_paddr, 1)) {
                 /* I/O region */
                 continue;
             }
@@ -142,7 +142,7 @@ static void walk_pde2(MemoryMappingList *list, AddressSpace *as,
              */
             high_paddr = ((hwaddr)(pde & 0x1fe000) << 19);
             start_paddr = (pde & ~0x3fffff) | high_paddr;
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_memory_is_io(as, start_paddr, 1)) {
                 /* I/O region */
                 continue;
             }
@@ -203,7 +203,7 @@ static void walk_pdpe(MemoryMappingList *list, AddressSpace *as,
         if (pdpe & PG_PSE_MASK) {
             /* 1 GB page */
             start_paddr = (pdpe & ~0x3fffffff) & ~(0x1ULL << 63);
-            if (cpu_physical_memory_is_io(start_paddr)) {
+            if (address_space_memory_is_io(as, start_paddr, 1)) {
                 /* I/O region */
                 continue;
             }
-- 
2.51.0


