Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8407E9FCF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631701.985335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YlD-0000iu-1D; Mon, 13 Nov 2023 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631701.985335; Mon, 13 Nov 2023 15:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YlC-0000fa-T2; Mon, 13 Nov 2023 15:21:58 +0000
Received: by outflank-mailman (input) for mailman id 631701;
 Mon, 13 Nov 2023 15:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2YlB-0007fE-1r
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:57 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 611d9c33-8238-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:21:55 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so698888066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:55 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a1709062c1600b009de11cc12d2sm4197707ejh.55.2023.11.13.07.21.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:54 -0800 (PST)
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
X-Inumbo-ID: 611d9c33-8238-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888915; x=1700493715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaPh59FgiGsmC+pCYaCOTA7yQ1Mp2MwkOCCJHlQNKqo=;
        b=fMk5NYIlbQ/gxBSTh9zJcjf5COuMPlM+O2pnKN9ZYTtV+/IvWkLoOQ+ERyYiN8ZqQB
         bMqHbyz0W9+eFiOgmLQUifCMZBxz3aMfx62deCOS/5LdKf6ydcGhy5GQCr7dLBoO+VyH
         rwsOJ49ZoY/Qnq3N9bZwbhpqJZq2/dBNuTMgZKXtsgo09ZHYNFes0g3EgZQ7HszHgAea
         gZMWZ0i7tyLCsDvWRWBPM/0pXnZQ7/pZ3cJwKfEocyWQx2Kw1qdNIaXcimZQxKUOddFw
         DRE2FaEAmTeBONgOaQBQ3TYzrZPJqN7o3558J5LrsrlZsTFxkpjXEpEyBR4iBZC7wzqu
         eOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888915; x=1700493715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaPh59FgiGsmC+pCYaCOTA7yQ1Mp2MwkOCCJHlQNKqo=;
        b=KB0prYqAtCmvYIPxjyw8W/3mNh9f7xtXVtr0XDrSalzeWYpx8J6cRnjRHaae5OfFbt
         ceAt8vv1GKRKNaWheZapkyhGj6njQgURe6TmuANfr4ytpE/g71vXMA8YJwaVh/gszcVM
         9JC+4ue3V++PjJcG2Tk1VVNz6QGEENzSz4pTPk9Eb5D14qdsoGrjoHTIQoidfgpTsNr4
         0N88Orb6W+6eNVgfoVDRcGi8AGFi0d8Wx6lq7uHXAS33Y89HvCVA+HShnHO1iS796Lq2
         YGAkkVyA00Kq0ewlGgwVq419JigVZSLYaMA+vS0gsIxA31Z7clDKAkzpbztws6kizSLx
         176A==
X-Gm-Message-State: AOJu0YxPCMpL3aS9/B4HCrQjQHPYLBCcGp2fx/+L0bVCbExVBzHqLeGr
	Jl5g0vRDMd1VkBpFGh6VxbHY4w==
X-Google-Smtp-Source: AGHT+IH3RjReylXfRQh/wsJfTu2jHnqkMqs+PQHcbPoh+QyiOeqF9Xb3+QdjFCNga0xDu80xIHTeww==
X-Received: by 2002:a17:906:fb8b:b0:9e6:59d5:8228 with SMTP id lr11-20020a170906fb8b00b009e659d58228mr4946396ejb.27.1699888915206;
        Mon, 13 Nov 2023 07:21:55 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 06/10] hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
Date: Mon, 13 Nov 2023 16:21:09 +0100
Message-ID: <20231113152114.47916-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We rarely need to include "cpu.h" in headers. Including it
'taint' headers to be target-specific. Here only the i386/arm
implementations requires "cpu.h", so include it there and
remove from the "hw/xen/xen-hvm-common.h" *common* header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 1 -
 hw/arm/xen_arm.c                | 1 +
 hw/i386/xen/xen-hvm.c           | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 734bfa3183..ca941fd3eb 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -4,7 +4,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
-#include "cpu.h"
 #include "hw/pci/pci.h"
 #include "hw/hw.h"
 #include "hw/xen/xen_native.h"
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index c646fd70d0..2c97d6adc8 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -33,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/xen/xen-hvm-common.h"
 #include "sysemu/tpm.h"
+#include "cpu.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index aff5c5b81d..369d738b50 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 
 #include "hw/xen/xen-hvm-common.h"
 #include <xen/hvm/e820.h>
+#include "cpu.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
 static MemoryRegion *framebuffer;
-- 
2.41.0


