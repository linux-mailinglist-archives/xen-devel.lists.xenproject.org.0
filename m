Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD51E9983
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 19:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfRuj-0003XV-B7; Sun, 31 May 2020 17:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yblG=7N=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jfRui-0003XP-94
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 17:38:24 +0000
X-Inumbo-ID: 84661984-a365-11ea-9947-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84661984-a365-11ea-9947-bc764e2007e4;
 Sun, 31 May 2020 17:38:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c71so8569741wmd.5
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Mxl/dNTcRwhkGe3G4jYrG/McOP5BFcH0HXoztP9CuE=;
 b=KN9foiNw1uNODlYLGsqkaiPFpDICcY39hhwQ0vwdyo0AGdI9BbCHCSkh+p4J9h4Laq
 DuJIwu3OpLHu4sHXUICkVbKQmAQmO+D8yyfjCtpGxkzofi4Igvfw3BC01Z7/GOK9kSfa
 /CHzYk/dCYbs+astQL+vk6kJZJNm3vCHZDeZsshhM7YKE/GswD1u2po1Hu0sHnTWODaV
 aw+XELKTPKtS86NcCcXXbY9Yd54eTLdGu3rk0hKXJbOXEaV87ip22Lyy/G35mPcBAnhe
 e4EhgrNgwMPPUSeRGMOLlO+3sZx1yyfRCuxcn0pMT9nWhIm8j0WbNSdQCQD9WVWhr+7/
 mH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9Mxl/dNTcRwhkGe3G4jYrG/McOP5BFcH0HXoztP9CuE=;
 b=Mh3P2JS3VWo5iJdSRP5rpNlL21krJpnsywv/7teAinhCL90CrLT8NOQocFX+xLSo/h
 h3UrX4ZxAhhABz5NE3LKMEWIcjSNmhdKClstiUoL9yRnCcOMDZ9O7rJxPOrofmvOq3sh
 unAH1HqZzA7J3KS8DGzLL0K4+Z7FaOAJKTiKw0XmzGBCUkWqs9KcBFpUo4UEVvOoYNQa
 T3Faw1vuYV4falsCjiOy74f02zoflax0n5SYuBE1JNdRQZH1j4HOdPgbyvzWBQWpUUxS
 iaauu3ijxktzsH3+jvJntM53Q4O+Vhqjy727NQibk/uUubn1P794xWP5RFjW2Ix2Q+Rb
 Hzlg==
X-Gm-Message-State: AOAM5303eV3dL/meg9uaktz81YtIWSKwiRWn3tFhxSAI4RnOzh8AOheH
 XaQ2+4W3+AJTaH6sAIaq5Ug=
X-Google-Smtp-Source: ABdhPJzXMrBZtqieig0y6kV4ABn1VIpJ1TZsTStlJMWpP9ZXmgSjXn+WbGAkxI3zyZ0yWA3NhOCtng==
X-Received: by 2002:a1c:5606:: with SMTP id k6mr19052387wmb.10.1590946699366; 
 Sun, 31 May 2020 10:38:19 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] hw/arm/aspeed: Correct DRAM container region size
Date: Sun, 31 May 2020 19:38:07 +0200
Message-Id: <20200531173814.8734-2-f4bug@amsat.org>
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
By using the UINT32_MAX value, the aspeed-ram-container
MemoryRegion ends up missing 1 byte:

 $ qemu-system-arm -M ast2600-evb -S -monitor stdio
 (qemu) info mtree

  address-space: aspeed.fmc-ast2600-dma-dram
    0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000bfffffff (prio 0, ram): ram
      00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram

Fix by using the correct value. We now have:

  address-space: aspeed.fmc-ast2600-dma-dram
    0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000bfffffff (prio 0, ram): ram
      00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2c23297edf..62344ac6a3 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -262,7 +262,7 @@ static void aspeed_machine_init(MachineState *machine)
     bmc = g_new0(AspeedBoardState, 1);
 
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
-                       UINT32_MAX);
+                       4 * GiB);
     memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
 
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
-- 
2.21.3


