Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA4442322
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 23:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219426.380226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUY-0007y6-61; Mon, 01 Nov 2021 22:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219426.380226; Mon, 01 Nov 2021 22:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhfUX-0007rk-Uc; Mon, 01 Nov 2021 22:09:21 +0000
Received: by outflank-mailman (input) for mailman id 219426;
 Mon, 01 Nov 2021 22:09:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02t=PU=redhat.com=quintela@srs-us1.protection.inumbo.net>)
 id 1mhfUW-0007pr-Rn
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 22:09:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5bcaf38f-3b60-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 22:09:18 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-J9cc_PWgPcGgo6ompzkXhw-1; Mon, 01 Nov 2021 18:09:17 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso181257wme.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 15:09:17 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id a1sm6750809wri.89.2021.11.01.15.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:15 -0700 (PDT)
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
X-Inumbo-ID: 5bcaf38f-3b60-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635804558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkGrv1tXzqIqxPURTbd5P4AwWVT450Zx93AirftplRQ=;
	b=fgXnQqu/9921Qgsaj4wdnFaw38yIE1zJXiLLiS2/o4iWaAmn1tcGk5fDFu5G7tC6nWWkKx
	Xvfi5x9Co64s4I9uxG9DJpEcPktHA9RcwmA2zaic9Crwb5a4XwdIXrqmoYGKMxllw32At1
	2UpDtT3XMgXUKOvA3VW3foVReh6sO1w=
X-MC-Unique: J9cc_PWgPcGgo6ompzkXhw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkGrv1tXzqIqxPURTbd5P4AwWVT450Zx93AirftplRQ=;
        b=2wDSATlFev0bhnuNl2f2vRba/HBnX486zjnE/NZMS2yAgUJ86TP8rEQMCEQ9WN1Vwo
         qJ4yYTHVA/Guk7mW1eu/qJ7E/fQGz77HeEKkIXAwf5Vu1WBZH1Syn5jaihJJdkbCJGEo
         iyYEhFftqEDqqa50ZNVL8bnYRjIV/IF+YYTVGSgwADvl+B/VoCHfI8yxWs9JrobU7Xye
         GxeO4HjJ1SWOEOgdLcBG1OVRV6E2lWpqCjJgCQ8jyBO5AclEtBWWtogr58MtUqz74x4Z
         RpxE6rphnQxy4bONNnhPd4Za7e/xahQQSXXN82dkXOfm7SXYI5xG/JKlEY0Q+ha++R5V
         inTA==
X-Gm-Message-State: AOAM532QwO15/1t0SS7ZDNVUUs9mEpjBiznHFwvnI16RWG1AqBOL8NAT
	MC8p+Q4L3UsqUlaYRPrxb26IExRSiyfhpvEfWzp1gxatZobzOettQxvQYSMZ0gXhDIzipASFEhL
	5OAfz09O6oY/dE7yLqxOo8uJWQFA=
X-Received: by 2002:a1c:f207:: with SMTP id s7mr1888729wmc.179.1635804556023;
        Mon, 01 Nov 2021 15:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdelN3acVNNcauyISlwa7+WeaQgRjEVk9oRjzpL60B7TVIsWjsHCUYyBOoiJZxzWXWvnQUpA==
X-Received: by 2002:a1c:f207:: with SMTP id s7mr1888689wmc.179.1635804555648;
        Mon, 01 Nov 2021 15:09:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PULL 01/20] migration/rdma: Fix out of order wrid
Date: Mon,  1 Nov 2021 23:08:53 +0100
Message-Id: <20211101220912.10039-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Li Zhijian <lizhijian@cn.fujitsu.com>

destination:
../qemu/build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server-migration.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5902,disable-ticketing -incoming rdma:192.168.22.23:8888
qemu-system-x86_64: -spice streaming-video=filter,port=5902,disable-ticketing: warning: short-form boolean option 'disable-ticketing' deprecated
Please use disable-ticketing=on instead
QEMU 6.0.50 monitor - type 'help' for more information
(qemu) trace-event qemu_rdma_block_for_wrid_miss on
(qemu) dest_init RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
qemu_rdma_block_for_wrid_miss A Wanted wrid CONTROL SEND (2000) but got CONTROL RECV (4000)

