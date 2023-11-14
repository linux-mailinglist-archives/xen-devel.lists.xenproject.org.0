Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BD7EB293
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632636.986973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ua5-0001Tq-Ur; Tue, 14 Nov 2023 14:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632636.986973; Tue, 14 Nov 2023 14:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ua5-0001Qs-RL; Tue, 14 Nov 2023 14:39:57 +0000
Received: by outflank-mailman (input) for mailman id 632636;
 Tue, 14 Nov 2023 14:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2ua5-0003b0-0x
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad790427-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:39:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso1146304166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:55 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 e10-20020a170906080a00b009a193a5acffsm5624675ejd.121.2023.11.14.06.39.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:54 -0800 (PST)
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
X-Inumbo-ID: ad790427-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972795; x=1700577595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1LXi3GoLl/gkTzQsgGS9qqbGm09JIagG9772ckn2qA=;
        b=hxCvAE7FVqwDYhNRfCjNL5US0jkCbIkJR6IfJDC5oSRDty0wvBiA81FZb62xERhseS
         0qen4Ig9tJTBPbDuPaMN4UoMTFPGWxDZWjHOi2Im1sBLAIx2DuT1sLApeADfz3AbiIj8
         3ymYjWaoIrMMq1iTCxgt6BIHGIBAP7En05xpy9/Odv3qROiUBCUHxXyVB7+Olu+w4MAh
         tVFQVbuCOrisyjxPPwUTPKI7HnrGIzDV7xU1WCeSsrbLtB1iYXYpjjgbFBWk36z2v+uo
         PWPANlX7AdmQd3fmoZ45GBTC5yxeEwWyK/SBpFcnFMmzBdg3MMo4sOK6MAl7iVcnG4XU
         qgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972795; x=1700577595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1LXi3GoLl/gkTzQsgGS9qqbGm09JIagG9772ckn2qA=;
        b=bMjX6IgV7vi0+p4E0Y1zCFBV8GZGxQhFfmZYp2JpwVyaGiPo6tkLF+KPSBEikEKNjX
         Ux4ZXAlE1X1anZdpygHIfAFp52Dm1YzYHs72rfp9OTFbXCT29inX8EgS5vkLEbN1hiGs
         bfPG1zBDallaiHlUUE+iN43Z+ZwNBgriIN23kZ6/rarl7GgAPszvfdI2R/XCzhmPPuyt
         rZPREkbqfPUV/DRD4m96MVIWbG7QVl/6mtISFdEsCCFAJXTNe7Aj2sAGyb1cDaau13PL
         t+ua9JN3CmmMsngsix9oF3XZyYrmlSwH14cw1J02D2Ppo3OmgbWRQSR8KBn4uLzN9+Ym
         0g5Q==
X-Gm-Message-State: AOJu0YyFn5j1PeL7YKUaT/gBxOnjsN8EClOiK9sneBhDSos60ABZxUHE
	HJfmA1TFaXsV6qiRcqJp2fm+kw==
X-Google-Smtp-Source: AGHT+IFO0v0Kbx5mK0/IVC1YCc6AdDt4TudkiuPrPaddeZvjZPoy7Sp5UUV1A0HKtR5wjcSegxv9ZQ==
X-Received: by 2002:a17:906:e51:b0:9ba:b5:cba6 with SMTP id q17-20020a1709060e5100b009ba00b5cba6mr2289558eji.14.1699972795126;
        Tue, 14 Nov 2023 06:39:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 14/19] hw/xen: Use target-agnostic qemu_target_page_bits()
Date: Tue, 14 Nov 2023 15:38:10 +0100
Message-ID: <20231114143816.71079-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of the target-specific TARGET_PAGE_BITS definition,
use qemu_target_page_bits() which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-hvm-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index fb81bd8fbc..73fa2c414d 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -2,6 +2,7 @@
 #include "qemu/units.h"
 #include "qemu/bitops.h"
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


