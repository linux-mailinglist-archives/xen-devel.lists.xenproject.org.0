Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F637EB275
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632626.986914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZ7-0005om-6N; Tue, 14 Nov 2023 14:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632626.986914; Tue, 14 Nov 2023 14:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZ7-0005lD-34; Tue, 14 Nov 2023 14:38:57 +0000
Received: by outflank-mailman (input) for mailman id 632626;
 Tue, 14 Nov 2023 14:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZ5-0003b0-Nw
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:38:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f8dab4-82fb-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:38:54 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9e62f903e88so626118966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:38:54 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 un1-20020a170907cb8100b009a9fbeb15f5sm5549367ejc.46.2023.11.14.06.38.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:38:53 -0800 (PST)
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
X-Inumbo-ID: 88f8dab4-82fb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972734; x=1700577534; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuAolXSNCEGrTS5m5CRvskBDG9NQVZE3kWB97Se1m9g=;
        b=w4RLHd/ijPrKLNVSNxRHMbaAfxOJM/N1TSReAZ2xX0crDtikUdzVWFiK0rkyDT/slj
         bHqcj/NXQq5qIcT6ai0VgC+PKna+11TDdbw0SiQZT9pv4nbH4aBRu80tIyggUUEgPadN
         kDbNcWEgedZbcrpSpSTk/zXeu43J6Is9eU+lKr3gHHesF+9LTRaC80Ucv8ddG0Zy7ZR7
         JATatIW+/eSIW9bHyakIHWnMOxT6pfY/upD0FWa2gTqeNOcvwJ72Ufe+kqSUxlkkzVGN
         +t3wydsFMyV2t+2ktd6wEsGjTBoOJvF3BjuLBvdxkWYZiBwgpt/AQ7nUCcFBy5DHlsEv
         oA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972734; x=1700577534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuAolXSNCEGrTS5m5CRvskBDG9NQVZE3kWB97Se1m9g=;
        b=Hf1uEcuZ9avlEosxuaMc89WhqUuKgu26LbLZP943FHUkoEnjl5MCUrJ+JHu9xRLzeL
         tX4ayyyyQl+zX79g4IphIkQozZdg6fJxG6NyZRd0FFXe1EbRx0ngQMxVzmPVDbgo9eN0
         7FFGdjn1UlBUb0uoMvYA/ZMWkdOxnTRkaKs7TVR8zdtTwNlvd6LKOyJP91Drjik3rUU0
         DrUr11Ul7/Fe1BRaLSJRQ59rQ6cnd7flFZgO8ssTby7o0nStLkJWIEM2NGtQ5t5UjOlm
         NO+QGU2Nf8kQB/Khp/M4RcRZCFzpG7IXAZETHo4ifmABlmJ4TH9edyUZxiphZcZ2hY+I
         s4OQ==
X-Gm-Message-State: AOJu0YzV73iin+4VGYwluF/pVtFaqMIPbB49cwBqNPtH9VF1MR0pHdSP
	uZh8MSF7EjzjHNpQfGVjcqeOxw==
X-Google-Smtp-Source: AGHT+IEd2vTLeg2GpIsCyOKyOB5sACh8KieliOs//U/3JH0fTJ/5IoDfAGItJdrYHg+Wv8sdCg7VbA==
X-Received: by 2002:a17:906:b78c:b0:9bf:f20:8772 with SMTP id dt12-20020a170906b78c00b009bf0f208772mr7590866ejb.26.1699972733904;
        Tue, 14 Nov 2023 06:38:53 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-9.0 v2 05/19] hw/display: Restrict xen_register_framebuffer() call to Xen
Date: Tue, 14 Nov 2023 15:38:01 +0100
Message-ID: <20231114143816.71079-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only call xen_register_framebuffer() when Xen is enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/vga.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 37557c3442..f9cf3d6f77 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "sysemu/reset.h"
+#include "sysemu/xen.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "hw/display/vga.h"
@@ -2223,7 +2224,9 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
         return false;
     }
     vmstate_register_ram(&s->vram, s->global_vmstate ? NULL : DEVICE(obj));
-    xen_register_framebuffer(&s->vram);
+    if (xen_enabled()) {
+        xen_register_framebuffer(&s->vram);
+    }
     s->vram_ptr = memory_region_get_ram_ptr(&s->vram);
     s->get_bpp = vga_get_bpp;
     s->get_offsets = vga_get_offsets;
-- 
2.41.0


