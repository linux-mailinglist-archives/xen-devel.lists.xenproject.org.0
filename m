Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773085B5F6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683264.1062720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLsH-0002xw-H4; Tue, 20 Feb 2024 08:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683264.1062720; Tue, 20 Feb 2024 08:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLsH-0002vV-Da; Tue, 20 Feb 2024 08:53:13 +0000
Received: by outflank-mailman (input) for mailman id 683264;
 Tue, 20 Feb 2024 08:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzaM=J5=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rcLsF-0002dz-GK
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:53:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7959e3ec-cfcd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:53:10 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3e8c1e4aa7so194147066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:53:10 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:10 -0800 (PST)
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
X-Inumbo-ID: 7959e3ec-cfcd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708419190; x=1709023990; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74P+PKZ6orTLj/5plkkdrxWuHnGI5wedPF2+fgfkjP0=;
        b=Wy2Zd/LcuH+3l8id/j9RzCXBT3y4P0QzKrhPQ3jsLvYKL5NM7v74NgOJ+tyq2ONb0V
         NTcfTwS5A2Kd1yOxY8L8KDNyUrFrDv+0WzNenc5F6e42yXuA/tH2jZryHP3M+Yebzp8l
         Qd12qScioQ87FOmZtY6fLQi1FM0rwbRoqlj754Y8ESvFKPYlrr9wqhGB79dijbsRmzKk
         +aJ3mawLZskCs+oa5jwUQUH11A5pfrHfHU0Y2e8r6RaY6nB1TWzTdZhkl8Glgj/3Q6EN
         HKtZkZpn1Qp+YsWJYHBGCAiD+sGzoJi7XO9faLfclIqhy0ei0trB9PJ5VNcR98fgBw0H
         frag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419190; x=1709023990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74P+PKZ6orTLj/5plkkdrxWuHnGI5wedPF2+fgfkjP0=;
        b=XTIQenuEf85xei1cIa2bz+L2fq9OprFu1JhNOlgGQ9yUqBRgLX42xiKqYbqMrOrc+z
         FjUvFsZexwalEmtBYG6VgIj4AQHRJhfRQtD+EbJsUaOQz+4znaWJgxJ2efRSFWrd6eLF
         UXMNPawYZzB1UoE8WH/YJt4atA8XsWnxNsLhKxc7Qz63qu6OArDOnt98nRHz8OgbSLtg
         EdCStW3yii0dG6kagz8FzvBpl850IMNjDIJN1zsfsxgcB5RYsuNbFCXlxgwWRXaxTS7q
         ArysrVj1Py1py5lRVf6srBjlGkF5h+4EdRNwjjH1sOohIteI+5Tp9bF9gmuWX1Nhh04v
         V4pg==
X-Forwarded-Encrypted: i=1; AJvYcCVXJS8X0Bv4W43tVq2ZY2jdoHnHoQe7zSffnD2G2rIsuA96duDgJ3V/BqV95dA9ESbFc/+Q7xFALKLjjkdL+RK5BFoXYN9fhPJZLmb0yEc=
X-Gm-Message-State: AOJu0YxVl4kQElLKjY5KLEevY5AKxxG2gQhkMdpmnQWzhkOaSxslg2dN
	CNBUfobRyOWAVfj98VWxfozNT5t/bx0Lkl4CHF9l4jIwYN07bksadxb8FZvlfmk=
X-Google-Smtp-Source: AGHT+IH0/5iDtgDsLwpGN/YmUhRGA55XSWPIdNMzHkhCmG1fsWPv29/an+50Zc6oVwnQznVwV1dJEg==
X-Received: by 2002:a17:906:57ca:b0:a3f:ce8:1234 with SMTP id u10-20020a17090657ca00b00a3f0ce81234mr403891ejr.68.1708419190280;
        Tue, 20 Feb 2024 00:53:10 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 03/21] Xen headers: correct typos
Date: Tue, 20 Feb 2024 10:52:10 +0200
Message-Id: <dca380ada7f7eabfb473828eccafc2902b1985b7.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 include/hw/xen/interface/arch-x86/xen-x86_64.h | 2 +-
 include/hw/xen/interface/arch-x86/xen.h        | 2 +-
 include/hw/xen/interface/event_channel.h       | 2 +-
 include/hw/xen/interface/grant_table.h         | 2 +-
 include/hw/xen/interface/hvm/hvm_op.h          | 2 +-
 include/hw/xen/interface/io/blkif.h            | 4 ++--
 include/hw/xen/interface/io/fbif.h             | 2 +-
 include/hw/xen/interface/io/kbdif.h            | 2 +-
 include/hw/xen/interface/io/ring.h             | 2 +-
 include/hw/xen/interface/memory.h              | 2 +-
 include/hw/xen/interface/physdev.h             | 4 ++--
 include/hw/xen/interface/xen.h                 | 4 ++--
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/hw/xen/interface/arch-x86/xen-x86_64.h b/include/hw/xen/interface/arch-x86/xen-x86_64.h
index 5d9035ed22..3e94eeb0bf 100644
--- a/include/hw/xen/interface/arch-x86/xen-x86_64.h
+++ b/include/hw/xen/interface/arch-x86/xen-x86_64.h
@@ -89,7 +89,7 @@
  *   RING1 -> RING3 kernel mode.
  *   RING2 -> RING3 kernel mode.
  *   RING3 -> RING3 user mode.
