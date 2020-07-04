Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F1214689
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUF-0003EX-PH; Sat, 04 Jul 2020 14:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUD-0003ES-Sv
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:49:50 +0000
X-Inumbo-ID: 9b9576f8-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b9576f8-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:49:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id j18so34714752wmi.3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Sd8UrNpAT6Q827DPYJ71GYz3qN5ijhu3T6adNwNx58=;
 b=VfCW80igCu05TRu6Kp/hRp0wwLcO25D00t+NwoIV0c8ix6mcQko2qSVKfN1H7cmL4H
 Vxhy0na0A3ZdoSWK98SpIoSITxwO50uXAKNvBj0H9USSoEJkOYekcVtX7qA8oey7Zq0C
 1gT9pIxDTb1SouD3jSFCjmRxh176pRqgb9NK+POT5ThziR0p2IFJM7o0Quc2x81CpA+g
 ifW/7fKRhTgTGZolZ71YooHseLeyWaonfI/a9QW1+3iYMgESDtL3KwrJ6MbXAJJc5tVN
 WBh2g+7GmdCH0HZbUKAJrDSTZ0YLZDtsbFuAgkRinU6RkXxKmgHpBNku6nt5HiABtxt8
 vQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8Sd8UrNpAT6Q827DPYJ71GYz3qN5ijhu3T6adNwNx58=;
 b=jMYCbb/2GYBb9LldY+odyXedBq6fxYycZVlpcGWrBwR5UUdaodGin/YuGv4qOt5ZgF
 eLwfC9z6t47dInGO8fYyaH0iGVGGc+RLKmFY7CtMR7gUb0GfJUCUazZNV+dtjYEgysGI
 h/IqyX2bRkrymU72AWpq4QvcqqsRwmYMwWKtnK7jEKRewEVW4iO6dl/3NCiF7BZpZ8DC
 ilKmX54ZLTPBCNMbhRbBzAi/MT7JzdqubAz5C7MYWeaM2OEgs5yX0iEWwFWrrtxl4pxz
 nknL6KWiBJAiJ206YBHUBW6UbrjDRuuzCAzsBAxawjUpudmjUe0sGsArP3ubcRQbg2VA
 5+sg==
X-Gm-Message-State: AOAM533YB1EAL02KTI8iidA5w8z/OcU091uSjOEdVTtzljmVGRjqvp3K
 9qsHAL2uSsVjesURiodUEuQ=
X-Google-Smtp-Source: ABdhPJyVXTn8bDCpfeNaz82C2B4sWvaeuwMMI0440OjK/Jj8KTAg5BtYB+Q0yPcpdr0q523zbyeuCw==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr27108566wmo.62.1593874187874; 
 Sat, 04 Jul 2020 07:49:47 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 00/26] hw/usb: Give it love,
 reduce 'hw/usb.h' inclusion out of hw/usb/
Date: Sat,  4 Jul 2020 16:49:17 +0200
Message-Id: <20200704144943.18292-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

This is the second time I try to replace a magic typename string
by a constant, and Zoltan warns me this is counter productive as
"hw/usb.h" pulls in an insane amount of code.

Time to give the usb subsystem some love and move forward.

This series can be decomposed as follow:

 1-2:    preliminary machine cleanups (arm/ppc)
 3-13:   usb related headers cleanups
 14-15:  usb quirks cleanup
 16-18:  refactor usb_get_dev_path() to add usb_get_port_path()
 19:     let spapr use usb_get_port_path() to make USBDevice opaque
 20:     extract the public USB API (for machine/board/soc)
 21:     make the older "usb.h" internal to hw/usb/
 22-25:  use TYPENAME definitions
 26:     cover dwc2 in MAINTAINERS

Please review.

Phil.

