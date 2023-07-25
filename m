Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DC760ACE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 08:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569454.890209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBpX-0005de-Vr; Tue, 25 Jul 2023 06:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569454.890209; Tue, 25 Jul 2023 06:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBpX-0005at-RM; Tue, 25 Jul 2023 06:47:35 +0000
Received: by outflank-mailman (input) for mailman id 569454;
 Tue, 25 Jul 2023 06:47:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXT9=DL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qOBpW-0005an-9Y
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 06:47:34 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20e001e0-2ab7-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 08:47:32 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-666eb03457cso2896212b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 23:47:32 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 p18-20020a170902a41200b001bb9f104333sm3906512plq.12.2023.07.24.23.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 23:47:30 -0700 (PDT)
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
X-Inumbo-ID: 20e001e0-2ab7-11ee-b23d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690267651; x=1690872451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWzN+HUQXSE8CC0n86w1+/sl9/LWI75RHk+lRbcP7uQ=;
        b=vK/cpq+XWmV8elkOjGqR/FSbCh2+QA4jEpC+cdRsN1NvyTMYsKV900RWFOhyZ9DDiz
         JPo2TwZXFnBZf8fYGuMsI07osGoJvNY14R0ysPvEc6Ft9LJsCyPJtA8fuelswb6wIEP4
         WiOBcqZ6dSb68yF/rku5wz1zmo7QpEE4diqQmccpU5rSzXh5SIhhG4hFZY+eUM92M691
         hHwUJILbZQ40y5SmT8UTK7wrSrDx2jt3LfRHbwIAunSeJcGtMDYePQOoErkIQ/EKeeoh
         b9XZ3hK6PvAww6Plv4TTmERMqij2sTkksKPGlH9MhH37EdZEuM0c+Gz2DFq5Q4+xWbW+
         k2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690267651; x=1690872451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWzN+HUQXSE8CC0n86w1+/sl9/LWI75RHk+lRbcP7uQ=;
        b=IiEO6i0bqmbk24Z9mDDjxx16PLQnLTgYYOvrLnKcGURHDjgWF+wVYmUlnXXPs8qQw8
         kfWgdVrUxYz5WhzMXukrAALU2KTMsULn3ja72BlLFdqTbuq+sZHKwED+H/q9qNWYwzTr
         WwoZWO74TqwLjAYD2RcLBkGkAfxVL7P4XdTlnEj7TwWDZ58wWC9NIWlaU0zyrRdQ8XNI
         6qVRGCxWJOMyE+YYRVVCHnaUp96DjnAZ+q2ywpndSZPXjwE1uAjyfvO7lukeAArXL8Rm
         f2Z1CYEdZD7ItfSDkvqBdvsZc2pyHAMEj+Ps9M2Q7/YF8PYpi+lzzhYDVlS6IKIdAPK+
         7ZXQ==
X-Gm-Message-State: ABy/qLZJiYuLaPStrAkfVoLAGNaa4glRJHxKWJzqiddTnfwmte7eDKFi
	pdmEN11Uq4qLPUO5/6I2Nx1rJA==
X-Google-Smtp-Source: APBJJlEUiVNnwpl1ujfGTV4J3Wl9UlyHhagVQvV3W3y2/Umq0sU3Sc1U7L8vMx0LSpx0aqXmnEzaDQ==
X-Received: by 2002:a05:6a20:42a5:b0:126:306b:c6d4 with SMTP id o37-20020a056a2042a500b00126306bc6d4mr9851386pzj.23.1690267650623;
        Mon, 24 Jul 2023 23:47:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/2] xen: Update dm_op.h from Xen public header
Date: Tue, 25 Jul 2023 12:17:25 +0530
Message-Id: <ffae9d7021829fea19fd93fda3c30b52b0af923e.1690190453.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the definitions in dm_op.h from Xen public header (latest commit
0c53c638e162 ("tools/xenstore: fix XSA-417 patch")).

