Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6zHEMr8zRmrHLgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:47:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C56F5790
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:47:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ff1iX/hV";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1351518.1608693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE15-0004GF-RC; Thu, 02 Jul 2026 09:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351518.1608693; Thu, 02 Jul 2026 09:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE15-0004Ee-M5; Thu, 02 Jul 2026 09:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1351518;
 Thu, 02 Jul 2026 09:47:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1wfE14-0004Dm-Oq
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:47:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfE14-00DI0b-4w
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:47:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a4633ad-bab6-0a2a0a5309dd-0a2a4502a6dc-20
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:47:30 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a4633ae-5a27-0a2a45020019-d155dd2df0fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:47:26 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4763b0c1dcdso1632335f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:47:26 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a15sm7539152f8f.14.2026.07.02.02.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 02:47:26 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985646; x=1783590446; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylBpQ0bt/QK9zQ9BEMnv21TmNMn+xhUv/pb6/Do4RGs=;
        b=Ff1iX/hV73wsQ6BINWM9CpYruivuosCueau4Yv4HSs0BKcCQv9Y8fqJmf8964YuLhx
         ydu8XxV65ETj4EVw/9Zj/kFRcwGHp0r62C5jIBWaBkClP5vPtWkxXu+iLpbGwSjAMu0b
         tVLtszB4W6A2877XPSCCJkFrU9+5iUGEodRMeS8uWd0mKlf1cOWKv1YYE2Ms1o82DO4K
         MT/RTa+h6byM0cxmLuiPgmWtvWhFd4MGdukvppcZkEwNQTkKamTB1mMlAvctGrhC+ni5
         Tv1cfIgqM5WD/B29p0Bt3jxFcYMiLlqslggb2X1zmb08jhHwZS9Y8yENVPr67e54nUQr
         Qujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985646; x=1783590446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylBpQ0bt/QK9zQ9BEMnv21TmNMn+xhUv/pb6/Do4RGs=;
        b=AmvXrLJh+n0lOvp/ZcADQwcpy+hZL7n47uk6P6yhSPRXdhior11qpzSUwXHnLNA/0W
         PAz74Pu09VAMCSL28rGrpJFxqXAUMA8aK7lFVCnJ8jdwt9RzSU8YLqP/grZoQt2Q0yW0
         yvNtSlkq0CQDz7jcM3t7h9SNr201nrXGNyaW/3IpObKOzzFEpWZ1b6bajnJQ8457GJin
         /WZgUfHcz6nZvo9n/kBbEq+esaVqd/41T4W/fK9fEUgAtjdATA3VSHBCt4P85aLvKN55
         0rkz3LNoaoywpNO+CoMq8KDJ1m7d7vlfXEtoPZOSznZPVOpab9kfbKA/oBMqf8FB9pDf
         Utvg==
X-Forwarded-Encrypted: i=1; AFNElJ8KgeDXSOkOEiJ4rkGRhOW490EsDM9kWmp/Hz+ga3AyArVjHQpTWsPpRrQvVbjtpIpqTJPXZVMch2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yysq0C9MyzdYV1+b97G0yfmVOQXdxeExJDmzYXBsvODFXnAoy+X
	tQx/P74YWCYJ4DJhJFUaCx5U8hvjpI1CEVW0XJJFeLbrB1t2zJEMYM0Y
X-Gm-Gg: AfdE7cmVbrXD2qQeZ72FFMppTpev9cn9GUfxVOZ8VkhKh243BKGNIB2A5cKLEYlmLWL
	oGpUhRGRvt99n5lTjqrtW8n5GTGsQRJOI3lQL76ux7pKhloVPU1Ceh317zUnqpAZ/EqMHzIuMeI
	by3vRaw+Ly9BrQF5E0cBDpmbnkfnJNiOFgePvLm9jadbSznVCoZDgCxfdMd6yye+31RngIG3NwJ
	QE7JbmUKaYJKrT13EYQV6pV8tkes/Kmg357bzhOEITzR3KQ7ZJ/6gCNRJLj1Opc0nY67p4oS4hk
	PtfNDE6r1j4twEgPUx1FiHsZhaGn0yzZ03WeQs7nBC5ZrzEP/41MMY5V2siJmmearL1cNriPk39
	XRvLY97Fi9MKEUjTH1INgxTNaA2d3oRI9IJkTKqGKm8+9q3YgTM/3xgJkplZOvmAo90Vuu27nhk
	e7e4FYbkTK+COSIyfmeGifFrtogaOW3idt+1QGPx2Nig==
