Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E752EAEB8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62051.109609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoPg-0008G7-KJ; Tue, 05 Jan 2021 15:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62051.109609; Tue, 05 Jan 2021 15:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoPg-0008Fi-Gi; Tue, 05 Jan 2021 15:38:24 +0000
Received: by outflank-mailman (input) for mailman id 62051;
 Tue, 05 Jan 2021 15:38:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwoPe-0008Fd-Fe
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:38:22 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d84dadc-e5be-4bd1-8bd0-6f139db3a03a;
 Tue, 05 Jan 2021 15:38:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex05Fbo1g6
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 16:37:50 +0100 (CET)
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
X-Inumbo-ID: 1d84dadc-e5be-4bd1-8bd0-6f139db3a03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609861097;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=W9N8s7dNaBHGMXFWm42bCXPrwVJsX/Q8eys4BVZlXWo=;
	b=YTYvWa77E5sYkHrky3/IlB59eakNgkmcAWSfA/YGLmJzo8IDp/KDI7yDjkcTGthKZD
	rJIq13osBJWjsRzwn8/Y8InlgKL3Q5NCMlncSG1k6O3IEp3slnqcQqyTbwKYbArdk0XK
	ZTn91zWAioR2iMwbut/W9PfMOJA3YJqbWhrGcva2p2hDZJI8Ff0KyJOgXTpm81xOe33k
	uo3bLVLN+VX/C/bOwHSBWs4dwp+RF+SplO28EkVD0FObZ4A2n27K9RhDKc05S+AmH8lb
	i+YvIAp/yl9lB6X0qaFKiwvdsFV7L/JlYojG/SlVprVs/IMyeuCModp/w8bFYWqu49Y4
	hEqA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS321Mjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: create libxensaverestore
Date: Tue,  5 Jan 2021 16:37:44 +0100
Message-Id: <20210105153744.25538-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all save/restore related code from libxenguest.so into a separate
library. The only consumer is libxl-save-helper. There is no need to
have the moved code mapped all the time in binaries where libxenguest.so
is used.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

