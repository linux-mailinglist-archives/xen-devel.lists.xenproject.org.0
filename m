Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8731EA5DD
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:30:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jflRc-0005Oz-Jf; Mon, 01 Jun 2020 14:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AG4=7O=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jflRb-0005Ot-Kj
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:29:39 +0000
X-Inumbo-ID: 50afece6-a414-11ea-8993-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50afece6-a414-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 14:29:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f185so11593562wmf.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HzSo+FKM+7hllBEEZUwDzngvpJfgcJMgoiFq36o0B8U=;
 b=XTbutdDKkJKkajTBQBfb3gKAZ8HdQTRh7KPk2PRf4BKVCmPN/4PTUsFkxrz9l/MxyE
 WUpRpf229tNzjnPfHSCA8du3tlIB75OS5/RVT9l2X8Pi8CcwsUCX6HO+2vIyYWMLw2tC
 ebQhYTRJklmhotmYL2rx/GdLsCDfCBNHfnduxY4Q5bNFjSm8izV9JBOdMPkxXDwKlw4c
 031Lz9blGnoP7VIxmgxsb+iWzGBmm5T0wI/Tv3aiTxDNGjcUF71CVDuNVRspxPMH9UPA
 3nwu20FxG3BzD2wN0HUsD79p+AZtAAKT3qF+a+MxMkbmLHvKPtyLwMf0vUqt0hTFsvk2
 JbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HzSo+FKM+7hllBEEZUwDzngvpJfgcJMgoiFq36o0B8U=;
 b=I6lssgU33SyusPhn97mHp5QEF+Y8kS64LSyi2vSDrUOMcU6AmjtLh6X6Qr5237ntJB
 ZGUPufjnURc0KJU0bJD7oZGyYv0p+YKZ/aiTqUHNvDh0V/Y6tHTf4DCDP/mYwBNqloky
 Wv0jh/CunPc5Vsi6LZARxULXIxjLKzW/xgl7hQTaolDe93iu5CeQKaSElv8BZHgjTyap
 1ioU0787g5346F1yqx9GC66NqOOaLCLkIJnI780cJymp1Kp1sR53jwzWSor5nTqv3fMk
 axjMWL5lxtsRggNpe3V/7OZSVimXaU4vy6atFcBRGUlUXTOO6LsHGFzSWpgoBqUVAmNi
 jaFA==
X-Gm-Message-State: AOAM531c9WRAFyz/UvAgHxctdI810ie+3pu8B8mFmS04Iy4Jp5X+WyDH
 F+u6KNe1Kg2QguYn099+QRw=
X-Google-Smtp-Source: ABdhPJwBHE8bkJSVSp9Yf35551bkKIwhQ9ZWpujBeFh9r1gwWsJDZxkC3k++/FRQy/FR48XoWkpxlQ==
X-Received: by 2002:a7b:c84b:: with SMTP id c11mr21338870wml.78.1591021774481; 
 Mon, 01 Jun 2020 07:29:34 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw/arm/aspeed: Correct DRAM container region size
Date: Mon,  1 Jun 2020 16:29:23 +0200
Message-Id: <20200601142930.29408-2-f4bug@amsat.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


