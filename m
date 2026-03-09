Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JnUJY5srml3EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF95234573
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249075.1546613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUML-0006KI-1c; Mon, 09 Mar 2026 06:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249075.1546613; Mon, 09 Mar 2026 06:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMK-0006Ho-Tq; Mon, 09 Mar 2026 06:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1249075;
 Mon, 09 Mar 2026 06:44:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UF23=BJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vzUMK-0006FY-60
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 06:44:56 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79d54920-1b83-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 07:44:53 +0100 (CET)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-56a9076813bso4437617e0c.3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 23:44:53 -0700 (PDT)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94ea681505csm1360097241.4.2026.03.08.23.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:44:51 -0700 (PDT)
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
X-Inumbo-ID: 79d54920-1b83-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038692; x=1773643492; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJrq6QMWPG9vMn/f3A1Ji6UEIjqvYTStXL9SXKLYoe4=;
        b=DMapLI2G3W9Xev1kUbEqF0oz8j/q+p9Tyhdi80uZy1cjI1I9NrzPtDu4jICJB5/kAZ
         qSGUn63UYBWM4PuIXzjwA0IlU5iI/3jwV1pHZssWripLyWJOAkB3bVH4YlP5TE55PEqU
         q+8EhpJKPGrx2sSyovdhMJFjapo/dOsqWQhBDksZJkc01Kd2ywd5uAvnTcrSp7GX94Y9
         0n5ngYOGcdsF07R+NvrvnHqAFDUfMT8SNkCpi+IKhlPxAOjMc6mHerpfXZcZqtUOd0Z+
         pvBQQlV5YhvzRpVPt2W/PfzFupOOHOLAYLqJ6ZILHp5wuVpn912FnoXWF6WHShpOKv3X
         kSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038692; x=1773643492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJrq6QMWPG9vMn/f3A1Ji6UEIjqvYTStXL9SXKLYoe4=;
        b=r9KZut7wqK80hgQ7BchUwbqYh853RHGyjO3nnB1tEz5ccscmYHx7DXECzIgS1RoJX3
         pLDkPvP2+hV8N4kMNi2yiqZB8LetUHGcb22dXFTs7GEVx2xGwALhtgBIfj5fEWNfo3PX
         T6Lp2UQ5IKg8LM+cA5gLvdgGbycwqk//lrInwwYpHPuRsoAZYeidZB0t1aIrUDTC7kRH
         2RFsSHfBnqO+ELgpGsqAnb6KuiNFwUuXWMirchMXlAtyR7vHfMRY5Gd4rf33rRAk3zmH
         JcfbRHkIgN+zCyrAsO2hJyF1G47D63sgqx3Y6mbAQGcXi1oImApHdRdEXoMyUougdyqe
         faKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOw8cqfqAf9G9mf+a3zuF/523x3+eRMoVxpKDBOmiEMWqHzu/VqWhMo9i0SFJpCb7PnDBF9R6pheM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYeFKGcJJRkW0GTTLEcfSbqRhIUSsBbINE5pF1k+BssTTGkutp
	DXX/cOYzOg182VHXn8/8dC1PGTg4k/I5LiuI+d6qtnO+rHTPjYuCX0Z+
X-Gm-Gg: ATEYQzxitIfrxITDaVxrpOIihnmfZe/V27UdGwGsa6Im8OL1scMRT3XskGYCrLhecYh
	YG3p37dlUXwYS7hwLm619f1Z5B7/XWD9n6DO/pCJo6d94Vf0kAk84Hpnx3GH6KzoI4IC4Le7jfY
	6vl905a3DGF31JQGT6zf0pw67s7pF+e689kTsgoaeTabSMdFqTCYjkACzpjgavh7zIvDgWueDOS
	EJkKXCCD6NfpJXD5h124Ps1YG7x3zOO5mYUsGcVcTs1xbJ43rliHZWAWnALCBN7QvXuJEtm7fgS
	KwWkp5XM9T0wrUxVEtiWLtyPiMM/94yowEynECfR1d8Kjq4wdML5xC6dtuYbmZ9CWjmtXo7Kwh1
	6az+TCJknng/Ptcz19MSB3y32MUfspnjbluWL0GIRaJkKGdhKcaKFTyvKn5VqMp873gmw9byPvb
	D/HiaPXycZalT/NfWzqkzExs5NtwU7V5GRCXIH8X9OO0HxaSd5BbSPaclzcQ==
X-Received: by 2002:a05:6122:1d4e:b0:559:58a5:f6cc with SMTP id 71dfb90a1353d-56b07d19f27mr3622628e0c.4.1773038691781;
        Sun, 08 Mar 2026 23:44:51 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 4/5] hw/xen-hvm: Add a mapcache arg to xen_register_ioreq()
Date: Mon,  9 Mar 2026 07:44:34 +0100
Message-ID: <20260309064436.51860-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309064436.51860-1-edgar.iglesias@gmail.com>
References: <20260309064436.51860-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4EF95234573
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,gmail.com,redhat.com,linaro.org,habkost.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:mst@redhat.com,m:marcel.apfelbaum@gmail.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,m:marcelapfelbaum@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