source:
../qemu/build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5901,disable-ticketing -S
qemu-system-x86_64: -spice streaming-video=filter,port=5901,disable-ticketing: warning: short-form boolean option 'disable-ticketing' deprecated
Please use disable-ticketing=on instead
QEMU 6.0.50 monitor - type 'help' for more information
(qemu)
(qemu) trace-event qemu_rdma_block_for_wrid_miss on
(qemu) migrate -d rdma:192.168.22.23:8888
source_resolve_host RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
(qemu) qemu_rdma_block_for_wrid_miss A Wanted wrid WRITE RDMA (1) but got CONTROL RECV (4000)

NOTE: we use soft RoCE as the rdma device.
[root@iaas-rpma images]# rdma link show rxe_eth0/1
link rxe_eth0/1 state ACTIVE physical_state LINK_UP netdev eth0

This migration could not be completed when out of order(OOO) CQ event occurs.
The send queue and receive queue shared a same completion queue, and
qemu_rdma_block_for_wrid() will drop the CQs it's not interested in. But
the dropped CQs by qemu_rdma_block_for_wrid() could be later CQs it wants.
So in this case, qemu_rdma_block_for_wrid() will block forever.

OOO cases will occur in both source side and destination side. And a
forever blocking happens on only SEND and RECV are out of order. OOO between
'WRITE RDMA' and 'RECV' doesn't matter.

below the OOO sequence:
       source                             destination
      rdma_write_one()                   qemu_rdma_registration_handle()
1.    S1: post_recv X                    D1: post_recv Y
2.    wait for recv CQ event X
3.                                       D2: post_send X     ---------------+
4.                                       wait for send CQ send event X (D2) |
5.    recv CQ event X reaches (D2)                                          |
6.  +-S2: post_send Y                                                       |
7.  | wait for send CQ event Y                                              |
8.  |                                    recv CQ event Y (S2) (drop it)     |
9.  +-send CQ event Y reaches (S2)                                          |
10.                                      send CQ event X reaches (D2)  -----+
11.                                      wait recv CQ event Y (dropped by (8))

Although a hardware IB works fine in my a hundred of runs, the IB specification
doesn't guaratee the CQ order in such case.

Here we introduce a independent send completion queue to distinguish
ibv_post_send completion queue from the original mixed completion queue.
It helps us to poll the specific CQE we are really interested in.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 138 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 101 insertions(+), 37 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 2a3c7889b9..f5d3bbe7e9 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -358,9 +358,11 @@ typedef struct RDMAContext {
     struct ibv_context          *verbs;
     struct rdma_event_channel   *channel;
     struct ibv_qp *qp;                      /* queue pair */
-    struct ibv_comp_channel *comp_channel;  /* completion channel */
+    struct ibv_comp_channel *recv_comp_channel;  /* recv completion channel */
+    struct ibv_comp_channel *send_comp_channel;  /* send completion channel */
     struct ibv_pd *pd;                      /* protection domain */
-    struct ibv_cq *cq;                      /* completion queue */
+    struct ibv_cq *recv_cq;                 /* recvieve completion queue */
+    struct ibv_cq *send_cq;                 /* send completion queue */
 
     /*
      * If a previous write failed (perhaps because of a failed
@@ -1059,21 +1061,34 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
         return -1;
     }
 
-    /* create completion channel */
-    rdma->comp_channel = ibv_create_comp_channel(rdma->verbs);
-    if (!rdma->comp_channel) {
-        error_report("failed to allocate completion channel");
+    /* create receive completion channel */
+    rdma->recv_comp_channel = ibv_create_comp_channel(rdma->verbs);
+    if (!rdma->recv_comp_channel) {
+        error_report("failed to allocate receive completion channel");
         goto err_alloc_pd_cq;
     }
 
     /*
-     * Completion queue can be filled by both read and write work requests,
-     * so must reflect the sum of both possible queue sizes.
+     * Completion queue can be filled by read work requests.
      */
-    rdma->cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
-            NULL, rdma->comp_channel, 0);
-    if (!rdma->cq) {
-        error_report("failed to allocate completion queue");
+    rdma->recv_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
+                                  NULL, rdma->recv_comp_channel, 0);
+    if (!rdma->recv_cq) {
+        error_report("failed to allocate receive completion queue");
+        goto err_alloc_pd_cq;
+    }
+
+    /* create send completion channel */
+    rdma->send_comp_channel = ibv_create_comp_channel(rdma->verbs);
+    if (!rdma->send_comp_channel) {
+        error_report("failed to allocate send completion channel");
+        goto err_alloc_pd_cq;
+    }
+
+    rdma->send_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
+                                  NULL, rdma->send_comp_channel, 0);
+    if (!rdma->send_cq) {
+        error_report("failed to allocate send completion queue");
         goto err_alloc_pd_cq;
     }
 