The M2P defines are also moved with a separate patch.

 .gitignore                                    |   2 +
 tools/include/xenguest.h                      | 186 -----------------
 tools/include/xensaverestore.h                | 190 ++++++++++++++++++
 tools/libs/Makefile                           |   1 +
 tools/libs/guest/Makefile                     |  11 -
 tools/libs/guest/xg_offline_page.c            |   1 -
 tools/libs/guest/xg_private.h                 |  10 +
 tools/libs/light/Makefile                     |   4 +-
 tools/libs/light/libxl_create.c               |   1 +
 tools/libs/light/libxl_internal.h             |   1 +
 tools/libs/light/libxl_save_helper.c          |   1 +
 tools/libs/light/libxl_save_msgs_gen.pl       |   2 +-
 tools/libs/saverestore/Makefile               |  43 ++++
 .../{guest => saverestore}/xg_nomigrate.c     |   0
 .../{guest => saverestore}/xg_save_restore.h  |  12 --
 .../{guest => saverestore}/xg_sr_common.c     |   0
 .../{guest => saverestore}/xg_sr_common.h     |  12 ++
 .../{guest => saverestore}/xg_sr_common_x86.c |   0
 .../{guest => saverestore}/xg_sr_common_x86.h |   0
 .../xg_sr_common_x86_pv.c                     |   0
 .../xg_sr_common_x86_pv.h                     |   0
 .../{guest => saverestore}/xg_sr_restore.c    |   0
 .../xg_sr_restore_x86_hvm.c                   |   0
 .../xg_sr_restore_x86_pv.c                    |   0
 .../libs/{guest => saverestore}/xg_sr_save.c  |   0
 .../xg_sr_save_x86_hvm.c                      |   0
 .../xg_sr_save_x86_pv.c                       |   0
 .../xg_sr_stream_format.h                     |   0
 tools/libs/uselibs.mk                         |   4 +-
 29 files changed, 267 insertions(+), 214 deletions(-)
 create mode 100644 tools/include/xensaverestore.h
 create mode 100644 tools/libs/saverestore/Makefile
 rename tools/libs/{guest => saverestore}/xg_nomigrate.c (100%)
 rename tools/libs/{guest => saverestore}/xg_save_restore.h (91%)
 rename tools/libs/{guest => saverestore}/xg_sr_common.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_common.h (98%)
 rename tools/libs/{guest => saverestore}/xg_sr_common_x86.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_common_x86.h (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_common_x86_pv.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_common_x86_pv.h (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_restore.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_restore_x86_hvm.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_restore_x86_pv.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_save.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_save_x86_hvm.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_save_x86_pv.c (100%)
 rename tools/libs/{guest => saverestore}/xg_sr_stream_format.h (100%)

diff --git a/.gitignore b/.gitignore
index b169d78ed7..5c23d28f6b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -144,6 +144,8 @@ tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
 tools/libs/light/xenlight.pc
+tools/libs/saverestore/libxensaverestore.map
+tools/libs/saverestore/xensaverestore.pc
 tools/libs/stat/_paths.h
 tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 775cf34c04..23a407c56f 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -24,9 +24,6 @@
 
 #define XC_NUMA_NO_NODE   (~0U)
 
-#define XCFLAGS_LIVE      (1 << 0)
-#define XCFLAGS_DEBUG     (1 << 1)
-
 #define X86_64_B_SIZE   64 
 #define X86_32_B_SIZE   32
 
@@ -434,189 +431,6 @@ static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pfn)
  */
 struct xenevtchn_handle;
 
-/* For save's precopy_policy(). */
-struct precopy_stats
-{
-    unsigned int iteration;
-    unsigned long total_written;
-    long dirty_count; /* -1 if unknown */
-};
-
-/*
- * A precopy_policy callback may not be running in the same address
- * space as libxc an so precopy_stats is passed by value.
- */
-typedef int (*precopy_policy_t)(struct precopy_stats, void *);
-
-/* callbacks provided by xc_domain_save */
-struct save_callbacks {
-    /*
-     * Called after expiration of checkpoint interval,
-     * to suspend the guest.
-     */
-    int (*suspend)(void *data);
-
-    /*
-     * Called before and after every batch of page data sent during
-     * the precopy phase of a live migration to ask the caller what
-     * to do next based on the current state of the precopy migration.
-     *
-     * Should return one of the values listed below:
-     */
-#define XGS_POLICY_ABORT          (-1) /* Abandon the migration entirely
-                                        * and tidy up. */
-#define XGS_POLICY_CONTINUE_PRECOPY 0  /* Remain in the precopy phase. */
-#define XGS_POLICY_STOP_AND_COPY    1  /* Immediately suspend and transmit the
-                                        * remaining dirty pages. */
-    precopy_policy_t precopy_policy;
-
-    /*
-     * Called after the guest's dirty pages have been
-     *  copied into an output buffer.
-     * Callback function resumes the guest & the device model,
-     *  returns to xc_domain_save.
-     * xc_domain_save then flushes the output buffer, while the
-     *  guest continues to run.
-     */
-    int (*postcopy)(void *data);
-
-    /*
-     * Called after the memory checkpoint has been flushed
-     * out into the network. Typical actions performed in this
-     * callback include:
-     *   (a) send the saved device model state (for HVM guests),
-     *   (b) wait for checkpoint ack
-     *   (c) release the network output buffer pertaining to the acked checkpoint.
-     *   (c) sleep for the checkpoint interval.
-     *
-     * returns:
-     * 0: terminate checkpointing gracefully
-     * 1: take another checkpoint
-     */
-    int (*checkpoint)(void *data);
-
-    /*
-     * Called after the checkpoint callback.
-     *
-     * returns:
-     * 0: terminate checkpointing gracefully
-     * 1: take another checkpoint
-     */
-    int (*wait_checkpoint)(void *data);
-
-    /* Enable qemu-dm logging dirty pages to xen */
-    int (*switch_qemu_logdirty)(uint32_t domid, unsigned enable, void *data); /* HVM only */
-
-    /* to be provided as the last argument to each callback function */
-    void *data;
-};
-
-/* Type of stream.  Plain, or using a continuous replication protocol? */
-typedef enum {
-    XC_STREAM_PLAIN,
-    XC_STREAM_REMUS,
-    XC_STREAM_COLO,
-} xc_stream_type_t;
-
-/**
- * This function will save a running domain.
- *
- * @param xch a handle to an open hypervisor interface
- * @param io_fd the file descriptor to save a domain to
- * @param dom the id of the domain
- * @param flags XCFLAGS_xxx
- * @param stream_type XC_STREAM_PLAIN if the far end of the stream
- *        doesn't use checkpointing
- * @param recv_fd Only used for XC_STREAM_COLO.  Contains backchannel from
- *        the destination side.
- * @return 0 on success, -1 on failure
- */
-int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
-                   uint32_t flags, struct save_callbacks *callbacks,
-                   xc_stream_type_t stream_type, int recv_fd);
-
-/* callbacks provided by xc_domain_restore */
-struct restore_callbacks {
-    /*
-     * Called once the STATIC_DATA_END record has been received/inferred.
-     *
-     * For compatibility with older streams, provides a list of static data
-     * expected to be found in the stream, which was missing.  A higher level
-     * toolstack is responsible for providing any necessary compatibiltiy.
-     */
-#define XGR_SDD_MISSING_CPUID (1 << 0)
-#define XGR_SDD_MISSING_MSR   (1 << 1)
-    int (*static_data_done)(unsigned int missing, void *data);
-
-    /* Called after a new checkpoint to suspend the guest. */
-    int (*suspend)(void *data);
-
-    /*
-     * Called after the secondary vm is ready to resume.
-     * Callback function resumes the guest & the device model,
-     * returns to xc_domain_restore.
-     */
-    int (*postcopy)(void *data);
-
-    /*
-     * A checkpoint record has been found in the stream.
-     * returns:
-     */
-#define XGR_CHECKPOINT_ERROR    0 /* Terminate processing */
-#define XGR_CHECKPOINT_SUCCESS  1 /* Continue reading more data from the stream */
-#define XGR_CHECKPOINT_FAILOVER 2 /* Failover and resume VM */
-    int (*checkpoint)(void *data);
-
-    /*
-     * Called after the checkpoint callback.
-     *
-     * returns:
-     * 0: terminate checkpointing gracefully
-     * 1: take another checkpoint
-     */
-    int (*wait_checkpoint)(void *data);
-
-    /*
-     * callback to send store gfn and console gfn to xl
-     * if we want to resume vm before xc_domain_save()
-     * exits.
-     */
-    void (*restore_results)(xen_pfn_t store_gfn, xen_pfn_t console_gfn,
-                            void *data);
-
-    /* to be provided as the last argument to each callback function */
-    void *data;
-};
-
-/**
- * This function will restore a saved domain.
- *
- * Domain is restored in a suspended state ready to be unpaused.
- *
- * @param xch a handle to an open hypervisor interface
- * @param io_fd the file descriptor to restore a domain from
- * @param dom the id of the domain
- * @param store_evtchn the xenstore event channel for this domain to use
- * @param store_mfn filled with the gfn of the store page
- * @param store_domid the backend domain for xenstore
- * @param console_evtchn the console event channel for this domain to use
- * @param console_mfn filled with the gfn of the console page
- * @param console_domid the backend domain for xenconsole
- * @param stream_type XC_STREAM_PLAIN if the far end of the stream is using
- *        checkpointing
- * @param callbacks non-NULL to receive a callback to restore toolstack
- *        specific data
- * @param send_back_fd Only used for XC_STREAM_COLO.  Contains backchannel to
- *        the source side.
- * @return 0 on success, -1 on failure
- */
-int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
-                      unsigned int store_evtchn, unsigned long *store_mfn,
-                      uint32_t store_domid, unsigned int console_evtchn,
-                      unsigned long *console_mfn, uint32_t console_domid,
-                      xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd);
-
 /**
  * This function will create a domain for a paravirtualized Linux
  * using file names pointing to kernel and ramdisk
diff --git a/tools/include/xensaverestore.h b/tools/include/xensaverestore.h
new file mode 100644
index 0000000000..8ac136729d
--- /dev/null
+++ b/tools/include/xensaverestore.h
@@ -0,0 +1,190 @@
+#ifndef XENSAVERESTORE_H
+#define XENSAVERESTORE_H
+
+#define XCFLAGS_LIVE      (1 << 0)
+#define XCFLAGS_DEBUG     (1 << 1)
+
+/* For save's precopy_policy(). */
+struct precopy_stats
+{
+    unsigned int iteration;
+    unsigned long total_written;
+    long dirty_count; /* -1 if unknown */
+};
+
+/*
+ * A precopy_policy callback may not be running in the same address
+ * space as libxc an so precopy_stats is passed by value.
+ */
+typedef int (*precopy_policy_t)(struct precopy_stats, void *);
+
+/* callbacks provided by xc_domain_save */
+struct save_callbacks {
+    /*
+     * Called after expiration of checkpoint interval,
+     * to suspend the guest.
+     */
+    int (*suspend)(void *data);
+
+    /*
+     * Called before and after every batch of page data sent during
+     * the precopy phase of a live migration to ask the caller what
+     * to do next based on the current state of the precopy migration.
+     *
+     * Should return one of the values listed below:
+     */
+#define XGS_POLICY_ABORT          (-1) /* Abandon the migration entirely
+                                        * and tidy up. */
+#define XGS_POLICY_CONTINUE_PRECOPY 0  /* Remain in the precopy phase. */
+#define XGS_POLICY_STOP_AND_COPY    1  /* Immediately suspend and transmit the
+                                        * remaining dirty pages. */
+    precopy_policy_t precopy_policy;
+
+    /*
+     * Called after the guest's dirty pages have been
+     *  copied into an output buffer.
+     * Callback function resumes the guest & the device model,
+     *  returns to xc_domain_save.
+     * xc_domain_save then flushes the output buffer, while the
+     *  guest continues to run.
+     */
+    int (*postcopy)(void *data);
+
+    /*
+     * Called after the memory checkpoint has been flushed
+     * out into the network. Typical actions performed in this
+     * callback include:
+     *   (a) send the saved device model state (for HVM guests),
+     *   (b) wait for checkpoint ack
+     *   (c) release the network output buffer pertaining to the acked checkpoint.
+     *   (c) sleep for the checkpoint interval.
+     *
+     * returns:
+     * 0: terminate checkpointing gracefully
+     * 1: take another checkpoint
+     */
+    int (*checkpoint)(void *data);
+
+    /*
+     * Called after the checkpoint callback.
+     *
+     * returns:
+     * 0: terminate checkpointing gracefully
+     * 1: take another checkpoint
+     */
+    int (*wait_checkpoint)(void *data);
+
+    /* Enable qemu-dm logging dirty pages to xen */
+    int (*switch_qemu_logdirty)(uint32_t domid, unsigned enable, void *data); /* HVM only */
+
+    /* to be provided as the last argument to each callback function */
+    void *data;
+};
+
+/* Type of stream.  Plain, or using a continuous replication protocol? */
+typedef enum {
+    XC_STREAM_PLAIN,
+    XC_STREAM_REMUS,
+    XC_STREAM_COLO,
+} xc_stream_type_t;
+
+/**
+ * This function will save a running domain.
+ *
+ * @param xch a handle to an open hypervisor interface
+ * @param io_fd the file descriptor to save a domain to
+ * @param dom the id of the domain
+ * @param flags XCFLAGS_xxx
+ * @param stream_type XC_STREAM_PLAIN if the far end of the stream
+ *        doesn't use checkpointing
+ * @param recv_fd Only used for XC_STREAM_COLO.  Contains backchannel from
+ *        the destination side.
+ * @return 0 on success, -1 on failure
+ */
+int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
+                   uint32_t flags, struct save_callbacks *callbacks,
+                   xc_stream_type_t stream_type, int recv_fd);
+
+/* callbacks provided by xc_domain_restore */
+struct restore_callbacks {
+    /*
+     * Called once the STATIC_DATA_END record has been received/inferred.
+     *
+     * For compatibility with older streams, provides a list of static data
+     * expected to be found in the stream, which was missing.  A higher level
+     * toolstack is responsible for providing any necessary compatibiltiy.
+     */
+#define XGR_SDD_MISSING_CPUID (1 << 0)
+#define XGR_SDD_MISSING_MSR   (1 << 1)
+    int (*static_data_done)(unsigned int missing, void *data);
+
+    /* Called after a new checkpoint to suspend the guest. */
+    int (*suspend)(void *data);
+
+    /*
+     * Called after the secondary vm is ready to resume.
+     * Callback function resumes the guest & the device model,
+     * returns to xc_domain_restore.
+     */
+    int (*postcopy)(void *data);
+
+    /*
+     * A checkpoint record has been found in the stream.
+     * returns:
+     */
+#define XGR_CHECKPOINT_ERROR    0 /* Terminate processing */
+#define XGR_CHECKPOINT_SUCCESS  1 /* Continue reading more data from the stream */
+#define XGR_CHECKPOINT_FAILOVER 2 /* Failover and resume VM */
+    int (*checkpoint)(void *data);
+
+    /*
+     * Called after the checkpoint callback.
+     *
+     * returns:
+     * 0: terminate checkpointing gracefully
+     * 1: take another checkpoint
+     */
+    int (*wait_checkpoint)(void *data);
+
+    /*
+     * callback to send store gfn and console gfn to xl
+     * if we want to resume vm before xc_domain_save()
+     * exits.
+     */
+    void (*restore_results)(xen_pfn_t store_gfn, xen_pfn_t console_gfn,
+                            void *data);
+
+    /* to be provided as the last argument to each callback function */
+    void *data;
+};
+
+/**
+ * This function will restore a saved domain.
+ *
+ * Domain is restored in a suspended state ready to be unpaused.
+ *
+ * @param xch a handle to an open hypervisor interface
+ * @param io_fd the file descriptor to restore a domain from
+ * @param dom the id of the domain
+ * @param store_evtchn the xenstore event channel for this domain to use
+ * @param store_mfn filled with the gfn of the store page
+ * @param store_domid the backend domain for xenstore
+ * @param console_evtchn the console event channel for this domain to use
+ * @param console_mfn filled with the gfn of the console page
+ * @param console_domid the backend domain for xenconsole
+ * @param stream_type XC_STREAM_PLAIN if the far end of the stream is using
+ *        checkpointing
+ * @param callbacks non-NULL to receive a callback to restore toolstack
+ *        specific data
+ * @param send_back_fd Only used for XC_STREAM_COLO.  Contains backchannel to
+ *        the source side.
+ * @return 0 on success, -1 on failure
+ */
+int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
+                      unsigned int store_evtchn, unsigned long *store_mfn,
+                      uint32_t store_domid, unsigned int console_evtchn,
+                      unsigned long *console_mfn, uint32_t console_domid,
+                      xc_stream_type_t stream_type,
+                      struct restore_callbacks *callbacks, int send_back_fd);
+
+#endif /* XENSAVERESTORE_H */
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 1afcd12e2b..ca43c66777 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -12,6 +12,7 @@ SUBDIRS-y += devicemodel
 SUBDIRS-y += ctrl
 SUBDIRS-y += guest
 SUBDIRS-y += hypfs
