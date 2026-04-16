Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLz2KWPw4Gl4ngAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:21:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C25D40F7F2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283529.1565733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNaj-00058S-Km; Thu, 16 Apr 2026 14:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283529.1565733; Thu, 16 Apr 2026 14:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNaj-00055x-I1; Thu, 16 Apr 2026 14:21:13 +0000
Received: by outflank-mailman (input) for mailman id 1283529;
 Thu, 16 Apr 2026 14:21:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDNai-0004sq-Bm
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:21:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNag-00EUAi-72
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:21:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f057-e002-0a2a0a5209dd-0a2a4502bd98-0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:11 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f057-af86-0a2a45020019-d155802aec67-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:11 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso131938125e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:21:11 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f096d110sm59803515e9.11.2026.04.16.07.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 07:21:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349270; x=1776954070; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7asg+oRMzsxXoRo6Oq9BgsaNNgnJ/iGaE08Tfel5jA=;
        b=j3OGgoR1ibG2dCT616OWsU5dHd9vpjBobG8+4C8IoDJyZRi0cCPTBHN9WekvJUT7Pd
         1Q+dLynlmYcQ+WNF5mqiY7t0b+J5UuMXw7+LF4zgm3Kb3cmzq26/FmppczQCjmKDh1x/
         i9aKvQ6nkwq3+h9GrFDOLApEIMccdyIafdzq3A+N+FyC9qr7i4YzeCyJM/t49mDiIahk
         hZyF8GLwPyS72ZQvJ1Ltdb67BrbMWbiY+YJ7lqLb+pHuIHB7Q+uzoPvZ92r4Arq6qrLN
         xnkSZGbdd/kCYfi/YPCl3vRhCkG5a6s7b6DQOMRVjfp/tgeKdiN57Zf89b2TbV4x/eLV
         oqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349270; x=1776954070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7asg+oRMzsxXoRo6Oq9BgsaNNgnJ/iGaE08Tfel5jA=;
        b=Rny+/oqrxxmAUn7ySWJ+WObDiw3bafO7uQ9x9ELGY+CuF1LVb+qYNPMMrO+QMfgpId
         IziYhVw4uW66ubPWITZn2wgIo3ZQ0h9N9w/wTUJvbeCvnSicKCHWC2yGcXJf4Tl7C8Lm
         g57Nh9hkB8zvJd1IIxTKeWsduekO/AZ65oez1T6qpttccXIIXTEWvWjI+yNE2OZ5S+bO
         y47a9ahd3rrJuOJCuXRe/NfPK++/Y0adda+HZ+ia5I/bpeGPXWcy6ScX5SEwVY3yEesW
         itTn/srfarCEd5LFR0aL8Odu8fiGgJKMgpfcZgeiCIYXRThoHbQyW7JnCBBYPP0Y5FK3
         gzXg==
X-Gm-Message-State: AOJu0YwYNg+LDl5tPLmNYiOQeshPb/tyhnMXJgQ3RVncpaDuoL1ZRqPM
	g1wRXq2C293fQccDQVn115bca4fGb+ws1kORWGXhfErz8RL7s+jIIgqWAOuMJQ==
X-Gm-Gg: AeBDieuHwmlM3qSwdrIoemrE7fZ65mMWdb597R2XUjiIoEOdQsNRaTjGCGy0qKl6tz7
	3+39pmulFuY/kUPDuyEBwiZ11gX5MNYK15MZ0eWJUd9Ra7VS7xhQ5vv/AYZuXE+awSAzjVWD0eX
	2W2O7sRiSYxSkIwsvP3xYSek32QIveudbzWqQYHc1Lkgl7KAU9BqIAw7E+A7WaVdI2X/fOYCswD
	Sz8TB92A/Rery5nW2fnKIDS2spKRsPURTTDV8ICO6CeiI/8FlfYRcsftkYb4H4e/JkDjIbuBSg5
	NffgbUZPUO6y9450x/vMhBEcBNycC3pd3nxQbaxKK7gZMjoUxdJMywsXq/55ycIWhbvrbIYF/Nu
	vfN99QXlMR+CkWLBQ+SU39u8GsQiiyXnD38aKEU7K3fJCrVhkT5p2z6Z9605LdL14HHsa5FluYt
	E8htLkBzBuDv3itZVzH3qvl0R2enCzp33oYMxsRLVwNlQtrcedwxQXO6K/kSZNEY0kKaNsLbVhg
	abv
