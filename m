Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FD1EA5DA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflRi-0005Pg-0J; Mon, 01 Jun 2020 14:29:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflRg-0005PZ-Ks
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:29:44 +0000
X-Inumbo-ID: 51863440-a414-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51863440-a414-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r9so10881094wmh.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBrOLTqq31ej2e44mSMA9447regWRi/096me+XUNWFc=;
 b=aYp6jMcbZt1EvSCtzGVSDvw0LjOVZN9U9J6IPOWER7nZTfo2AJX9+2u9BbzugNhsHn
 Y37qYszwgtSp5Vi9meiZMPRCBrru/b392x/XySILcHH864UsCPa7D4edh2DtjgMpgeQF
 KB7IfsR9l+RvEZ41vlpb8yOXOfnby9TjY8pU9epCl8a2EIRP3GOpubRy0xq+tjioH92Q
 ZdZKA/fD+8ONkO9XePvj6FRtCYXyfnGwh41bJX2ZwRt55t3Wk2i7NgF8TKRcQ/D5WHp8
 c0MPNHyco0u+zIe2mvXsvW8NO9B/YVxgKM1DhZ0+Xu714KN+vQ5Tl3CCM4/snBRMzpJh
 MyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vBrOLTqq31ej2e44mSMA9447regWRi/096me+XUNWFc=;
 b=QbaUt0u3c2+4FILIcsGY/b2eG3r3el9ObxRGcPO5wIytG3xKTYuXQBX0CGMSnr1sY8
 Xx0byOmb2K38DGINqF6iwxHhKo6F9rXo78xzI/38IBsy6IjisiWaHXFXLQzffzEMC6fB
 XK0vyDrni/U5WEKOqYAvkEDiLPwzNcMta3DB9ag5l9+7TEAiOAlZPHojQunekx4dmgcm
 Flj38FyGr+BegAB1kDpIhcbfDzGK7c0cKGkEGeryVTVLV/XYjDVHzdi6nMIRrdy2q628
 sBx4438ZvH/pFp5wbhmNJnnfO/iga91ZgZiZtBiXkXPwu6FEdbUnmuStE8vOyRLu2lY2
 DqWQ==
X-Gm-Message-State: AOAM533pUyQFaWwTlTGl8kT4WRus/0jehGKpxaEVkkhkN/bSU7bJHzIE
 P2M7nS38/bYXnajocOupFIE=
X-Google-Smtp-Source: ABdhPJzOxS6SdO4MzNSLT95XruS6WV6AMszcyX4HNvgqW82fuRu7xSM8biS+Gv+YwkDeI9wFb3oYMQ==
X-Received: by 2002:a1c:814c:: with SMTP id c73mr21234151wmd.140.1591021775955; 
 Mon, 01 Jun 2020 07:29:35 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/pci-host/prep: Correct RAVEN bus bridge memory
 region size
Date: Mon,  1 Jun 2020 16:29:24 +0200
Message-Id: <20200601142930.29408-3-f4bug@amsat.org>
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
By using the UINT32_MAX value, the bm-raven MemoryRegion
ends up missing 1 byte:

  $ qemu-system-ppc -M prep -S -monitor stdio -usb
  memory-region: bm-raven
    0000000000000000-00000000fffffffe (prio 0, i/o): bm-raven
      0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
      0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff

Fix by using the correct value. We now have:

  memory-region: bm-raven
    0000000000000000-00000000ffffffff (prio 0, i/o): bm-raven
      0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
      0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/prep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 1a02e9a670..88e2fc66a9 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -294,7 +294,7 @@ static void raven_pcihost_initfn(Object *obj)
                              &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
 
     /* Bus master address space */
-    memory_region_init(&s->bm, obj, "bm-raven", UINT32_MAX);
+    memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
     memory_region_init_alias(&s->bm_pci_memory_alias, obj, "bm-pci-memory",
                              &s->pci_memory, 0,
                              memory_region_size(&s->pci_memory));
-- 
2.21.3


