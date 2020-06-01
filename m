Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BE1EA5DE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflRw-0005UD-Pd; Mon, 01 Jun 2020 14:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflRv-0005Tp-KU
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:29:59 +0000
X-Inumbo-ID: 5430da60-a414-11ea-9947-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5430da60-a414-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r15so11562762wmh.5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1c6Ywd2WY7bkeebkfpfDjPJtSo9TSSd8GLZEIuba7M=;
 b=KOMpvQ1h+cZ/GQVz8Qxdx0mis+TlMoxKHuaO2rSRSRaGWhvUFWWUqHiwcfE323UL85
 aFEytOww3L6zSlWIZYTfxs/42vrUDiv9C6o/n7DgZcVeQbTpRmEyDlSCBhRvyEEe/q1E
 KTruiQ5Yb9wpzHMcL/S5jvbB3uNWlV8t7A15KU5YJuRpiEXQ8HrJAra1lGOBEpLrTZ3O
 642Vmt3sR4HbgPjDypLJB8+Ui1R+27mPnBXP523uszOrtFVLjhJkd3kdzmV8PrhICcHq
 x0ChezwGeMAvWpPgfm2AcOw/MfHwRzWWgyDUEAGIrSzdPEIsC91vU304u1JiiHnltmvV
 YGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R1c6Ywd2WY7bkeebkfpfDjPJtSo9TSSd8GLZEIuba7M=;
 b=eceXSelJKc3Ns6ByncE03RFugJERuw285xfaabpympbGfERp7DqegewR/3wqYCYIRS
 01C+m+0xJP/NQvaHac8uFZiVglPLfs+tDEePcm+1FqdvFB8UcQzF7yeBXuDsV0TTd6rE
 wGKKa6S1WKeozlboKfrCDHeutqk5zOBUhxKEWrszA5EO+8Uh443BsF4xrD6kM0oswnTx
 LwGHEXuppeztthwUKFqeMzMTNM7nohQ9i1g8zb+DNP7FhDilIk+4ezitrsJkkqBhvpbH
 4zYEP2J5EbKgw196a2a5E+iXh0zoo6vxtAB4A7vC3T1ini1hFe07QVM+RRtzUiAdObUa
 +qNQ==
X-Gm-Message-State: AOAM530S+CV37jdRWa66FcFT1bEUz4h22bFdif1fgbIaKomv5SQy9KO/
 qUekrdBvk7Jq8qGOtV4Luik=
X-Google-Smtp-Source: ABdhPJwdSMIYLsZyoLFaZUJVXdLPvSbS6G1a5vB2dplcqD0mIzzFuz5/mh32BbsK8QB7xfYYy+wUTQ==
X-Received: by 2002:a1c:7f96:: with SMTP id
 a144mr21650923wmd.176.1591021780425; 
 Mon, 01 Jun 2020 07:29:40 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/pci-host: Use the IEC binary prefix definitions
Date: Mon,  1 Jun 2020 16:29:27 +0200
Message-Id: <20200601142930.29408-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


