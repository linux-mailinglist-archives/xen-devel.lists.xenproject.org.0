Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E298F16F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809514.1221897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrK-0000Op-AE; Thu, 03 Oct 2024 14:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809514.1221897; Thu, 03 Oct 2024 14:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrK-0000MA-4j; Thu, 03 Oct 2024 14:31:14 +0000
Received: by outflank-mailman (input) for mailman id 809514;
 Thu, 03 Oct 2024 14:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swMrI-00005c-Vv
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:31:12 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234b232f-8194-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 16:31:12 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5398e4ae9efso1187354e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:31:11 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82a38a6sm191699e87.217.2024.10.03.07.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:31:10 -0700 (PDT)
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
X-Inumbo-ID: 234b232f-8194-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965871; x=1728570671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opHAkxizOwjrlq5VyQ2hdU0DAn4w0L6+u/XZM8FV3ts=;
        b=WHmdUbdpZRYHiUNxWz5mCYDoDF0EfA/dUxPSAzIDafcK3zd0cPBGgd5uSinHz1NUX5
         4LUObLC7786bkelRURFHoaTMR0yTlDicINlLc1QtEINHk5vGSCPnTyYVE2kBRv3gKujR
         8JHFSkusoTtgx7p6OQi5pr8VwOCvjoYHO0+HsW+AS9GY+o+XSs+tCALf2jTjonakg+fH
         dsK//9hV+Dk0zLHBSWZp9xlK6K13MYpFxlAAMwJ+OVwNIPXhRFVhSg9S76PSuQ4McOH/
         dzMfkG0b3amuI/C/KB3qin+dpsg3O6iMD99ZDcXd0tTZlK21Saf7q2oq2z9mqt58MpW4
         2Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965871; x=1728570671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opHAkxizOwjrlq5VyQ2hdU0DAn4w0L6+u/XZM8FV3ts=;
        b=Ao9Zh9ShAbfmjcmk8Htf7NzgDjoRtzkjwxX6dtSaJdHkaQlmLfhV369cz+fTz4cL5F
         Tbal9tGfeFrH3N3Icrs2hfVPFmFu8jxD61mmDS3VisDc8MX1wXnQTG281sC9lq919z7O
         1U9jKJYpSfGH8OoyHTxuTn/6PFs1yKGThdEDUZ/7InNd9tFNevhdYeEa5AYbZLkIfYYc
         LiiDEjRnAJ+NoXs9/1eYZ2s4fh2xSRbyB7MEkiN0GV7st9gDGOC+FVIxwu9CtIkI4/2T
         RoWbv3FdUReQsCzNOvq9WFRCwh6KFmG22RGR1zmBIn5+3xixWhQZOMmpex32uvcSseNf
         3bjg==
X-Forwarded-Encrypted: i=1; AJvYcCWkaWHQw0HzfMVmFO+mRNkZbY6ZAR9Y8QI9SnvuzpKD5vqH8zGMklfQd18gqKv6U/7p4ybmcvsy/rA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwMN1TACKKJy8husGBYDBhnMEwrAIXSWJDuQt1/lWtJ6YhZ0zw
	FhwsPRzNZ2pzz9sFgyacrUyHr3rg8XrAe45el7SpdmTb9/X7T1hV
X-Google-Smtp-Source: AGHT+IHt76trfUAo3X2djdRCfcBNTLDwcCDmqbU8H2X/oCHrgaYE6gDJizIgEZU7Zmu/NUrFBvluYg==
X-Received: by 2002:a05:6512:6288:b0:539:a3cd:97cb with SMTP id 2adb3069b0e04-539a3cde6b7mr3099308e87.43.1727965871243;
        Thu, 03 Oct 2024 07:31:11 -0700 (PDT)
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
Subject: [PULL v1 2/5] hw/xen: Expose handle_bufioreq in xen_register_ioreq
Date: Thu,  3 Oct 2024 16:30:59 +0200
Message-ID: <20241003143103.1476805-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
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
 hw/xen/xen-hvm-common.c         | 101 ++++++++++++++++++++------------
 hw/xen/xen-pvh-common.c         |   4 +-
 include/hw/xen/xen-hvm-common.h |   3 +
 include/hw/xen/xen_native.h     |   3 +-
 5 files changed, 74 insertions(+), 41 deletions(-)

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
index 3a9d6f981b..3ce994fc3a 100644
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
@@ -675,59 +677,79 @@ static int xen_map_ioreq_server(XenIOState *state)
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
-
-    if (state->shared_page == NULL) {
+    /*
+     * If we fail to map the shared page with xenforeignmemory_map_resource()
+     * or if we're using buffered ioreqs, we need xen_get_ioreq_server_info()
+     * to provide the the addresses to map the shared page and/or to get the
+     * event-channel port for buffered ioreqs.
+     */
+    if (state->shared_page == NULL || state->has_bufioreq) {
         trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
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
 
-        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                  PROT_READ | PROT_WRITE,
-                                                  1, &ioreq_pfn, NULL);
+        if (state->shared_page == NULL) {
+            trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
+
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
 
@@ -830,14 +852,15 @@ static void xen_do_ioreq_register(XenIOState *state,
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
@@ -865,6 +888,7 @@ err:
 }
 
 void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        uint8_t handle_bufioreq,
                         const MemoryListener *xen_memory_listener)
 {
     int rc;
@@ -883,7 +907,8 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
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


