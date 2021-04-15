Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F28360A44
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111132.212483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1mw-0007Lu-Cq; Thu, 15 Apr 2021 13:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111132.212483; Thu, 15 Apr 2021 13:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX1mw-0007LV-9G; Thu, 15 Apr 2021 13:12:06 +0000
Received: by outflank-mailman (input) for mailman id 111132;
 Thu, 15 Apr 2021 13:12:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y61X=JM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lX1mu-0007LQ-NG
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:12:05 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50c3bbea-705f-48c5-85fc-356d25b6e22e;
 Thu, 15 Apr 2021 13:12:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.3 DYNA|AUTH)
 with ESMTPSA id g00c91x3FDBf0xb
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 15 Apr 2021 15:11:41 +0200 (CEST)
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
X-Inumbo-ID: 50c3bbea-705f-48c5-85fc-356d25b6e22e
ARC-Seal: i=1; a=rsa-sha256; t=1618492301; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ftXG1W7EjNc2k8vl7lwEqLQfe0sf1b6BXpAX9qlA10DuBkWCnkmhy5iy/8Ghnx06CC
    FbAx9dZ7w6FcmyddOf3J3JLL8QGuJiiiwilgmZ1N8A8NQ/vdz9m1+DTqK3nNdLLZ7UTG
    ciOkI+D07QyIsHvYyIAhHKm/pHOIavjKWCBSaqEH3CaDZlyO6v4WTWFlh5ZdLnYX3hln
    kSJFMILSO1cLRg/VavPxKswVJgLCc7hXpRncFdmva4kWmRxszkJbl6fpYUjQRcQMfI0O
    +E5ygOd9+IKdntsuxvzoSd5P94uutMH+8IWorHEnPPolR7Ju4VoCVinEq/4SN6J/4hwa
    JJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618492301;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=4pWkBeNVVN7WJH/yySZwACbmsXWYMXdRFWGMZIINQC8=;
    b=O+qRRDbg7ojNnwADb6NUBiV8aL3V6ciOwkjNwe2sPDZQR15J77P72QwfMWZEIV8/cV
    AYfqq/RWfhTcL3W5sorTMFbFUQxAg73amwIcoU+s+wip41nH5+J92Kv2rwEBqqc896QC
    XBXaFNIlzUG4p+Cn6Tp81jc/Ojpv67zF7ZTjN32V9g1pj6o0/eeLuHVqD+Mk6uIuEClL
    d+PCdEPjewei8xDe2IlZtifPpS/vjveDj/Q/7H345eJz4bPmT639evIp7kQaH3cAX16H
    /Qm5jRAnQdpiTnjJOjxO7I2uGnd2RxSF13JmIrbKcQroG/1NSgz3DJe0I0mXU1gqJipl
    br9w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618492301;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=4pWkBeNVVN7WJH/yySZwACbmsXWYMXdRFWGMZIINQC8=;
    b=DvFcvJ8wo8/HKG10SyaQVUPxvvdSD9xmgwA6EuwbCcPTU5c5V3K0VnfaowR2xBZkMx
    Gbub2HiNIC3hEr4iIAdE3cKP9qWop3H+oUUmOrwYaJMVPk4ClIRGKQpL9KeSZJNUGjSO
    W0NuoMB39RxsGjqV3H6vI+NRdg8VtuN3LXIgQBsC6YrqKHKYc49ufDkDyfMMKN0/0jbs
    UkvRMGfzDd+ikZANfgX8CbCRUUAhXqzS1g7uPJsuldbBAVWbqXx/K7kWgU3/H3sfgUp5
    NQYkL2+9s/SZ6Q50qbKD7v3VyJWqZ6gOxVid8U6uKF/sSBCTkBnNkU1NjKfR3wlfduTe
    muRA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3m8g"
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
Subject: [PATCH v4] tools: create libxensaverestore
Date: Thu, 15 Apr 2021 15:11:38 +0200
Message-Id: <20210415131138.8709-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all save/restore related code from libxenguest.so into a separate
library libxensaverestore.so. The only consumer is libxl-save-helper.
There is no need to have the moved code mapped all the time in binaries
where libxenguest.so is used.

According to size(1) the change is:
   text	   data	    bss	    dec	    hex	filename
 187183	   4304	     48	 191535	  2ec2f	guest/libxenguest.so.4.15.0

 124106	   3376	     48	 127530	  1f22a	guest/libxenguest.so.4.15.0
  67841	   1872	      8	  69721	  11059	saverestore/libxensaverestore.so.4.15.0