- * However RING0 indicates that the guest kernel should return to iteself
+ * However RING0 indicates that the guest kernel should return to itself
  * directly with
  *      orb   $3,1*8(%rsp)
  *      iretq
diff --git a/include/hw/xen/interface/arch-x86/xen.h b/include/hw/xen/interface/arch-x86/xen.h
index c0f4551247..323bd06a63 100644
--- a/include/hw/xen/interface/arch-x86/xen.h
+++ b/include/hw/xen/interface/arch-x86/xen.h
@@ -156,7 +156,7 @@ typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */
  * information in this structure is updated, the fields read include: fpu_ctxt
  * (if VGCT_I387_VALID is set), flags, user_regs and debugreg[*].
  *
- * Note: VCPUOP_initialise for HVM guests is non-symetric with
+ * Note: VCPUOP_initialise for HVM guests is non-symmetric with
  * DOMCTL_setvcpucontext, and uses struct vcpu_hvm_context from hvm/hvm_vcpu.h
  */
 struct vcpu_guest_context {
diff --git a/include/hw/xen/interface/event_channel.h b/include/hw/xen/interface/event_channel.h
index 0d91a1c4af..d446863230 100644
--- a/include/hw/xen/interface/event_channel.h
+++ b/include/hw/xen/interface/event_channel.h
@@ -302,7 +302,7 @@ typedef struct evtchn_set_priority evtchn_set_priority_t;
  * ` enum neg_errnoval
  * ` HYPERVISOR_event_channel_op_compat(struct evtchn_op *op)
  * `
- * Superceded by new event_channel_op() hypercall since 0x00030202.
+ * Superseded by new event_channel_op() hypercall since 0x00030202.
  */
 struct evtchn_op {
     uint32_t cmd; /* enum event_channel_op */
diff --git a/include/hw/xen/interface/grant_table.h b/include/hw/xen/interface/grant_table.h
index 1dfa17a6d0..7652e8bf81 100644
--- a/include/hw/xen/interface/grant_table.h
+++ b/include/hw/xen/interface/grant_table.h
@@ -607,7 +607,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
  /*
   * GNTMAP_contains_pte subflag:
   *  0 => This map request contains a host virtual address.
-  *  1 => This map request contains the machine addess of the PTE to update.
+  *  1 => This map request contains the machine address of the PTE to update.
   */
 #define _GNTMAP_contains_pte    (4)
 #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
diff --git a/include/hw/xen/interface/hvm/hvm_op.h b/include/hw/xen/interface/hvm/hvm_op.h
index e22adf0319..3defe1c108 100644
--- a/include/hw/xen/interface/hvm/hvm_op.h
+++ b/include/hw/xen/interface/hvm/hvm_op.h
@@ -337,7 +337,7 @@ struct xen_hvm_altp2m_op {
 #define HVMOP_altp2m_vcpu_disable_notify  13
 /* Get the active vcpu p2m index */
 #define HVMOP_altp2m_get_p2m_idx          14
-/* Set the "Supress #VE" bit for a range of pages */
+/* Set the "Suppress #VE" bit for a range of pages */
 #define HVMOP_altp2m_set_suppress_ve_multi 15
 /* Set visibility for a given altp2m view */
 #define HVMOP_altp2m_set_visibility       16
diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
index 22f1eef0c0..4356956975 100644
--- a/include/hw/xen/interface/io/blkif.h
+++ b/include/hw/xen/interface/io/blkif.h
@@ -42,7 +42,7 @@
  * All data in the XenStore is stored as strings.  Nodes specifying numeric
  * values are encoded in decimal.  Integer value ranges listed below are
  * expressed as fixed sized integer types capable of storing the conversion
- * of a properly formated node string, without loss of information.
+ * of a properly formatted node string, without loss of information.
  *
  * Any specified default value is in effect if the corresponding XenBus node
  * is not present in the XenStore.
@@ -406,7 +406,7 @@
  *     further requests may reuse these grants and require write permissions.
  * (9) Linux implementation doesn't have a limit on the maximum number of
  *     grants that can be persistently mapped in the frontend driver, but
- *     due to the frontent driver implementation it should never be bigger
+ *     due to the frontend driver implementation it should never be bigger
  *     than RING_SIZE * BLKIF_MAX_SEGMENTS_PER_REQUEST.
  *(10) The discard-secure property may be present and will be set to 1 if the
  *     backing device supports secure discard.
diff --git a/include/hw/xen/interface/io/fbif.h b/include/hw/xen/interface/io/fbif.h
index 93c73195d8..46046f6775 100644
--- a/include/hw/xen/interface/io/fbif.h
+++ b/include/hw/xen/interface/io/fbif.h
@@ -72,7 +72,7 @@ union xenfb_out_event
  * just ignore it.  Frontends that use the advice should immediately
  * refresh the framebuffer (and send an update notification event if
  * those have been requested), then use the update frequency to guide
- * their periodical refreshs.
+ * their periodical refresh.
  */
 #define XENFB_TYPE_REFRESH_PERIOD 1
 #define XENFB_NO_REFRESH 0
diff --git a/include/hw/xen/interface/io/kbdif.h b/include/hw/xen/interface/io/kbdif.h
index 4bde6b3821..5794cc33f8 100644
--- a/include/hw/xen/interface/io/kbdif.h
+++ b/include/hw/xen/interface/io/kbdif.h
@@ -22,7 +22,7 @@
  * All data in XenStore is stored as strings.  Nodes specifying numeric
  * values are encoded in decimal. Integer value ranges listed below are
  * expressed as fixed sized integer types capable of storing the conversion
- * of a properly formated node string, without loss of information.
+ * of a properly formatted node string, without loss of information.
  *
  *****************************************************************************
  *                            Backend XenBus Nodes
diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
index 025939278b..6d8f63d7a5 100644
--- a/include/hw/xen/interface/io/ring.h
+++ b/include/hw/xen/interface/io/ring.h
@@ -145,7 +145,7 @@ typedef struct __name##_back_ring __name##_back_ring_t
  *
  * N.B. these macros do NO INTERLOCKS OR FLOW CONTROL.
  * This is OK in 1-for-1 request-response situations where the
- * requestor (front end) never has more than RING_SIZE()-1
+ * requester (front end) never has more than RING_SIZE()-1
  * outstanding requests.
  */
 
diff --git a/include/hw/xen/interface/memory.h b/include/hw/xen/interface/memory.h
index 29cf5c8239..ad11573d90 100644
--- a/include/hw/xen/interface/memory.h
+++ b/include/hw/xen/interface/memory.h
@@ -167,7 +167,7 @@ struct xen_machphys_mfn_list {
 
     /*
      * Pointer to buffer to fill with list of extent starts. If there are
-     * any large discontiguities in the machine address space, 2MB gaps in
+     * any large discontinuities in the machine address space, 2MB gaps in
      * the machphys table will be represented by an MFN base of zero.
      */
     XEN_GUEST_HANDLE(xen_pfn_t) extent_start;
diff --git a/include/hw/xen/interface/physdev.h b/include/hw/xen/interface/physdev.h
index f0c0d4727c..053c045cf5 100644
--- a/include/hw/xen/interface/physdev.h
+++ b/include/hw/xen/interface/physdev.h
@@ -206,7 +206,7 @@ typedef struct physdev_manage_pci_ext physdev_manage_pci_ext_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_manage_pci_ext_t);
 
 /*
- * Argument to physdev_op_compat() hypercall. Superceded by new physdev_op()
+ * Argument to physdev_op_compat() hypercall. Superseded by new physdev_op()
  * hypercall since 0x00030202.
  */
 struct physdev_op {
@@ -332,7 +332,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_dbgp_op_t);
 
 #if __XEN_INTERFACE_VERSION__ < 0x00040600
 /*
- * These all-capitals physdev operation names are superceded by the new names
+ * These all-capitals physdev operation names are superseded by the new names
  * (defined above) since interface version 0x00030202. The guard above was
  * added post-4.5 only though and hence shouldn't check for 0x00030202.
  */
diff --git a/include/hw/xen/interface/xen.h b/include/hw/xen/interface/xen.h
index 920567e006..b8fe746f78 100644
--- a/include/hw/xen/interface/xen.h
+++ b/include/hw/xen/interface/xen.h
@@ -733,8 +733,8 @@ struct shared_info {
      * are delivered by this mechanism:
      *  1. Bi-directional inter- and intra-domain connections. Domains must
      *     arrange out-of-band to set up a connection (usually by allocating
-     *     an unbound 'listener' port and avertising that via a storage service
-     *     such as xenstore).
+     *     an unbound 'listener' port and advertising that via a storage
+     *     service such as xenstore).
      *  2. Physical interrupts. A domain with suitable hardware-access
      *     privileges can bind an event-channel port to a physical interrupt
      *     source.
-- 
γαῖα πυρί μιχθήτω


