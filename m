Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D41C366B
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 12:08:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVY0j-0001sn-OT; Mon, 04 May 2020 10:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3vB=6S=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jVY0h-0001si-MJ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:07:39 +0000
X-Inumbo-ID: 15824f82-8def-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15824f82-8def-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 10:07:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g13so20178529wrb.8
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2020 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ZVZt1eZRouG8SfIcedxiaba1cChmaXwtwdN3BvQWTc=;
 b=HcRGrtw9qZwIdAjOVDw2nBeZQtDcI35wjvWlHOGFRg+YHxIgcEOeEOIUXHFvYJWe1y
 0aEc8lF3QcOuHPeMJ45OuZQ1/+1Dnot2UsK7TlMShn1hmMCU98nR3HqSnBLrZu1ndQJM
 w1kaQH2SKAmFC3AZAy7uhqrr/gwyVu0QHVGrrHfctlxK7lQakRs3aFMLtMqke8iQsdYT
 PLVukoSv+TknjgwBfsv/LgVJCO02T7xkFe7qLDeEyKZT9f5P4xcYNT0INYTTlZ5cGDXi
 WsE3CbUxGOSfFLN2WtsdFFKoJ5fyjZFpRUSS1D0HqN6DiszZ4ePD73Tu2IZ8D9II0tF4
 AY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/ZVZt1eZRouG8SfIcedxiaba1cChmaXwtwdN3BvQWTc=;
 b=Wjwmp0yjNXlK5TgKvH/Stw5V8I9pl8wyxIyiDyWbNBiE4kK2l0xj8Pcl8Vw7zptarx
 FDeoe6ucPnB9m93axlJRTJpScBz+Tqo7WYH/5Jmrfyhkc/MTcJ4gek8pgkTfcm4YxqIV
 WOxVOflL82kkpreBTOv9ksGiWRndgU3ZkYWi/8SfwQAW9xyuseeta/RZgQDFyqBdJ/6P
 4xZuldZgMBc1Lyk3mm+0YOwAunt9s3WRcV0bi6aJ7QZPofXkvSRPs1CSKJ3ria2GN24x
 cVxozPVhBVTsPGdPNxhZN8UONvcoaec4P/HtcEhO/7MikhdDZTUQQGLZngIo5CB5iZi/
 lRTQ==
X-Gm-Message-State: AGi0PuarReB8iKtA4IesTP2v01PmDvF8695nHIEev2DzbVMDRSJZD9c8
 rqOxWz6wcXgkYuqwF+Tyn6o=
X-Google-Smtp-Source: APiQypI4CLhwM1s9qsXBHl1cozRkicm4SNedwT3p1NV3wnHda5P0CMNLiBvDg4MvOP8bkIL5h8q9ag==
X-Received: by 2002:adf:a74b:: with SMTP id e11mr16878108wrd.99.1588586858230; 
 Mon, 04 May 2020 03:07:38 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id k9sm18517778wrd.17.2020.05.04.03.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 03:07:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] various: Remove unnecessary casts
Date: Mon,  4 May 2020 12:07:32 +0200
Message-Id: <20200504100735.10269-1-f4bug@amsat.org>
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
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
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

Since v2:
- Add A-b/R-b tags
- Reword description (Markus)

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


