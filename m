Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOnuCI6H72ksCQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:58:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC2475BFC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295026.1571729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyp-0004rB-Ac; Mon, 27 Apr 2026 15:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295026.1571729; Mon, 27 Apr 2026 15:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyp-0004km-6p; Mon, 27 Apr 2026 15:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1295026;
 Mon, 27 Apr 2026 15:34:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHNyn-0004h0-Dx
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:34:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNym-005DEt-NA
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:34:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef81f4-e002-0a2a0a5209dd-0a2a4508ec26-16
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:36 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef820c-63b5-0a2a45080019-d1558036d83d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:36 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso78057725e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:34:36 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c0354sm737076355e9.11.2026.04.27.08.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 08:34:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777304076; x=1777908876; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/P5e4xXherIeaejZwj9DdoItZcrKaqfgLMdEPxMeGI=;
        b=IXF9hNbYg0XEuMVt+TzOvTbAdjKfju9/Ln05E2+qXMeMdkJk8D8yY27AwOGAPcuhs0
         a/KDq6MGQlzDAATD9UI5tofMJIcFos8duZNHsorcuGNIG9PCsMGP0H2we3EKYPP4aJ45
         tLo4YwVnU1tBoVj+64kdc+2/4OtubFTPXt4ifpmlX0FXbwJ1bcNSPc9m1uahnoRjsxV7
         17WZI1n0k7XEm0DnOU3S9b8PzGsyWjdVLQjQULO4PdKDiMMfwBtTMk3YmrgsF8zKPB4h
         hbDQkeBK/80NEGKeX53EIkloa9ryCw+7ckQm+TZilXmEQmOoAfXwfLFhcDA7fI9dMeLR
         Mpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304076; x=1777908876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/P5e4xXherIeaejZwj9DdoItZcrKaqfgLMdEPxMeGI=;
        b=HjMac7tvkvIOJqSdDjJ7ps9h4AFrnutszJJyF2MnewelpjlUxbvYeVzhXe4EghUBF7
         gSBYvdiZ0diOybkNKIJlsWlvLnxqg5nUGv4IHkjeNP/BqynmwjGaPUAYXM/rGqSSEv+/
         0d8mDD6oiQCas1lrYEO8u/GVhsnRQSiqDyOEGIylwSIIHMUzLghqqhZVYbZ8l1FllgEp
         uWA6Uzc02FViO7RCDACbNT1CTr/SHFyzSsSd/fr51VMdlUinx6iU1/Upou9kY+iI2iHW
         ID9+9HKciuL2WV3pGCQ5KgAeecZ2i2PGa3vk3BU193abaC1OwqJzxMumzYFtLxEQ2V6B
         ASlg==
X-Gm-Message-State: AOJu0YxC8Q0elGcXhWt1zlbjDrXeJ5pAFuNetBuu0groeCSC52sEmXFg
	PQVvaZcQrkH3vQ0UcO0TWKcwS3zK6dEJZnAaXXMBQur1HYsVooNszIWSa8AImQ==
X-Gm-Gg: AeBDievG+1aGB9yHMD6jtazcl1oG7lyoHXr/0PI2JJRmTfDnVcSnGDCYgf0GuuWHVUa
	dFW98KQw4OL3hb0qvdRlr0mlYAhFs0MzDw5qGHiMS3eTPxeVzQfBDXWKzRt4HxL2aXOJoWbMjyY
	lrzj1OdaJWo1fb/wiDBNJTZcTBIR7U5ua5yB4vtdbAQv1bvLQbLc9KxV2cPTgZjqfgq8zkDDHl3
	YX9xCYPc3p16yHn941Tv9smJ5/7GDlgyoDj0hhDrGe9qHkkeT8E6ubgxkp96lOevQ4gE57Qqzww
	sbcoaMlHTVL3OvmC9uzT+yZ7rk12zZNOu1jnLyafLFX7rqUR6Yoy24gGyiVMhKDMw6ryBtvPABB
	TuOhirNrjQKQrLLQtcdmtvwZNSWGvJqclnhNs0QNaUZ4StMv/r0rNv2ne9THA1VQAqNbpZImk3E
	rMroa/QWzbxFUuuhRBqzGar8pQ47ef7QdjBPn+Zp9KmSFwyOLhBNWxN5ey6ucQCp0mPhKQu0fCl
	lIq
X-Received: by 2002:a05:600c:1907:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-489201cdf13mr426972005e9.12.1777304075162;
        Mon, 27 Apr 2026 08:34:35 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/3] xen/dom0less: introduce next_phandle in struct kernel_info