+SUBDIRS-y += saverestore
 SUBDIRS-y += store
 SUBDIRS-y += stat
 SUBDIRS-$(CONFIG_Linux) += vchan
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 1c729040b3..f9ff2fa4d4 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -10,18 +10,7 @@ SRCS-y += xg_private.c
 SRCS-y += xg_domain.c
 SRCS-y += xg_suspend.c
 ifeq ($(CONFIG_MIGRATE),y)
-SRCS-y += xg_sr_common.c
-SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
-SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
-SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
-SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
-SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
-SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
-SRCS-y += xg_sr_restore.c
-SRCS-y += xg_sr_save.c
 SRCS-y += xg_offline_page.c
-else
-SRCS-y += xg_nomigrate.c
 endif
 
 CFLAGS += -I$(XEN_libxenctrl)
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index d4722f0e8c..e49ef55887 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -29,7 +29,6 @@
 
 #include "xc_private.h"
 #include "xg_private.h"
-#include "xg_save_restore.h"
 
 struct pte_backup_entry
 {
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index fee3191cd4..1e3060ae1b 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -135,4 +135,14 @@ static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
 int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
               uint32_t dom);
 
+/*
+** The M2P is made up of some number of 'chunks' of at least 2MB in size.
+** The below definitions and utility function(s) deal with mapping the M2P
+** regarldess of the underlying machine memory size or architecture.
+*/
+#define M2P_SHIFT       L2_PAGETABLE_SHIFT_PAE
+#define M2P_CHUNK_SIZE  (1 << M2P_SHIFT)
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
+#define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
+
 #endif /* XG_PRIVATE_H */
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 68f6fa315f..07410e246b 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -179,7 +179,7 @@ $(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libx
 $(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
 libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
 libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
-$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
+$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxensaverestore)
 
 testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
 testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
@@ -241,7 +241,7 @@ test_%: test_%.o test_common.o libxenlight_test.so
 	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
-	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxensaverestore) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
 testidl: testidl.o libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 86f4a8369d..4cd2242c77 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -21,6 +21,7 @@
 #include "libxl_arch.h"
 
 #include <xenguest.h>
