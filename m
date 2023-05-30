Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71B7154C6
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 07:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540727.842686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3rgP-0006Yl-95; Tue, 30 May 2023 05:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540727.842686; Tue, 30 May 2023 05:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3rgP-0006N1-2N; Tue, 30 May 2023 05:14:09 +0000
Received: by outflank-mailman (input) for mailman id 540727;
 Tue, 30 May 2023 02:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OULz=BT=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q3pKn-0008AP-Lq
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 02:43:41 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8cf90dd-fe93-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 04:43:41 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d30ab1f89so2605307b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 19:43:40 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 63-20020a630542000000b0051baf3f1b3esm7801785pgf.76.2023.05.29.19.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 19:43:39 -0700 (PDT)
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
X-Inumbo-ID: c8cf90dd-fe93-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685414619; x=1688006619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejrIrGDi4fwDc42huLgpjGNxWrqatNvW4qPUqySFFzs=;
        b=bA03kVN0LRRXIzKN4XRu7rfTWzkdAzIu5vrroA41QIqCpQkLzqpjwbAKDmNVrQc619
         sel8WanjG9YLk5mNX33VW98hchhdEjHAjMcVWMOs98OW41wGMxEr94iO1KxTFBIMgiPA
         mjJzoZXp3qVL1Firr5Vy8may4ZNLv7dUH3ERx5Uvq1sGdqZ3uKieNa3iZvE0Le9gfN1m
         VutCkV1KEbIvbRwPj4wqIy2kZTcaHUeJZ6aEezuK2d86xDfoF2+Kgn4zuSX2aTRnEtPW
         bA1j++wF+++Qk/bOAfW4Gd9EqnZ4kQYwpQoN9StGcROzUAjdbV6aRYnloFE3Wx4G3OBc
         oGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685414619; x=1688006619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejrIrGDi4fwDc42huLgpjGNxWrqatNvW4qPUqySFFzs=;
        b=KOEyw78IubrG08U2suEvL57ljeXumZvlXzon2re3np37pQBr2b/CL0knziWrszUI3v
         ioGb4+FxSeqLTvme4+k8PxcZ362QJGyenPCQBOL+rz397QyZkhh7dwYNCFfbSxdPpfE+
         BOUdB1ZhuobiYVcY5MNPBpv1GY/uHOIWr+YMVFTBZgQ6tpnY+qcno2sVDznkht/AJaSh
         SZCTxFUIs/y1ERbQ5E9uS3T70M8R0FBrCc1nkn7P9y3Pd3jmjlB65GBpr08dX1P9TMuB
         bWrzrJeFEyJkuNyTTif3oNP98ugaiXsI0ZPQl+RCDGY+OanyrQBHJ7dSkvHTCTRvqTPT
         W8mQ==
X-Gm-Message-State: AC+VfDytSCE32wdAYCPXKiVvfncWDiVZidj/R2aioLRRTKvbEsmAOF2S
	pEAW88KVU3OgdMNkKxCEqJlByA==
X-Google-Smtp-Source: ACHHUZ6aiCOJhP/F1eiuxvqFrg32PvLvuYZpAKh2r88y5LDB6dQkwW+lr4Qrw3EN74hLySTW1nk6pA==
X-Received: by 2002:a05:6a20:d805:b0:10b:78d7:502 with SMTP id iv5-20020a056a20d80500b0010b78d70502mr906865pzb.36.1685414619631;
        Mon, 29 May 2023 19:43:39 -0700 (PDT)
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
Subject: [PATCH 2/2] net: Update MemReentrancyGuard for NIC
Date: Tue, 30 May 2023 11:43:02 +0900
Message-Id: <20230530024302.14215-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530024302.14215-1-akihiko.odaki@daynix.com>
References: <20230530024302.14215-1-akihiko.odaki@daynix.com>
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


