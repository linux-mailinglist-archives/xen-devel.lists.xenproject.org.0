Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD457154C5
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 07:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540725.842680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3rgO-0006N6-TZ; Tue, 30 May 2023 05:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540725.842680; Tue, 30 May 2023 05:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3rgO-0006JZ-LP; Tue, 30 May 2023 05:14:08 +0000
Received: by outflank-mailman (input) for mailman id 540725;
 Tue, 30 May 2023 02:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OULz=BT=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q3pKi-0008AP-G7
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 02:43:36 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47ade56-fe93-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 04:43:33 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-53202149ae2so2376395a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 19:43:33 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 63-20020a630542000000b0051baf3f1b3esm7801785pgf.76.2023.05.29.19.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 19:43:31 -0700 (PDT)
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
X-Inumbo-ID: c47ade56-fe93-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685414612; x=1688006612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUSBfeomTiau/0Y+TQ+XPKgzi9WAbYuw9lFLHs7E/DQ=;
        b=w6Z20Rgo4xXfTYdtH29au26JsCc0AdguJDZCe9tpOlJ/HNKSUDkh1thz3zb240lx51
         vhN4SuNqyJPdv3kTgH5zw+25+0fHFfFR4b+s4TsIrgvAdKKd/8pXQAMiZv5j5smaBhm6
         VsefE8tNCEi1frSiquFiZ+TSnismCsNsedKxw7SpwP4P0f2RJxOJOi1Pv+1ZPc4ejb12
         pCNFmbl01dHfpWqTlqePVRqhiBS25887MtmbDjor2q4IevAvTK4ZX03NRktd/p6x7Rby
         aNtPfkJ78rsMuv4W0Op91DAdU9/XKDIzhucWk0OmLTAGwvmhAa5VpaujI920NxGFCyzs
         4j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685414612; x=1688006612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUSBfeomTiau/0Y+TQ+XPKgzi9WAbYuw9lFLHs7E/DQ=;
        b=IarMHVKXqDsdYd50hktTR3gwzv6BhklIr0MNj3FAlnC3odhC2otNAzXZ2KHDv1iJVj
         RfQLKxc4o9/BzqMgUu5s7wtiiqpORj3oG82fpVL7WefiJ32P6wVgbSmTnvscDgw+oBSE
         mIODwynXmsLMHSr/p6J+U37rmIQzEGaQZaggCKVe8crxy1fYNU6eEgXEADoQ6tlBn1v6
         uElMKlh9galHSperzMUtnpvvF8+aL+wbxr37pZktTkzeBaw1NHMuvRMPdecBO94G2L0Z
         8NypMKgla4hHt0S7V3gGCCqzMIAO/PUraN3LmDO9ksPjfIR8fNMsHO+6/Phu3g2O1wim
         HGxQ==
X-Gm-Message-State: AC+VfDzNP8CgSYkjnaprjvzVikdHvGaPLsXmSiaOEdJ+dmg3pdamMoj/
	+2dCboRVfp46BxuECpo8zVi38g==
X-Google-Smtp-Source: ACHHUZ4/tmzoprzvDSp1+GkGS0w0qgBMQNWlO3/kfqD0rkZYdMgOG7YxabsrsxdA7VJUy2aQVS84Jw==
X-Received: by 2002:a05:6a20:e18b:b0:ff:a017:2b07 with SMTP id ks11-20020a056a20e18b00b000ffa0172b07mr906955pzb.20.1685414612047;
        Mon, 29 May 2023 19:43:32 -0700 (PDT)
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
Subject: [PATCH 1/2] net: Provide MemReentrancyGuard * to qemu_new_nic()
Date: Tue, 30 May 2023 11:43:01 +0900
Message-Id: <20230530024302.14215-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530024302.14215-1-akihiko.odaki@daynix.com>
References: <20230530024302.14215-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently MemReentrancyGuard was added to DeviceState to record that the
device is engaging in I/O. The network device backend needs to update it
when delivering a packet to a device.

