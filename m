Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F41E9982
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRuo-0003Xu-JG; Sun, 31 May 2020 17:38:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRun-0003Xp-9M
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:29 +0000
X-Inumbo-ID: 85503244-a365-11ea-8993-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85503244-a365-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 17:38:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l10so9153100wrr.10
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z6MXV/mZkWfnz890Yo+s0rvg8AHT39PfBFvpsFHjWdc=;
 b=QYvY3gXUnPTn17LDoEHOKbq6Mu4mCC5ZirXYyRfQqjW5yMjkLaLcPgaNmCokzrSMk1
 iS14BZGt5nbepXJHY+8YKtfXPZXZoNrZ+xgr27SkIjDH7+NfBvh7a00/wX4juM+cvnwK
 kJvp8SHZ9O1Fw+foevpkIx2zJ5dHganq6zkOmnCCVuUfWTlmW+u0u0wAD+jVqP2ieGrl
 iT20yzOXUuxrY/CD15YcZTH3BtjOGqMctoePxbz/lG6hLw9EA8Dkfw7WaiJU7nfxWIpo
 pcD/IKA8vgRB1+wufffNFi3pgiHvatdIAE+NJgbDW7auOUENhXlhJYpgVbftvrr2aaPq
 uw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z6MXV/mZkWfnz890Yo+s0rvg8AHT39PfBFvpsFHjWdc=;
 b=PrBmLFsWRjv/R7/rDPQA/9Vsx26MAeMfHU1beU7QYbwKpBdV8AG3YXX/dRVGOb6tFu
 g7Krm0pb3roAjRPftReMah8/7X/Zct308exG9/7FowSouN/s39XCiPFceyEdkaLYMFP7
 /MYGVZ+nDmX2koZcASeZmxEQ06rbBRlooLECAm1ZyHDCqVouxoWRtFMqIhiT357Gnyzj
 GDshLHazbxTsdZehdXgLjYHx1q/2fEYSPl3FntitWoihntUk7LSEPovea7iWEnFqhgSh
 J8V1p4sYFDVVPSyDBfRZ7ekEdFsgGl62RbOchWJoZHJl1dlB329eMpmW5MNmcsCGSMz9
 nxmQ==
X-Gm-Message-State: AOAM530ufPxts58hCr/SzEx3RgO8DUr0TQkj4LsShPhmBRNO/lsAIbZF
 ulgvQ7lX4jfRH8Jjuis+PcU=
X-Google-Smtp-Source: ABdhPJxmf1AHg9yOHBeUWTlVu63d2WHNpQGKdZws+bxSgk4Mw6bA+b97Z+h44ot+Y4hgdoKMFKkyYw==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr4028148wrv.287.1590946700911; 
 Sun, 31 May 2020 10:38:20 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] hw/pci-host/prep: Correct RAVEN bus bridge memory region
 size
Date: Sun, 31 May 2020 19:38:08 +0200
Message-Id: <20200531173814.8734-3-f4bug@amsat.org>
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


