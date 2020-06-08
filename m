Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80951F1C99
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKCz-0003em-It; Mon, 08 Jun 2020 16:01:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKCx-0003eU-Ns
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:07 +0000
X-Inumbo-ID: 404037ca-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 404037ca-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
 b=Z6b9xR/6zTQzT8aJLK7HAeUlBDApfrpo4e9rBnTyxltheE/qgHc2cc1v8czIAtMAUDvpNt
 cQLqFn8LtRuTzC8qR1CYMc7vPEIFpJRW65zEgz5m2avS3yswR9QG7LZkdsmTkUAfRaAzM8
 ub5PD25MLbssQokfM8L3IQEpauT4e4o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-TdMg-M7XNCifG-owD_E9lg-1; Mon, 08 Jun 2020 12:00:49 -0400
X-MC-Unique: TdMg-M7XNCifG-owD_E9lg-1
Received: by mail-wr1-f70.google.com with SMTP id p9so7360166wrx.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
 b=FMiXfFipkQ6PtUynE8RdFDM2abwa8Z6J2ZRk/LCulU8Yoqn1MCXQKS0u0k5GS3UKc8
 LnJjEAyLH4FTu2Gu8Z7HnVsCCO+k50e+ukO+E/D1GC1nm7K6HwJwpjddWP91T3nUAIp+
 mUb4aSl+L4CI3UyWMkZWYbfa+TudL44iO6Jd3ru+/+HLojtWoH024VxBhrcXKPTvBzGX
 cyKK0gpaZoK03tw7XIC3a8Rc9PZ7PInnmxjoMIkSc43fsYHuFxP1d2BFj7O0CtdwLhcz
 yL9yaEhGSQiMmiEnogdGI3NcD53diBqLjDXf1lSE5V/ynh2pDDwgeN1BcCnvVIUWtJdz
 s4HA==
X-Gm-Message-State: AOAM532Rud1XM/nTGMhXzOJzBjsxcpoHOhG35pTKsG0iDdzHKbYCG7Zr
 XIXHFA0kmedQ1yLCuHC6y6qsvAlBxbUtG9q00W7araFWwHLMintY6ayPafN+KVcwku9pjAzjVjh
 A5q3fS+puiDGvXPNsVEZdC0elq0U=
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr24291797wrw.91.1591632048381; 
 Mon, 08 Jun 2020 09:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMtorKuHBb+MRvZ6tBeip6kyiiVi39BDg4R5E8m4jpXwbcp5IXslWyCaizAHQ0jAbG9qrLqg==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr24291746wrw.91.1591632048080; 
 Mon, 08 Jun 2020 09:00:48 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o15sm175107wrv.48.2020.06.08.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
Date: Mon,  8 Jun 2020 18:00:09 +0200
Message-Id: <20200608160044.15531-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Based on today's IRC chat, this is a trivial RFC series
to anotate pre-qdev/QOM devices so developers using them
without knowing they are not QOM'ified yet can realize
it and convert them if they have time.

qdev/QOM devices are introspectable, so easier to test
or even fuzz.

