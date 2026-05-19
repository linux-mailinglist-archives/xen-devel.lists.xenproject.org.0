Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEF4BCV1DGqihwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:35:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED11580A4D
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 16:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313122.1583345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPLWw-00050t-OJ; Tue, 19 May 2026 14:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313122.1583345; Tue, 19 May 2026 14:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPLWw-0004y0-LY; Tue, 19 May 2026 14:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1313122;
 Tue, 19 May 2026 14:34:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wPLWv-0004xu-6r
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:34:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPLWu-00D0uz-J5
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:34:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0c7501-5cb7-0a2a0a5109dd-0a2a4503b31c-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:34:44 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0c7504-672d-0a2a45030019-d1558032d1a3-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:34:44 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so39879835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 07:34:44 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694f2csm332412275e9.4.2026.05.19.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 07:34:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779201283; x=1779806083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFsM69tub7HaJA13MDbunxZ7yWIg1wjasziHv5KLvkQ=;
        b=W9LyCGGH8LSQO1UnzjxajB7b1kPb0sbJ+xEglH+bMLBrWhE7YB1ec8sbyt7YJ4Fdn4
         xeWSDsScQ9aMaZbpj6IVgOqNaf3k90nk9DUBepBilGwvPnyAhduURIHKsGgQxGkdgFG6
         1XlXIxDrgAG8aISIszLeicXzUE7c67sd8ypjbaAVlxDRwlMUr+eIL4DCaCnKr2b8o9XI
         i5dHf5q3V7ra9j89XFnVC7aifPQjSoH46oxJir0eUIkhtTcNcnnQF1jfzpxYkYEXqiZU
         64rx7sIrB46VQhYUvXpgEunMewdXbdwhF6hUGgseOWeDOHu2oQVm4VkooFuArVRMfg8/
         STCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201283; x=1779806083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFsM69tub7HaJA13MDbunxZ7yWIg1wjasziHv5KLvkQ=;
        b=CEyCn78CJEIUjHDBB3OLFHBC/GQlKVjsI27w04jUahpdhs3OvOTGkd7AC2cUcbXg9/
         KvVoLvqZz45gVtMV3iyQGAPVJnnwO/tFbEpHRJD2wwIIeHisaBnmkJc+Ph6RJI6HpQZs
         xcirLMDP01MjAvnmDvAd5TFhwbtjg4O0iT43Gm3DzjnkCGY0dzE6kDvuxX4TixXjxQXF
         WWIdlptEIPBEoQVgSj2uGV8tsvFfvAO94QW+3Sqf+a1TXJu/eW0qWBvOajkdZqr90MI3
         jbzuyp6LuUyxQ4ioLCmvW3iooSlfqXtih7yC1O7F7sBXQCh4ofGYNEN3GADDHnhjHdsH
         viSw==
X-Gm-Message-State: AOJu0YyjVADMm28d+BFtRX9+LD0TjFttVPriWXdksXwKDA9HiI80cJpe
	RQfVsHYPvIq3L4N7RIp3eJ4tzJCbF1iQqLumO8fZ8b5cAeZUp95ypUZTahcliw==
X-Gm-Gg: Acq92OH4As2Wb5UTrSK03GlKqDAifnMqi8433OBgh4bDXEgfFYW5z/P6h4Ht67zaWMo
	MOSraqffAn9p/dVxPEpBJvw36+Jp7z0ursx2uggdOaNpO/6+1PqPPkwyZzfDg44EJ8h+M+Za74x
	EYirDOUGOUST5f8jbb920hr1mreyoi5Y5RmT4qkDv8Z9jytPe3c4eDwxVRe7e/FBSPGYD8sU0zq
	VQJUNyZuythlq8bahBDS4ycc7vODL8PmgtIT3cQvp57Quw2MvS1k0RNcgqTZPcE5vmgzA/TC0+K
	SpjFKmADo3kmlsDaJDQnHZtaH9xRoFAMY5QXvM/Bk55+S6Q5WzakF6X0lXOUhkUo4aSGUL8M55q
	aZ1XF5dfjva1bWAFOnC/x1z2V4K2m0Fu36AWneQVEcWKCdmqKMTA5lqaiDfGrEkIyYaLx498qVZ
	iav/3z1PiVx/yBD9Og0umgSCx9ZQ==
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr313045065e9.20.1779201283308;
        Tue, 19 May 2026 07:34:43 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Luca Fancellu <luca.fancellu@arm.com>,
	Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gic-v3: Preserve ARE_NS when disabling the distributor
Date: Tue, 19 May 2026 17:31:54 +0300
Message-ID: <0bc584018c025ee9fa5557276b9f3914ca9205d4.1779200467.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779201284-4066C938-A4105372/0/0
X-purgate-type: clean
X-purgate-size: 1810
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:luca.fancellu@arm.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9ED11580A4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

gicv3_dist_init() disables the distributor before reprogramming the
global interrupt state. It used to do this by writing 0 to GICD_CTLR.

On a system where firmware has already enabled Non-secure affinity
routing, a zero write clears the Non-secure view's GICD_CTLR.ARE_NS bit.
Arm IHI 0069H.b, section 2.3.3 ("Changing affinity routing enables"),
states that changing GICD_CTLR.ARE_NS from 1 to 0 is UNPREDICTABLE. The
GICD_CTLR register description in section 12.9.4 carries the same rule
for the ARE_NS field.

Preserve ARE_NS while clearing the group enable bits. If firmware left
ARE_NS clear, the value written is still 0, preserving the existing
initialization flow.

Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7f365cdbe9..dc00afc0ee 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -745,12 +745,17 @@ static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
+    uint32_t ctlr;
     uint64_t affinity;
     unsigned int nr_lines;
     int i;
 
-    /* Disable the distributor */
-    writel_relaxed(0, GICD + GICD_CTLR);
+    /*
+     * Disable the distributor without clearing ARE_NS. The GIC architecture
+     * makes changing ARE_NS from 1 to 0 UNPREDICTABLE.
+     */
+    ctlr = readl_relaxed(GICD + GICD_CTLR);
+    writel_relaxed(ctlr & GICD_CTLR_ARE_NS, GICD + GICD_CTLR);
 
     type = readl_relaxed(GICD + GICD_TYPER);
     nr_lines = 32 * ((type & GICD_TYPE_LINES) + 1);
-- 
2.43.0