X-Received: by 2002:a05:600c:8286:b0:493:c42c:7e88 with SMTP id 5b1f17b1804b1-493c42c8307mr52961315e9.34.1782985646320;
        Thu, 02 Jul 2026 02:47:26 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Date: Thu, 02 Jul 2026 11:46:13 +0200
Subject: [PATCH RFC v3 2/2] vhost-user: implement
 VHOST_USER_PROTOCOL_F_XEN_MMAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-vhost-xen-foreign-mapping-v3-2-2b8ef913382b@rt-rk.com>
References: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
In-Reply-To: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org, Viresh Kumar <viresh.kumar@linaro.org>, 
 Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
 Nikola Jelic <Nikola.Jelic@rt-rk.com>
X-Mailer: b4 0.13.0
X-purgate-ID: tlsNG-720697/1782985646-4FB1F7C5-5DBB5988/0/0
X-purgate-type: clean
X-purgate-size: 12093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mst@redhat.com,m:sgarzare@redhat.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:viresh.kumar@linaro.org,m:Dusan.Stojkovic@rt-rk.com,m:Nikola.Jelic@rt-rk.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,xenproject.org,gmail.com,lists.xenproject.org,linaro.org,rt-rk.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF1C56F5790

From: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>

The vhost-user specification reserves protocol feature bit 17 and
documents an extended memory region description for backends that map
guest memory through Xen rather than mapping a file descriptor each
region carries two extra fields, "xen mmap flags" and "domid" (see
docs/interop/vhost-user.rst, "Memory region description").
The layout is implemented by rust-vmm's vhost and vm-memory crates
and used by Xen vhost-user device backends.

Implement the front-end side for foreign mappings:

- negotiate VHOST_USER_PROTOCOL_F_XEN_MMAP

- when negotiated, build SET_MEM_TABLE payloads from the extended
  region layout, with xen_mmap_flags = FOREIGN and
  xen_mmap_data set to the guest's domain id.

- under Xen, do not call vhost_user_get_mr_data(): guest RAM has no fd
  and its userspace_addr does not correspond to a valid mapping in the
  address space. Backends map regions through privcmd using the guest
  physical address and domid; the fd accompanying each region only
  satisfies the protocol's one-fd-per-region requirement. Pass a
  /dev/xen/privcmd fd and close it once the message has been sent.
  Tracepoints for opening and closing xen fds are added as well.

- suppress VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS under Xen:
  Postcopy is likewise refused.

The userspace_addr field is carried unchanged; Xen backends derive
mappings from guest_phys_addr and domid and do not interpret it.

