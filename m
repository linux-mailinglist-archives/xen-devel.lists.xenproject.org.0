Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6411EA5E0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflRn-0005Qe-8g; Mon, 01 Jun 2020 14:29:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflRl-0005QA-Kb
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:29:49 +0000
X-Inumbo-ID: 5270d9b4-a414-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5270d9b4-a414-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d128so11621927wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxI9GbbijxDixix+zf0tcfiMCEcCufTLAytrxKWhnaw=;
 b=McijkDfUDfkGD5lMdNQ+M+R1KyklnbVnSE2xHGQXgc1FoZJoCchot8LzXFDjcv6KOM
 NfDZQCYHBzFyP55Su7iZS69grQCQSVbwDOPJ+fB1HbziyodXwYIRjrKQJxgmPT4ArVpq
 rm9Pu0LT63ray48uF1rziqp7IZcfFUNMkYG9A+LsNcigRtirUvuwvV444Ky81hpelupC
 +5N9EyRxBaOoygPIaPo+byEWNWCAKP5TJYnc3C0AUoXQLnUV2+IO/kOm471D5FNX4dGS
 PXeofGbkbTz3KyYJzwzy8JhQSJZBOmbcV67oJceaEhbsL8Eabp6qKyVKz5B+XRC8hlPA
 RKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mxI9GbbijxDixix+zf0tcfiMCEcCufTLAytrxKWhnaw=;
 b=ln2kB1BybxCf73EUlvDIgqcsP5a+sQJy8PF8FBXQ7ePpMOulOxpkgiEvZpY4y1Epmk
 IU6qxcXFV6b8OGAmNcz5wbpU+XpciqtZYiZOyYNEHIkkr/+/9yFWlX+vOgYJtdL1FO8T
 H0Qca5aSxjbLFd7KpkcNlypS5qjv8+QHZo8o3I5xJwbeeQHmssSWP/XAvr7LgXqPVe7e
 le3OCcMLKcjpo6MkrUTXEojJ08DQVQjZ6RHSLmm25n0qqGMsynhtqCHzNSwNHpa6q63H
 9WSLHPiPnJ6hWMyic4K7azHgKTpZQC2J9AqrKQ1dWsb4udEop8mTciliNxIK6QH4Kihc
 EMrQ==
X-Gm-Message-State: AOAM533jVFIMpTsrkc+DpKpz8YAhSHeoO8iBMFdYTlFKn3rZLoVnRG4o
 G/o1Iy117lAx9jVRcB/2pr4=
X-Google-Smtp-Source: ABdhPJy45MyMB35sU56T7YLu7WldCE4HuCq6HN3F6gvzbGobgbl/tu9cwCNmdjlgEG1zdLyU9Mx++g==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr20855219wmj.2.1591021777436;
 Mon, 01 Jun 2020 07:29:37 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/pci/pci_bridge: Correct pci_bridge_io memory region
 size
Date: Mon,  1 Jun 2020 16:29:25 +0200
Message-Id: <20200601142930.29408-4-f4bug@amsat.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


