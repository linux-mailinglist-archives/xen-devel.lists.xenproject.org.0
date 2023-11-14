Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFDD7EB27A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632628.986922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZD-0006Kn-Dk; Tue, 14 Nov 2023 14:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632628.986922; Tue, 14 Nov 2023 14:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uZD-0006IN-Af; Tue, 14 Nov 2023 14:39:03 +0000
Received: by outflank-mailman (input) for mailman id 632628;
 Tue, 14 Nov 2023 14:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uZB-0003vI-Lk
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:39:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cf80e29-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:39:01 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-545ed16b137so8049513a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:39:01 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 b21-20020aa7d495000000b0054353639161sm5133902edr.89.2023.11.14.06.38.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:39:00 -0800 (PST)
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
X-Inumbo-ID: 8cf80e29-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972740; x=1700577540; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2i2PCnBLcbag3MdE1ImS65uDPosS8yIjq0X323T5yY=;
        b=mblXSRE7gCbEaWFRO/HpuNY+P90f7PHjKSwivujayJT3HaDfjT8vZQLryHZg/mXZBE
         Sj8CFJMLN07oyma6l+JNFRL7agBSofS2rSCIMErvWBShpoFffJEgf1i+x/rabf+7PZgJ
         W9gD1IsziW6tw9rJZo+a1UPpiT+7RaOVlolMu36rls9cjmPJAKuEHM/JmfiptCpl0NU8
         TODLOuSf2q+AtT8ruqy7V/Ikymczt7v6XK79YTs4sa8879Bwa5Dx1pyIfoye+Rwh31vo
         f6h20pOe715O5OiijLK3hYmGIq3kb4ro7KWg64W2comZ/xaNwLl9AVfWBrmA+rtJHJal
         ZJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972740; x=1700577540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2i2PCnBLcbag3MdE1ImS65uDPosS8yIjq0X323T5yY=;
        b=Yjpuhsw44sJKJsPjskufMSv/Cs7EA5dNz/MHG6r1aZvUKVyK+8GFiok096kN1RC0XR
         7kTYHanzjF6GNMdky5EpRKx8XNfw7dSbADkbcWJvoav/eEPK2m/2tR5i7UpwnvbSFtJ+
         JBHO2LZpCfaLl8p+uJ1LBfUG6Lypbd7nRHLUUMu8D1YJ+caLeTbWQ3ROcNiCF4M2Knsp
         6h36U7Xn9RAQIhN76/fPrBXk4s5PQuNAYAVpoMP7aVKPQkUbH2HWX1MNHSPe/UZQ/JKA
         IodK+VkthTbZ11GueXCNGisu/arj/mUiFpLbw3uM/rGOydq8tUo17Mi/crhEzJ0lvqao
         eR2A==
X-Gm-Message-State: AOJu0Yw5sN7t3Fd0xVVJb9g2v1o3gAP0U22+T9IU/EXFbUuVRnobHzBH
	BirodqWG/piyDyPMMUYKqiDG4g==
X-Google-Smtp-Source: AGHT+IHSJfSbRj04/mwMI7ongNHq1l4+SKd+JSAzh7MEswy3END/JCbC/d/lhlupvrq+nM36Jvq7cA==
X-Received: by 2002:a50:fb14:0:b0:53d:eca8:8775 with SMTP id d20-20020a50fb14000000b0053deca88775mr7423669edq.26.1699972740609;
        Tue, 14 Nov 2023 06:39:00 -0800 (PST)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 06/19] hw/pci/msi: Restrict xen_is_pirq_msi() call to Xen
Date: Tue, 14 Nov 2023 15:38:02 +0100
Message-ID: <20231114143816.71079-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similarly to the restriction in hw/pci/msix.c (see commit
e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
xen_is_pirq_msi() call in msi_is_masked() to Xen.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 041b0bdbec..8104ac1d91 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -23,6 +23,7 @@
 #include "hw/xen/xen.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "sysemu/xen.h"
 
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -308,7 +309,7 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     }
 
     data = pci_get_word(dev->config + msi_data_off(dev, msi64bit));
-    if (xen_is_pirq_msi(data)) {
+    if (xen_enabled() && xen_is_pirq_msi(data)) {
         return false;
     }
 
-- 
2.41.0


