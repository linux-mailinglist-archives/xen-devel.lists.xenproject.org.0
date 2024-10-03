Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6098F6A2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809819.1222368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0g-00085p-Iz; Thu, 03 Oct 2024 18:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809819.1222368; Thu, 03 Oct 2024 18:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0g-00083u-FA; Thu, 03 Oct 2024 18:57:10 +0000
Received: by outflank-mailman (input) for mailman id 809819;
 Thu, 03 Oct 2024 18:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swR0f-00082k-DI
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:57:09 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 497f6ce9-81b9-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 20:57:07 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5398cc2fcb7so1592317e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:57:07 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82a3977sm236219e87.210.2024.10.03.11.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:05 -0700 (PDT)
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
X-Inumbo-ID: 497f6ce9-81b9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981827; x=1728586627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGqqG4KMNUSJeDEYGOTuWNkgrn+DA19mS0ISFTxuLo8=;
        b=gPQS4N5gmXmqGXF19alMRw4Zml2aNyhfwC1srtmq2nQ0Sf8n1mEfsOeSXMofssuwp5
         +sXV+ClqvAB7tMC0S6FW+j2N0H6bDuL2QvmROfPxgdbjQjRgVkI3tbbtVJ/yxVIRdqxb
         +7Pz7I8Vy0DT3T0qFb8o2GjZRKX2X3XVV+xlEmS6kdYDwhA0n7IK2fWJWx6VOb8NLXdW
         6/xjUb9ok9+agWWqRFRZhurrie/txgsNDqMubd1bfrw+CytcZbCV0AUqweGr6Fz74t4z
         xTJk7AGgcrTdlVPZMkm8DdaqwoiqtGbHIkYXb1uZ3SanLhCdJvSkcIp9IHLAdfxrL5yV
         TpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981827; x=1728586627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGqqG4KMNUSJeDEYGOTuWNkgrn+DA19mS0ISFTxuLo8=;
        b=lTw4/FFkot+vGnShLMp07YRLXLNUItJEmKjWFwOhmUq9fCHGxCZtzEqLepRbMkAImX
         VhMqdw/49h+1tv0kPZTtAfAfOVqb4RoYIU0I6CUgXfqunNGUP1kWmhkE1KEw++eHXqFN
         e77XswZSp8s5QZTt3UGLWbRcuusIwW3AFGj8J1ZdyYClb59vSlnTNUGdv320ujx9jbCp
         jJrdIXHHgVxi9Rf2O2s/3wHnIzhOvDFHmLcYVsXyaux/jGoR0qptZcVHGvcorYZT87+F
         zM5cvQcSXCfU3dO8+c1/LqD4+GP1gQno5d7WHkAe47QAttcxsYVCi0/V95ZNTezDHJY4
         YghA==
X-Forwarded-Encrypted: i=1; AJvYcCXQq7GK5KCdxF74y8FCi8mU31XT+tbVdFE6IRgnzwxXzT9756fdRVA4o1ebnlzVGZRBsKGim7IukVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfOkUYKIE1OT05HMYshfEutwewaPFOd4JkZbL3vomn/rIDqimv
	Ol6AHKN3F57Aw0qcgqiFBpLZ539mrwMuZC0s1zslI/Ggyrl0kV+U
X-Google-Smtp-Source: AGHT+IHLTEkfckUGGKRvcplbeYVmPhK1mXleMIddN5HE0TGjyz0xJQGcVibsOAd0AKBA95Aqv2gqjg==
X-Received: by 2002:a05:6512:a96:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-539ab84a43cmr239526e87.3.1727981826784;
        Thu, 03 Oct 2024 11:57:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 2/5] hw/xen: Expose handle_bufioreq in xen_register_ioreq
Date: Thu,  3 Oct 2024 20:56:51 +0200
Message-ID: <20241003185655.1480819-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Expose handle_bufioreq in xen_register_ioreq().
This is to allow machines to enable or disable buffered ioreqs.