Signed-off-by: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
Signed-off-by: Nikola Jelic <Nikola.Jelic@rt-rk.com>
---
 hw/virtio/trace-events         |   2 +
 hw/virtio/vhost-user.c         | 120 +++++++++++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost-user.h |   2 +-
 3 files changed, 120 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2a57edc21e..0f3c58fd78 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -30,6 +30,8 @@ vhost_user_postcopy_fault_handler_found(int i, uint64_t region_offset, uint64_t
 vhost_user_postcopy_listen(void) ""
 vhost_user_set_mem_table_postcopy(uint64_t client_addr, uint64_t qhva, int reply_i, int region_i) "client:0x%"PRIx64" for hva: 0x%"PRIx64" reply %d region %d"
 vhost_user_set_mem_table_withfd(int index, const char *name, uint64_t memory_size, uint64_t guest_phys_addr, uint64_t userspace_addr, uint64_t offset) "%d:%s: size:0x%"PRIx64" GPA:0x%"PRIx64" QVA/userspace:0x%"PRIx64" RB offset:0x%"PRIx64
+vhost_user_open_region_fd(int index, int fd) "region:%d fd:%d"
+vhost_user_put_region_fds(int index, int fd) "region:%d fd:%d"
 vhost_user_postcopy_waker(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
 vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d627351f45..932ead4eeb 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -30,6 +30,8 @@
 #include "migration/postcopy-ram.h"
 #include "trace.h"
 #include "system/ramblock.h"
+#include "system/xen.h"
+#include "hw/xen/xen.h"
 
 #include <sys/ioctl.h>
 #include <sys/socket.h>
@@ -181,12 +183,36 @@ typedef struct VhostUserMemoryRegion {
     uint64_t mmap_offset;
 } VhostUserMemoryRegion;
 
+/*
+ * Memory region flags for VHOST_USER_PROTOCOL_F_XEN_MMAP, matching the
+ * values used by rust-vmm's vm-memory (MmapXenFlags).
+ */
+#define VHOST_USER_XEN_MMAP_FLAG_FOREIGN    0x1
+#define VHOST_USER_XEN_MMAP_FLAG_GRANT      0x2
+
+/*
+ * Extended memory region description, used when
+ * VHOST_USER_PROTOCOL_F_XEN_MMAP has been negotiated.
+ */
+typedef struct VhostUserMemoryRegionXen {
+    VhostUserMemoryRegion region;
+    uint32_t xen_mmap_flags;
+    uint32_t xen_mmap_data; /* domain id for FOREIGN/GRANT mappings */
+} VhostUserMemoryRegionXen;
+
+
 typedef struct VhostUserMemory {
     uint32_t nregions;
     uint32_t padding;
     VhostUserMemoryRegion regions[VHOST_MEMORY_BASELINE_NREGIONS];
 } VhostUserMemory;
 
+typedef struct VhostUserMemoryXen {
+    uint32_t nregions;
+    uint32_t padding;
+    VhostUserMemoryRegionXen regions[VHOST_MEMORY_BASELINE_NREGIONS];
+} VhostUserMemoryXen;
+
 typedef struct VhostUserMemRegMsg {
     uint64_t padding;
     VhostUserMemoryRegion region;
@@ -294,6 +320,7 @@ typedef union {
         struct vhost_vring_state state;
         struct vhost_vring_addr addr;
         VhostUserMemory memory;
+        VhostUserMemoryXen memory_xen;
         VhostUserMemRegMsg mem_reg;
         VhostUserLog log;
         struct vhost_iotlb_msg iotlb;
@@ -594,6 +621,8 @@ static MemoryRegion *vhost_user_get_mr_data(uint64_t addr, ram_addr_t *offset,
 static bool vhost_user_gpa_addresses(struct vhost_dev *dev)
 {
     return vhost_user_has_protocol_feature(
+        dev, VHOST_USER_PROTOCOL_F_XEN_MMAP) ||
+        vhost_user_has_protocol_feature(
         dev, VHOST_USER_PROTOCOL_F_GPA_ADDRESSES);
 }
 
@@ -612,6 +641,23 @@ static void vhost_user_fill_msg_region(struct vhost_dev *dev,
     dst->mmap_offset = mmap_offset;
 }
 
+/*
+ * With VHOST_USER_PROTOCOL_F_XEN_MMAP the region fds are opened by us
+ * rather than owned by the RAMBlocks, so they must be closed once the
+ * message carrying them has been sent (or on error).
+ */
+static void vhost_user_put_region_fds(struct vhost_dev *dev, int *fds,
+                                      size_t fd_num)
+{
+    if (!vhost_user_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_XEN_MMAP)) {
+        return;
+    }
+    for (size_t i = 0; i < fd_num; i++) {
+        trace_vhost_user_put_region_fds(i, fds[i]);
+        close(fds[i]);
+    }
+}
+
 static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
                                              struct vhost_dev *dev,
                                              VhostUserMsg *msg,
@@ -623,13 +669,41 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
     MemoryRegion *mr;
     struct vhost_memory_region *reg;
     VhostUserMemoryRegion region_buffer;
+    bool xen_mmap = vhost_user_has_protocol_feature(dev,
+            VHOST_USER_PROTOCOL_F_XEN_MMAP);
+
+    if (track_ramblocks && xen_mmap) {
+        error_report("vhost-user: postcopy is not supported under Xen");
+        return -ENOTSUP;
+    }
 
     msg->hdr.request = VHOST_USER_SET_MEM_TABLE;
 
     for (i = 0; i < dev->mem->nregions; ++i) {
         reg = dev->mem->regions + i;
 
-        mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
+        if (xen_mmap) {
+            /*
+             * Under Xen the guest RAM is not mapped into our address
+             * space; the backend maps it through the Xen foreign
+             * mapping interface using the guest physical address and
+             * domain id carried in the region descriptor.  The file
+             * descriptor only satisfies the one-fd-per-region
+             * requirement of the protocol: pass /dev/xen/privcmd and
+             * close it once the message has been sent.
+             */
+            mr = NULL;
+            offset = 0;
+            fd = open("/dev/xen/privcmd", O_RDWR | O_CLOEXEC);
+            if (fd < 0) {
+                error_report("vhost-user: failed to open /dev/xen/privcmd:"
+                             " %s", strerror(errno));
+                return -errno;
+            }
+            trace_vhost_user_open_region_fd(i, fd);
+        } else {
+            mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
+        }
         if (fd > 0) {
             if (track_ramblocks) {
                 assert(*fd_num < VHOST_MEMORY_BASELINE_NREGIONS);
@@ -642,10 +716,21 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
                 u->region_rb[i] = mr->ram_block;
             } else if (*fd_num == VHOST_MEMORY_BASELINE_NREGIONS) {
                 error_report("Failed preparing vhost-user memory table msg");
+                if (xen_mmap) {
+                    close(fd);
+                }
                 return -ENOBUFS;
             }
             vhost_user_fill_msg_region(dev, &region_buffer, reg, offset);
-            msg->payload.memory.regions[*fd_num] = region_buffer;
+            if (xen_mmap) {
+                msg->payload.memory_xen.regions[*fd_num].region = region_buffer;
+                msg->payload.memory_xen.regions[*fd_num].xen_mmap_flags =
+                    VHOST_USER_XEN_MMAP_FLAG_FOREIGN;
+                msg->payload.memory_xen.regions[*fd_num].xen_mmap_data =
+                    xen_domid;
+            } else {
+                msg->payload.memory.regions[*fd_num] = region_buffer;
+            }
             fds[(*fd_num)++] = fd;
         } else if (track_ramblocks) {
             u->region_rb_offset[i] = 0;
@@ -663,7 +748,11 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
 
     msg->hdr.size = sizeof(msg->payload.memory.nregions);
     msg->hdr.size += sizeof(msg->payload.memory.padding);
-    msg->hdr.size += *fd_num * sizeof(VhostUserMemoryRegion);
+    if (xen_mmap) {
+        msg->hdr.size += *fd_num * sizeof(VhostUserMemoryRegionXen);
+    } else {
+        msg->hdr.size += *fd_num * sizeof(VhostUserMemoryRegion);
+    }
 
     return 0;
 }
@@ -1149,10 +1238,12 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
         ret = vhost_user_fill_set_mem_table_msg(u, dev, &msg, fds, &fd_num,
                                                 false);
         if (ret < 0) {
+            vhost_user_put_region_fds(dev, fds, fd_num);
             return ret;
         }
 
         ret = vhost_user_write(dev, &msg, fds, fd_num);
+        vhost_user_put_region_fds(dev, fds, fd_num);
         if (ret < 0) {
             return ret;
         }
@@ -2551,6 +2642,29 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
                                VHOST_USER_PROTOCOL_F_GET_VRING_BASE_INFLIGHT);
         }
 
+        if (!xen_enabled()) {
+            /*
+             * Xen memory mappings only make sense when QEMU itself runs
+             * as a Xen device model.
+             */
+            protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_XEN_MMAP);
+        } else {
+            if (!virtio_has_feature(protocol_features,
+                                    VHOST_USER_PROTOCOL_F_XEN_MMAP)) {
+                error_setg(errp, "vhost-user backend does not support "
+                           "VHOST_USER_PROTOCOL_F_XEN_MMAP, which is "
+                           "required when running under Xen");
+                return -EPROTO;
+            }
+            /*
+             * The ADD/REM_MEM_REG message path has not been adapted to
+             * the Xen region format.  Xen guests expose a single RAM
+             * region, so fall back to SET_MEM_TABLE.
+             */
+            protocol_features &=
+                ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS);
+        }
+
         /* final set of protocol features */
         u->protocol_features = protocol_features;
         err = vhost_user_set_protocol_features(dev, u->protocol_features);
diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index 06c360af18..46be9cd57c 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -30,7 +30,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
     VHOST_USER_PROTOCOL_F_STATUS = 16,
-    /* Feature 17 reserved for VHOST_USER_PROTOCOL_F_XEN_MMAP. */
+    VHOST_USER_PROTOCOL_F_XEN_MMAP = 17,
     VHOST_USER_PROTOCOL_F_SHARED_OBJECT = 18,
     VHOST_USER_PROTOCOL_F_DEVICE_STATE = 19,
     VHOST_USER_PROTOCOL_F_GET_VRING_BASE_INFLIGHT = 20,

-- 
2.43.0