In preparation for such a change, add MemReentrancyGuard * as a
parameter of qemu_new_nic().

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/net.h             | 1 +
 hw/net/allwinner-sun8i-emac.c | 3 ++-
 hw/net/allwinner_emac.c       | 3 ++-
 hw/net/cadence_gem.c          | 3 ++-
 hw/net/dp8393x.c              | 3 ++-
 hw/net/e1000.c                | 3 ++-
 hw/net/e1000e.c               | 2 +-
 hw/net/eepro100.c             | 4 +++-
 hw/net/etraxfs_eth.c          | 3 ++-
 hw/net/fsl_etsec/etsec.c      | 3 ++-
 hw/net/ftgmac100.c            | 3 ++-
 hw/net/i82596.c               | 2 +-
 hw/net/igb.c                  | 2 +-
 hw/net/imx_fec.c              | 2 +-
 hw/net/lan9118.c              | 3 ++-
 hw/net/mcf_fec.c              | 3 ++-
 hw/net/mipsnet.c              | 3 ++-
 hw/net/msf2-emac.c            | 3 ++-
 hw/net/mv88w8618_eth.c        | 3 ++-
 hw/net/ne2000-isa.c           | 3 ++-
 hw/net/ne2000-pci.c           | 3 ++-
 hw/net/npcm7xx_emc.c          | 3 ++-
 hw/net/opencores_eth.c        | 3 ++-
 hw/net/pcnet.c                | 3 ++-
 hw/net/rocker/rocker_fp.c     | 4 ++--
 hw/net/rtl8139.c              | 3 ++-
 hw/net/smc91c111.c            | 3 ++-
 hw/net/spapr_llan.c           | 3 ++-
 hw/net/stellaris_enet.c       | 3 ++-
 hw/net/sungem.c               | 2 +-
 hw/net/sunhme.c               | 3 ++-
 hw/net/tulip.c                | 3 ++-
 hw/net/virtio-net.c           | 6 ++++--
 hw/net/vmxnet3.c              | 2 +-
 hw/net/xen_nic.c              | 4 ++--
 hw/net/xgmac.c                | 3 ++-
 hw/net/xilinx_axienet.c       | 3 ++-
 hw/net/xilinx_ethlite.c       | 3 ++-
 hw/usb/dev-network.c          | 3 ++-
 net/net.c                     | 1 +
 40 files changed, 75 insertions(+), 41 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 1448d00afb..a7d8deaccb 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -157,6 +157,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
                        NICConf *conf,
                        const char *model,
                        const char *name,
+                       MemReentrancyGuard *reentrancy_guard,
                        void *opaque);
 void qemu_del_nic(NICState *nic);
 NetClientState *qemu_get_subqueue(NICState *nic, int queue_index);
diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index fac4405f45..cc350d40e5 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -824,7 +824,8 @@ static void allwinner_sun8i_emac_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_allwinner_sun8i_emac_info, &s->conf,
-                           object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index 372e5b66da..e10965de14 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -453,7 +453,8 @@ static void aw_emac_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_aw_emac_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     fifo8_create(&s->rx_fifo, RX_FIFO_SIZE);
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 42ea2411a2..a7bce1c120 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1633,7 +1633,8 @@ static void gem_realize(DeviceState *dev, Error **errp)
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
     s->nic = qemu_new_nic(&net_gem_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
 
     if (s->jumbo_max_len > MAX_FRAME_SIZE) {
         error_setg(errp, "jumbo-max-len is greater than %d",
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 45b954e46c..abfcc6f69f 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -943,7 +943,8 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
                           "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);
 
     s->nic = qemu_new_nic(&net_dp83932_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->watchdog = timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, s);
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 4dc4dd7704..7581378226 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1696,7 +1696,8 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
                                macaddr);
 
     d->nic = qemu_new_nic(&net_e1000_info, &d->conf,
-                          object_get_typename(OBJECT(d)), dev->id, d);
+                          object_get_typename(OBJECT(d)), dev->id,
+                          &dev->mem_reentrancy_guard, d);
 
     qemu_format_nic_info_str(qemu_get_queue(d->nic), macaddr);
 
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index c3848797b8..e41a6c1038 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -320,7 +320,7 @@ e1000e_init_net_peer(E1000EState *s, PCIDevice *pci_dev, uint8_t *macaddr)
     int i;
 
     s->nic = qemu_new_nic(&net_e1000e_info, &s->conf,
-        object_get_typename(OBJECT(s)), dev->id, s);
+        object_get_typename(OBJECT(s)), dev->id, &dev->mem_reentrancy_guard, s);
 
     s->core.max_queue_num = s->conf.peers.queues ? s->conf.peers.queues - 1 : 0;
 
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dc07984ae9..e2b03b787d 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1874,7 +1874,9 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
     nic_reset(s);
 
     s->nic = qemu_new_nic(&net_eepro100_info, &s->conf,
-                          object_get_typename(OBJECT(pci_dev)), pci_dev->qdev.id, s);
+                          object_get_typename(OBJECT(pci_dev)),
+                          pci_dev->qdev.id,
+                          &pci_dev->qdev.mem_reentrancy_guard, s);
 
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
     TRACE(OTHER, logout("%s\n", qemu_get_queue(s->nic)->info_str));
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 1b82aec794..ba57a978d1 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -618,7 +618,8 @@ static void etraxfs_eth_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_etraxfs_info, &s->conf,
-                          object_get_typename(OBJECT(s)), dev->id, s);
+                          object_get_typename(OBJECT(s)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->phy.read = tdk_read;
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 798ea33d08..00315f305d 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -391,7 +391,8 @@ static void etsec_realize(DeviceState *dev, Error **errp)
     eTSEC        *etsec = ETSEC_COMMON(dev);
 
     etsec->nic = qemu_new_nic(&net_etsec_info, &etsec->conf,
-                              object_get_typename(OBJECT(dev)), dev->id, etsec);
+                              object_get_typename(OBJECT(dev)), dev->id,
+                              &dev->mem_reentrancy_guard, etsec);
     qemu_format_nic_info_str(qemu_get_queue(etsec->nic), etsec->conf.macaddr.a);
 
     etsec->ptimer = ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY_LEGACY);
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index d3bf14be53..be2cf63c08 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1118,7 +1118,8 @@ static void ftgmac100_realize(DeviceState *dev, Error **errp)
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
     s->nic = qemu_new_nic(&net_ftgmac100_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index ec21e2699a..dc64246f75 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -743,7 +743,7 @@ void i82596_common_init(DeviceState *dev, I82596State *s, NetClientInfo *info)
         qemu_macaddr_default_if_unset(&s->conf.macaddr);
     }
     s->nic = qemu_new_nic(info, &s->conf, object_get_typename(OBJECT(dev)),
-                dev->id, s);
+                dev->id, &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     if (USE_TIMER) {
diff --git a/hw/net/igb.c b/hw/net/igb.c
index 1c989d7677..141bc56d79 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -315,7 +315,7 @@ igb_init_net_peer(IGBState *s, PCIDevice *pci_dev, uint8_t *macaddr)
     int i;
 
     s->nic = qemu_new_nic(&net_igb_info, &s->conf,
-        object_get_typename(OBJECT(s)), dev->id, s);
+        object_get_typename(OBJECT(s)), dev->id, &dev->mem_reentrancy_guard, s);
 
     s->core.max_queue_num = s->conf.peers.queues ? s->conf.peers.queues - 1 : 0;
 
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 5d1f1f104c..6881e3e4f0 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1334,7 +1334,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
 
     s->nic = qemu_new_nic(&imx_eth_net_info, &s->conf,
                           object_get_typename(OBJECT(dev)),
-                          dev->id, s);
+                          dev->id, &dev->mem_reentrancy_guard, s);
 
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index e5c4af182d..cf7b8c897a 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1361,7 +1361,8 @@ static void lan9118_realize(DeviceState *dev, Error **errp)
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
     s->nic = qemu_new_nic(&net_lan9118_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
     s->eeprom[0] = 0xa5;
     for (i = 0; i < 6; i++) {
diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
index 8aa27bd322..57dd49abea 100644
--- a/hw/net/mcf_fec.c
+++ b/hw/net/mcf_fec.c
@@ -643,7 +643,8 @@ static void mcf_fec_realize(DeviceState *dev, Error **errp)
     mcf_fec_state *s = MCF_FEC_NET(dev);
 
     s->nic = qemu_new_nic(&net_mcf_fec_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
index 2ade72dea0..8e925de867 100644
--- a/hw/net/mipsnet.c
+++ b/hw/net/mipsnet.c
@@ -255,7 +255,8 @@ static void mipsnet_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq);
 
     s->nic = qemu_new_nic(&net_mipsnet_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index db3a04deb1..145a5e46ab 100644
--- a/hw/net/msf2-emac.c
+++ b/hw/net/msf2-emac.c
@@ -530,7 +530,8 @@ static void msf2_emac_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_msf2_emac_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/mv88w8618_eth.c b/hw/net/mv88w8618_eth.c
index ef30b0d4a6..2185f1131a 100644
--- a/hw/net/mv88w8618_eth.c
+++ b/hw/net/mv88w8618_eth.c
@@ -350,7 +350,8 @@ static void mv88w8618_eth_realize(DeviceState *dev, Error **errp)
 
     address_space_init(&s->dma_as, s->dma_mr, "emac-dma");
     s->nic = qemu_new_nic(&net_mv88w8618_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
 }
 
 static const VMStateDescription mv88w8618_eth_vmsd = {
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index 6ced6775ff..a79f7fad1f 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -74,7 +74,8 @@ static void isa_ne2000_realizefn(DeviceState *dev, Error **errp)
     ne2000_reset(s);
 
     s->nic = qemu_new_nic(&net_ne2000_isa_info, &s->c,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
 }
 
diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
index edc6689d33..fee93c6ec0 100644
--- a/hw/net/ne2000-pci.c
+++ b/hw/net/ne2000-pci.c
@@ -71,7 +71,8 @@ static void pci_ne2000_realize(PCIDevice *pci_dev, Error **errp)
 
     s->nic = qemu_new_nic(&net_ne2000_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
-                          pci_dev->qdev.id, s);
+                          pci_dev->qdev.id,
+                          &pci_dev->qdev.mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
 }
 
diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 8156f701b0..1d4e8f59f3 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -821,7 +821,8 @@ static void npcm7xx_emc_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&emc->conf.macaddr);
     emc->nic = qemu_new_nic(&net_npcm7xx_emc_info, &emc->conf,
-                            object_get_typename(OBJECT(dev)), dev->id, emc);
+                            object_get_typename(OBJECT(dev)), dev->id,
+                            &dev->mem_reentrancy_guard, emc);
     qemu_format_nic_info_str(qemu_get_queue(emc->nic), emc->conf.macaddr.a);
 }
 
diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index 0b3dc3146e..f96d6ea2cc 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -732,7 +732,8 @@ static void sysbus_open_eth_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq);
 
     s->nic = qemu_new_nic(&net_open_eth_info, &s->conf,
-                          object_get_typename(OBJECT(s)), dev->id, s);
+                          object_get_typename(OBJECT(s)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
 }
 
 static void qdev_open_eth_reset(DeviceState *dev)
diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index d456094575..1627f6939c 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -1718,7 +1718,8 @@ void pcnet_common_init(DeviceState *dev, PCNetState *s, NetClientInfo *info)
     s->poll_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pcnet_poll_timer, s);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
-    s->nic = qemu_new_nic(info, &s->conf, object_get_typename(OBJECT(dev)), dev->id, s);
+    s->nic = qemu_new_nic(info, &s->conf, object_get_typename(OBJECT(dev)),
+                          dev->id, &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     /* Initialize the PROM */
diff --git a/hw/net/rocker/rocker_fp.c b/hw/net/rocker/rocker_fp.c
index cbeed65bd5..0d21948ada 100644
--- a/hw/net/rocker/rocker_fp.c
+++ b/hw/net/rocker/rocker_fp.c
@@ -241,8 +241,8 @@ FpPort *fp_port_alloc(Rocker *r, char *sw_name,
     port->conf.bootindex = -1;
     port->conf.peers = *peers;
 
-    port->nic = qemu_new_nic(&fp_port_info, &port->conf,
-                             sw_name, NULL, port);
+    port->nic = qemu_new_nic(&fp_port_info, &port->conf, sw_name, NULL,
+                             &DEVICE(r)->mem_reentrancy_guard, port);
     qemu_format_nic_info_str(qemu_get_queue(port->nic),
                              port->conf.macaddr.a);
 
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 5a5aaf868d..f4df03af71 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -3397,7 +3397,8 @@ static void pci_rtl8139_realize(PCIDevice *dev, Error **errp)
     s->eeprom.contents[9] = s->conf.macaddr.a[4] | s->conf.macaddr.a[5] << 8;
 
     s->nic = qemu_new_nic(&net_rtl8139_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), d->id, s);
+                          object_get_typename(OBJECT(dev)), d->id,
+                          &d->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->cplus_txbuffer = NULL;
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index ad778cd8fc..4eda971ef3 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -783,7 +783,8 @@ static void smc91c111_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_smc91c111_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
     /* ??? Save/restore.  */
 }
diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
index a6876a936d..475d5f3a34 100644
--- a/hw/net/spapr_llan.c
+++ b/hw/net/spapr_llan.c
@@ -325,7 +325,8 @@ static void spapr_vlan_realize(SpaprVioDevice *sdev, Error **errp)
     memcpy(&dev->perm_mac.a, &dev->nicconf.macaddr.a, sizeof(dev->perm_mac.a));
 
     dev->nic = qemu_new_nic(&net_spapr_vlan_info, &dev->nicconf,
-                            object_get_typename(OBJECT(sdev)), sdev->qdev.id, dev);
+                            object_get_typename(OBJECT(sdev)), sdev->qdev.id,
+                            &sdev->qdev.mem_reentrancy_guard, dev);
     qemu_format_nic_info_str(qemu_get_queue(dev->nic), dev->nicconf.macaddr.a);
 
     dev->rxp_timer = timer_new_us(QEMU_CLOCK_VIRTUAL, spapr_vlan_flush_rx_queue,
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 8dd60783d8..6768a6912f 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -492,7 +492,8 @@ static void stellaris_enet_realize(DeviceState *dev, Error **errp)
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
     s->nic = qemu_new_nic(&net_stellaris_enet_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index eb01520790..347ccdd19d 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -1361,7 +1361,7 @@ static void sungem_realize(PCIDevice *pci_dev, Error **errp)
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_sungem_info, &s->conf,
                           object_get_typename(OBJECT(dev)),
-                          dev->id, s);
+                          dev->id, &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic),
                              s->conf.macaddr.a);
 }
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 1f3d8011ae..82e38a428a 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -892,7 +892,8 @@ static void sunhme_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_sunhme_info, &s->conf,
-                          object_get_typename(OBJECT(d)), d->id, s);
+                          object_get_typename(OBJECT(d)), d->id,
+                          &d->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 915e5fb595..1f8e45de5e 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -983,7 +983,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 
     s->nic = qemu_new_nic(&net_tulip_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
-                          pci_dev->qdev.id, s);
+                          pci_dev->qdev.id,
+                          &pci_dev->qdev.mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
 }
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ed9f240bfd..9728158b72 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3696,10 +3696,12 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
          * Happen when virtio_net_set_netclient_name has been called.
          */
         n->nic = qemu_new_nic(&net_virtio_info, &n->nic_conf,
-                              n->netclient_type, n->netclient_name, n);
+                              n->netclient_type, n->netclient_name,
+                              &dev->mem_reentrancy_guard, n);
     } else {
         n->nic = qemu_new_nic(&net_virtio_info, &n->nic_conf,
-                              object_get_typename(OBJECT(dev)), dev->id, n);
+                              object_get_typename(OBJECT(dev)), dev->id,
+                              &dev->mem_reentrancy_guard, n);
     }
 
     for (i = 0; i < n->max_queue_pairs; i++) {
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 18b9edfdb2..5051818fe4 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -2083,7 +2083,7 @@ static void vmxnet3_net_init(VMXNET3State *s)
 
     s->nic = qemu_new_nic(&net_vmxnet3_info, &s->conf,
                           object_get_typename(OBJECT(s)),
-                          d->id, s);
+                          d->id, &d->mem_reentrancy_guard, s);
 
     s->peer_has_vhdr = vmxnet3_peer_has_vnet_hdr(s);
     s->tx_sop = true;
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 9bbf6599fc..e735f79c5b 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -293,8 +293,8 @@ static int net_init(struct XenLegacyDevice *xendev)
         return -1;
     }
 
-    netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf,
-                               "xen", NULL, netdev);
+    netdev->nic = qemu_new_nic(&net_xen_info, &netdev->conf, "xen", NULL,
+                               &xendev->qdev.mem_reentrancy_guard, netdev);
 
     qemu_set_info_str(qemu_get_queue(netdev->nic),
                       "nic: xenbus vif macaddr=%s", netdev->mac);
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 0ab6ae91aa..1f4f277d84 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -402,7 +402,8 @@ static void xgmac_enet_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xgmac_enet_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->regs[XGMAC_ADDR_HIGH(0)] = (s->conf.macaddr.a[5] << 8) |
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 5b19a01eaa..7d1fd37b4a 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -967,7 +967,8 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_enet_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     tdk_init(&s->TEMAC.phy);
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 89f4f3b254..989afaf037 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -235,7 +235,8 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
+                          object_get_typename(OBJECT(dev)), dev->id,
+                          &dev->mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 }
 
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 5fff487ee5..2c33e36cad 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1386,7 +1386,8 @@ static void usb_net_realize(USBDevice *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_usbnet_info, &s->conf,
-                          object_get_typename(OBJECT(s)), s->dev.qdev.id, s);
+                          object_get_typename(OBJECT(s)), s->dev.qdev.id,
+                          &s->dev.qdev.mem_reentrancy_guard, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
     snprintf(s->usbstring_mac, sizeof(s->usbstring_mac),
              "%02x%02x%02x%02x%02x%02x",
diff --git a/net/net.c b/net/net.c
index 6492ad530e..982df2479f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -319,6 +319,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
                        NICConf *conf,
                        const char *model,
                        const char *name,
+                       MemReentrancyGuard *reentrancy_guard,
                        void *opaque)
 {
     NetClientState **peers = conf->peers.ncs;
-- 
2.40.1


