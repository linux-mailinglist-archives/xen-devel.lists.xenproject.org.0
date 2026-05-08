Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P9PCsP2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53ED4F7FD3
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303781.1577137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR0-0001iG-Gs; Fri, 08 May 2026 14:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303781.1577137; Fri, 08 May 2026 14:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQz-0001V9-2O; Fri, 08 May 2026 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1303781;
 Fri, 08 May 2026 14:44:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQv-0000o2-0b
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQs-00EphB-Rk
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a1-e002-0a2a0a5209dd-0a2a4507ac04-38
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:04 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b4-229c-0a2a45070019-d155da2cd5a5-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:04 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b9358dd7f79so346800766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:04 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251444; x=1778856244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHhk3cMIRsy4K9vYVYjAVZnf9kJw2uzZP67LAV96DoQ=;
        b=sYR1yjTRf5W3Qqp8qwoaYeEV8uEk2A5IW8z2EHg5pCOMaRP/dvPS7O8C3GWWrcSX4F
         LvYblAh6LN4Gvmtx2VVhMzOSOP1Myrx5lgibRsT+DPMUATEfP58Lfey6cRtXroek1exS
         2t4wuXNRNvt2xMA+VXvVjMG/B0lDyHSbPf5NCVBO3S87izFfx4HGduX4zVIvcbBWI/Hn
         tHe2Voy/4hjG3T/WEqhOQ5A3S1hBecL9VcpZTyZjel/mAtDohrYTjOZPLx8JAEdCpALW
         G8sYCVZNkUfm9q/7Q5ZNkCCv0ECI1snDbVvSa+psdlothe2YqQZpQEPib1vVRgwXi3ZZ
         5deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251444; x=1778856244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHhk3cMIRsy4K9vYVYjAVZnf9kJw2uzZP67LAV96DoQ=;
        b=VZdMPT95AftAJ07chnRB13yRGjF6+M7aipzlHPMbEqtjGne0FUdHtyCQkuPQry4sUJ
         JzaZiKlFILCeHDFllfnddivCn2qkRS8+RhUWGr7DdyIRW6poV9MUFVLZRI313FajUkxQ
         s8CFO0Q4RllEw/SMWsTx9ym/8AXTej2j2MXIFgm8caVW/sOhcGersvoVEU4BVlGzgdMn
         O62h+DleO98SV8ypso+s+TqgGVGPclwnidR2LbOoJdHo8jEtuSV6tYhJjKCY5W0e1bhp
         EWuoecocWJesusHLRKzs1/t1TKnbJibkQ/j9kYgjYAOyXHCp8JWjkMrRR0lHy1xwUFEv
         MUNA==
X-Gm-Message-State: AOJu0YyGRXZzfvSLGlqel7RTOqzPb++TU5cRy2NnwRx/iexvnsMFxsob
	QQjYTr9XsjriCjzwBgrlH+Aj8DUIRVD/5NnavhWh8BkayBP3DLp73t+gvMvCog==
X-Gm-Gg: AeBDieuR1iiy4C1M7lf+bNhpfnhZa2t8SD2rlTvGvn3t8UlO5EEIbyG7u8pciQm2plt
	keN/HNcoy2llTSfXy3hZR03FO1G3NtssqZb3sezXcltdEflW2MFb0xqxdsSYH9cSxLrLzKRjbfZ
	4jmSqkE9dqnAhJSgMc/GuGmL8VysOrICaQuooRm7n5fQ1/4XQV16uGLwtRXyl/XDbUK25wwXbsa
	OTZH/iMoSSo1qPyQbuOb8EricoviBPWgAl37xLM9TBNCNrrot5mvFqsBl6Rwc4n5YUUZGToWuoI
	RrqL6tEKroGK4yqeGzPrTbn/7NDRO07kJUKN+eF+E9dmOcQjqUzS0vY8U329wjiXfq0CiKP6yiY
	QkDGd4fNoULYzSJKXgQxUkC6g+YmgZyuR4mNGZlz8+2vJk1pUu+4B6SzrU2P1AFiNf8EpqByL0a
	UXvnUBaDob+LUIKJu8dkVpQKOwmEeAAPedvBIQ/uuqAj4qhr8PapP7E3fYRC0gfaLEMw==
X-Received: by 2002:a17:907:7b96:b0:b9d:6cef:95fc with SMTP id a640c23a62f3a-bc56dd16fb0mr899141466b.35.1778251443460;
        Fri, 08 May 2026 07:44:03 -0700 (PDT)
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
Subject: [PATCH v2 18/26] xen: move declaration of map_device_irqs_to_domain() to common header
Date: Fri,  8 May 2026 16:43:20 +0200
Message-ID: <2c0099a788abedfb0d6a8041203d93bb745e6bbe.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778251444-0A971C48-374D17EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2159
X-Rspamd-Queue-Id: D53ED4F7FD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

As map_device_irqs_to_domain() is used unconditionally by common part of
dom0less code it is moved to common header.

fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
also called indirectly in Arm's DOM0-related code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


