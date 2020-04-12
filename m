Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6AC1A60A2
	for <lists+xen-devel@lfdr.de>; Sun, 12 Apr 2020 23:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNjre-0006iP-30; Sun, 12 Apr 2020 21:10:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pqw0=54=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jNjrc-0006fm-UO
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 21:10:00 +0000
X-Inumbo-ID: f7fc3d0e-7d01-11ea-9e09-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7fc3d0e-7d01-11ea-9e09-bc764e2007e4;
 Sun, 12 Apr 2020 21:10:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f13so8369660wrm.13
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=78jL4VADjrh0P46dW2DeDq44Jyf+SdDfu3arjlW7LnM=;
 b=OxkjuSkWJAFZSnNM8yGetjkdEAeKalwtCudr2Vh2d27xI1BS4ILr7L9uBODjpRJkpH
 R6D8YXX/p+XUqNrFQIAz93kwaViDm5mQpiBuOecCeCVBz4yojSdNqw6Ipl46gFGlzf9r
 g8Cm0L+Z0C4mTbJh2CzJAY1wv+iIGBJ1VnGSQPeoXju8w0uYyAB0pz5E8h0xKz80Mxci
 z074B0Y4PP1p9TvlgPyvgyIT792lXRCe/qHu6rPI5r6pePkQJmyeyZz3JKxyhm2cJYbS
 4YYIUqsp56tehGunUkN7pmQHzZn5tu03tfUy2aBHiRpXOWFa841s50yv6YsU3qC+BikH
 QIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=78jL4VADjrh0P46dW2DeDq44Jyf+SdDfu3arjlW7LnM=;
 b=Ga/4cHxs3+okKoKq8o7zgcJsqb1xlhZSAaTg6aH06B4htNT9ZFuWAjGsnCkX9wgKMZ
 GV0Pz7KyTEsbHdPPVAXl9CKXlKfp+Pd2viqJlxu/3A9HRhIl7H2tLeU+W3NR5jowUjj4
 PBGjOeKbA28/Wtauh1gdO4Z3SrcNMkgeUgUNzCWAQt0t0E3CxGOg1JrAyi21v+OB5CK6
 U+qs6i5aMUgvmiVQo2OQINkPu3O1Ak9hJFoizH0K+jgAEqPpOS2KU2OMO0R40n90uHwS
 lyHZommzsMvbEmgnfXpe5Y75CLRHkGoLHJ4XWVIY8eZF9VesPHgkqYIHP6RrmP12ZeCU
 Bk2Q==
X-Gm-Message-State: AGi0Pub2Ynko8rYK+/R7BhhhyCb52Eo53Mp4hYNrOvh+T3RXETIVz14t
 /jLGZHR6Y6Bj1b+q/TiLhbE=
X-Google-Smtp-Source: APiQypIHokdZHj3hxylpnNFCsDn0s/aQ6M1SC93tjDE0SBCneBZJc3wwsTL0+EuIZJCPMwTTJMFunQ==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr5945448wrv.260.1586725799424; 
 Sun, 12 Apr 2020 14:09:59 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o16sm12553602wrs.44.2020.04.12.14.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:09:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 0/3] various: Remove unnecessary casts
Date: Sun, 12 Apr 2020 23:09:51 +0200
Message-Id: <20200412210954.32313-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
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
2.21.1