No functional change since all callers still set it to
HVM_IOREQSRV_BUFIOREQ_ATOMIC.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/i386/xen/xen-hvm.c           |   4 +-
 hw/xen/xen-hvm-common.c         | 100 ++++++++++++++++++++------------
 hw/xen/xen-pvh-common.c         |   4 +-
 include/hw/xen/xen-hvm-common.h |   3 +
 include/hw/xen/xen_native.h     |   3 +-
 5 files changed, 73 insertions(+), 41 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 4f6446600c..d3df488c48 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -614,7 +614,9 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     state = g_new0(XenIOState, 1);
 
-    xen_register_ioreq(state, max_cpus, &xen_memory_listener);
+    xen_register_ioreq(state, max_cpus,
+                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
+                       &xen_memory_listener);
 
     xen_is_stubdomain = xen_check_stubdomain(state->xenstore);
 
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 3a9d6f981b..7d2b72853b 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -667,6 +667,8 @@ static int xen_map_ioreq_server(XenIOState *state)
     xen_pfn_t ioreq_pfn;
     xen_pfn_t bufioreq_pfn;
     evtchn_port_t bufioreq_evtchn;
+    unsigned long num_frames = 1;
+    unsigned long frame = 1;
     int rc;
 
     /*
@@ -675,59 +677,78 @@ static int xen_map_ioreq_server(XenIOState *state)
      */
     QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
     QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
+
+    if (state->has_bufioreq) {
+        frame = 0;
+        num_frames = 2;
+    }
     state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
                                          XENMEM_resource_ioreq_server,
-                                         state->ioservid, 0, 2,
+                                         state->ioservid,
+                                         frame, num_frames,
                                          &addr,
                                          PROT_READ | PROT_WRITE, 0);
     if (state->fres != NULL) {
         trace_xen_map_resource_ioreq(state->ioservid, addr);
-        state->buffered_io_page = addr;
-        state->shared_page = addr + XC_PAGE_SIZE;
+        state->shared_page = addr;
+        if (state->has_bufioreq) {
+            state->buffered_io_page = addr;
+            state->shared_page = addr + XC_PAGE_SIZE;
+        }
     } else if (errno != EOPNOTSUPP) {
         error_report("failed to map ioreq server resources: error %d handle=%p",
                      errno, xen_xc);
         return -1;
     }
 
-    rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
-                                   (state->shared_page == NULL) ?
-                                   &ioreq_pfn : NULL,
-                                   (state->buffered_io_page == NULL) ?
-                                   &bufioreq_pfn : NULL,
-                                   &bufioreq_evtchn);
-    if (rc < 0) {
-        error_report("failed to get ioreq server info: error %d handle=%p",
-                     errno, xen_xc);
-        return rc;
-    }
+    /*
+     * If we fail to map the shared page with xenforeignmemory_map_resource()
+     * or if we're using buffered ioreqs, we need xen_get_ioreq_server_info()
+     * to provide the the addresses to map the shared page and/or to get the
+     * event-channel port for buffered ioreqs.
+     */
+    if (state->shared_page == NULL || state->has_bufioreq) {
+        rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
+                                       (state->shared_page == NULL) ?
+                                       &ioreq_pfn : NULL,
+                                       (state->has_bufioreq &&
+                                        state->buffered_io_page == NULL) ?
+                                       &bufioreq_pfn : NULL,
+                                       &bufioreq_evtchn);
+        if (rc < 0) {
+            error_report("failed to get ioreq server info: error %d handle=%p",
+                         errno, xen_xc);
+            return rc;
+        }
 
-    if (state->shared_page == NULL) {
-        trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
+        if (state->shared_page == NULL) {
+            trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
 
-        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                  PROT_READ | PROT_WRITE,
-                                                  1, &ioreq_pfn, NULL);
+            state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
+                                                      PROT_READ | PROT_WRITE,
+                                                      1, &ioreq_pfn, NULL);
+        }
         if (state->shared_page == NULL) {
             error_report("map shared IO page returned error %d handle=%p",
                          errno, xen_xc);
         }
