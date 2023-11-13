Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92037E9FCD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631700.985325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yl6-0000FC-MS; Mon, 13 Nov 2023 15:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631700.985325; Mon, 13 Nov 2023 15:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yl6-00009H-JF; Mon, 13 Nov 2023 15:21:52 +0000
Received: by outflank-mailman (input) for mailman id 631700;
 Mon, 13 Nov 2023 15:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2Yl4-0007fE-Qi
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d63363e-8238-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:21:49 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso7044339a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:49 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a50a6d3000000b0054026e95beesm3942482edc.76.2023.11.13.07.21.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:48 -0800 (PST)
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
X-Inumbo-ID: 5d63363e-8238-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888909; x=1700493709; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC1GyuSTm1pIOLAiq1jl6VtM1wTJGGJIerTVB/FTO70=;
        b=RhKDSAq4tdFZFblL2vgU5GyIc25BAMTcvtLAay9NlQ86waYqpEFM97KTw95y77ljf1
         bJwamz84mo9R24Wo97Sha70o22VVLAgAm3RzDP/0HyIjUgNnGTAjAQyWo1EWr2+Q3wFd
         GuP0fNuOjpo8dvP30c2Ee2esBtRKK48hBkJj/3BTpEpP5Pn5ALH+XBpsF3D0W1kcceuQ
         u+2aBHNLa0oUWOJtqfTz5WZ6Bm9ZeU3B+IYV2YO+1jy2RgJHRuHoUKEx7/vjNibOXH6J
         2q5NmF5s72b/cqlnYswZnkzlRXxWM2qMk1SbvgVIfFQO9ba8QLXHY5g2o30t2pHbSyUk
         14pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888909; x=1700493709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC1GyuSTm1pIOLAiq1jl6VtM1wTJGGJIerTVB/FTO70=;
        b=mBjVAN92tnXev/5cnZMI+M+590rZS0K8jXAHnu2aM18lZNKnVN7mL8NEmpAZTJ/u+Y
         qVxFoNjUbGZZaepUptuXhSfBh5EPftxej1+mFDdCg0XkNtSZuthpl1ASYyoRa+lKCBuT
         w5+p6cN1x+XgjlkMk+qNB15kZ2a/Q69iM0BKh7NNsw+ccFOTp+hXL3sAPRGXfOvoji+j
         9GFkVykhJH+r0iVr5L0a/fJxroYiUlU80/ebXbCzTNzBLk+zUGtFCYUPDrECOBSLcSvA
         9UmPgBtUn3qA/DFa9vTMgXr1hU5uh1SSWnwZ7LIHMj5+E+jtQI0aMfmv5VNS/AAiVmqu
         D+yw==
X-Gm-Message-State: AOJu0YzQPUzQJBniCIZnAeEvGCCO1Q96VFjpJBnof/OaUoyTHJvc4iQv
	hPorFKexCdRXTa+wt2bMDQfQtg==
X-Google-Smtp-Source: AGHT+IGbtAixMPiQVaiouSIFTb1IQKmmFA1AcOCrzXhQQ2Afk2FYf+XnPnB9Zgf0YAtZ7aK4/lySbw==
X-Received: by 2002:a50:ab12:0:b0:540:2ece:79 with SMTP id s18-20020a50ab12000000b005402ece0079mr5690457edc.10.1699888908890;
        Mon, 13 Nov 2023 07:21:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 05/10] hw/xen: Use target-agnostic qemu_target_page_bits()
Date: Mon, 13 Nov 2023 16:21:08 +0100
Message-ID: <20231113152114.47916-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of the target-specific TARGET_PAGE_BITS definition,
use qemu_target_page_bits() which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 03f9417e7e..35b3b5407d 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "exec/target_page.h"
 #include "trace.h"
 
 #include "hw/pci/pci_host.h"
@@ -13,6 +14,7 @@ MemoryRegion ram_memory;
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
     unsigned long nr_pfn;
     xen_pfn_t *pfn_list;
     int i;
@@ -31,11 +33,11 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
 
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