Philippe Mathieu-Daudé (35):
  qom/object: Update documentation
  hw/core/qdev: Add qdev_warn_deprecated_function_used() helper
  hw/arm/omap: Emit warning when old code is used
  hw/arm/pxa2xx: Emit warning when old code is used
  hw/arm/nseries: Emit warning when old code is used
  hw/timer/arm_timer: Emit warning when old code is used
  hw/char/parallel: Emit warning when old code is used
  hw/display/blizzard: Emit warning when old code is used
  hw/display/ramfb: Emit warning when old code is used
  hw/display/tc6393xb: Emit warning when old code is used
  hw/display/vga-isa-mm: Emit warning when old code is used
  hw/dma/etraxfs_dma: Emit warning when old code is used
  hw/dma/soc_dma: Emit warning when old code is used
  hw/i386/pc: Emit warning when old code is used
  hw/i386/xen/xen-hvm: Emit warning when old code is used
  hw/input/lasips2: Emit warning when old code is used
  hw/input/pckbd: Emit warning when old code is used
  hw/input/ps2: Emit warning when old code is used
  hw/input/tsc2005: Emit warning when old code is used
  hw/intc/i8259: Emit warning when old code is used
  hw/lm32/lm32_hwsetup: Emit warning when old code is used
  hw/m68k/mcf520x: Emit warning when old code is used
  hw/misc/applesmc: Emit warning when old code is used
  hw/misc/cbus: Emit warning when old code is used
  hw/nvram/eeprom93xx: Emit warning when old code is used
  hw/openrisc/cputimer: Emit warning when old code is used
  hw/ppc/ppc: Emit warning when old code is used
  hw/ppc/ppc4xx: Emit warning when old code is used
  hw/ppc/ppc_booke: Emit warning when old code is used
  hw/ppc/virtex_ml507: Emit warning when old code is used
  hw/sh4: Emit warning when old code is used
  hw/riscv: Emit warning when old code is used
  hw/timer/slavio_timer: Emit warning when old code is used
  hw/usb/hcd-musb: Emit warning when old code is used
  hw/xtensa/xtfpga: Emit warning when old code is used

 configure                    |  8 ++++++++
 hw/lm32/lm32_hwsetup.h       |  3 +++
 include/hw/qdev-deprecated.h | 26 ++++++++++++++++++++++++++
 include/qom/object.h         |  6 +++---
 hw/arm/nseries.c             |  2 ++
 hw/arm/omap1.c               |  6 ++++++
 hw/arm/pxa2xx.c              |  3 +++
 hw/char/omap_uart.c          |  5 +++++
 hw/char/parallel.c           |  3 +++
 hw/char/sh_serial.c          |  3 +++
 hw/core/qdev.c               |  8 ++++++++
 hw/display/blizzard.c        |  3 +++
 hw/display/pxa2xx_lcd.c      |  3 +++
 hw/display/ramfb.c           |  3 +++
 hw/display/tc6393xb.c        |  3 +++
 hw/display/vga-isa-mm.c      |  5 +++++
 hw/display/vga.c             |  3 +++
 hw/dma/etraxfs_dma.c         |  4 +++-
 hw/dma/soc_dma.c             |  3 +++
 hw/i386/pc.c                 |  3 +++
 hw/i386/xen/xen-hvm.c        |  4 +++-
 hw/input/lasips2.c           |  4 +++-
 hw/input/pckbd.c             |  4 +++-
 hw/input/ps2.c               |  6 +++++-
 hw/input/pxa2xx_keypad.c     |  3 +++
 hw/input/tsc2005.c           |  3 +++
 hw/intc/i8259.c              |  3 +++
 hw/intc/sh_intc.c            |  3 +++
 hw/m68k/mcf5206.c            |  5 +++++
 hw/m68k/mcf5208.c            |  3 +++
 hw/misc/applesmc.c           |  3 +++
 hw/misc/cbus.c               |  3 +++
 hw/misc/omap_gpmc.c          |  3 +++
 hw/misc/omap_l4.c            |  3 +++
 hw/misc/omap_sdrc.c          |  3 +++
 hw/nvram/eeprom93xx.c        |  3 +++
 hw/openrisc/cputimer.c       |  3 +++
 hw/ppc/ppc.c                 |  3 +++
 hw/ppc/ppc405_boards.c       |  5 +++++
 hw/ppc/ppc405_uc.c           | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c         |  7 +++++++
 hw/ppc/ppc_booke.c           |  4 +++-
 hw/ppc/virtex_ml507.c        |  4 +++-
 hw/riscv/riscv_htif.c        |  4 ++++
 hw/riscv/sifive_uart.c       |  4 ++++
 hw/sd/omap_mmc.c             |  5 +++++
 hw/sh4/r2d.c                 |  3 +++
 hw/sh4/sh7750.c              |  4 ++++
 hw/ssi/omap_spi.c            |  3 +++
 hw/timer/arm_timer.c         |  3 +++
 hw/timer/omap_synctimer.c    |  4 ++++
 hw/timer/sh_timer.c          |  5 +++++
 hw/timer/slavio_timer.c      |  3 +++
 hw/usb/hcd-musb.c            |  3 +++
 hw/xtensa/xtfpga.c           |  3 +++
 55 files changed, 240 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/qdev-deprecated.h

-- 
2.21.3


