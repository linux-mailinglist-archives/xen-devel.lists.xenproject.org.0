Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pDoyAhgSNGqzNQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:43:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00A6A14F3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:43:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rbj+KWy3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1341413.1601878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEtO-00009H-9W; Thu, 18 Jun 2026 15:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341413.1601878; Thu, 18 Jun 2026 15:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEtO-0008VX-5M; Thu, 18 Jun 2026 15:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1341413;
 Thu, 18 Jun 2026 15:42:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1waEsd-0008GN-Nx
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 15:42:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEsc-00H5lX-Od
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:42:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a3411c4-2eae-0a2a0a5409dd-0a2a4501eb26-20
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:42:10 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a3411d2-e031-0a2a45010019-d155dd33b870-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:42:10 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-462342ac290so1294430f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 08:42:10 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm69038581f8f.28.2026.06.18.08.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 08:42:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781797330; x=1782402130; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylBpQ0bt/QK9zQ9BEMnv21TmNMn+xhUv/pb6/Do4RGs=;
        b=rbj+KWy3MuLyf8Rr+TUqPd5bEk+nz+xnsCAFQLOY9++w0exg1e7Vo27uJuhSUgCnxo
         PmLK1S9i+TCgx/LU9awWybDI3onf4mWhG+oyK2Bc1CYNhzbdmnE8estWRTaOQ1/dv5B8
         UPi9/wqZNay3DQ8/vnZ9moB6c1eiVq2dvLo0ThbTfwy9C5AaKqxy490SRwg+Rm5wBqEh
         Hh1i1nyCKmeh0rxp+IJB4uJt+n34gv0lt2fdIY5FOdXIT026AcjqAoqEBfhqBsr+xSTQ
         QCL50TWvAgsr0BmslyCS9QPkZbZya9t6sNFW6Mhk1Xqc6an7ldDaERrAYCO8ImIuphP0
         IONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781797330; x=1782402130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylBpQ0bt/QK9zQ9BEMnv21TmNMn+xhUv/pb6/Do4RGs=;
        b=hyX0A6GOjLAOB+qisrW8JST/l0hdqpylArHMMjmEtBhWj1cMrsFZbMzToYNqtr0Y3j
         FdeQzJtWnUaA/I/r+2RWGDB/ei0mA6M2PogF00qkFndF0GvAzfBG95tbQDR8ZRVUHdSP
         +VA52pbLjqy01mlemxifTUF0TU/pU8LjOhioHdGaSpJkZM9iUN7MoDn9c0SjY+02h3e1
         etjrUor7eHZG3kOYkZtiwHkSAKrIzwjy/TrKqHmRQ/PZnJ1wsT79vm2Mw6tykBomN7LM
         43uDtmp+HydWLAc+OR54kWl1m+RijdeN9k7zrvht7AGe17CrQjUc09yHJytd9Fo1DGi7
         /IBg==
X-Forwarded-Encrypted: i=1; AFNElJ8SNAg56V8NHlWbXp2T01Xd+4NwXuqM72KnYdx+WUSyD1H5xYPqhGNU3cAgkE09HZ704mSEGkjrGxs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxyb6ySh18c/BFvlZuJBwGypm3UJMkod/P7CeWMUswrAFhdrUnp
	R9le9dzbX7WxLg9aqB/s9Yz9w3eDBMzJ9WnSOfF5EeH8tQkMMzYf8MxJ
X-Gm-Gg: AfdE7cmQhWG0TOpBRVhDmnnf2CuSME4ddv6dfCY3Bvqo5nlXC2fWzsokfv9e4F5dgIy
	werik+7aU+J0ZtfTsZai1CwyAaA28D9iaEL5PlbH7bbzPn5duaHjh0zLki4Bg3LNIumbs0oIZLI
	tynkzgdKrYas62hfuZlDDajbe3psGlsxy08qN8bCJBwnCC4uZjuX5gr2bmWKY9m/mLRfXpuNFJB
	fQxCTfgwR16TmgHMWxWWvKe2V9oo9jPIsmVmu54ChWYbFWrLvgkuoO3DqwbnNZFwlkdm/BnJ3A3
	LPryu8g55+DXvjpLf+BYT5mojKYlUFdDwEWWMqVRMkKtD2Wq+S+bHHaBKg6xsISlWL2/h64dmez
	kLkssJo2atNWCh/gthapcqWuTpYv48CFi7UEZy5ZkMlDgiLdGWwhMPk/3YJI6dnTZjEGf0Zgbod
	UkXA3YxWrDkp4zinq5jIWjmnagHDPZn1SnvFGsiAUMIg==
X-Received: by 2002:a5d:64e3:0:b0:460:3233:beea with SMTP id ffacd0b85a97d-46241b76818mr15062090f8f.42.1781797329944;
        Thu, 18 Jun 2026 08:42:09 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Date: Thu, 18 Jun 2026 17:39:37 +0200
Subject: [PATCH RFC 2/2] vhost-user: implement
 VHOST_USER_PROTOCOL_F_XEN_MMAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-vhost-xen-foreign-mapping-v1-2-7f60a6241971@rt-rk.com>
References: <20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com>
In-Reply-To: <20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com>
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
X-purgate-ID: tlsNG-d62444/1781797330-CE9ADE30-C0E3FD3A/0/0
X-purgate-type: clean
X-purgate-size: 12093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
X-Rspamd-Queue-Id: 4F00A6A14F3

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


