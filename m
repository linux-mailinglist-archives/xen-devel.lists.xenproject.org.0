Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80A11CED72
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 09:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYOtw-0004OV-8G; Tue, 12 May 2020 07:00:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB0z=62=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jYOtu-0004OQ-KT
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 07:00:26 +0000
X-Inumbo-ID: 412bb198-941e-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 412bb198-941e-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 07:00:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m24so10868744wml.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v6fg/mU4Bk/0q03fr2d5YzMbkGZ67G/czubLvjRut6E=;
 b=GgXgmFz8IY+pa9ocN2/XvYf1Z5J3CRDjyV+8xqeFnikvU5jCbQLf+YGXawi1zXF1wK
 nEp/GbVlzP17pUvUFZkuS9f2GXLimVNCaQnAurujidToXag6PvgDmn4tpcRFsH7reZQC
 MoAWgBH6I6b5/OgmqJ3AEr4tBCEoxIuIHZKm9nLR6k5jqXT5QzsgTNJsm0Y8zTWC17ed
 +8+skZr4g0xTxz1dfSh5eKksAqonVo7b7KGs47GDQFSxdg06PQdaimERZEF9qH0cDLZp
 rciTN8f2otxSJeW3UBVU7QboWmu2WO1IudLXV7wEwGqOsGivDgP9LXihMZbbmnP7e08A
 ViAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v6fg/mU4Bk/0q03fr2d5YzMbkGZ67G/czubLvjRut6E=;
 b=rHfYkLo/i5cPot0MjYFyI/qZ9bTQVsJzJFw8meoD9o50RjcxyELZ0npKb6/Sj80l21
 CznAeDp3G4MO8dnG4L/O2XLzmIt4nHnUucP5xvKjxfjm/6CbHRzMFOiSAO1t9b9T82hm
 DLQIeTmgHwUhrXf+Rf7TZk67SWhAfBRVj6D6hWL5MOi8UbH8+UmIgdTp5zutj3qt369m
 kd5tfcOSXjMW5zcp3kzkTWnu3aH76qSOuCRPykn/BmSdtiBOrmI70+0YiP216TAdFBq3
 cZ44lnGYgxyF2Hqglnm/3dGsL05fJbXK3hBcuhP2Thlfx4w+5P4GVPfDsbRQ0r1iHNCs
 jftw==
X-Gm-Message-State: AGi0Pua2m6yeDPLP+32fXgRHdkE44zwdCMTDzuk4NEPbW7jrSec4Rb+R
 DpGeeUmZrar8o/hSTZ/mDfo=
X-Google-Smtp-Source: APiQypIT2HPCX3fabSDeTGNUfM5dRg5+16ERzkptJxDXeBDyVSY92wAyQPNH6JP5vKrTXy89Xka+RA==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr13129954wme.2.1589266824836; 
 Tue, 12 May 2020 00:00:24 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id i17sm30322243wml.23.2020.05.12.00.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:00:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] various: Remove unnecessary casts
Date: Tue, 12 May 2020 09:00:17 +0200
Message-Id: <20200512070020.22782-1-f4bug@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove unnecessary casts using coccinelle scripts.

The CPU()/OBJECT() patches don't introduce logical change,
The DEVICE() one removes various OBJECT_CHECK() calls.

Since v3:
- Fixed patch #2 description (Markus)
- Add A-b/R-b tags

Since v2:
- Reword description (Markus)
- Add A-b/R-b tags

Philippe Mathieu-Daudé (3):
  target: Remove unnecessary CPU() cast
  various: Remove unnecessary OBJECT() cast
  hw: Remove unnecessary DEVICE() cast

 hw/core/bus.c                       | 2 +-
 hw/display/artist.c                 | 2 +-
 hw/display/cg3.c                    | 2 +-
 hw/display/sm501.c                  | 2 +-
 hw/display/tcx.c                    | 4 ++--
 hw/display/vga-isa.c                | 2 +-
 hw/i2c/imx_i2c.c                    | 2 +-
 hw/i2c/mpc_i2c.c                    | 2 +-
 hw/ide/ahci-allwinner.c             | 2 +-
 hw/ide/piix.c                       | 2 +-
 hw/ipmi/smbus_ipmi.c                | 2 +-
 hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
 hw/misc/macio/pmu.c                 | 2 +-
 hw/net/ftgmac100.c                  | 3 +--
 hw/net/imx_fec.c                    | 2 +-
 hw/nubus/nubus-device.c             | 2 +-
 hw/pci-host/bonito.c                | 2 +-
 hw/ppc/spapr.c                      | 2 +-
 hw/s390x/sclp.c                     | 2 +-
 hw/sh4/sh_pci.c                     | 2 +-
 hw/xen/xen-legacy-backend.c         | 2 +-
 monitor/misc.c                      | 3 +--
 qom/object.c                        | 4 ++--
 target/ppc/mmu_helper.c             | 2 +-
 24 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.21.3


