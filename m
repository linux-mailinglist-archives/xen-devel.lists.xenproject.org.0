Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8382D72DC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 10:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50241.88820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kneps-0000gV-8p; Fri, 11 Dec 2020 09:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50241.88820; Fri, 11 Dec 2020 09:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kneps-0000g6-5S; Fri, 11 Dec 2020 09:35:36 +0000
Received: by outflank-mailman (input) for mailman id 50241;
 Fri, 11 Dec 2020 09:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=byGL=FP=gmail.com=bmeng.cn@srs-us1.protection.inumbo.net>)
 id 1knepq-0000g1-7Q
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 09:35:34 +0000
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de204c78-ac46-4529-bb81-a3fbbcc83f23;
 Fri, 11 Dec 2020 09:35:33 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id 2so8192356ilg.9
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 01:35:32 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id g1sm4065362ioh.39.2020.12.11.01.35.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Dec 2020 01:35:32 -0800 (PST)
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
X-Inumbo-ID: de204c78-ac46-4529-bb81-a3fbbcc83f23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A/cB+UmI9E0j+nJVr2oYBsjH7YKCVvR2Pxv7tFSl0zw=;
        b=STLAf7gl4jww/Y/EmM3KDbzh19tbx+o3mypDCyNXNlXCidHBThhWZcmNdusW7ktDOi
         vbjZvfoaGg62/JV5pqfI6H7Fn1RpvdkNxEAJHks2pEpV6jQQlL8HA/RdRLfrwSl3+vQM
         SVMxI2HuzJNy1pa8JNIztJLaV2+ePJSF8dexpVwYg/EExa6GYu5z5KRNTxyTN3Hg0C4S
         QeQloeUwxKXkvDNwhNRt3O3S6kRtb5ZSJGedvtp6n768WWjQPx3bQRtcnR8RMSfLIcmX
         Kmz01NksaYJWZIJ2DEM/9P7Pel2XLFnajZTWEVheM1V7fM2Gi/6+5lrBA3vjq7dj3fQx
         ZSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A/cB+UmI9E0j+nJVr2oYBsjH7YKCVvR2Pxv7tFSl0zw=;
        b=nocLolxo/UwRiWU7z3+y4Q9setSw28TuxYd9uQwxKAHOXXBg4GVqb0U2mh4GbwvE+u
         AjFCZ02nOHEiJcTvnNv5re0DhJ7yPXJGUiAAjIWL6eWRkdNxq8qA3dKQByeUPRh9mVuH
         Cvd5z9urthY5mISYcCO0QNexAwAlab9Ts3G7MYqO76IcdOPe+xfOeBwvFWAEJVZ5JQL5
         putDv0qkZ99KOzcmVdbMo6H//aOjUojZfnucslSiIWk2gfRqbcFZ/ghFPSTn+IXI932W
         OROHW7BPsssLOHTv20l4dWkjc9C1juByxp1HT1vnQA7a+Y8kH0StAN2lcRZhJepT8x7H
         a+/g==
X-Gm-Message-State: AOAM531kUkJEfA2PXZ172/BjNk4UennC9Laa1jja5XREA/vGrajGQMED
	Wy5bpX791nMOihY53gvipeI=
X-Google-Smtp-Source: ABdhPJwVfhlAvs/EzRx/jVUtjRoK8Ceqg5JPndS+7DZoIvG8b2oUCVojGSmtF0TvrgKOfufEBw0vpA==
X-Received: by 2002:a92:dccb:: with SMTP id b11mr14709054ilr.36.1607679332523;
        Fri, 11 Dec 2020 01:35:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andrew Jeffery <andrew@aj.id.au>,
	Anthony Perard <anthony.perard@citrix.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Zhang Chen <chen.zhang@intel.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/3] net: checksum: Introduce fine control over checksum type
Date: Fri, 11 Dec 2020 17:35:12 +0800
Message-Id: <1607679312-51325-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
References: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bin Meng <bin.meng@windriver.com>

At present net_checksum_calculate() blindly calculates all types of
checksums (IP, TCP, UDP). Some NICs may have a per type setting in
their BDs to control what checksum should be offloaded. To support
such hardware behavior, introduce a 'csum_flag' parameter to the
net_checksum_calculate() API to allow fine control over what type
checksum is calculated.

Existing users of this API are updated accordingly.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- update ftgmac100.c per Cédric Le Goater's suggestion
- simplify fsl_etsec and imx_fec checksum logic

 include/net/checksum.h        |  7 ++++++-
 hw/net/allwinner-sun8i-emac.c |  2 +-
 hw/net/cadence_gem.c          |  2 +-
 hw/net/fsl_etsec/rings.c      | 18 +++++++++---------
 hw/net/ftgmac100.c            | 13 ++++++++++++-
 hw/net/imx_fec.c              | 20 ++++++++------------
 hw/net/virtio-net.c           |  2 +-
 hw/net/xen_nic.c              |  2 +-
 net/checksum.c                | 18 ++++++++++++++----
 net/filter-rewriter.c         |  4 ++--
 10 files changed, 55 insertions(+), 33 deletions(-)