@@ -1083,11 +1098,19 @@ err_alloc_pd_cq:
     if (rdma->pd) {
         ibv_dealloc_pd(rdma->pd);
     }
-    if (rdma->comp_channel) {
-        ibv_destroy_comp_channel(rdma->comp_channel);
+    if (rdma->recv_comp_channel) {
+        ibv_destroy_comp_channel(rdma->recv_comp_channel);
+    }
+    if (rdma->send_comp_channel) {
+        ibv_destroy_comp_channel(rdma->send_comp_channel);
+    }
+    if (rdma->recv_cq) {
+        ibv_destroy_cq(rdma->recv_cq);
+        rdma->recv_cq = NULL;
     }
     rdma->pd = NULL;
-    rdma->comp_channel = NULL;
+    rdma->recv_comp_channel = NULL;
+    rdma->send_comp_channel = NULL;
     return -1;
 
 }
@@ -1104,8 +1127,8 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
     attr.cap.max_recv_wr = 3;
     attr.cap.max_send_sge = 1;
     attr.cap.max_recv_sge = 1;
-    attr.send_cq = rdma->cq;
-    attr.recv_cq = rdma->cq;
+    attr.send_cq = rdma->send_cq;
+    attr.recv_cq = rdma->recv_cq;
     attr.qp_type = IBV_QPT_RC;
 
     ret = rdma_create_qp(rdma->cm_id, rdma->pd, &attr);
