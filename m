Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01071913D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 05:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542204.845794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4YqL-0002a2-8O; Thu, 01 Jun 2023 03:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542204.845794; Thu, 01 Jun 2023 03:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4YqL-0002Wy-5R; Thu, 01 Jun 2023 03:19:17 +0000
Received: by outflank-mailman (input) for mailman id 542204;
 Thu, 01 Jun 2023 03:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+w1M=BV=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q4YqJ-0002Ws-V6
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 03:19:16 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14caff70-002b-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 05:19:13 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-53487355877so151114a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 20:19:13 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001a245b49731sm2146753plb.128.2023.05.31.20.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 20:19:11 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 14caff70-002b-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685589552; x=1688181552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrfFhcpCDB+Tgl6xUiFVZLlSppgb/hsoX/FxVOIbZUk=;
        b=z1bUqRtFniqO+bDSlNVkZdAPV7g6hOQkUnZEIvrkOpa1HB1WNNSeN+5GTor/T6EdBn
         9rZ1e3RoJk8fMmy0+yMVpIgUAJZC3kR34QzL4JKGdEQQw+wZgt/ELbpHmVqTt+ZreuIu
         +nP5HB9cjZCnC7Cvfx9CdY8c7kEdx7r0R0fVVhuLS2Wl50qjZqIfWWlbubifFz9rqisq
         qcxXFv9ln2tNzelTaAIHYnEoyHXwi4+5m8yk8EMC/8YQ+Q8GeAyqjLYt4NQMb4h0N97f
         hoF95xvRgTZpKgNF4BGKaeuQDDq5lxnX8MCA6TPZHsURpnSVbvHzPJzKgiDxCd8Rg29I
         huRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685589552; x=1688181552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrfFhcpCDB+Tgl6xUiFVZLlSppgb/hsoX/FxVOIbZUk=;
        b=EXNmLjzJspQhfCpXiyLwoxUp8sKIhvwL33LnL6T8QZ64LYin0vWn5j0G18Xd5pxfLm
         aDnxkSBY6tz+CiFBsRnRZXMKHxfjHb+2QXHYN0AcPPdtyW+5YYnJ9928HEHDIYJdhbU1
         YVe6tAu0kBIX6EVg6V3bHl3S7wQQbjB/UKoEHDRFTqMhhjB2O//bi0V1RsEF1yEq4+A5
         KKlbsm8TCGgX+Sv83CIofIYx7+OgYRRaiylm8XTQMG1eIybzPtrU8DHiNtngMqQcTNj3
         xLrGq079YHxu9zxDdxKxPnF5BHnLWRwcL0QFWc/LzLzwEuaUV/uzmG6yKZfBTSOTqL/x
         xQkA==
X-Gm-Message-State: AC+VfDx0426Yls/gC5MDoczXfwDXWALTN80VonQyo4Nb7xxt+PQZEqhI
	mO1aEgtmaAFBVXXvUdEhzL6d/w==
X-Google-Smtp-Source: ACHHUZ4MZp29o+MFds/2GU+jNfvYE9Eyik8T0K+uVPXBV8iQEJ2uPuzNs2Z4+TUkzOA+GoV0RyHdvA==
X-Received: by 2002:a05:6a20:2326:b0:10b:bf3d:bc5d with SMTP id n38-20020a056a20232600b0010bbf3dbc5dmr4805679pzc.47.1685589552099;
        Wed, 31 May 2023 20:19:12 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
	P J P <pj.pandit@yahoo.co.in>,
	Alexander Bulekov <alxndr@bu.edu>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
	Thomas Huth <huth@tuxfamily.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Sven Schnelle <svens@stackframe.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Rob Herring <robh@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
Date: Thu,  1 Jun 2023 12:18:57 +0900
Message-Id: <20230601031859.7115-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently MemReentrancyGuard was added to DeviceState to record that the
device is engaging in I/O. The network device backend needs to update it
when delivering a packet to a device.

This implementation follows what bottom half does, but it does not add
a tracepoint for the case that the network device backend started
delivering a packet to a device which is already engaging in I/O. This
is because such reentrancy frequently happens for
qemu_flush_queued_packets() and is insignificant.

This series consists of two patches. The first patch makes a bulk change to
add a new parameter to qemu_new_nic() and does not contain behavioral changes.
The second patch actually implements MemReentrancyGuard update.

V1 -> V2: Added the 'Fixes: CVE-2023-3019' tag

Akihiko Odaki (2):
  net: Provide MemReentrancyGuard * to qemu_new_nic()
  net: Update MemReentrancyGuard for NIC

 include/net/net.h             |  2 ++
 hw/net/allwinner-sun8i-emac.c |  3 ++-
 hw/net/allwinner_emac.c       |  3 ++-
 hw/net/cadence_gem.c          |  3 ++-
 hw/net/dp8393x.c              |  3 ++-
 hw/net/e1000.c                |  3 ++-
 hw/net/e1000e.c               |  2 +-
 hw/net/eepro100.c             |  4 +++-
 hw/net/etraxfs_eth.c          |  3 ++-
 hw/net/fsl_etsec/etsec.c      |  3 ++-
 hw/net/ftgmac100.c            |  3 ++-
 hw/net/i82596.c               |  2 +-
 hw/net/igb.c                  |  2 +-
 hw/net/imx_fec.c              |  2 +-
 hw/net/lan9118.c              |  3 ++-
 hw/net/mcf_fec.c              |  3 ++-
 hw/net/mipsnet.c              |  3 ++-
 hw/net/msf2-emac.c            |  3 ++-
 hw/net/mv88w8618_eth.c        |  3 ++-
 hw/net/ne2000-isa.c           |  3 ++-
 hw/net/ne2000-pci.c           |  3 ++-
 hw/net/npcm7xx_emc.c          |  3 ++-
 hw/net/opencores_eth.c        |  3 ++-
 hw/net/pcnet.c                |  3 ++-
 hw/net/rocker/rocker_fp.c     |  4 ++--
 hw/net/rtl8139.c              |  3 ++-
 hw/net/smc91c111.c            |  3 ++-
 hw/net/spapr_llan.c           |  3 ++-
 hw/net/stellaris_enet.c       |  3 ++-
 hw/net/sungem.c               |  2 +-
 hw/net/sunhme.c               |  3 ++-
 hw/net/tulip.c                |  3 ++-
 hw/net/virtio-net.c           |  6 ++++--
 hw/net/vmxnet3.c              |  2 +-
 hw/net/xen_nic.c              |  4 ++--
 hw/net/xgmac.c                |  3 ++-
 hw/net/xilinx_axienet.c       |  3 ++-
 hw/net/xilinx_ethlite.c       |  3 ++-
 hw/usb/dev-network.c          |  3 ++-
 net/net.c                     | 15 +++++++++++++++
 40 files changed, 90 insertions(+), 41 deletions(-)

-- 
2.40.1