Date: Mon, 27 Apr 2026 17:34:23 +0200
Message-ID: <3822f12057ecc9d51b314308b0e32a85e83a7558.1777296786.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777296786.git.oleksii.kurochko@gmail.com>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777304076-3A776DB1-10E9FD48/10/73395122804
X-purgate-type: spam
X-purgate-size: 6329
X-Rspamd-Queue-Id: 81AC2475BFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.32 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,d000000:email,0.0.0.0:email,1.171.63.0:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.660];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

There are cases where it is necessary to know the next available phandle
number in order to generate phandles for guest device nodes.

When a partial FDT (pfdt) is provided, special care is needed during
initialization of next_phandle, as the pfdt may already contain a dummy
interrupt controller node with a phandle assigned to it. next_phandle
must therefore be initialized to one past the highest phandle already
present in the pfdt, to avoid collisions.

Since next_phandle may be needed for the very first guest node generated,
domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
The new call site also aligns better with the existing comment stating
that domain_handle_dtb_boot_module() must be called before the rest of
the device tree is generated.

Introduce alloc_phandle() to ensure that phandles allocated for guest
nodes do not overlap the Xen-reserved phandle range.  This helper will
be used by subsequent patches (by RISC-V at the moment).

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Here is an example of generated guest DTB:
    cpus {
    ...
      cpu@0 {
    ...
        interrupt-controller {
          compatible = "riscv,cpu-intc";
          #interrupt-cells = <0x1>;
          interrupt-controller;
          phandle = <0xfdea>;
        };
      };
    };

    /soc/imsics@28000000 {

      interrupts-extended = <0xfdea 0x9 >;

      phandle = <0xfdeb>;
    };

    /soc/aplic@d000000 {
    ...
      msi-parent = <0xfdeb>;
      phandle = <0x1>;
    };

Note that phandle is generated in this example not by get_next_free_phandle().

For non RISC-V people, APLIC is an interrupt controller (something like GIC in
Arm), IMSIC it is interrupt controller which provides MSI and connects to
each CPU.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
---
Changes in v4:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
 - Drop BUG_ON(GUEST_PHANDLE_GIC == 1).
 - Update the comment above declaration of next_phandle field of srtuct
   kernel_info.
---
Changes in v2:
 - s/free_phandle/next_phandle.
 - s/get_next_free_phandle/alloc_phandle.
---
 xen/common/device-tree/dom0less-build.c | 43 ++++++++++++++++++-------
 xen/include/xen/fdt-domain-build.h      |  6 ++++
 xen/include/xen/fdt-kernel.h            |  6 ++++
 3 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..9787ee264975 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -389,6 +389,24 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
     if ( res < 0 )
         goto out;
 
+    /*
+     * Find the highest phandle in the partial FDT so next_phandle starts
+     * above it, avoiding collisions with pfdt's own phandle assignments.
+     */
+    res = fdt_generate_phandle(pfdt, &kinfo->next_phandle);
+    if ( res )
+    {
+        res = (res == -FDT_ERR_NOPHANDLES) ? -EOVERFLOW : -EINVAL;
+        goto out;
+    }
+
+    if ( kinfo->next_phandle >= GUEST_PHANDLE_GIC )
+    {
+        dprintk(XENLOG_ERR, "Phandle allocation overlaps Xen reserved range\n");
+        res = -EOVERFLOW;
+        goto out;
+    }
+
     for ( node_next = fdt_first_subnode(pfdt, 0);
           node_next > 0;
           node_next = fdt_next_subnode(pfdt, node_next) )
@@ -459,6 +477,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
 
     kinfo->phandle_intc = GUEST_PHANDLE_GIC;
+    kinfo->next_phandle = 1;
 
 #ifdef CONFIG_GRANT_TABLE
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
@@ -499,6 +518,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    /*
+     * domain_handle_dtb_boot_module() must be called before the rest of the
+     * device tree is generated because it sets phandle_intc and next_phandle,
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
@@ -516,18 +547,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
index 886a85381651..fd2ba01ff0f4 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -63,6 +63,12 @@ int find_unallocated_memory(const struct kernel_info *kinfo,
                                       unsigned long e_gfn,
                                       void *data));
 
+/* Return 0 (invalid phandle) if the Xen-reserved range has been reached */
+static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
+{
+    return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
+}
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 33a60597bb4d..4d0467bb396a 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -44,6 +44,12 @@ struct kernel_info {
     /* Interrupt controller phandle */
     uint32_t phandle_intc;
 
+    /*
+     * Next free phandle for guest device nodes; do not access directly, use
+     * alloc_phandle().
+     */
+    uint32_t next_phandle;
+
     /* loader to use for this kernel */
     void (*load)(struct kernel_info *info);
 
-- 
2.53.0


