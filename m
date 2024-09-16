Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC7497A4D2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 17:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799580.1209559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLe-00061A-MX; Mon, 16 Sep 2024 15:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799580.1209559; Mon, 16 Sep 2024 15:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqDLe-0005yP-IN; Mon, 16 Sep 2024 15:09:06 +0000
Received: by outflank-mailman (input) for mailman id 799580;
 Mon, 16 Sep 2024 15:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVXs=QO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sqDLc-0005jt-Pg
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 15:09:04 +0000
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b80504d-743d-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 17:09:03 +0200 (CEST)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a08489f757so13483685ab.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 08:09:02 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8eea7sm16674175ab.77.2024.09.16.08.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:09:00 -0700 (PDT)
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
X-Inumbo-ID: 9b80504d-743d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726499342; x=1727104142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbKegTM3qN+Ytt+xHcqndYgbj2oaz5lyUbttYzNXA8U=;
        b=IgbsWgLHFJignpMW78mwTN9pdmWjPIEEFZBstvBJgn2fO4JPJo5MceMCxdJcavLkve
         KVXnGt+If0NlnbaFQuV7cdhb62busjbntneFbbfTQsN7cQX9RvzCPjqSTL94pXolIzac
         gsFcRBvoM/QjF6i2BjBb59ArAKibDX57LeB5EgO8ALkqkmVXIxC4+nD5C+pJEl4pnCEX
         CoBr8vXax908kpHmIPKau1OfDHn8Smv9lgin0JzfINT8a7qiZxk8wLiSnZVstuwxbHU+
         TSFDhr9b1sFfPN3Xx7UPlFs06lapbFNl/Sv4hSp34Yie582COLYAOmSd21zkMh0D+7y9
         SF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499342; x=1727104142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbKegTM3qN+Ytt+xHcqndYgbj2oaz5lyUbttYzNXA8U=;
        b=bg+gZLM6b4Do+E7ATtxUohqG/F9Bolhbn/BZV7dphtV4rSVHsjszG2CsNU6emsPlcs
         5H92DJnvtVEeX+qWC6E5Xnqu/LE3NQxiOAxP4mZfQ2lekxTYben+QwFH0nCbCSI11KGo
         FSF0SaCR7Ofyqs7NW9ePsV6P098ADOoOO6kgIU8ZY9jhkzTx/hTNdx4SQLQxfqeIjXQg
         rms6pBJYTTg3BuvZYLHQ4sugyMpperp1OHF+F5AjyG1gio9e26frhhuai/mNNg9lfrLc
         4eCK8kAohHBrFi90vaD3imSdVhBthV282FD5CWVpRTXIfbRjN69UsKkJI2eYyRpse56C
         us9g==
X-Forwarded-Encrypted: i=1; AJvYcCVRfaFchPn24FQKMN3BoVAJW7JpznkLdtSXSdG842OPCCQlglwoTQvza4DHfdYGhpW1PdP8eXFrddg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRcwR7scinZ1J9+ljEHyRCP6Hk/62zeQ4zdVR9aJkbkBdb3cZe
	fzq+J6NZJF78lNLFbIJiMaLDOUIsc5w88iQAEAl9S2uQqZLxV9Py
X-Google-Smtp-Source: AGHT+IG+/SW/D0yFpfEJ5d73OOBWnbYkm6OlW1UxBoRWx11pp93quvsquEBHNNv20XbyDW5ufhyR9g==
X-Received: by 2002:a05:6e02:148f:b0:3a0:98ab:7932 with SMTP id e9e14a558f8ab-3a098ab7be4mr50233635ab.9.1726499341496;
        Mon, 16 Sep 2024 08:09:01 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v1 1/4] xen: Expose handle_bufioreq in xen_register_ioreq
Date: Mon, 16 Sep 2024 17:08:49 +0200
Message-ID: <20240916150853.1216703-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Expose handle_bufioreq in xen_register_ioreq().
This is to allow machines to enable or disable buffered ioreqs.

No functional change since all callers still set it to
HVM_IOREQSRV_BUFIOREQ_ATOMIC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/i386/xen/xen-hvm.c           |   4 +-
 hw/xen/xen-hvm-common.c         | 100 +++++++++++++++++++-------------
 hw/xen/xen-pvh-common.c         |   4 +-
 include/hw/xen/xen-hvm-common.h |   3 +
 include/hw/xen/xen_native.h     |   3 +-
 5 files changed, 70 insertions(+), 44 deletions(-)

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
index 3a9d6f981b..d8824cccf1 100644
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
@@ -675,59 +677,72 @@ static int xen_map_ioreq_server(XenIOState *state)
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
-        trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
+    if (state->has_bufioreq) {
+        rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
+                                       (state->shared_page == NULL) ?
+                                       &ioreq_pfn : NULL,
+                                       (state->buffered_io_page == NULL) ?
+                                       &bufioreq_pfn : NULL,
+                                       &bufioreq_evtchn);
+        if (rc < 0) {
+            error_report("failed to get ioreq server info: error %d handle=%p",
+                    errno, xen_xc);
+            return rc;
+        }
 
-        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                  PROT_READ | PROT_WRITE,
-                                                  1, &ioreq_pfn, NULL);
         if (state->shared_page == NULL) {
-            error_report("map shared IO page returned error %d handle=%p",
-                         errno, xen_xc);
+            trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
+
+            state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
+                                                      PROT_READ | PROT_WRITE,
+                                                      1, &ioreq_pfn, NULL);
+            if (state->shared_page == NULL) {
+                error_report("map shared IO page returned error %d handle=%p",
+                        errno, xen_xc);
+            }
         }
-    }
 
-    if (state->buffered_io_page == NULL) {
-        trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
-
-        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
-                                                       PROT_READ | PROT_WRITE,
-                                                       1, &bufioreq_pfn,
-                                                       NULL);
         if (state->buffered_io_page == NULL) {
-            error_report("map buffered IO page returned error %d", errno);
-            return -1;
+            trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
+
+            state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
+                    PROT_READ | PROT_WRITE,
+                    1, &bufioreq_pfn,
+                    NULL);
+            if (state->buffered_io_page == NULL) {
+                error_report("map buffered IO page returned error %d", errno);
+                return -1;
+            }
         }
     }
 
-    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
+
+    if (state->shared_page == NULL ||
+        (state->has_bufioreq && state->buffered_io_page == NULL)) {
         return -1;
     }
 
@@ -830,14 +845,15 @@ static void xen_do_ioreq_register(XenIOState *state,
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
@@ -865,6 +881,7 @@ err:
 }
 
 void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        int handle_bufioreq,
                         const MemoryListener *xen_memory_listener)
 {
     int rc;
@@ -883,7 +900,8 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
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
index 3d796235dc..7246941fe5 100644
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
+                        int handle_bufioreq,
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


