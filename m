Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B37EB280
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632631.986943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZR-0007Xm-3r; Tue, 14 Nov 2023 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632631.986943; Tue, 14 Nov 2023 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZR-0007Ux-0T; Tue, 14 Nov 2023 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 632631;
 Tue, 14 Nov 2023 14:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZP-0003b0-Ul
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95048d94-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:39:14 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso1146147566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:14 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 g4-20020a1709064e4400b009e609088c09sm5584953ejw.1.2023.11.14.06.39.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:13 -0800 (PST)
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
X-Inumbo-ID: 95048d94-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972754; x=1700577554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhpN1sNxh5OOZ/KSUE3Y0jUPmEpPW/hS+3a5vlda+P4=;
        b=UdmQCgEDvbr7P35GPus8m2g3dRyrWQv8o42DbW7NIGomAr5QARmoZ8nsiLFD0GgtAL
         ac9i7YEDJVSQC66E/9erxEypAHYwOJdQoTH3bIXE7BNvufqNpg0PAmZNJe2O+7W2drBF
         hQng+brBxqbpH7amXu4Sa6118OKXQhIMmh3r8qRnB231R/JoXJOl6TXE2fHNqnHsWSSt
         8zb9GnhCsT+cbt0w0y7gnpDOZNzQPP8WQUSkrDKvIxA4yIPkx7jmSgjrl9PTSOOvOve1
         XgWKkfNzBB8YOZqzM9kMkdkjhqDOsgXc4YdYOf5JWCPvTk7+oqLb96TMkMhUWFTjpX4w
         BHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972754; x=1700577554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhpN1sNxh5OOZ/KSUE3Y0jUPmEpPW/hS+3a5vlda+P4=;
        b=u8GoUiP6SRR0HwWDDeV795xLCuA3fcFJWR0z5g6b2YHWXEIg6OiAf1LdTqcWzFtSyD
         3mzPqNOhzYg0mEjUZMMs4bYcy0KiRgjvcs5xbwjGlibxUCc1NJVohMYR4SqdVWEj6erK
         Wis2KGbAS78Xi3XcCdrpvYJUr1RKqN8mz1Ek5XT7v+VhG7XiXxBU8CjFeiOI10A0jOoj
         jlm6hxgfKAMPXo1jJTuBq9I5sXz7YJv29Vloksdl2sx0/gm2I2sasoZkuAtJbP9D4zKN
         xvZ068KPpUWiR7/lGsID1sHKkMpVS5XYmSfENVRduiK3mZY1A9vVs0pOBvZeV7KQq3+W
         W/Mw==
X-Gm-Message-State: AOJu0YwHKsnrdqnh95odb3y3Ij7j43PPqkgg5SQ/QgecekwM2C5bD1z2
	f9uM7kXiuZcqvanYFQeIZaSMxg==
X-Google-Smtp-Source: AGHT+IEBPsAFKv3TcvW/4lHrf4Ji7dOfSz7fvZ7L1HUiABJvwud/gdEB/1UIkKrwYaMtMuFVPwAlYw==
X-Received: by 2002:a17:906:bf45:b0:9e5:1db7:3199 with SMTP id ps5-20020a170906bf4500b009e51db73199mr3052455ejb.4.1699972753957;
        Tue, 14 Nov 2023 06:39:13 -0800 (PST)
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
Subject: [PATCH-for-9.0 v2 08/19] hw/xen: Remove unused Xen stubs
Date: Tue, 14 Nov 2023 15:38:04 +0100
Message-ID: <20231114143816.71079-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All these stubs are protected by a 'if (xen_enabled())' check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 stubs/xen-hw-stub.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 6cf0e9a4c1..53c6a6f2a0 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -8,36 +8,12 @@
 
 #include "qemu/osdep.h"
 #include "hw/xen/xen.h"
-#include "hw/xen/xen-x86.h"
-
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    return -1;
-}
-
-void xen_intx_set_irq(void *opaque, int irq_num, int level)
-{
-}
-
-int xen_set_pci_link_route(uint8_t link, uint8_t irq)
-{
-    return -1;
-}
 
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     return 0;
 }
 
-qemu_irq *xen_interrupt_controller_init(void)
-{
-    return NULL;
-}
-
 void xen_register_framebuffer(MemoryRegion *mr)
 {
 }
-
-void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
-{
-}
-- 
2.41.0