While touching the files anyway, take the opportunity to drop the
reduntant xg_sr_ filename prefix.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v4:
- drop xg_ prefix from filenames (jgross)
- drop sr_ prefix from filenames (jbeulich)
v3:
- repost in time for 4.16
v2:
- copy also license header
- move xg_nomigrate.c
- add size(1) output to commit msg
- remove change from libxl_create.c

 .gitignore                                    |   2 +
 tools/include/xenguest.h                      | 186 ----------------
 tools/include/xensaverestore.h                | 208 ++++++++++++++++++
 tools/libs/Makefile                           |   1 +
 tools/libs/guest/Makefile                     |  11 -
 tools/libs/guest/xg_offline_page.c            |   1 -
 tools/libs/light/Makefile                     |   4 +-
 tools/libs/light/libxl_internal.h             |   1 +
 tools/libs/light/libxl_save_helper.c          |   1 +
 tools/libs/light/libxl_save_msgs_gen.pl       |   2 +-
 tools/libs/saverestore/Makefile               |  38 ++++
 .../xg_sr_common.c => saverestore/common.c}   |   2 +-
 .../xg_sr_common.h => saverestore/common.h}   |  16 +-
 .../common_x86.c}                             |   2 +-
 .../common_x86.h}                             |   2 +-
 .../common_x86_pv.c}                          |   2 +-
 .../common_x86_pv.h}                          |   2 +-
 .../nomigrate.c}                              |   0
 .../xg_sr_restore.c => saverestore/restore.c} |   2 +-
 .../restore_x86_hvm.c}                        |   2 +-
 .../restore_x86_pv.c}                         |   2 +-
 .../xg_sr_save.c => saverestore/save.c}       |   2 +-
 .../save_restore.h}                           |   2 -
 .../save_x86_hvm.c}                           |   2 +-
 .../save_x86_pv.c}                            |   2 +-
 .../stream_format.h}                          |   0
 tools/libs/uselibs.mk                         |   4 +-
 27 files changed, 282 insertions(+), 217 deletions(-)
 create mode 100644 tools/include/xensaverestore.h
 create mode 100644 tools/libs/saverestore/Makefile
 rename tools/libs/{guest/xg_sr_common.c => saverestore/common.c} (99%)
 rename tools/libs/{guest/xg_sr_common.h => saverestore/common.h} (98%)
 rename tools/libs/{guest/xg_sr_common_x86.c => saverestore/common_x86.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86.h => saverestore/common_x86.h} (98%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.c => saverestore/common_x86_pv.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.h => saverestore/common_x86_pv.h} (98%)
 rename tools/libs/{guest/xg_nomigrate.c => saverestore/nomigrate.c} (100%)
 rename tools/libs/{guest/xg_sr_restore.c => saverestore/restore.c} (99%)
 rename tools/libs/{guest/xg_sr_restore_x86_hvm.c => saverestore/restore_x86_hvm.c} (99%)
 rename tools/libs/{guest/xg_sr_restore_x86_pv.c => saverestore/restore_x86_pv.c} (99%)
 rename tools/libs/{guest/xg_sr_save.c => saverestore/save.c} (99%)
 rename tools/libs/{guest/xg_save_restore.h => saverestore/save_restore.h} (98%)
 rename tools/libs/{guest/xg_sr_save_x86_hvm.c => saverestore/save_x86_hvm.c} (99%)
 rename tools/libs/{guest/xg_sr_save_x86_pv.c => saverestore/save_x86_pv.c} (99%)
 rename tools/libs/{guest/xg_sr_stream_format.h => saverestore/stream_format.h} (100%)

diff --git a/.gitignore b/.gitignore
index 1c2fa1530b..95c5c02039 100644
--- a/.gitignore
+++ b/.gitignore
@@ -147,6 +147,8 @@ tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
 tools/libs/light/xenlight.pc
+tools/libs/saverestore/libxensaverestore.map
+tools/libs/saverestore/xensaverestore.pc
 tools/libs/stat/_paths.h
 tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 217022b6e7..feb20dc375 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -24,9 +24,6 @@
 
 #define XC_NUMA_NO_NODE   (~0U)
 
