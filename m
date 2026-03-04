Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHG/I4SQp2lKiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B111F9B66
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245076.1544473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPk-00079j-Tj; Wed, 04 Mar 2026 01:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245076.1544473; Wed, 04 Mar 2026 01:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPk-00076K-PW; Wed, 04 Mar 2026 01:52:40 +0000
Received: by outflank-mailman (input) for mailman id 1245076;
 Wed, 04 Mar 2026 01:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0T8J=BE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vxbPi-00069T-Ld
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 01:52:38 +0000
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d219c63d-176c-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 02:52:38 +0100 (CET)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-5ff1703cb9eso1668728137.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 17:52:37 -0800 (PST)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94df6577693sm16742382241.9.2026.03.03.17.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 17:52:35 -0800 (PST)
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
X-Inumbo-ID: d219c63d-176c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589157; x=1773193957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZOO08zLikZY030P2ehrGV6veLejKIl076oxwM9/gTs=;
        b=eXk/08fdK1Tui/DCmFmi2fHGK0ecEBAJkf9fZhkl1StlYMNMxgHBwFl5Zh3hE+5J9K
         n3Axy7FwydzUkCjGruiBggDhzTwBFnX+XydUkvdMPEbTaooYHFRrCcQeS9qoE5s1wq9n
         VcZLo5bWtuNjuv3sm/3UurFdkkVx0eGuVJj6V4nWA5hm40Li+amUkVb/xMf/HweDevf0
         T1adE0UmZsPsvl2RZMQQiKLNQ7sfMJUw/EvCbTGsbLa6TQvrHtDoRL4DS4IkTmhUPMmd
         QhEuw/N92QpYUxRKnrTBtuzcNE1eV7tsUoLffZh+RkkT2lXRhKlyH//IBf5FiPmMnhTH
         rSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589157; x=1773193957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZOO08zLikZY030P2ehrGV6veLejKIl076oxwM9/gTs=;
        b=pzVvZ6lUx14VYhmPDknIA+rBv5qpbwaF5yg6DyVY2iPaE3v+bX8ASSvfnhsNwQDfwb
         IDP0isornjJouAwj1g1EXW5eiP3CmF4yDpxdhsfqdta7DrzS1LQG6H7BIu7BrMLEs0to
         rzvjKW3Oy5QwZlBWH0M9wp/yyVqWLAX7C78/CxNA9PRWI/h81hlc9syYf8Q043Z15xec
         l7hIo50n7zS31SQVDSasdeVr7oiH+WukaBVKqKcTG/2IuHLYzykwROZmAX91dh9ylPBx
         8g1PjV5MemLeUZACjprzz4I3w8GHlGR/O3vJUDx1eoQWFV2APpDr/Uf9gftpSK4su5uU
         YDsg==
X-Forwarded-Encrypted: i=1; AJvYcCWpCdSYjNYFtOfymWwWkoO0PRuYTEz2mXGdL9xXH/mzB6YwxiZSAxNQ0PB35gmVlL588vxvl5kKafs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5TK0+LKbDoD07VeqXWgp5w0GxmuIkRgPB9Tk0A9MyRDjaV2Ul
	quEPzGVZ+lpD43e6o/LFP6ooNwrM65T9RUqzlcnuMEPmFSDYj3W26922
X-Gm-Gg: ATEYQzyKvPXp69wkaW+SZy9If/u3e1kyxj2Nz3PavIIxG6FycVm09ztBsinxHjDTp9p
	2eMks7a9J1YrhOHjb2MEa5j2nuD/eCkIgOYPGgLYdbj47VYTihGGivv/7jBOsu5mtrZt4VZMdEr
	4ogTgbJxMkC/ZyEuSq5ii3QGOj+Cqo7hntjTdtsCJGQlEHakUB8zV8VC7+l2Bc+BDrPwTEh5HbN
	fSKl4MjXNGM8LtZ2X1lFxxCLahJhzERHePF8HwaZMHO6JhN8nnoma1yEzuve/H1vJl1bhXGsFft
	uFT/anz47nxkKFzvZUmH7EicRJ23NI9Gg1aHMXovABZLcygwX0oNA+WNWYxR8XO+Pvu9pR65jKb
	k7vrvWnW+22CGuaKxpqGpdER2+XcihPFB1ljULBUFOPXJ8ApTnJFJHWuW5FioBJZOiTYhSmC7+2
	ip+o1ZVDro6X7kpMCUZKZ3XiF+UFG5vGK9kiMyS+t+MIRFFYciSxTQM6Z7EA==