+#include <xensaverestore.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/e820.h>
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c79523ba92..15cf081905 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -56,6 +56,7 @@
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
 #include <xenguest.h>
+#include <xensaverestore.h>
 #include <xenhypfs.h>
 
 #include <xen-tools/libs.h>
diff --git a/tools/libs/light/libxl_save_helper.c b/tools/libs/light/libxl_save_helper.c
index 65dff389bf..896e845a2f 100644
--- a/tools/libs/light/libxl_save_helper.c
+++ b/tools/libs/light/libxl_save_helper.c
@@ -48,6 +48,7 @@
 
 #include "xenctrl.h"
 #include "xenguest.h"
+#include "xensaverestore.h"
 #include "_libxl_save_msgs_helper.h"
 
 /*----- logger -----*/
diff --git a/tools/libs/light/libxl_save_msgs_gen.pl b/tools/libs/light/libxl_save_msgs_gen.pl
index 5bfbd4fd10..9bc6c2a574 100755
--- a/tools/libs/light/libxl_save_msgs_gen.pl
+++ b/tools/libs/light/libxl_save_msgs_gen.pl
@@ -72,7 +72,7 @@ END_BOTH
 END_CALLOUT
 
 #include <xenctrl.h>
-#include <xenguest.h>
+#include <xensaverestore.h>
 #include "_libxl_save_msgs_${ah}.h"
 
 END_HELPER
