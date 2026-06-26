Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ma0nHgqfPmoXJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804E6CEA41
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HsC0S4PL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346269.1604721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lU-0000Gf-QH; Fri, 26 Jun 2026 15:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346269.1604721; Fri, 26 Jun 2026 15:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lU-0000ES-Mf; Fri, 26 Jun 2026 15:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1346269;
 Fri, 26 Jun 2026 15:46:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lS-0008Sh-Kw
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lS-004aNQ-1l
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9edc-bab6-0a2a0a5309dd-0a2a4501e980-12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:46 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee5-400f-0a2a45010019-d155d0b6dcda-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:45 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3997a448ecbso12136791fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:45 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:44 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488805; x=1783093605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvT5LR8MKVSYyunuWtIqsb5iTgSnZW7RCbzYGmmoDZQ=;
        b=HsC0S4PLS0FnpYT5EW0BY1QrEnYyxulEBJr68rUDZKTZn8lsjuO0X0bzZYSmHUzym9
         nbbKp126LvsASyoW7QuPXoCjCZN21t2t083h2VP8GDT4xg7zO5QmHpR8bvQctli3ABcy
         ZP5he/UXWVwqB9cTRcO3ZqSfHKnhd+MLCCFBP4e49iZIfpF9IAzrJ5r/tTzV+S/rnfWo
         M25aZ6llxtQgU8Kjilkmzcp+Puy91jkgxtB0OtMpjq0QNr4M5igkqwv30x6W8BbM3dW7
         jGx3DHLmgsLazSQ4GY6iXj4P1mbJxjmQgV8ZZ1KRr0TKjL8eTTzs3q2dCeOsXb4hTGiN
         fOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488805; x=1783093605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvT5LR8MKVSYyunuWtIqsb5iTgSnZW7RCbzYGmmoDZQ=;
        b=ZBPsacfKQHCwLI/OmAJ32dAUNFlwcip8YYVKxRyiyWdupDg/m/0D5agUgLrpPa91Lt
         661KJXsRnr9RvQA1KzOlWUQIF7IjiPsYNgsUxOp3tD6b2WAkdVTKxEDsJjwhe45CSonX
         vi3eksoNgWYT2zGoZ8BBaBuh1ACgYyuScK76+Yt+1rjoCRE3QwnXd2FDeC81qdY6IIwO
         Za0d/LKpA2W2tvBpDxXeuVZsMxqp/J/V++YO1+Q7sWiWBR249vcCNDRAwf0DfE7wCkee
         7m3rZMiLuUqiGjTE/CWIi6UtrLQqJVL0SZ2nBJ/Apka96jV1N9SlTexbjShXm7IbQbsH
         6wrA==
X-Gm-Message-State: AOJu0Yzc33FbDh6bHcOw4fcBLcWA92Snpx1XrAfvJBLdaaRl/SwJw8mr
	TAzIwmV+NXvzUMMQCOZRzs32SqJkBhz0KL48BvgqgAEhkZEv/+DWEpk57znP0w==
X-Gm-Gg: AfdE7ckAgV3rxE2F7JA4SKzhcfpdpRd2QjEXzlQfgfz6lhPgZBTf3UI+ea9PDe2ZHQ3
	47i5oFT3wbcwse6V2DHUlT3cHizC4/QcXc49uumOV2dvmKzWb7MZJ8bdEPLuT5s2Q7ojPYmdZsF
	ZVzcaqVm0ifVUEY8GHz0sUqLwCW3z61eh0olY/8tmylPLsxhS5gJDeknbssxrklyh0tHw0bkKMu
	UXPnVuKgwUz5K8lRhFIhRjCUeaCN8GbnlbZDk6XtwUanEIWsZm99QsYUs7rq8hPIvhEgC1bjNLZ
	zin+JE3FbAIXIj1PR2qejYgUmuU3fMyJiVqCYlFqbHcb610edPSmcH6U85s0bRNLPoSlaYi2cSr
	TdcQkqQVQUwFzmOWgiLIP1Aim5z+Jbsx6z8elsADYQHmSZvYarMY5F07qJX8Pq/z2kW3N7TyIDL
	6xQ6dY4KQLqk3uEr6doqtwCEIw4QFMo/hk2RK7rAw1mDUYd2pkttoxtP/X3GQpmEabDv99
X-Received: by 2002:ac2:4f15:0:b0:5ae:a9ec:9fc1 with SMTP id 2adb3069b0e04-5aea9eca36cmr128297e87.60.1782488805066;
        Fri, 26 Jun 2026 08:46:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 02/25] xen: arm: move declaration of map_device_irqs_to_domain() to common header
Date: Fri, 26 Jun 2026 17:46:11 +0200
Message-ID: <ec994287fb54537b0d6a97a666d49f0c080193f6.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782488806-D1EC21E0-6A192B89/10/73395122804
X-purgate-type: spam
X-purgate-size: 3643
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2804E6CEA41

As map_device_irqs_to_domain() is used unconditionally by common part of
dom0less code, move the prototype to a common header.

fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
also called indirectly in Arm's DOM0-related code and DT overlay feature.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Reword commit message: use imperative mood ("move the prototype") and
   mention the DT overlay feature alongside Arm's DOM0-related code.
 - Add #include <xen/fdt-domain-build.h> to Arm's device.c so the definition
   site sees the prototype.
 - Drop the duplicated function description above the definition in device.c
   (it now lives only on the prototype in fdt-domain-build.h).
---
Changes in v3:
 - Add tag arm and move this patch earlier before RISC-V-related patches.
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/device.c              |  9 +--------
 xen/arch/arm/include/asm/setup.h   |  3 ---
 xen/include/xen/fdt-domain-build.h | 13 +++++++++++++
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 7d9644fd8b6d..b11366d722ef 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -11,6 +11,7 @@
 #include <xen/device_tree.h>
 #include <xen/dt-overlay.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/iocap.h>
 #include <xen/lib.h>
 
@@ -117,14 +118,6 @@ int __overlay_init map_range_to_domain(const struct dt_device_node *dev,
     return 0;
 }
 
-/*
- * map_device_irqs_to_domain retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
 int __overlay_init map_device_irqs_to_domain(struct domain *d,
                                              struct dt_device_node *dev,
                                              bool need_mapping,
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 14fa92d5c1db..2af780512540 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -51,9 +51,6 @@ void init_traps(void);
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
-int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
-                              bool need_mapping, struct rangeset *irq_ranges);
-
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
 
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 671486c1c837..8612e98dfda5 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -12,6 +12,7 @@
 
 struct domain;
 struct page_info;
+struct rangeset;
 struct membanks;
 
 typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
@@ -79,6 +80,18 @@ static inline void set_domain_type(struct domain *d, const struct kernel_info *k
 #endif
 }
 
+/*
+ * Retrieves the interrupts configuration from a device tree node and maps
+ * those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
+                              bool need_mapping,
+                              struct rangeset *irq_ranges);
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
-- 
2.54.0