-#define XCFLAGS_LIVE      (1 << 0)
-#define XCFLAGS_DEBUG     (1 << 1)
-
 #define X86_64_B_SIZE   64 
 #define X86_32_B_SIZE   32
 
@@ -433,189 +430,6 @@ static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pfn)
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
index 0000000000..0410f0469e
--- /dev/null
+++ b/tools/include/xensaverestore.h
@@ -0,0 +1,208 @@
+/******************************************************************************
+ * A library for guest domain save/restore/migration in Xen.
+ *
+ * Copyright (c) 2003-2004, K A Fraser.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
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
index 604e1695d6..7bb3d92553 100644
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
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 7d8c51d492..68e51dd13c 100644
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
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c6a4a187f5..2889572888 100644
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
index 9d425b1dee..f263ee01bb 100755
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
index 0000000000..48728b3be2
--- /dev/null
+++ b/tools/libs/saverestore/Makefile
@@ -0,0 +1,38 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+ifeq ($(CONFIG_MIGRATE),y)
+SRCS-y += common.c
+SRCS-$(CONFIG_X86) += common_x86.c
+SRCS-$(CONFIG_X86) += common_x86_pv.c
+SRCS-$(CONFIG_X86) += restore_x86_pv.c
+SRCS-$(CONFIG_X86) += restore_x86_hvm.c
+SRCS-$(CONFIG_X86) += save_x86_pv.c
+SRCS-$(CONFIG_X86) += save_x86_hvm.c
+SRCS-y += restore.c
+SRCS-y += save.c
+else
+SRCS-y += nomigrate.c
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
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/saverestore/common.c
similarity index 99%
rename from tools/libs/guest/xg_sr_common.c
rename to tools/libs/saverestore/common.c
index 17567ab133..77128bc747 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/saverestore/common.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xg_sr_common.h"
+#include "common.h"
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/saverestore/common.h
similarity index 98%
rename from tools/libs/guest/xg_sr_common.h
rename to tools/libs/saverestore/common.h
index 617dc75add..56286f3c8e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/saverestore/common.h
@@ -1,13 +1,25 @@
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
-#include "xg_save_restore.h"
+#include "save_restore.h"
 #include "xc_bitops.h"
 
-#include "xg_sr_stream_format.h"
+#include "stream_format.h"
 
 /* String representation of Domain Header types. */
 const char *dhdr_type_to_str(uint32_t type);
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/saverestore/common_x86.c
similarity index 99%
rename from tools/libs/guest/xg_sr_common_x86.c
rename to tools/libs/saverestore/common_x86.c
index 3168c5485f..6d706a2d94 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/saverestore/common_x86.c
@@ -1,4 +1,4 @@
-#include "xg_sr_common_x86.h"
+#include "common_x86.h"
 
 int write_x86_tsc_info(struct xc_sr_context *ctx)
 {
diff --git a/tools/libs/guest/xg_sr_common_x86.h b/tools/libs/saverestore/common_x86.h
similarity index 98%
rename from tools/libs/guest/xg_sr_common_x86.h
rename to tools/libs/saverestore/common_x86.h
index b55758c96d..3a2d91dcb8 100644
--- a/tools/libs/guest/xg_sr_common_x86.h
+++ b/tools/libs/saverestore/common_x86.h
@@ -1,7 +1,7 @@
 #ifndef __COMMON_X86__H
 #define __COMMON_X86__H
 
-#include "xg_sr_common.h"
+#include "common.h"
 
 /*
  * Obtains a domains TSC information from Xen and writes a X86_TSC_INFO record
diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/saverestore/common_x86_pv.c
similarity index 99%
rename from tools/libs/guest/xg_sr_common_x86_pv.c
rename to tools/libs/saverestore/common_x86_pv.c
index cd33406aab..caf3cc588f 100644
--- a/tools/libs/guest/xg_sr_common_x86_pv.c
+++ b/tools/libs/saverestore/common_x86_pv.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xg_sr_common_x86_pv.h"
+#include "common_x86_pv.h"
 
 xen_pfn_t mfn_to_pfn(struct xc_sr_context *ctx, xen_pfn_t mfn)
 {
diff --git a/tools/libs/guest/xg_sr_common_x86_pv.h b/tools/libs/saverestore/common_x86_pv.h
similarity index 98%
rename from tools/libs/guest/xg_sr_common_x86_pv.h
rename to tools/libs/saverestore/common_x86_pv.h
index 953b5bfb8d..a9f8c970e3 100644
--- a/tools/libs/guest/xg_sr_common_x86_pv.h
+++ b/tools/libs/saverestore/common_x86_pv.h
@@ -1,7 +1,7 @@
 #ifndef __COMMON_X86_PV_H
 #define __COMMON_X86_PV_H
 
-#include "xg_sr_common_x86.h"
+#include "common_x86.h"
 
 /* Virtual address ranges reserved for hypervisor. */
 #define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
diff --git a/tools/libs/guest/xg_nomigrate.c b/tools/libs/saverestore/nomigrate.c
similarity index 100%
rename from tools/libs/guest/xg_nomigrate.c
rename to tools/libs/saverestore/nomigrate.c
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/saverestore/restore.c
similarity index 99%
rename from tools/libs/guest/xg_sr_restore.c
rename to tools/libs/saverestore/restore.c
index b57a787519..be259a1c6b 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -2,7 +2,7 @@
 
 #include <assert.h>
 
-#include "xg_sr_common.h"
+#include "common.h"
 
 /*
  * Read and validate the Image and Domain headers.
diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/saverestore/restore_x86_hvm.c
similarity index 99%
rename from tools/libs/guest/xg_sr_restore_x86_hvm.c
rename to tools/libs/saverestore/restore_x86_hvm.c
index d6ea6f3012..bd63bd2818 100644
--- a/tools/libs/guest/xg_sr_restore_x86_hvm.c
+++ b/tools/libs/saverestore/restore_x86_hvm.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <arpa/inet.h>
 
-#include "xg_sr_common_x86.h"
+#include "common_x86.h"
 
 /*
  * Process an HVM_CONTEXT record from the stream.
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/saverestore/restore_x86_pv.c
similarity index 99%
rename from tools/libs/guest/xg_sr_restore_x86_pv.c
rename to tools/libs/saverestore/restore_x86_pv.c
index dc50b0f5a8..96608e5231 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/saverestore/restore_x86_pv.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xg_sr_common_x86_pv.h"
+#include "common_x86_pv.h"
 
 static xen_pfn_t pfn_to_mfn(const struct xc_sr_context *ctx, xen_pfn_t pfn)
 {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/saverestore/save.c
similarity index 99%
rename from tools/libs/guest/xg_sr_save.c
rename to tools/libs/saverestore/save.c
index 6652730f6f..63881814c2 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/saverestore/save.c
@@ -2,7 +2,7 @@
 #include <arpa/inet.h>
 #include <time.h>
 
-#include "xg_sr_common.h"
+#include "common.h"
 
 /*
  * Writes an Image header and Domain header into the stream.
diff --git a/tools/libs/guest/xg_save_restore.h b/tools/libs/saverestore/save_restore.h
similarity index 98%
rename from tools/libs/guest/xg_save_restore.h
rename to tools/libs/saverestore/save_restore.h
index 3dbbc8dcd2..20bd3d30a5 100644
--- a/tools/libs/guest/xg_save_restore.h
+++ b/tools/libs/saverestore/save_restore.h
@@ -15,8 +15,6 @@
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "xc_private.h"
-
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
 
diff --git a/tools/libs/guest/xg_sr_save_x86_hvm.c b/tools/libs/saverestore/save_x86_hvm.c
similarity index 99%
rename from tools/libs/guest/xg_sr_save_x86_hvm.c
rename to tools/libs/saverestore/save_x86_hvm.c
index 1634a7bc43..91c2cb99ab 100644
--- a/tools/libs/guest/xg_sr_save_x86_hvm.c
+++ b/tools/libs/saverestore/save_x86_hvm.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xg_sr_common_x86.h"
+#include "common_x86.h"
 
 #include <xen/hvm/params.h>
 
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/saverestore/save_x86_pv.c
similarity index 99%
rename from tools/libs/guest/xg_sr_save_x86_pv.c
rename to tools/libs/saverestore/save_x86_pv.c
index 4964f1f7b8..92f77fad0f 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/saverestore/save_x86_pv.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <limits.h>
 
-#include "xg_sr_common_x86_pv.h"
+#include "common_x86_pv.h"
 
 /* Check a 64 bit virtual address for being canonical. */
 static inline bool is_canonical_address(xen_vaddr_t vaddr)
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/saverestore/stream_format.h
similarity index 100%
rename from tools/libs/guest/xg_sr_stream_format.h
rename to tools/libs/saverestore/stream_format.h
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

