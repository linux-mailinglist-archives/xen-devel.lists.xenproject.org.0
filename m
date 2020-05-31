Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236841E9984
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRus-0003YV-RT; Sun, 31 May 2020 17:38:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRus-0003YP-A0
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:34 +0000
X-Inumbo-ID: 8635776e-a365-11ea-8993-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8635776e-a365-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 17:38:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c71so8569812wmd.5
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KsQ1BQRlJKLRUJr0jZUSVevT0fbQ9tRG4Kdv5xJn5Tg=;
 b=OvvgLC/+ddLEdgOqG9BGzOSTBcy0qN+18q9JC4/GfG3Fv91qKjhOlaWmQsPxLKfIYF
 mfaemWp0HiASJbUQUtd6QuGfRI62byfE90yIS3vCqYnsVS75yNstLw/2gw3sfw3FYXEW
 dBxgPuXkmZioeuXxlU6fZo2HcwQ/Gs8sqkvr9BuK4zsXEaFMMySi/8Cu6OqTnjoSf/SC
 sAkQG0K6/+6kfk7BDu6pdCiZg999VMnGuU5pmOk+21AWQNPNvyp6a5rTtQ9EXGp+4LkB
 kchQAzw2OdcC4MBliuOIAPwp+otTA1rZeh4VWsDHXsUsgu/jx/jTiApCJFkIF93rtgw6
 xZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KsQ1BQRlJKLRUJr0jZUSVevT0fbQ9tRG4Kdv5xJn5Tg=;
 b=ID98wBgqAel/uZvvHdPbr0lZ1xfCYxMYygBTrkqmvGHOvCUVunbjQlBILZthTrBdUR
 lGhs/hxhQyh9zzd020fSUiNxjlQ8PZAY00npbscdNpvdDOzCKzq7+9j/LpTgSHCbgSj3
 fTa1H2QXeT589xKsdHjaJ5zYJr+E+L5zBEMpI80gziAdDBi8EJ8u7r1OftimdF1YgXpU
 Z05+RlUWxdSm2wff1CTWHHDUjsc50sBAtQpqWYXDhvBfyyTUfnhWLc2Z+5gBL6nRUxKi
 r99La1ZCD8yERjK3wrI0z6dr4Ja7MijbEHdQwqK3+RF/RUl7o12DfYW6T3U9JCO1vjIE
 +s+w==
X-Gm-Message-State: AOAM5310REyGEDqhqoVevWOSRKA65/FuuuYx39UV1wjuVVGeKN5Kjcyw
 L3SGDZmJA8dMUpXnV55i5FM=
X-Google-Smtp-Source: ABdhPJzeybcJCTXmZjvw+0M7Jmw3AwmGdkeKINOR50NTyuWnxoCKp8N0SHbRKuVp2dnjlfQ5FAFP8A==
X-Received: by 2002:a1c:808d:: with SMTP id b135mr17521127wmd.94.1590946702340; 
 Sun, 31 May 2020 10:38:22 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] hw/pci/pci_bridge: Correct pci_bridge_io memory region
 size
Date: Sun, 31 May 2020 19:38:09 +0200
Message-Id: <20200531173814.8734-4-f4bug@amsat.org>
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

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value. This is not a problem
for the 32-bit maximum, 4 GiB.
By using the UINT32_MAX value, the pci_bridge_io MemoryRegion
ends up missing 1 byte:

  (qemu) info mtree
  memory-region: pci_bridge_io
    0000000000000000-00000000fffffffe (prio 0, i/o): pci_bridge_io
      0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
      0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
      00000000000001ce-00000000000001d1 (prio 0, i/o): vbe
      0000000000000378-000000000000037f (prio 0, i/o): parallel
      00000000000003b4-00000000000003b5 (prio 0, i/o): vga
      ...

Fix by using the correct value. We now have:

  memory-region: pci_bridge_io
    0000000000000000-00000000ffffffff (prio 0, i/o): pci_bridge_io
      0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
      0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
      ...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci_bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 97967d12eb..3ba3203f72 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -30,6 +30,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
 #include "qemu/module.h"
@@ -381,7 +382,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     memory_region_init(&br->address_space_mem, OBJECT(br), "pci_bridge_pci", UINT64_MAX);
     sec_bus->address_space_io = &br->address_space_io;
     memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
-                       UINT32_MAX);
+                       4 * GiB);
     br->windows = pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
-- 
2.21.3


