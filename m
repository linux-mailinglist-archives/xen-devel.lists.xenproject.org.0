Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495761E9985
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRv8-0003ef-Og; Sun, 31 May 2020 17:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRv7-0003e8-9Z
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:49 +0000
X-Inumbo-ID: 88be7936-a365-11ea-8993-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88be7936-a365-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 17:38:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k26so9130932wmi.4
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iYvFEgksB/BdazMa4Cs2c4jhXMbkN0WXaFJS9CHNgVo=;
 b=mLOiMHew1qF2hGdISfFnUSQy6ouAsSbwhEJxg/OGYSPf9xv1xTbVr8mBMRqJHP0j55
 yBAV5qmG/+djftEUqMiPwGr4Bh3GmX3ZVamOeBJXaKaDNXOaK/dz/G5T07RNwS0DFgrY
 c6bALnWU6nCvGXRvmEhcQH90po/UBDda62lpMh8uL/oBuNFtkrZ/+WZD/xRTxEPgKh8w
 YobGHA9manrtqDfq5TIha9eaxMdsJWURJqAn1SCZ+ZvWMz1ywD46nuh/+b1NyAbjDy7+
 GWlf7/+f8s9uLntj5m+01uzRU7k+D/zt9t5VXEvBWhKQ9MlGmJn6WzbC/VlmhCnqS0u0
 g/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iYvFEgksB/BdazMa4Cs2c4jhXMbkN0WXaFJS9CHNgVo=;
 b=CB7OI1ol+ATI2rfGAEt7szes8XDcFce1QBl13ZOgXfxXR/FYKWbUxtKKpBINXiYF2i
 oLfNqX4DX68Zvmr/oaSZljadKKIfJDztOG2c+JwhbssDxtEEQU9oRL3+cr3chFqH0Fw4
 HKoVOxbpxBuovNbpOXxnFBCJ4+oYasxSUjt0CyPX+WdbBy/sJFfyaZ9rZCL34sluQN54
 4vVjbR8Ilq6ieKRtKWVMjJpRyWgyH1i3Ab8NjhJLFVRAoswT+RzayClILP+ALKUEHn1G
 YvHmH25i2lHTSG80yNeo6JctgxHnW/xqI66HLIOsYWRbD22B1geCtZxPonyZwBA/wXu6
 FMRQ==
X-Gm-Message-State: AOAM531vz5kMz62yjSEhhd+dOietFzhymgKEhxmPB8iPuFomA9VyuNqg
 QWl9VLN6O4JTALAvS5nZUgE=
X-Google-Smtp-Source: ABdhPJwhb/IFbThB/tKVOWT/s2NPGR4HDMLpVaDysxOxobXYSvPIAsMTEGuw+7HN9OrZnw/sT/Aqyw==
X-Received: by 2002:a1c:4d0c:: with SMTP id o12mr18594700wmh.181.1590946706678; 
 Sun, 31 May 2020 10:38:26 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:12 +0200
Message-Id: <20200531173814.8734-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 2b1b38c58a..7290f23962 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -542,7 +542,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
                                 &s->parent_obj.data_mem);
 
     /* Dino PCI bus memory.  */
-    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 1ull << 32);
+    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
 
     b = pci_register_root_bus(dev, "pci", dino_set_irq, dino_pci_map_irq, s,
                               &s->pci_mem, get_system_io(),
@@ -561,7 +561,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     }
 
     /* Set up PCI view of memory: Bus master address space.  */
-    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 1ull << 32);
+    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 4 * GiB);
     memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
                              "bm-system", addr_space, 0,
                              0xf0000000 + DINO_MEM_CHUNK_SIZE);
-- 
2.21.3


