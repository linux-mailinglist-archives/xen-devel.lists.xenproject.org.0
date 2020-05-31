Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630731E9986
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRv3-0003cN-Ct; Sun, 31 May 2020 17:38:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRv2-0003br-AU
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:44 +0000
X-Inumbo-ID: 87ee27d6-a365-11ea-81bc-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87ee27d6-a365-11ea-81bc-bc764e2007e4;
 Sun, 31 May 2020 17:38:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so9114561wru.12
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9h6TBijqwhWtCdWuge0QqjjfhcYOfthGpKadm9tGxU=;
 b=clCSszb1FCsID9L9t4vBQapFKkE9cKOSakgm1eGvx1xsWw2JAQNwLPoaGyVtpO42pe
 kBKp/gPUmWIa/w5oOdIrRSY8p4p3XayTg3tMrrOmZmC34eM3rOnIEYRVnlpbvTCc6+Vo
 HEPQNWcpPsZAYdMebzBYVG/m9y9BWrVBmpNxm2yP1xXyoU3t8PWsCPYU5BKwTMzBj1HS
 BPino4U2lYhzNDvluhBK5euxZu9633dvESJdHU8nk0XGJtc8X7A2ua3EJZKg1u4SPdX2
 0Jc2etnb43hAo2TU2bhSL1ZDKnP3BXxfNBGozVyquRrYoWn4Hz++GY3WW7gghPDFdniU
 m7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R9h6TBijqwhWtCdWuge0QqjjfhcYOfthGpKadm9tGxU=;
 b=o8WBSUen77TVPyEtM8BVT5SHy2XZ4y3Cuk6d2SnDsqdPU35r0iaS7aK5XtHobXGWp9
 QYF/UBkSMULDb7wEuAQRgfhM1Q0hIDNwbfHZ+wlzK10Tt25Vyjo4vVz16vmgxVxiY078
 L8I3PzxHiMrXAgtQ8Bx8bKujEdetIZXdnTaLUw1SicGihQ8e0VVAib2e6GcGSJjiyxrO
 +iCyLI7GzPyAEloSeQJcHqXdKiCBWxhh7ewbJ40pG3fYvvnDC3oKq3eRYYWqmN5oKO7s
 Xw92fWamf4CqCNz1i0cy4RXRf/Lvbv+xRxaTWg0izXDMT1brSVHPg0G6UMBwuuBLy5Ye
 tavg==
X-Gm-Message-State: AOAM532HRevb8hL3JDFJEIY9c4otrPdCmimjKQx+MDfglhVjrkHI7Ajt
 vIDpc2XDUSageqXIuGdU1Qg=
X-Google-Smtp-Source: ABdhPJytdErKTCE9Dfb5cKXCrSruxfcAtIRvlaMsZNBz3NN+Eo12ujY//8NvCs6N5Z61jtTmgTyVVg==
X-Received: by 2002:adf:f512:: with SMTP id q18mr19634939wro.38.1590946705256; 
 Sun, 31 May 2020 10:38:25 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] hw/pci-host: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:11 +0200
Message-Id: <20200531173814.8734-6-f4bug@amsat.org>
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
 hw/pci-host/i440fx.c    | 3 ++-
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 0adbd77553..aefb416c8f 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
@@ -301,7 +302,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     memory_region_set_enabled(&f->smram_region, true);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&f->smram, OBJECT(d), "smram", 1ull << 32);
+    memory_region_init(&f->smram, OBJECT(d), "smram", 4 * GiB);
     memory_region_set_enabled(&f->smram, true);
     memory_region_init_alias(&f->low_smram, OBJECT(d), "smram-low",
                              f->ram_memory, 0xa0000, 0x20000);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 352aeecfa7..b788f17b2c 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -589,7 +589,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     memory_region_set_enabled(&mch->open_high_smram, false);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&mch->smram, OBJECT(mch), "smram", 1ull << 32);
+    memory_region_init(&mch->smram, OBJECT(mch), "smram", 4 * GiB);
     memory_region_set_enabled(&mch->smram, true);
     memory_region_init_alias(&mch->low_smram, OBJECT(mch), "smram-low",
                              mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index cfb9a78ea6..8ddfb8772a 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -399,8 +400,8 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     pci_map_irq_fn mapfn;
     int i;
 
-    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 1ULL << 32);
-    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 1ULL << 32);
+    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 4 * GiB);
+    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 4 * GiB);
 
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
                              &s->pci_mem_space, &s->pci_io_space,
-- 
2.21.3