Philippe Mathieu-Daudé (26):
  hw/arm/sbsa-ref: Remove unused 'hw/usb.h' header
  hw/ppc/sam460ex: Add missing 'hw/pci/pci.h' header
  hw/usb: Remove unused VM_USB_HUB_SIZE definition
  hw/usb: Reduce 'exec/memory.h' inclusion
  hw/usb/desc: Add missing header
  hw/usb/hcd-dwc2: Remove unnecessary includes
  hw/usb/hcd-dwc2: Restrict some headers to source
  hw/usb/hcd-dwc2: Restrict 'dwc2-regs.h' scope
  hw/usb/hcd-ehci: Remove unnecessary include
  hw/usb/hcd-ehci: Move few definitions from header to source
  hw/usb/hcd-xhci: Add missing header
  hw/usb/hcd-musb: Restrict header scope
  hw/usb/desc: Reduce some declarations scope
  hw/usb/quirks: Rename included source with '.inc.c' suffix
  hw/usb: Add new 'usb-quirks.h' local header
  hw/usb/bus: Simplify usb_get_dev_path()
  hw/usb/bus: Rename usb_get_dev_path() as usb_get_full_dev_path()
  hw/usb/bus: Add usb_get_port_path()
  hw/ppc/spapr: Use usb_get_port_path()
  hw/usb: Introduce "hw/usb/usb.h" public API
  hw/usb: Move internal API to local 'usb-internal.h' header
  hw/usb/usb-hcd: Use OHCI type definitions
  hw/usb/usb-hcd: Use EHCI type definitions
  hw/usb/usb-hcd: Use UHCI type definitions
  hw/usb/usb-hcd: Use XHCI type definitions
  MAINTAINERS: Cover dwc-hsotg (dwc2) USB host controller emulation

 hw/usb/desc.h                             | 11 +++++
 {include/hw => hw}/usb/dwc2-regs.h        |  0
 hw/usb/hcd-dwc2.h                         |  5 +-
 hw/usb/hcd-ehci.h                         | 24 +---------
 {include/hw => hw}/usb/hcd-musb.h         |  2 +
 hw/usb/hcd-ohci.h                         |  4 +-
 hw/usb/hcd-xhci.h                         |  4 +-
 include/hw/usb.h => hw/usb/usb-internal.h | 50 ++-----------------
 hw/usb/usb-quirks.h                       | 27 +++++++++++
 include/hw/usb/chipidea.h                 |  2 +-
 include/hw/usb/usb-hcd.h                  | 36 ++++++++++++++
 include/hw/usb/usb.h                      | 58 +++++++++++++++++++++++
 chardev/baum.c                            |  2 +-
 hw/arm/allwinner-a10.c                    |  2 +-
 hw/arm/allwinner-h3.c                     | 10 ++--
 hw/arm/exynos4210.c                       |  2 +-
 hw/arm/pxa2xx.c                           |  3 +-
 hw/arm/realview.c                         |  3 +-
 hw/arm/sbsa-ref.c                         |  4 +-
 hw/arm/versatilepb.c                      |  3 +-
 hw/arm/xilinx_zynq.c                      |  2 +-
 hw/display/sm501.c                        |  3 +-
 hw/i386/pc.c                              |  2 +-
 hw/i386/pc_piix.c                         |  5 +-
 hw/i386/pc_q35.c                          | 15 +++---
 hw/isa/piix4.c                            |  3 +-
 hw/mips/fuloong2e.c                       |  5 +-
 hw/ppc/mac_newworld.c                     |  5 +-
 hw/ppc/mac_oldworld.c                     |  3 +-
 hw/ppc/sam460ex.c                         |  6 ++-
 hw/ppc/spapr.c                            | 13 +++--
 hw/sh4/r2d.c                              |  2 +-
 hw/usb/bus.c                              | 40 +++++++++-------
 hw/usb/chipidea.c                         |  1 +
 hw/usb/combined-packet.c                  |  2 +-
 hw/usb/core.c                             |  2 +-
 hw/usb/desc-msos.c                        |  2 +-
 hw/usb/desc.c                             |  3 +-
 hw/usb/dev-audio.c                        |  2 +-
 hw/usb/dev-hid.c                          |  2 +-
 hw/usb/dev-hub.c                          |  2 +-
 hw/usb/dev-mtp.c                          |  2 +-
 hw/usb/dev-network.c                      |  2 +-
 hw/usb/dev-serial.c                       |  2 +-
 hw/usb/dev-smartcard-reader.c             |  2 +-
 hw/usb/dev-storage.c                      |  2 +-
 hw/usb/dev-uas.c                          |  2 +-
 hw/usb/dev-wacom.c                        |  2 +-
 hw/usb/hcd-dwc2.c                         |  8 ++--
 hw/usb/hcd-ehci-sysbus.c                  |  1 +
 hw/usb/hcd-ehci.c                         | 13 ++++-
 hw/usb/hcd-musb.c                         |  4 +-
 hw/usb/hcd-ohci-pci.c                     |  4 +-
 hw/usb/hcd-ohci.c                         |  1 -
 hw/usb/hcd-uhci.c                         | 21 ++++----
 hw/usb/hcd-xhci-nec.c                     |  3 +-
 hw/usb/hcd-xhci.c                         |  2 +-
 hw/usb/host-libusb.c                      |  2 +-
 hw/usb/host-stub.c                        |  2 +-
 hw/usb/libhw.c                            |  2 +-
 hw/usb/quirks.c                           |  5 +-
 hw/usb/{quirks.h => quirks.inc.c}         |  5 --
 hw/usb/redirect.c                         |  3 +-
 hw/usb/tusb6010.c                         |  4 +-
 hw/usb/xen-usb.c                          |  2 +-
 monitor/misc.c                            |  2 +-
 softmmu/vl.c                              |  2 +-
 MAINTAINERS                               |  7 ++-
 68 files changed, 294 insertions(+), 185 deletions(-)
 rename {include/hw => hw}/usb/dwc2-regs.h (100%)
 rename {include/hw => hw}/usb/hcd-musb.h (98%)
 rename include/hw/usb.h => hw/usb/usb-internal.h (92%)
 create mode 100644 hw/usb/usb-quirks.h
 create mode 100644 include/hw/usb/usb-hcd.h
 create mode 100644 include/hw/usb/usb.h
 rename hw/usb/{quirks.h => quirks.inc.c} (99%)

-- 
2.21.3


