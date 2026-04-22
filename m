Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBxXAAue6GlNNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:08:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661444446EE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290140.1569833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8J-0005vX-OV; Wed, 22 Apr 2026 09:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290140.1569833; Wed, 22 Apr 2026 09:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8J-0005st-Kx; Wed, 22 Apr 2026 09:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1290140;
 Wed, 22 Apr 2026 09:44:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFU8H-0005eC-VF
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:44:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFU8H-00E82D-By
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:44:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89879-5cb7-0a2a0a5109dd-0a2a4503bf1a-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:33 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89880-672d-0a2a45030019-d155a72ed0f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:32 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a41099fa86so4655054e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:44:32 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41cc7f832sm3494193e87.28.2026.04.22.02.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 02:44:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776851071; x=1777455871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccoFJqXqscTgy/LGmtQbJuqk+NDolzkDBynx/48/gkQ=;
        b=BRTsnYl6l1eIx8r4worWJuyYK81brhYITiHMRnc8oxiNCQNSkbxUduOo8TYoLDGACi
         drO9JHSl+Qk7M60+uWkLPl1u5eaO3jGHVWyAUCN9SVg3LE9M0LzVYcXpoiTAfTQuJPRp
         5ss5ClrD4qTU69I8bttnMT5GDGe0Ra0fVg+JS9G5DRz9r19yNvFT1vcYTLK8yiOx0YHN
         HEe7xHrNedis7OJQH1/SdWHjzDRqz3aC9d8BAM1RaGB7mo1LwmAsjYrNdwyKlW2Q+p+t
         nJOvp0E+hdy4IXZppQoIEdhELrbR7k2vUhn7IpfX7sdpyBUMybVksoESXB15Yklnd7Rj
         bA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851071; x=1777455871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccoFJqXqscTgy/LGmtQbJuqk+NDolzkDBynx/48/gkQ=;
        b=p43sB5Ovwl7oW3EyyY4nk9IEEZo45fjWudEoAtq1y3VrHpkGNOi6sMLF/SfL9f5I/K
         i5cUWaeR/w6B4EM8l7AQazf9rDVo69vhiKEGs1rCS3txTF1bYvL95l9BOiRtbbC2SeKD
         umkVDnxD8YuXNOcS6NcgnLHuMVhYZvzpz0MHU5DNmg12qEQ0zoIld/zBw4seKasaS+B4
         nJlrwQp3t/3/a/XP7TrQXBIlkdIBp/AIXUYZ4xbOqHQ0zvV5lck14hhADyEMKszljU/t
         2GCovbA9Xvs5Aq96u0g0bUsDvwWuEjYsJipu44P7eaNSr2hcPQyYQ2GAbS+A2qCGZ450
         rdZw==
X-Gm-Message-State: AOJu0YxONHfeNrH3ddNtgtTQVPr1l5xvvEhGMEknPs+Ep0rhDtr39uCE
	0Xz5gFg5zW566TJgowjkj201JexbHMfqbx5+4wIV1Zc6AJkhfS6f49CPy3wtsw==
X-Gm-Gg: AeBDievB0AQzvaSZ8lwVCsIJBR622peiKDRoUiHYjTtrdocc3MmO0PeBFMy/OBl6pkr
	8NIWePQ998DUyp3C7RR0YcP5s4GNxJ0865LqBZYg6zz63KP05wAiyoLU48axeDyP6PydL5nJH4s
	DfZRKiOrnsUBfYbN3IAx6aHt4T8yYUp+CYsA/94umuJQr+yol6QmvGSJQVU4+viW0gaots58K4t
	GO4xymu41oY8XmLqDVExOJGXp/pr7C9j2yL9XV/hmqakrFFCzpTAx8p+Pcwom2sZ0cqTMhVDeef
	qiujaLjC8K6GT57nzY7/2nowyoXkt8Q77SEwUAS+APgJTJnhyD/86rz1KgXARX4dRavWzX5pz0y
	hao6PRq7E13olkto75TdwPR98+qtnoMg0sDwL+8h4uxyS8e1u0Wib0TV5h6iHbwrtyIWwTdUarJ
	YJ8kvummHs/UYBtDEj2mqb+Xxlq0GyCICNONXYu7VLyFm56f4ClVAkLbulNwHvc2hsC/n4d4JG2
	H9B
X-Received: by 2002:a05:6512:308f:b0:5a2:8495:965f with SMTP id 2adb3069b0e04-5a4172bfedcmr8378917e87.15.1776851071013;
        Wed, 22 Apr 2026 02:44:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] xen/dom0less: introduce next_phandle in struct kernel_info
Date: Wed, 22 Apr 2026 11:44:17 +0200
Message-ID: <4a9d79a9ef2bf25e904c9f49ddef7d5a3f3a4ac2.1776780944.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776780944.git.oleksii.kurochko@gmail.com>
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776851072-2A567938-522BEE5E/10/73395122804
X-purgate-type: spam
X-purgate-size: 6042
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.171.63.0:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,d000000:email,0.0.0.0:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 661444446EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v2:
 - s/free_phandle/next_phandle.
 - s/get_next_free_phandle/alloc_phandle.
---
 xen/common/device-tree/dom0less-build.c | 44 ++++++++++++++++++-------
 xen/include/xen/fdt-domain-build.h      |  6 ++++
 xen/include/xen/fdt-kernel.h            |  3 ++
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..ca3ac84a3ef3 100644
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
@@ -459,6 +477,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
 
     kinfo->phandle_intc = GUEST_PHANDLE_GIC;
+    kinfo->next_phandle = 1;
+    BUILD_BUG_ON(GUEST_PHANDLE_GIC == 1);
 
 #ifdef CONFIG_GRANT_TABLE
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
@@ -499,6 +519,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
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
index 1d9e77df0eb3..a604f3983fe6 100644
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
index aa977a50f4fc..438adfe3855b 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -44,6 +44,9 @@ struct kernel_info {
     /* Interrupt controller phandle */
     uint32_t phandle_intc;
 
+    /* Next free phandle available for assigning to guest device nodes */
+    uint32_t next_phandle;
+
     /* loader to use for this kernel */
     void (*load)(struct kernel_info *info);
 
-- 
2.53.0