diff --git a/tools/libs/saverestore/Makefile b/tools/libs/saverestore/Makefile
new file mode 100644
index 0000000000..fa756dfb3a
--- /dev/null
+++ b/tools/libs/saverestore/Makefile
@@ -0,0 +1,43 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+ifeq ($(CONFIG_LIBXC_MINIOS),y)
+# Save/restore of a domain is currently incompatible with a stubdom environment
+override CONFIG_MIGRATE := n
+endif
+
+ifeq ($(CONFIG_MIGRATE),y)
+SRCS-y += xg_sr_common.c
+SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
+SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
+SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
+SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
+SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
+SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
+SRCS-y += xg_sr_restore.c
+SRCS-y += xg_sr_save.c
+else
+SRCS-y += xg_nomigrate.c
+endif
+
+CFLAGS += -I$(XEN_libxenctrl)
+CFLAGS += -I$(XEN_libxenguest)
+
+-include $(XEN_TARGET_ARCH)/Makefile
+
+CFLAGS   += -Werror -Wmissing-prototypes
+CFLAGS   += -I. -I./include $(CFLAGS_xeninclude)
+CFLAGS   += -D__XEN_TOOLS__
+CFLAGS   += -include $(XEN_ROOT)/tools/config.h
+# Needed for asprintf()
+CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
+
+LIBHEADER := xensaverestore.h
+
+NO_HEADERS_CHK := y
+
+include $(XEN_ROOT)/tools/libs/libs.mk
+
+.PHONY: cleanlocal
+cleanlocal:
+	rm -f libxensaverestore.map
diff --git a/tools/libs/guest/xg_nomigrate.c b/tools/libs/saverestore/xg_nomigrate.c
similarity index 100%
rename from tools/libs/guest/xg_nomigrate.c
rename to tools/libs/saverestore/xg_nomigrate.c
diff --git a/tools/libs/guest/xg_save_restore.h b/tools/libs/saverestore/xg_save_restore.h
similarity index 91%
rename from tools/libs/guest/xg_save_restore.h
rename to tools/libs/saverestore/xg_save_restore.h
index 88120eb54b..d45354061c 100644
--- a/tools/libs/guest/xg_save_restore.h
+++ b/tools/libs/saverestore/xg_save_restore.h
@@ -15,8 +15,6 @@
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "xc_private.h"
-
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
 