List of changes done to the file after copying from Xen:
- Updated paths of included files.
- Removed typedef definitions, as is done for other Xen headers (as per
  kernel coding guidelines).
- Removed some not-so-useful comments.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->V3:
- Updated commit log with more details.

V1->V2:
- New commit.

 include/xen/interface/hvm/dm_op.h | 445 ++++++++++++++++++++++++++++++
 1 file changed, 445 insertions(+)

diff --git a/include/xen/interface/hvm/dm_op.h b/include/xen/interface/hvm/dm_op.h
index 08d972f87c7b..bc6948fd1815 100644
--- a/include/xen/interface/hvm/dm_op.h
+++ b/include/xen/interface/hvm/dm_op.h
@@ -6,6 +6,451 @@
 #ifndef __XEN_PUBLIC_HVM_DM_OP_H__
 #define __XEN_PUBLIC_HVM_DM_OP_H__
 
+#include <xen/interface/xen.h>
+#include <xen/interface/event_channel.h>
+
+#ifndef uint64_aligned_t
+#define uint64_aligned_t uint64_t
+#endif
+
+/*
+ * IOREQ Servers
+ *
+ * The interface between an I/O emulator and Xen is called an IOREQ Server.
+ * A domain supports a single 'legacy' IOREQ Server which is instantiated if
+ * parameter...
+ *
+ * HVM_PARAM_IOREQ_PFN is read (to get the gfn containing the synchronous
+ * ioreq structures), or...
+ * HVM_PARAM_BUFIOREQ_PFN is read (to get the gfn containing the buffered
+ * ioreq ring), or...
+ * HVM_PARAM_BUFIOREQ_EVTCHN is read (to get the event channel that Xen uses
+ * to request buffered I/O emulation).
+ *
+ * The following hypercalls facilitate the creation of IOREQ Servers for
+ * 'secondary' emulators which are invoked to implement port I/O, memory, or
+ * PCI config space ranges which they explicitly register.
+ */
+
+typedef uint16_t ioservid_t;
+
+/*
+ * XEN_DMOP_create_ioreq_server: Instantiate a new IOREQ Server for a
+ *                               secondary emulator.
+ *
+ * The <id> handed back is unique for target domain. The valur of
+ * <handle_bufioreq> should be one of HVM_IOREQSRV_BUFIOREQ_* defined in
+ * hvm_op.h. If the value is HVM_IOREQSRV_BUFIOREQ_OFF then  the buffered
+ * ioreq ring will not be allocated and hence all emulation requests to
+ * this server will be synchronous.
+ */
+#define XEN_DMOP_create_ioreq_server 1
+
+struct xen_dm_op_create_ioreq_server {
+    /* IN - should server handle buffered ioreqs */
+    uint8_t handle_bufioreq;
+    uint8_t pad[3];
+    /* OUT - server id */
+    ioservid_t id;
+};
+
+/*
+ * XEN_DMOP_get_ioreq_server_info: Get all the information necessary to
+ *                                 access IOREQ Server <id>.
+ *
+ * If the IOREQ Server is handling buffered emulation requests, the
+ * emulator needs to bind to event channel <bufioreq_port> to listen for
+ * them. (The event channels used for synchronous emulation requests are
+ * specified in the per-CPU ioreq structures).
+ * In addition, if the XENMEM_acquire_resource memory op cannot be used,
+ * the emulator will need to map the synchronous ioreq structures and
+ * buffered ioreq ring (if it exists) from guest memory. If <flags> does
+ * not contain XEN_DMOP_no_gfns then these pages will be made available and
+ * the frame numbers passed back in gfns <ioreq_gfn> and <bufioreq_gfn>
+ * respectively. (If the IOREQ Server is not handling buffered emulation
+ * only <ioreq_gfn> will be valid).
+ *
+ * NOTE: To access the synchronous ioreq structures and buffered ioreq
+ *       ring, it is preferable to use the XENMEM_acquire_resource memory
+ *       op specifying resource type XENMEM_resource_ioreq_server.
+ */
+#define XEN_DMOP_get_ioreq_server_info 2
+
+struct xen_dm_op_get_ioreq_server_info {
+    /* IN - server id */
+    ioservid_t id;
+    /* IN - flags */
+    uint16_t flags;
+
+#define _XEN_DMOP_no_gfns 0
+#define XEN_DMOP_no_gfns (1u << _XEN_DMOP_no_gfns)
+
+    /* OUT - buffered ioreq port */
+    evtchn_port_t bufioreq_port;
+    /* OUT - sync ioreq gfn (see block comment above) */
+    uint64_aligned_t ioreq_gfn;
+    /* OUT - buffered ioreq gfn (see block comment above)*/
+    uint64_aligned_t bufioreq_gfn;
+};
+
+/*
+ * XEN_DMOP_map_io_range_to_ioreq_server: Register an I/O range for
+ *                                        emulation by the client of
+ *                                        IOREQ Server <id>.
+ * XEN_DMOP_unmap_io_range_from_ioreq_server: Deregister an I/O range
+ *                                            previously registered for
+ *                                            emulation by the client of
+ *                                            IOREQ Server <id>.
+ *
+ * There are three types of I/O that can be emulated: port I/O, memory
+ * accesses and PCI config space accesses. The <type> field denotes which
+ * type of range* the <start> and <end> (inclusive) fields are specifying.
+ * PCI config space ranges are specified by segment/bus/device/function
+ * values which should be encoded using the DMOP_PCI_SBDF helper macro
+ * below.
+ *
+ * NOTE: unless an emulation request falls entirely within a range mapped
+ * by a secondary emulator, it will not be passed to that emulator.
+ */
+#define XEN_DMOP_map_io_range_to_ioreq_server 3
+#define XEN_DMOP_unmap_io_range_from_ioreq_server 4
+
+struct xen_dm_op_ioreq_server_range {
+    /* IN - server id */
+    ioservid_t id;
+    uint16_t pad;
+    /* IN - type of range */
+    uint32_t type;
+# define XEN_DMOP_IO_RANGE_PORT   0 /* I/O port range */
+# define XEN_DMOP_IO_RANGE_MEMORY 1 /* MMIO range */
+# define XEN_DMOP_IO_RANGE_PCI    2 /* PCI segment/bus/dev/func range */
+    /* IN - inclusive start and end of range */
+    uint64_aligned_t start, end;
+};
+
+#define XEN_DMOP_PCI_SBDF(s,b,d,f) \
+	((((s) & 0xffff) << 16) |  \
+	 (((b) & 0xff) << 8) |     \
+	 (((d) & 0x1f) << 3) |     \
+	 ((f) & 0x07))
+
+/*
+ * XEN_DMOP_set_ioreq_server_state: Enable or disable the IOREQ Server <id>
+ *
+ * The IOREQ Server will not be passed any emulation requests until it is
+ * in the enabled state.
+ * Note that the contents of the ioreq_gfn and bufioreq_gfn (see
+ * XEN_DMOP_get_ioreq_server_info) are not meaningful until the IOREQ Server
+ * is in the enabled state.
+ */
+#define XEN_DMOP_set_ioreq_server_state 5
+
+struct xen_dm_op_set_ioreq_server_state {
+    /* IN - server id */
+    ioservid_t id;
+    /* IN - enabled? */
+    uint8_t enabled;
+    uint8_t pad;
+};
+
+/*
+ * XEN_DMOP_destroy_ioreq_server: Destroy the IOREQ Server <id>.
+ *
+ * Any registered I/O ranges will be automatically deregistered.
+ */
+#define XEN_DMOP_destroy_ioreq_server 6
+
+struct xen_dm_op_destroy_ioreq_server {
+    /* IN - server id */
+    ioservid_t id;
+    uint16_t pad;
+};
+
+/*
+ * XEN_DMOP_track_dirty_vram: Track modifications to the specified pfn
+ *                            range.
+ *
+ * NOTE: The bitmap passed back to the caller is passed in a
+ *       secondary buffer.
+ */
+#define XEN_DMOP_track_dirty_vram 7
+
+struct xen_dm_op_track_dirty_vram {
+    /* IN - number of pages to be tracked */
+    uint32_t nr;
+    uint32_t pad;
+    /* IN - first pfn to track */
+    uint64_aligned_t first_pfn;
+};
+
+/*
+ * XEN_DMOP_set_pci_intx_level: Set the logical level of one of a domain's
+ *                              PCI INTx pins.
+ */
+#define XEN_DMOP_set_pci_intx_level 8
+
+struct xen_dm_op_set_pci_intx_level {
+    /* IN - PCI INTx identification (domain:bus:device:intx) */
+    uint16_t domain;
+    uint8_t bus, device, intx;
+    /* IN - Level: 0 -> deasserted, 1 -> asserted */
+    uint8_t  level;
+};
+
+/*
+ * XEN_DMOP_set_isa_irq_level: Set the logical level of a one of a domain's
+ *                             ISA IRQ lines.
+ */
+#define XEN_DMOP_set_isa_irq_level 9
+
+struct xen_dm_op_set_isa_irq_level {
+    /* IN - ISA IRQ (0-15) */
+    uint8_t  isa_irq;
+    /* IN - Level: 0 -> deasserted, 1 -> asserted */
+    uint8_t  level;
+};
+
+/*
+ * XEN_DMOP_set_pci_link_route: Map a PCI INTx line to an IRQ line.
+ */
+#define XEN_DMOP_set_pci_link_route 10
+
+struct xen_dm_op_set_pci_link_route {
+    /* PCI INTx line (0-3) */
+    uint8_t  link;
+    /* ISA IRQ (1-15) or 0 -> disable link */
+    uint8_t  isa_irq;
+};
+
+/*
+ * XEN_DMOP_modified_memory: Notify that a set of pages were modified by
+ *                           an emulator.
+ *
+ * DMOP buf 1 contains an array of xen_dm_op_modified_memory_extent with
+ * @nr_extents entries.
+ *
+ * On error, @nr_extents will contain the index+1 of the extent that
+ * had the error.  It is not defined if or which pages may have been
+ * marked as dirty, in this event.
+ */
+#define XEN_DMOP_modified_memory 11
+
+struct xen_dm_op_modified_memory {
+    /*
+     * IN - Number of extents to be processed
+     * OUT -returns n+1 for failing extent
+     */
+    uint32_t nr_extents;
+    /* IN/OUT - Must be set to 0 */
+    uint32_t opaque;
+};
+
+struct xen_dm_op_modified_memory_extent {
+    /* IN - number of contiguous pages modified */
+    uint32_t nr;
+    uint32_t pad;
+    /* IN - first pfn modified */
+    uint64_aligned_t first_pfn;
+};
+
+/*
+ * XEN_DMOP_set_mem_type: Notify that a region of memory is to be treated
+ *                        in a specific way. (See definition of
+ *                        hvmmem_type_t).
+ *
+ * NOTE: In the event of a continuation (return code -ERESTART), the
+ *       @first_pfn is set to the value of the pfn of the remaining
+ *       region and @nr reduced to the size of the remaining region.
+ */
+#define XEN_DMOP_set_mem_type 12
+
+struct xen_dm_op_set_mem_type {
+    /* IN - number of contiguous pages */
+    uint32_t nr;
+    /* IN - new hvmmem_type_t of region */
+    uint16_t mem_type;
+    uint16_t pad;
+    /* IN - first pfn in region */
+    uint64_aligned_t first_pfn;
+};
+
+/*
+ * XEN_DMOP_inject_event: Inject an event into a VCPU, which will
+ *                        get taken up when it is next scheduled.
+ *
+ * Note that the caller should know enough of the state of the CPU before
+ * injecting, to know what the effect of injecting the event will be.
+ */
+#define XEN_DMOP_inject_event 13
+
+struct xen_dm_op_inject_event {
+    /* IN - index of vCPU */
+    uint32_t vcpuid;
+    /* IN - interrupt vector */
+    uint8_t vector;
+    /* IN - event type (DMOP_EVENT_* ) */
+    uint8_t type;
+/* NB. This enumeration precisely matches hvm.h:X86_EVENTTYPE_* */
+# define XEN_DMOP_EVENT_ext_int    0 /* external interrupt */
+# define XEN_DMOP_EVENT_nmi        2 /* nmi */
+# define XEN_DMOP_EVENT_hw_exc     3 /* hardware exception */
+# define XEN_DMOP_EVENT_sw_int     4 /* software interrupt (CD nn) */
+# define XEN_DMOP_EVENT_pri_sw_exc 5 /* ICEBP (F1) */
+# define XEN_DMOP_EVENT_sw_exc     6 /* INT3 (CC), INTO (CE) */
+    /* IN - instruction length */
+    uint8_t insn_len;
+    uint8_t pad0;
+    /* IN - error code (or ~0 to skip) */
+    uint32_t error_code;
+    uint32_t pad1;
+    /* IN - type-specific extra data (%cr2 for #PF, pending_dbg for #DB) */
+    uint64_aligned_t cr2;
+};
+
+/*
+ * XEN_DMOP_inject_msi: Inject an MSI for an emulated device.
+ */
+#define XEN_DMOP_inject_msi 14
+
+struct xen_dm_op_inject_msi {
+    /* IN - MSI data (lower 32 bits) */
+    uint32_t data;
+    uint32_t pad;
+    /* IN - MSI address (0xfeexxxxx) */
+    uint64_aligned_t addr;
+};
+
+/*
+ * XEN_DMOP_map_mem_type_to_ioreq_server : map or unmap the IOREQ Server <id>
+ *                                      to specific memory type <type>
+ *                                      for specific accesses <flags>
+ *
+ * For now, flags only accept the value of XEN_DMOP_IOREQ_MEM_ACCESS_WRITE,
+ * which means only write operations are to be forwarded to an ioreq server.
+ * Support for the emulation of read operations can be added when an ioreq
+ * server has such requirement in future.
+ */
+#define XEN_DMOP_map_mem_type_to_ioreq_server 15
+
+struct xen_dm_op_map_mem_type_to_ioreq_server {
+    ioservid_t id;      /* IN - ioreq server id */
+    uint16_t type;      /* IN - memory type */
+    uint32_t flags;     /* IN - types of accesses to be forwarded to the
+                           ioreq server. flags with 0 means to unmap the
+                           ioreq server */
+
+#define XEN_DMOP_IOREQ_MEM_ACCESS_READ (1u << 0)
+#define XEN_DMOP_IOREQ_MEM_ACCESS_WRITE (1u << 1)
+
+    uint64_t opaque;    /* IN/OUT - only used for hypercall continuation,
+                           has to be set to zero by the caller */
+};
+
+/*
+ * XEN_DMOP_remote_shutdown : Declare a shutdown for another domain
+ *                            Identical to SCHEDOP_remote_shutdown
+ */
+#define XEN_DMOP_remote_shutdown 16
+
+struct xen_dm_op_remote_shutdown {
+    uint32_t reason;       /* SHUTDOWN_* => enum sched_shutdown_reason */
+                           /* (Other reason values are not blocked) */
+};
+
+/*
+ * XEN_DMOP_relocate_memory : Relocate GFNs for the specified guest.
+ *                            Identical to XENMEM_add_to_physmap with
+ *                            space == XENMAPSPACE_gmfn_range.
+ */
+#define XEN_DMOP_relocate_memory 17
+
+struct xen_dm_op_relocate_memory {
+    /* All fields are IN/OUT, with their OUT state undefined. */
+    /* Number of GFNs to process. */
+    uint32_t size;
+    uint32_t pad;
+    /* Starting GFN to relocate. */
+    uint64_aligned_t src_gfn;
+    /* Starting GFN where GFNs should be relocated. */
+    uint64_aligned_t dst_gfn;
+};
+
+/*
+ * XEN_DMOP_pin_memory_cacheattr : Pin caching type of RAM space.
+ *                                 Identical to XEN_DOMCTL_pin_mem_cacheattr.
+ */
+#define XEN_DMOP_pin_memory_cacheattr 18
+
+struct xen_dm_op_pin_memory_cacheattr {
+    uint64_aligned_t start; /* Start gfn. */
+    uint64_aligned_t end;   /* End gfn. */
+/* Caching types: these happen to be the same as x86 MTRR/PAT type codes. */
+#define XEN_DMOP_MEM_CACHEATTR_UC  0
+#define XEN_DMOP_MEM_CACHEATTR_WC  1
+#define XEN_DMOP_MEM_CACHEATTR_WT  4
+#define XEN_DMOP_MEM_CACHEATTR_WP  5
+#define XEN_DMOP_MEM_CACHEATTR_WB  6
+#define XEN_DMOP_MEM_CACHEATTR_UCM 7
+#define XEN_DMOP_DELETE_MEM_CACHEATTR (~(uint32_t)0)
+    uint32_t type;          /* XEN_DMOP_MEM_CACHEATTR_* */
+    uint32_t pad;
+};
+
+/*
+ * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
+ *                         IRQ lines (currently Arm only).
+ * Only SPIs are supported.
+ */
+#define XEN_DMOP_set_irq_level 19
+
+struct xen_dm_op_set_irq_level {
+    uint32_t irq;
+    /* IN - Level: 0 -> deasserted, 1 -> asserted */
+    uint8_t level;
+    uint8_t pad[3];
+};
+
+/*
+ * XEN_DMOP_nr_vcpus: Query the number of vCPUs a domain has.
+ *
+ * This is the number of vcpu objects allocated in Xen for the domain, and is
+ * fixed from creation time.  This bound is applicable to e.g. the vcpuid
+ * parameter of XEN_DMOP_inject_event, or number of struct ioreq objects
+ * mapped via XENMEM_acquire_resource.
+ */
+#define XEN_DMOP_nr_vcpus 20
+
+struct xen_dm_op_nr_vcpus {
+    uint32_t vcpus; /* OUT */
+};
+
+struct xen_dm_op {
+    uint32_t op;
+    uint32_t pad;
+    union {
+        struct xen_dm_op_create_ioreq_server create_ioreq_server;
+        struct xen_dm_op_get_ioreq_server_info get_ioreq_server_info;
+        struct xen_dm_op_ioreq_server_range map_io_range_to_ioreq_server;
+        struct xen_dm_op_ioreq_server_range unmap_io_range_from_ioreq_server;
+        struct xen_dm_op_set_ioreq_server_state set_ioreq_server_state;
+        struct xen_dm_op_destroy_ioreq_server destroy_ioreq_server;
+        struct xen_dm_op_track_dirty_vram track_dirty_vram;
+        struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
+        struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
+        struct xen_dm_op_set_irq_level set_irq_level;
+        struct xen_dm_op_set_pci_link_route set_pci_link_route;
+        struct xen_dm_op_modified_memory modified_memory;
+        struct xen_dm_op_set_mem_type set_mem_type;
+        struct xen_dm_op_inject_event inject_event;
+        struct xen_dm_op_inject_msi inject_msi;
+        struct xen_dm_op_map_mem_type_to_ioreq_server map_mem_type_to_ioreq_server;
+        struct xen_dm_op_remote_shutdown remote_shutdown;
+        struct xen_dm_op_relocate_memory relocate_memory;
+        struct xen_dm_op_pin_memory_cacheattr pin_memory_cacheattr;
+        struct xen_dm_op_nr_vcpus nr_vcpus;
+    } u;
+};
+
 struct xen_dm_op_buf {
 	GUEST_HANDLE(void) h;
 	xen_ulong_t size;
-- 
2.31.1.272.g89b43f80a514