-    }
 
-    if (state->buffered_io_page == NULL) {
-        trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
+        if (state->has_bufioreq && state->buffered_io_page == NULL) {
+            trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
 
-        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                       PROT_READ | PROT_WRITE,
-                                                       1, &bufioreq_pfn,
-                                                       NULL);
-        if (state->buffered_io_page == NULL) {
-            error_report("map buffered IO page returned error %d", errno);
-            return -1;
+            state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
+                                                        PROT_READ | PROT_WRITE,
+                                                        1, &bufioreq_pfn,
+                                                        NULL);
+            if (state->buffered_io_page == NULL) {
+                error_report("map buffered IO page returned error %d", errno);
+                return -1;
+            }
         }
     }
 
-    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
+    if (state->shared_page == NULL ||
+        (state->has_bufioreq && state->buffered_io_page == NULL)) {
         return -1;
     }
 
@@ -830,14 +851,15 @@ static void xen_do_ioreq_register(XenIOState *state,
         state->ioreq_local_port[i] = rc;
     }
 
-    rc = qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_domid,
-                                          state->bufioreq_remote_port);
-    if (rc == -1) {
-        error_report("buffered evtchn bind error %d", errno);
-        goto err;
+    if (state->has_bufioreq) {
+        rc = qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_domid,
+                                              state->bufioreq_remote_port);
+        if (rc == -1) {
+            error_report("buffered evtchn bind error %d", errno);
+            goto err;
+        }
+        state->bufioreq_local_port = rc;
     }
-    state->bufioreq_local_port = rc;
-
     /* Init RAM management */
 #ifdef XEN_COMPAT_PHYSMAP
     xen_map_cache_init(xen_phys_offset_to_gaddr, state);
@@ -865,6 +887,7 @@ err:
 }
 
 void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        uint8_t handle_bufioreq,
                         const MemoryListener *xen_memory_listener)
 {
     int rc;
@@ -883,7 +906,8 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
         goto err;
     }
 
-    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
+    state->has_bufioreq = handle_bufioreq != HVM_IOREQSRV_BUFIOREQ_OFF;
+    rc = xen_create_ioreq_server(xen_domid, handle_bufioreq, &state->ioservid);
     if (!rc) {
         xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
     } else {
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 28d7168446..08641fdcec 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -194,7 +194,9 @@ static void xen_pvh_init(MachineState *ms)
     }
 
     xen_pvh_init_ram(s, sysmem);
-    xen_register_ioreq(&s->ioreq, ms->smp.max_cpus, &xen_memory_listener);
+    xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
+                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
+                       &xen_memory_listener);
 
     if (s->cfg.virtio_mmio_num) {
         xen_create_virtio_mmio_devices(s);
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 3d796235dc..0f586c4384 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -81,6 +81,8 @@ typedef struct XenIOState {
     QLIST_HEAD(, XenPciDevice) dev_list;
     DeviceListener device_listener;
 
+    bool has_bufioreq;
+
     Notifier exit;
 } XenIOState;
 
@@ -95,6 +97,7 @@ void xen_device_unrealize(DeviceListener *listener, DeviceState *dev);
 
 void xen_hvm_change_state_handler(void *opaque, bool running, RunState rstate);
 void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        uint8_t handle_bufioreq,
                         const MemoryListener *xen_memory_listener);
 
 void cpu_ioreq_pio(ioreq_t *req);
diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
index 1a5ad693a4..5caf91a616 100644
--- a/include/hw/xen/xen_native.h
+++ b/include/hw/xen/xen_native.h
@@ -464,10 +464,11 @@ static inline void xen_unmap_pcidev(domid_t dom,
 }
 
 static inline int xen_create_ioreq_server(domid_t dom,
+                                          int handle_bufioreq,
                                           ioservid_t *ioservid)
 {
     int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
-                                                HVM_IOREQSRV_BUFIOREQ_ATOMIC,
+                                                handle_bufioreq,
                                                 ioservid);
 
     if (rc == 0) {
-- 
2.43.0