X-Received: by 2002:a05:6102:c52:b0:5fe:13bc:f13a with SMTP id ada2fe7eead31-5ffaafb23f5mr239107137.36.1772589156590;
        Tue, 03 Mar 2026 17:52:36 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 4/5] hw/xen-hvm: Add a mapcache arg to xen_register_ioreq()
Date: Wed,  4 Mar 2026 02:52:20 +0100
Message-ID: <20260304015222.979224-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304015222.979224-1-edgar.iglesias@gmail.com>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44B111F9B66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,xen.org,gmail.com,redhat.com,linaro.org,habkost.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@gmail.com,m:mst@redhat.com,m:marcel.apfelbaum@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,m:marcelapfelbaum@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a mapcache argument to xen_register_ioreq() allowing
the caller to optionally disable the mapcache.

All callers still call it with mapcache = true so there's no
functional change yet.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/i386/xen/xen-hvm.c           |  2 +-
 hw/xen/xen-hvm-common.c         | 18 ++++++++++++------
 hw/xen/xen-pvh-common.c         |  3 ++-
 include/hw/xen/xen-hvm-common.h |  3 ++-
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index a6e1683885..c7bfcaae8e 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -622,7 +622,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     xen_register_ioreq(state, max_cpus,
                        HVM_IOREQSRV_BUFIOREQ_ATOMIC,
-                       &xen_memory_listener);
+                       &xen_memory_listener, true);
 
     xen_is_stubdomain = xen_check_stubdomain(state->xenstore);
 
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 59c73dfaeb..8c825588ae 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -473,7 +473,9 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
         case IOREQ_TYPE_TIMEOFFSET:
             break;
         case IOREQ_TYPE_INVALIDATE:
-            xen_invalidate_map_cache();
+            if (xen_map_cache_enabled()) {
+                xen_invalidate_map_cache();
+            }
             break;
         case IOREQ_TYPE_PCI_CONFIG:
             cpu_ioreq_config(state, req);
@@ -823,7 +825,8 @@ void xen_shutdown_fatal_error(const char *fmt, ...)
 
 static void xen_do_ioreq_register(XenIOState *state,
                                   unsigned int max_cpus,
-                                  const MemoryListener *xen_memory_listener)
+                                  const MemoryListener *xen_memory_listener,
+                                  bool mapcache)
 {
     int i, rc;
 
@@ -874,11 +877,13 @@ static void xen_do_ioreq_register(XenIOState *state,
         state->bufioreq_local_port = rc;
     }
     /* Init RAM management */
+    if (mapcache) {
 #ifdef XEN_COMPAT_PHYSMAP
-    xen_map_cache_init(xen_phys_offset_to_gaddr, state);
+        xen_map_cache_init(xen_phys_offset_to_gaddr, state);
 #else
-    xen_map_cache_init(NULL, state);
+        xen_map_cache_init(NULL, state);
 #endif
+    }
 
     qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
 
@@ -901,7 +906,8 @@ err:
 
 void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
                         uint8_t handle_bufioreq,
-                        const MemoryListener *xen_memory_listener)
+                        const MemoryListener *xen_memory_listener,
+                        bool mapcache)
 {
     int rc;
 
@@ -922,7 +928,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
     state->has_bufioreq = handle_bufioreq != HVM_IOREQSRV_BUFIOREQ_OFF;
     rc = xen_create_ioreq_server(xen_domid, handle_bufioreq, &state->ioservid);
     if (!rc) {
-        xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
+        xen_do_ioreq_register(state, max_cpus, xen_memory_listener, mapcache);
     } else {
         warn_report("xen: failed to create ioreq server");
     }
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 1381310fc7..4fade017bb 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -202,7 +202,8 @@ static void xen_pvh_init(MachineState *ms)
     xen_pvh_init_ram(s, sysmem);
     xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
                        xpc->handle_bufioreq,
-                       &xen_memory_listener);
+                       &xen_memory_listener,
+                       true);
 
     if (s->cfg.virtio_mmio_num) {
         xen_create_virtio_mmio_devices(s);
diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index e1beca062f..d177ff14ea 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -91,7 +91,8 @@ void xen_device_unrealize(DeviceListener *listener, DeviceState *dev);
 void xen_hvm_change_state_handler(void *opaque, bool running, RunState rstate);
 void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
                         uint8_t handle_bufioreq,
-                        const MemoryListener *xen_memory_listener);
+                        const MemoryListener *xen_memory_listener,
+                        bool mapcache);
 
 void cpu_ioreq_pio(ioreq_t *req);
 #endif /* HW_XEN_HVM_COMMON_H */
-- 
2.43.0