diff --git a/include/net/checksum.h b/include/net/checksum.h
index 05a0d27..7dec37e 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -21,11 +21,16 @@
 #include "qemu/bswap.h"
 struct iovec;
 
+#define CSUM_IP     0x01
+#define CSUM_TCP    0x02
+#define CSUM_UDP    0x04
+#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)
+
 uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
 uint16_t net_checksum_finish(uint32_t sum);
 uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
                              uint8_t *addrs, uint8_t *buf);
-void net_checksum_calculate(uint8_t *data, int length);
+void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
 
 static inline uint32_t
 net_checksum_add(int len, uint8_t *buf)
diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index 38d3285..0427689 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -514,7 +514,7 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacState *s)
         /* After the last descriptor, send the packet */
         if (desc.status2 & TX_DESC_STATUS2_LAST_DESC) {
             if (desc.status2 & TX_DESC_STATUS2_CHECKSUM_MASK) {
-                net_checksum_calculate(packet_buf, packet_bytes);
+                net_checksum_calculate(packet_buf, packet_bytes, CSUM_ALL);
             }
 
             qemu_send_packet(nc, packet_buf, packet_bytes);
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7a53469..9a4474a 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1266,7 +1266,7 @@ static void gem_transmit(CadenceGEMState *s)
 
                 /* Is checksum offload enabled? */
                 if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
-                    net_checksum_calculate(s->tx_packet, total_bytes);
+                    net_checksum_calculate(s->tx_packet, total_bytes, CSUM_ALL);
                 }
 
                 /* Update MAC statistics */
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 628648a..121415a 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -183,13 +183,11 @@ static void process_tx_fcb(eTSEC *etsec)
     uint8_t *l3_header = etsec->tx_buffer + 8 + l3_header_offset;
     /* L4 header */
     uint8_t *l4_header = l3_header + l4_header_offset;
+    int csum = 0;
 
     /* if packet is IP4 and IP checksum is requested */
     if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
-        /* do IP4 checksum (TODO This function does TCP/UDP checksum
-         * but not sure if it also does IP4 checksum.) */
-        net_checksum_calculate(etsec->tx_buffer + 8,
-                etsec->tx_buffer_len - 8);
+        csum |= CSUM_IP;
     }
     /* TODO Check the correct usage of the PHCS field of the FCB in case the NPH
      * flag is on */
@@ -201,9 +199,7 @@ static void process_tx_fcb(eTSEC *etsec)
             /* if checksum is requested */
             if (flags & FCB_TX_CTU) {
                 /* do UDP checksum */
-
-                net_checksum_calculate(etsec->tx_buffer + 8,
-                        etsec->tx_buffer_len - 8);
+                csum |= CSUM_UDP;
             } else {
                 /* set checksum field to 0 */
                 l4_header[6] = 0;
@@ -211,10 +207,14 @@ static void process_tx_fcb(eTSEC *etsec)
             }
         } else if (flags & FCB_TX_CTU) { /* if TCP and checksum is requested */
             /* do TCP checksum */
-            net_checksum_calculate(etsec->tx_buffer + 8,
-                                   etsec->tx_buffer_len - 8);
+            csum |= CSUM_TCP;
         }
     }
