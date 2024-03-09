Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262C877388
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690972.1076697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hi-0001oL-50; Sat, 09 Mar 2024 19:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690972.1076697; Sat, 09 Mar 2024 19:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hi-0001lx-1i; Sat, 09 Mar 2024 19:23:06 +0000
Received: by outflank-mailman (input) for mailman id 690972;
 Sat, 09 Mar 2024 19:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2Hh-0000Lp-6g
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7319aa81-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:23:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a45aa7cb2b3so235244866b.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:03 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1709064bd300b00a44e2f3024bsm1172780ejv.68.2024.03.09.11.23.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:02 -0800 (PST)
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
X-Inumbo-ID: 7319aa81-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012183; x=1710616983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q44dwAJ9zWJURYp9hh0U7wvOFqEH1mwy4JxGXOeg8jA=;
        b=N30iY6udcSXFerUkOTtu1tk37o+Ry8uP2nm5eR32c0NFM3bWwetYf6+0lCc/gcJRwv
         n4RU4uw5f4HcQAYtEh+uzrUMpUj+S4gQQMu/R5eCIU9bQycAGYMLQy/AYJpCq0drQCkT
         Ki/ZXHtD6AuBed6P2KXaaqKt+PEblN/CEXiZ2PQAxyzk+nVeGCPCz97KEt1lcHg0pVXK
         Sb7bAetNJ2MUZHGXsZvWoyKzE6+Abf/g6gBs+0zPQretHSj2iTd/wKMXVxSIKhHK3fct
         oWMRFgEhaftQYn0JrVXY1NQS0D+iPNu/+mwYar+LnzRtFeS9SIeMTsykHDgECBV690iO
         D9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012183; x=1710616983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q44dwAJ9zWJURYp9hh0U7wvOFqEH1mwy4JxGXOeg8jA=;
        b=P/JbiVpwvMXPgWTHwmQ0pQxKK2pmFEXMNyROXY/HB5hYAUDyCt6qCOjjOyVqsFQBDm
         LDhiHXWW9bahuPPrTFDfrwMRXGo0CzReAe01ZkF7HzLby6RlofdxEMYjv2SUc79YOlzU
         1yIWWD1UD0LHUztct50VgybGrOzhL2iNGinjgugv6bsOvdT6aoABnIZ2n2TKyaNALF37
         VW3U+kw3FFtCiD4FrYswZDiLYHKfL5I06+ttlQk6jmSaEVNuT1DoPmwzxb2PNULwbgAn
         zK45ZB/WEc6pvNRAOggNGl1jS/caTjwYTE9DnxQem1QhNc4/e2ahUZZapaW07uLIcy8d
         MRcg==
X-Forwarded-Encrypted: i=1; AJvYcCXEgKwK+4EBszgYaiutHoTdk7SmjPbL55lzzCtmpHWWVph4dy0Xz33DHPfdkabMskPWJl6meQEpw9Fy2hypF/8MjvVWO++OUguMN+10rCE=
X-Gm-Message-State: AOJu0Yy5WylpHd3eHpvorQV5G9H0gT2iofV9T+vXOU3+u/GXq+S+N9Oh
	/Y4UZk5AtiW7sTtLymK7cLX1qIG1DA9PQ/eVg3rCSdNxuX6YlhEvs8GN1RcDwDQ=
X-Google-Smtp-Source: AGHT+IHOQkfTUB7DFZUnzFt5SN8xXU0FWBVOfPyoMZQqgOTUu5nO+XttuLhInRopNUGb3cs1S/BhDQ==
X-Received: by 2002:a17:907:7898:b0:a45:119e:3dec with SMTP id ku24-20020a170907789800b00a45119e3decmr1327777ejc.73.1710012183067;
        Sat, 09 Mar 2024 11:23:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 08/43] hw/xen: Use target-agnostic qemu_target_page_bits()
Date: Sat,  9 Mar 2024 20:21:35 +0100
Message-ID: <20240309192213.23420-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of the target-specific TARGET_PAGE_BITS definition,
use qemu_target_page_bits() which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-15-philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index dc69cada57..1627da7398 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "exec/target_page.h"
 #include "trace.h"
 
 #include "hw/pci/pci_host.h"
@@ -14,6 +15,7 @@ MemoryRegion xen_memory;
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
     unsigned long nr_pfn;
     xen_pfn_t *pfn_list;
     int i;
@@ -32,11 +34,11 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
 
     trace_xen_ram_alloc(ram_addr, size);
 
-    nr_pfn = size >> TARGET_PAGE_BITS;
+    nr_pfn = size >> target_page_bits;
     pfn_list = g_new(xen_pfn_t, nr_pfn);
 
     for (i = 0; i < nr_pfn; i++) {
-        pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
+        pfn_list[i] = (ram_addr >> target_page_bits) + i;
     }
 
     if (xc_domain_populate_physmap_exact(xen_xc, xen_domid, nr_pfn, 0, 0, pfn_list)) {
-- 
2.41.0


