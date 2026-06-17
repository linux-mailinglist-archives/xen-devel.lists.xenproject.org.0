Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HLCRJYeCMmq91AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8B698F2B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UBTRuqBd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340082.1601089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHV-0000te-J5; Wed, 17 Jun 2026 11:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340082.1601089; Wed, 17 Jun 2026 11:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHV-0000qD-Cn; Wed, 17 Jun 2026 11:18:05 +0000
Received: by outflank-mailman (input) for mailman id 1340082;
 Wed, 17 Jun 2026 11:18:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHT-0000eY-HC
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHR-000VG3-CG
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328263-e002-0a2a0a5209dd-0a2a4507bfe6-16
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:01 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328269-229c-0a2a45070019-d1558030f0cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:01 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso30076345e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:01 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695081; x=1782299881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoVAso1S9Fp0u19eDBxf1mv/kzkPYBOYkZMUv8ML4DQ=;
        b=UBTRuqBd/pG971TKuEdx8dDPCozFxbreGjy74oD8g01quz8RbFpJX/A1AekoBxVJ4n
         iLm0lmxpXDn+gu2ylqZXAPS08H9TjIUUt7At4/c/VPN2QI05t4xx1QGU41NVid5PAtXF
         +boFJ/OQ1TkdtUhFitwBh0BdVqZyoqVXgMKnasDHwg8FaDHVWSuTj0MR9cNnqkD+SFBQ
         790jtZr+ZeL3eLlQZ7cGo8QHldyTl7J87m/yfpFgEmrCSO84NCmeTnQbQIIWcPLE7+U8
         ALZ2lsb2rq5dRa7iCNm94GJu7kIginDwWZ6+EvlZB6lOGtPoK+TbxWGhI3inD0AZQ3rq
         rTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695081; x=1782299881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LoVAso1S9Fp0u19eDBxf1mv/kzkPYBOYkZMUv8ML4DQ=;
        b=cahqoXhGXE9RawMZFFKACSnKTfk2Wa6pAczOf8c4mx4Y1I3vTLaXG17G/rarcW80Ol
         NXxBOeX0u4g0fd5Xi9p0FKR9tJv5TCBt4wFxAcJ5jAKvG0jV9/6UIzJ7jcZGnpcMBwW9
         WT+AcoZDxDppgkB8A6VoygmjFBy34f6P78PzVJjatd3NK/X/1jS2Cm0PMA8d/4h06F0t
         nY7IW6cinsBtLiI/uu2zgfUMS9L+pquYOeRtVvwHOMNoUE5EfhKGBVbx4932SbWZpJ0I
         1OyfsLTtRFh4qDm8f0Cx7H2VoC0E2mZr1f0fHB6KlZDQkVn2IicQX2saePC4ihDEiO4O
         Uc0A==
X-Gm-Message-State: AOJu0YxERNjMlpUTw5UsZq8g7B3rinRSofkbdlwF7b/oHIAsGNT3U4nZ
	wrviJtxU36U23bBCf1FfJakvUFvqsHakxNbN8U6BrIaBmFqNV9QzU1UJmKBLQw==
X-Gm-Gg: Acq92OHYOfCar+h8SBAN5o/X6dbnrLOhek0dzldwW9bmz/XNw1AvICCsQjuH9/jsNZi
	zk0UjGErrQWQA7ryJwKzW9jrnlSGbNI+XnAR+vxcl6dERcAGmfIb5LCfyrcN9VwBxGxzfW/w5jE
	vcv232FqJGwMpP4qIKyH6skXZSSH4cOpl3r+tYdQP6Mf2YtMRPSb8f1BATFPbCv99zKuCiSOH8l
	PX9jEA8TvxkC/E8ufKlN4HVSkkjoduqUWqmCBPWk2HnfdnZnC8bz9NR/NYsUbyfXxz0gj+odhH+
	d/7zEChJjDZjAJJ1LGmcL0+mHkDBqS3Zy5vnM1p5s06DLKQd5d70pUCcq9uHBEpr+PmKArshPY9
	OGUj9nxl8Vwsc21z9/y4EKimu6RxwxTLVS9yvrYNk3wwgEJAgZ7vXH2OpeTTeqxiyZvFOzxki8M
	JZgJrcup99eIMTamuW3zpTzfqiQlKRTEv9tXwFvD5zfIhreTSt8aR4beGyTw==
X-Received: by 2002:a05:600c:a319:b0:492:1e36:552b with SMTP id 5b1f17b1804b1-492333e0e20mr49333735e9.36.1781695080614;
        Wed, 17 Jun 2026 04:18:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v3 01/23] xen: arm: move declaration of map_device_irqs_to_domain() to common header
Date: Wed, 17 Jun 2026 13:17:29 +0200
Message-ID: <7bbb4d94f6711014f46becfabeb916ceed294833.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781695081-21B68C48-054D02CF/10/73395122804
X-purgate-type: spam
X-purgate-size: 2255
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34D8B698F2B

As map_device_irqs_to_domain() is used unconditionally by common part of
dom0less code it is moved to common header.

fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
also called indirectly in Arm's DOM0-related code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Add tag arm and move this patch earlier before RISC-V-related patches.
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/include/asm/setup.h   |  3 ---
 xen/include/xen/fdt-domain-build.h | 13 +++++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0d29b46ea52b..0adfa4993a8f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -53,9 +53,6 @@ void init_traps(void);
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