X-Received: by 2002:a05:600c:8b2f:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488d688da37mr363620945e9.31.1776349270314;
        Thu, 16 Apr 2026 07:21:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 1/3] xen/dom0less: introduce free_phandle in struct kernel_info
Date: Thu, 16 Apr 2026 16:20:58 +0200
Message-ID: <58f59a071f6329acac610688a6c25b67b30e5b92.1776340422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776340422.git.oleksii.kurochko@gmail.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776349271-B3563161-B83B048D/10/73395122804
X-purgate-type: spam
X-purgate-size: 5091
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.931];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C25D40F7F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are cases where it is necessary to know the next available phandle
number in order to generate phandles for guest device nodes.

When a partial FDT (pfdt) is provided, special care is needed during
initialization of free_phandle, as the pfdt may already contain a dummy
interrupt controller node with a phandle assigned to it.  free_phandle
must therefore be initialized to one past the highest phandle already
present in the pfdt, to avoid collisions.

Since free_phandle may be needed for the very first guest node generated,
domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
The new call site also aligns better with the existing comment stating
that domain_handle_dtb_boot_module() must be called before the rest of
the device tree is generated.

Introduce get_next_free_phandle() to ensure that phandles allocated for
guest nodes do not overlap the Xen-reserved phandle range.  This helper
will be used by subsequent patches (by RISC-V at the moment).

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/common/device-tree/dom0less-build.c | 44 ++++++++++++++++++-------
 xen/include/xen/fdt-domain-build.h      |  6 ++++
 xen/include/xen/fdt-kernel.h            |  3 ++
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..9205f01f0a49 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -389,6 +389,24 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
     if ( res < 0 )
         goto out;
 
+    /*
+     * Find the highest phandle in the partial FDT so free_phandle starts
+     * above it, avoiding collisions with pfdt's own phandle assignments.
+     */
+    res = fdt_generate_phandle(pfdt, &kinfo->free_phandle);
+    if ( res )
+    {
+        res = (res == -FDT_ERR_NOPHANDLES) ? -EOVERFLOW : -EINVAL;
+        goto out;
+    }
+
+    if ( kinfo->free_phandle >= GUEST_PHANDLE_GIC )
+    {
+        dprintk(XENLOG_ERR, "Phandle allocation overlaps Xen reserved range\n");
+        res = -EOVERFLOW;
+        goto out;
+    }
+
     for ( node_next = fdt_first_subnode(pfdt, 0);
           node_next > 0;
           node_next = fdt_next_subnode(pfdt, node_next) )
@@ -459,6 +477,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
 
     kinfo->phandle_intc = GUEST_PHANDLE_GIC;
+    kinfo->free_phandle = 1;
+    BUILD_BUG_ON(GUEST_PHANDLE_GIC == 1);
 
 #ifdef CONFIG_GRANT_TABLE
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
@@ -499,6 +519,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    /*
+     * domain_handle_dtb_boot_module() must be called before the rest of the
+     * device tree is generated because it sets phandle_intc and free_phandle,
+     * which subsequent node generation depends on.
+     */
+    if ( kinfo->dtb )
+    {
+        ret = domain_handle_dtb_boot_module(d, kinfo);
+        if ( ret )
+            goto err;
+    }
+
     ret = make_chosen_node(kinfo);
     if ( ret )
         goto err;
@@ -516,18 +548,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    /*
-     * domain_handle_dtb_boot_module has to be called before the rest of
-     * the device tree is generated because it depends on the value of
-     * the field phandle_intc.
-     */
-    if ( kinfo->dtb )
-    {
-        ret = domain_handle_dtb_boot_module(d, kinfo);
-        if ( ret )
-            goto err;
-    }
-
     ret = make_intc_domU_node(kinfo);
     if ( ret )
         goto err;
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 1d9e77df0eb3..220ae46ddbe1 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -63,6 +63,12 @@ int find_unallocated_memory(const struct kernel_info *kinfo,
                                       unsigned long e_gfn,
                                       void *data));
 
+/* Return 0 (invalid phandle) if the Xen-reserved range has been reached */
+static inline uint32_t get_next_free_phandle(struct kernel_info *kinfo)
+{
+    return kinfo->free_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->free_phandle++;
+}
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index aa977a50f4fc..3527934b2a00 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -44,6 +44,9 @@ struct kernel_info {
     /* Interrupt controller phandle */
     uint32_t phandle_intc;
 
+    /* Next free phandle available for assigning to guest device nodes */
+    uint32_t free_phandle;
+
     /* loader to use for this kernel */
     void (*load)(struct kernel_info *info);
 
-- 
2.53.0


