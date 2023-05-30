Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B217154C7
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 07:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540723.842674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3rgO-0006KS-Lr; Tue, 30 May 2023 05:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540723.842674; Tue, 30 May 2023 05:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3rgO-0006Hy-BW; Tue, 30 May 2023 05:14:08 +0000
Received: by outflank-mailman (input) for mailman id 540723;
 Tue, 30 May 2023 02:43:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OULz=BT=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q3pKd-00089x-T4
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 02:43:32 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfd13341-fe93-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 04:43:28 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d3578c25bso4579357b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 19:43:26 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 63-20020a630542000000b0051baf3f1b3esm7801785pgf.76.2023.05.29.19.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 19:43:23 -0700 (PDT)
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
X-Inumbo-ID: bfd13341-fe93-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685414604; x=1688006604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swwLnIkzsF+teWY2PyMri5LA/E3FuwMRZkjgfo8Sf88=;
        b=Mk7dJszWz2jAD6FWi0cao85HuTooPQab6qm7QHzPUgs/YznOaSVoUH9MQcXHmnerZP
         hR1JtUquNXQLzoQle2nym9+2/UrkKMlqwAOJAlHXH8JOu8vd6du751KrQDltRrPAe9C5
         i1VvizG0Bl3Nf1w+iysV9cthnw/1aAdUpjl9a1u7cX6ZAtNQwV7EGM9toZpV9T192QsT
         o0h6jomXg0eaMr7lSBclIWMo17OT0dP1IZg4szXD2PIilLzDOI3PuhuK1TGfGk/kvaVl
         KVHS+BTO5NgxEjKNvlVKL3EKGDw6qnxJICKErDGA00YBshaZ+29p1wqkgd3bzox0LFNV
         lBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685414604; x=1688006604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swwLnIkzsF+teWY2PyMri5LA/E3FuwMRZkjgfo8Sf88=;
        b=LkRiddBMga5RiglUZRUnPQ/4ACIeZUFDKE6KRQVxPf1Gtdrc4bI2Of7o+OlTyHPYO8
         U/psgCWic12kL1lnCRvxraJ7jMyk3vLIJBVEXwGaAXj1IYAlEEHkL1A4o7/4794v9oG0
         kmj8v/om4EQw2PcT0cC0dwX9R7WRWf8ipXvbj7RApPOq9ia80EwrZXK1G17Di42D2QxC
         eJRPAlnfExdR0hkAjmBgm6rL1M/nWDJA8bRHwxf5ub8yKOR/QIvZBzwYSFKzSfDjE0Tv
         rsEqxr3+A/R49f8mpgqbxSK+4yJoFP7ZcKYuGucEbHe2OfkjupVWxWXIyxepOE95bSeS
         WP4A==
X-Gm-Message-State: AC+VfDxWprrod1daLLOq3FXytiU1pDj/cjmrQoK5xYFI3iEUhU/iu17j
	wakNhQQ9+B1uQqW+MSMlgugbrQ==
X-Google-Smtp-Source: ACHHUZ5YsC9cr+QFUOl5hhAO7DM8g16IxDu9WjEWSsTOketuhwKTj1vai2Ctzeoq8pHPAgrmQUbTCw==
X-Received: by 2002:a05:6a20:ce4f:b0:10e:de4f:3437 with SMTP id id15-20020a056a20ce4f00b0010ede4f3437mr869413pzb.39.1685414604413;
        Mon, 29 May 2023 19:43:24 -0700 (PDT)
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
Subject: [PATCH 0/2] net: Update MemReentrancyGuard for NIC
Date: Tue, 30 May 2023 11:43:00 +0900
Message-Id: <20230530024302.14215-1-akihiko.odaki@daynix.com>
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