@@ -1496,14 +1519,14 @@ static void qemu_rdma_signal_unregister(RDMAContext *rdma, uint64_t index,
  * (of any kind) has completed.
  * Return the work request ID that completed.
  */
-static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
-                               uint32_t *byte_len)
+static uint64_t qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
+                               uint64_t *wr_id_out, uint32_t *byte_len)
 {
     int ret;
     struct ibv_wc wc;
     uint64_t wr_id;
 
-    ret = ibv_poll_cq(rdma->cq, 1, &wc);
+    ret = ibv_poll_cq(cq, 1, &wc);
 
     if (!ret) {
         *wr_id_out = RDMA_WRID_NONE;
@@ -1575,7 +1598,8 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
 /* Wait for activity on the completion channel.
  * Returns 0 on success, none-0 on error.
  */
-static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
+static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
+                                       struct ibv_comp_channel *comp_channel)
 {
     struct rdma_cm_event *cm_event;
     int ret = -1;
@@ -1586,7 +1610,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
      */
     if (rdma->migration_started_on_destination &&
         migration_incoming_get_current()->state == MIGRATION_STATUS_ACTIVE) {
-        yield_until_fd_readable(rdma->comp_channel->fd);
+        yield_until_fd_readable(comp_channel->fd);
     } else {
         /* This is the source side, we're in a separate thread
          * or destination prior to migration_fd_process_incoming()
@@ -1597,7 +1621,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
          */
         while (!rdma->error_state  && !rdma->received_error) {
             GPollFD pfds[2];
-            pfds[0].fd = rdma->comp_channel->fd;
+            pfds[0].fd = comp_channel->fd;
             pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
             pfds[0].revents = 0;
 
@@ -1655,6 +1679,17 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
     return rdma->error_state;
 }
 
+static struct ibv_comp_channel *to_channel(RDMAContext *rdma, int wrid)
+{
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_comp_channel :
+           rdma->recv_comp_channel;
+}
+
+static struct ibv_cq *to_cq(RDMAContext *rdma, int wrid)
+{
+    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_cq : rdma->recv_cq;
+}
+
 /*
  * Block until the next work request has completed.
  *
@@ -1675,13 +1710,15 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
     struct ibv_cq *cq;
     void *cq_ctx;
     uint64_t wr_id = RDMA_WRID_NONE, wr_id_in;
+    struct ibv_comp_channel *ch = to_channel(rdma, wrid_requested);
+    struct ibv_cq *poll_cq = to_cq(rdma, wrid_requested);
 
-    if (ibv_req_notify_cq(rdma->cq, 0)) {
+    if (ibv_req_notify_cq(poll_cq, 0)) {
         return -1;
     }
     /* poll cq first */
     while (wr_id != wrid_requested) {
-        ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
+        ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
         if (ret < 0) {
             return ret;
         }
@@ -1702,12 +1739,12 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
     }
 
     while (1) {
-        ret = qemu_rdma_wait_comp_channel(rdma);
+        ret = qemu_rdma_wait_comp_channel(rdma, ch);
         if (ret) {
             goto err_block_for_wrid;
         }
 
-        ret = ibv_get_cq_event(rdma->comp_channel, &cq, &cq_ctx);
+        ret = ibv_get_cq_event(ch, &cq, &cq_ctx);
         if (ret) {
             perror("ibv_get_cq_event");
             goto err_block_for_wrid;
@@ -1721,7 +1758,7 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
         }
 
         while (wr_id != wrid_requested) {
-            ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
+            ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
             if (ret < 0) {
                 goto err_block_for_wrid;
             }
@@ -2437,13 +2474,21 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma_destroy_qp(rdma->cm_id);
         rdma->qp = NULL;
     }
-    if (rdma->cq) {
-        ibv_destroy_cq(rdma->cq);
-        rdma->cq = NULL;
+    if (rdma->recv_cq) {
+        ibv_destroy_cq(rdma->recv_cq);
+        rdma->recv_cq = NULL;
     }
-    if (rdma->comp_channel) {
-        ibv_destroy_comp_channel(rdma->comp_channel);
-        rdma->comp_channel = NULL;
+    if (rdma->send_cq) {
+        ibv_destroy_cq(rdma->send_cq);
+        rdma->send_cq = NULL;
+    }
+    if (rdma->recv_comp_channel) {
+        ibv_destroy_comp_channel(rdma->recv_comp_channel);
+        rdma->recv_comp_channel = NULL;
+    }
+    if (rdma->send_comp_channel) {
+        ibv_destroy_comp_channel(rdma->send_comp_channel);
+        rdma->send_comp_channel = NULL;
     }
     if (rdma->pd) {
         ibv_dealloc_pd(rdma->pd);
@@ -3115,10 +3160,14 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
     if (io_read) {
-        aio_set_fd_handler(ctx, rioc->rdmain->comp_channel->fd,
+        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
+                           false, io_read, io_write, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
     } else {
-        aio_set_fd_handler(ctx, rioc->rdmaout->comp_channel->fd,
+        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
+                           false, io_read, io_write, NULL, opaque);
+        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
                            false, io_read, io_write, NULL, opaque);
     }
 }
@@ -3332,7 +3381,22 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
      */
     while (1) {
         uint64_t wr_id, wr_id_in;
-        int ret = qemu_rdma_poll(rdma, &wr_id_in, NULL);
+        int ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
+        if (ret < 0) {
+            error_report("rdma migration: polling error! %d", ret);
+            goto err;
+        }
+
+        wr_id = wr_id_in & RDMA_WRID_TYPE_MASK;
+
+        if (wr_id == RDMA_WRID_NONE) {
+            break;
+        }
+    }
+
+    while (1) {
+        uint64_t wr_id, wr_id_in;
+        int ret = qemu_rdma_poll(rdma, rdma->send_cq, &wr_id_in, NULL);
         if (ret < 0) {
             error_report("rdma migration: polling error! %d", ret);
             goto err;
-- 
2.33.1