+
+    if (csum) {
+        net_checksum_calculate(etsec->tx_buffer + 8,
+                               etsec->tx_buffer_len - 8, csum);
+    }
 }
 
 static void process_tx_bd(eTSEC         *etsec,
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 782ff19..25685ba 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -564,6 +564,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
         ptr += len;
         frame_size += len;
         if (bd.des0 & FTGMAC100_TXDES0_LTS) {
+            int csum = 0;
 
             /* Check for VLAN */
             if (flags & FTGMAC100_TXDES1_INS_VLANTAG &&
@@ -573,8 +574,18 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
             }
 
             if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
-                net_checksum_calculate(s->frame, frame_size);
+                csum |= CSUM_IP;
             }
+            if (flags & FTGMAC100_TXDES1_TCP_CHKSUM) {
+                csum |= CSUM_TCP;
+            }
+            if (flags & FTGMAC100_TXDES1_UDP_CHKSUM) {
+                csum |= CSUM_UDP;
+            }
+            if (csum) {
+                net_checksum_calculate(s->frame, frame_size, csum);
+            }
+
             /* Last buffer in frame.  */
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
             ptr = s->frame;
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 2c14804..f03450c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -561,22 +561,18 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
         ptr += len;
         frame_size += len;
         if (bd.flags & ENET_BD_L) {
+            int csum = 0;
+
             if (bd.option & ENET_BD_PINS) {
-                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
-                if (IP_HEADER_VERSION(ip_hd) == 4) {
-                    net_checksum_calculate(s->frame, frame_size);
-                }
+                csum |= (CSUM_TCP | CSUM_UDP);
             }
             if (bd.option & ENET_BD_IINS) {
-                struct ip_header *ip_hd = PKT_GET_IP_HDR(s->frame);
-                /* We compute checksum only for IPv4 frames */
-                if (IP_HEADER_VERSION(ip_hd) == 4) {
-                    uint16_t csum;
-                    ip_hd->ip_sum = 0;
-                    csum = net_raw_checksum((uint8_t *)ip_hd, sizeof(*ip_hd));
-                    ip_hd->ip_sum = cpu_to_be16(csum);
-                }
+                csum |= CSUM_IP;
+            }
+            if (csum) {
+                net_checksum_calculate(s->frame, frame_size, csum);
             }
+
             /* Last buffer in frame.  */
 
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 044ac95..4082be3 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1471,7 +1471,7 @@ static void work_around_broken_dhclient(struct virtio_net_hdr *hdr,
         (buf[12] == 0x08 && buf[13] == 0x00) && /* ethertype == IPv4 */
         (buf[23] == 17) && /* ip.protocol == UDP */
         (buf[34] == 0 && buf[35] == 67)) { /* udp.srcport == bootps */
-        net_checksum_calculate(buf, size);
+        net_checksum_calculate(buf, size, CSUM_UDP);
         hdr->flags &= ~VIRTIO_NET_HDR_F_NEEDS_CSUM;
     }
 }
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 00a7fdf..5c815b4 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -174,7 +174,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
                     tmpbuf = g_malloc(XC_PAGE_SIZE);
                 }
                 memcpy(tmpbuf, page + txreq.offset, txreq.size);
-                net_checksum_calculate(tmpbuf, txreq.size);
+                net_checksum_calculate(tmpbuf, txreq.size, CSUM_ALL);
                 qemu_send_packet(qemu_get_queue(netdev->nic), tmpbuf,
                                  txreq.size);
             } else {
diff --git a/net/checksum.c b/net/checksum.c
index dabd290..70f4eae 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
     return net_checksum_finish(sum);
 }
 
-void net_checksum_calculate(uint8_t *data, int length)
+void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
 {
     int mac_hdr_len, ip_len;
     struct ip_header *ip;
@@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int length)
     }
 
     /* Calculate IP checksum */
-    stw_he_p(&ip->ip_sum, 0);
-    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
-    stw_be_p(&ip->ip_sum, csum);
+    if (csum_flag & CSUM_IP) {
+        stw_he_p(&ip->ip_sum, 0);
+        csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
+        stw_be_p(&ip->ip_sum, csum);
+    }
 
     if (IP4_IS_FRAGMENT(ip)) {
         return; /* a fragmented IP packet */
@@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int length)
     switch (ip->ip_p) {
     case IP_PROTO_TCP:
     {
+        if (!(csum_flag & CSUM_TCP)) {
+            return;
+        }
+
         tcp_header *tcp = (tcp_header *)(ip + 1);
 
         if (ip_len < sizeof(tcp_header)) {
@@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int length)
     }
     case IP_PROTO_UDP:
     {
+        if (!(csum_flag & CSUM_UDP)) {
+            return;
+        }
+
         udp_header *udp = (udp_header *)(ip + 1);
 
         if (ip_len < sizeof(udp_header)) {
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index e063a81..80caac5 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -114,7 +114,7 @@ static int handle_primary_tcp_pkt(RewriterState *rf,
             tcp_pkt->th_ack = htonl(ntohl(tcp_pkt->th_ack) + conn->offset);
 
             net_checksum_calculate((uint8_t *)pkt->data + pkt->vnet_hdr_len,
-                                   pkt->size - pkt->vnet_hdr_len);
+                                   pkt->size - pkt->vnet_hdr_len, CSUM_TCP);
         }
 
         /*
@@ -216,7 +216,7 @@ static int handle_secondary_tcp_pkt(RewriterState *rf,
             tcp_pkt->th_seq = htonl(ntohl(tcp_pkt->th_seq) - conn->offset);
 
             net_checksum_calculate((uint8_t *)pkt->data + pkt->vnet_hdr_len,
-                                   pkt->size - pkt->vnet_hdr_len);
+                                   pkt->size - pkt->vnet_hdr_len, CSUM_TCP);
         }
     }
 
-- 
2.7.4


