Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9171913E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 05:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542206.845815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Yqa-00039c-1T; Thu, 01 Jun 2023 03:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542206.845815; Thu, 01 Jun 2023 03:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4YqZ-00036P-U5; Thu, 01 Jun 2023 03:19:31 +0000
Received: by outflank-mailman (input) for mailman id 542206;
 Thu, 01 Jun 2023 03:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+w1M=BV=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q4YqY-0002Ws-EU
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 03:19:30 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e2db27f-002b-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 05:19:29 +0200 (CEST)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5289cf35eeaso1244522a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 20:19:29 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001a245b49731sm2146753plb.128.2023.05.31.20.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 20:19:27 -0700 (PDT)
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
X-Inumbo-ID: 1e2db27f-002b-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685589568; x=1688181568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmIxJv/RQZ1r+yT76IboD8L/ibu/PXdMmNY/Ba4zw4E=;
        b=LifDaFHsjEizUqk1VXUEMNKpYG+2uFwQWZ6WmhqcXRIokhq+sF0/tOYP3m8p66m5Sw
         ixVkHy6LMbrBelnPG8Q1Q9VRLCT+uqGDYCGM6cpIlvIhSQ3FFZGbw6zk85tp5GfS+ldw
         Da0krCI3eNH0oCEHagqgTjS5JGpkwahp96+PqTHoZpg3dydVTmpmjawNVceSXeK03RKl
         uDHry/5Rb534a/JTOwsP6b8N7HJmZpCpM7hLTgB3X2valR5fHWq29yMLiL9qGTiqTqCE
         IGUaKyP4J9vbFD+3AyXaVCi4WEEzIHEifi3LI1MYz+fnnZmTcLeNYfg5/h7F5O8KGHQI
         qzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685589568; x=1688181568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmIxJv/RQZ1r+yT76IboD8L/ibu/PXdMmNY/Ba4zw4E=;
        b=SvGpBABI9Hwz/+ixPn9rhKZF2N+45b7u8BvHuKENyTbb6DwJZBQQN79IPuKozRAGnK
         tT+k91E1d3NPiWOwpWVVwj5hizRMfoLpvWz1BRp12QXxPNRnzvoGVg8e2ykyDwJXudta
         vjERt9kJHmWTy226Cnz+TC1XR9lVoa6abFE5YR5I+WY2qaCFDmGwX8uhDOqWR37zAtq+
         l2+U7x9XNcnCcMBinFshY1DmKhBfUdvFHbMVgMqTMIWBjSEQaTUexFFbfUuo/ok1+g1u
         Tsut3WtoFWYI8ZivNVrnZ3ccqRemeEhM/CiqQ1ChrU9Ptv7PnU2k7UFzAlFAcdwq0sNQ
         m1rg==
X-Gm-Message-State: AC+VfDyREjs+PsBjAmSV6Pr5tXKDDuh19s7zAXRGZUl8RnFHpSqULcyg
	JncRzfJUG09DvB+66fsIOZChLA==
X-Google-Smtp-Source: ACHHUZ5miu5cdAr+t12FHP1vTIi7NetVQS5akrT+IyNAzvoVQFkZ1wGN5w557t12H8/USySWfc8W4g==
X-Received: by 2002:a17:902:daca:b0:1ad:d542:6e14 with SMTP id q10-20020a170902daca00b001add5426e14mr680893plx.12.1685589567904;
        Wed, 31 May 2023 20:19:27 -0700 (PDT)
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
Subject: [PATCH v2 2/2] net: Update MemReentrancyGuard for NIC
Date: Thu,  1 Jun 2023 12:18:59 +0900
Message-Id: <20230601031859.7115-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601031859.7115-1-akihiko.odaki@daynix.com>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
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

Fixes: CVE-2023-3019
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/net.h |  1 +
 net/net.c         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index a7d8deaccb..685ec58318 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -124,6 +124,7 @@ typedef QTAILQ_HEAD(NetClientStateList, NetClientState) NetClientStateList;
 typedef struct NICState {
     NetClientState *ncs;
     NICConf *conf;
+    MemReentrancyGuard *reentrancy_guard;
     void *opaque;
     bool peer_deleted;
 } NICState;
diff --git a/net/net.c b/net/net.c
index 982df2479f..3523cceafc 100644
--- a/net/net.c
+++ b/net/net.c
@@ -332,6 +332,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
     nic = g_malloc0(info->size + sizeof(NetClientState) * queues);
     nic->ncs = (void *)nic + info->size;
     nic->conf = conf;
+    nic->reentrancy_guard = reentrancy_guard,
     nic->opaque = opaque;
 
     for (i = 0; i < queues; i++) {
@@ -805,6 +806,7 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
                                        int iovcnt,
                                        void *opaque)
 {
+    MemReentrancyGuard *owned_reentrancy_guard;
     NetClientState *nc = opaque;
     int ret;
 
@@ -817,12 +819,24 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
         return 0;
     }
 
+    if (nc->info->type != NET_CLIENT_DRIVER_NIC ||
+        qemu_get_nic(nc)->reentrancy_guard->engaged_in_io) {
+        owned_reentrancy_guard = NULL;
+    } else {
+        owned_reentrancy_guard = qemu_get_nic(nc)->reentrancy_guard;
+        owned_reentrancy_guard->engaged_in_io = true;
+    }
+
     if (nc->info->receive_iov && !(flags & QEMU_NET_PACKET_FLAG_RAW)) {
         ret = nc->info->receive_iov(nc, iov, iovcnt);
     } else {
         ret = nc_sendv_compat(nc, iov, iovcnt, flags);
     }
 
+    if (owned_reentrancy_guard) {
+        owned_reentrancy_guard->engaged_in_io = false;
+    }
+
     if (ret == 0) {
         nc->receive_disabled = 1;
     }
-- 
2.40.1