@@ -99,16 +97,6 @@ static inline int get_platform_info(xc_interface *xch, uint32_t dom,
 #define PFN_TO_KB(_pfn) ((_pfn) << (PAGE_SHIFT - 10))
 
 
-/*
-** The M2P is made up of some number of 'chunks' of at least 2MB in size.
-** The below definitions and utility function(s) deal with mapping the M2P
-** regarldess of the underlying machine memory size or architecture.
-*/
-#define M2P_SHIFT       L2_PAGETABLE_SHIFT_PAE
-#define M2P_CHUNK_SIZE  (1 << M2P_SHIFT)
-#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
-#define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
-
 #define UNFOLD_CR3(_c)                                                  \
   ((uint64_t)((dinfo->guest_width == 8)                                 \
               ? ((_c) >> 12)                                            \
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/saverestore/xg_sr_common.c
similarity index 100%
rename from tools/libs/guest/xg_sr_common.c
rename to tools/libs/saverestore/xg_sr_common.c
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/saverestore/xg_sr_common.h
similarity index 98%
rename from tools/libs/guest/xg_sr_common.h
rename to tools/libs/saverestore/xg_sr_common.h
index 617dc75add..5e22006504 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/saverestore/xg_sr_common.h
@@ -1,7 +1,19 @@
 #ifndef __COMMON__H
 #define __COMMON__H
 
+#include <unistd.h>
+#include <errno.h>
 #include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
+#include "xc_private.h"
+#include "xenguest.h"
+#include "xensaverestore.h"
 
 #include "xg_private.h"
 #include "xg_save_restore.h"
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/saverestore/xg_sr_common_x86.c
similarity index 100%
rename from tools/libs/guest/xg_sr_common_x86.c
rename to tools/libs/saverestore/xg_sr_common_x86.c
diff --git a/tools/libs/guest/xg_sr_common_x86.h b/tools/libs/saverestore/xg_sr_common_x86.h
similarity index 100%
rename from tools/libs/guest/xg_sr_common_x86.h
rename to tools/libs/saverestore/xg_sr_common_x86.h
diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/saverestore/xg_sr_common_x86_pv.c
similarity index 100%
rename from tools/libs/guest/xg_sr_common_x86_pv.c
rename to tools/libs/saverestore/xg_sr_common_x86_pv.c
diff --git a/tools/libs/guest/xg_sr_common_x86_pv.h b/tools/libs/saverestore/xg_sr_common_x86_pv.h
similarity index 100%
rename from tools/libs/guest/xg_sr_common_x86_pv.h
rename to tools/libs/saverestore/xg_sr_common_x86_pv.h
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/saverestore/xg_sr_restore.c
similarity index 100%
rename from tools/libs/guest/xg_sr_restore.c
rename to tools/libs/saverestore/xg_sr_restore.c
diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/saverestore/xg_sr_restore_x86_hvm.c
similarity index 100%
rename from tools/libs/guest/xg_sr_restore_x86_hvm.c
rename to tools/libs/saverestore/xg_sr_restore_x86_hvm.c
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/saverestore/xg_sr_restore_x86_pv.c
similarity index 100%
rename from tools/libs/guest/xg_sr_restore_x86_pv.c
rename to tools/libs/saverestore/xg_sr_restore_x86_pv.c
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/saverestore/xg_sr_save.c
similarity index 100%
rename from tools/libs/guest/xg_sr_save.c
rename to tools/libs/saverestore/xg_sr_save.c
diff --git a/tools/libs/guest/xg_sr_save_x86_hvm.c b/tools/libs/saverestore/xg_sr_save_x86_hvm.c
similarity index 100%
rename from tools/libs/guest/xg_sr_save_x86_hvm.c
rename to tools/libs/saverestore/xg_sr_save_x86_hvm.c
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/saverestore/xg_sr_save_x86_pv.c
similarity index 100%
rename from tools/libs/guest/xg_sr_save_x86_pv.c
rename to tools/libs/saverestore/xg_sr_save_x86_pv.c
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/saverestore/xg_sr_stream_format.h
similarity index 100%
rename from tools/libs/guest/xg_sr_stream_format.h
rename to tools/libs/saverestore/xg_sr_stream_format.h
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index efd7a475ba..62a2990b95 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -20,6 +20,8 @@ LIBS_LIBS += ctrl
 USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
 LIBS_LIBS += guest
 USELIBS_guest := evtchn ctrl
+LIBS_LIBS += saverestore
+USELIBS_saverestore := guest ctrl
 LIBS_LIBS += store
 USELIBS_store := toolcore
 LIBS_LIBS += vchan
@@ -27,7 +29,7 @@ USELIBS_vchan := toollog store gnttab evtchn
 LIBS_LIBS += stat
 USELIBS_stat := ctrl store
 LIBS_LIBS += light
-USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
+USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest saverestore
 LIBS_LIBS += util
 USELIBS_util := light
 FILENAME_util := xlutil

