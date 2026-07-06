Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S7k1LKzQS2ogawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64883712EB1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pkKJY2ZN;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355490.1610313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliF-0007eM-R3; Mon, 06 Jul 2026 15:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355490.1610313; Mon, 06 Jul 2026 15:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliF-0007Y4-Mv; Mon, 06 Jul 2026 15:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1355490;
 Mon, 06 Jul 2026 15:58:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliE-00079r-6x
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliD-00AcWu-Jw
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd08f-bab6-0a2a0a5309dd-0a2a4506e170-26
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:25 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a1-08de-0a2a45060019-d155802ad59b-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:25 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so20514595e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:25 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353505; x=1783958305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9q2co12X66hZII96yfXyVBuNaa4Dm4OQ/7bOcOdJkmg=;
        b=pkKJY2ZNLOC1OP1CxWM6pdNT/UswtOEbgfw5N/fnvRsNQnrslXJ98+n2uWbF7vO0m5
         MVnrL0wjWHK93fmGPobkdyohAxShzhuVwIbayZp1iNjT4NdND3CTReXMsQNvWlHD0P5F
         JnXfKKCNue0x4lMqhX2NGB9RjA0W5q6FrlivGTiPJ0JuDFWsbM6C5jVkazwwohm8tagY
         RakP005c/yBtZC1r09sN1LAea32O/9bT/9oo/v+LWus1RcbvYMV6kJEidPZKj7AKINgX
         nqxvwWQ8j5oZ62c6ef181lHeDhG8H3WWMeLWt89x4DJGwmI/IP8X+LyYBghYy+P4vs40
         cKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353505; x=1783958305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9q2co12X66hZII96yfXyVBuNaa4Dm4OQ/7bOcOdJkmg=;
        b=rNEQh488YTBwfJuB98f521NJIvKfNWxJ9N2ShdXVsfQcrCRqHTard3oXN3WT5+2HmD
         PgzkNJdT0/MRbHQdpzmmBG+f6izVm6e3CSABmC9ve76rJ4HyPpv+zVRMHFdK5T8+WmuH
         UTVwDtLZ4c8fvVsfAUwqD5acj5qFylrZiApd+k+vJx/vlAsJEGYCJTtu5dmgw+F239aE
         U+hXblbbBkNl+EITQ2u1BKiMBHdlGu0GmCchtxKvoBtoZS4wqK7ZDiEtDl8+ALDYq0JG
         jx7DsM1njZj3qLTUXr17IhJdOqi2BNz3Ps1Rebe9p5R3JlSKf0bz1T8qwHgOdjAJpyWA
         k6BA==
X-Gm-Message-State: AOJu0YyIgnvkxSMxBJB98t8rK40B2CSaQv9+2oxK03Ki+nb4F6bfXQHK
	trALtg/hCYYPsNryUHHYN0cHBpijXIpKjvjlRbJwEBCIYXOIpoZshkXKllU/Jw==
X-Gm-Gg: AfdE7cnjue2Hj46PsFK7LF++I1oAC787WsVDiopi7Odjr8McbqTdvCaEfnaOTCOV30C
	Ag9FTsLlsA/k+AE7S9VLoadfWHK7+KhtURZNftDFrzkcHv06dsezm0mQdirtbDyJmzyM1DryPj0
	u7MiePNtfYvgwifkf53Uc15pCMQFcOGKztp1PVdgx6r8LKEuLLlOPZvg1FYU8HD+74d8gwp9X40
	6VbNb6h/YvMA1qq4jmZ6RJLEdEkdU7tRQsa+2TTjeR6EsOUPCBzH4+fWZlYDYKWA1WnRJunRDV7
	yO1DRomUlF8KmtV8yOVtL2DYQhK5t8o+q18OcHivhlEzIaf5qyyrxTqUrw7atcBSzUlbwvflwGB
	gyDXJZduzzgg4LiQvDD19s/5zc+BKPLsYbbZ7soJ6Bq16mTA0/rGfpav1XQbL1Hi6idKoOPQKEh
	j4hFh0DUXD9Rr7VleBVVuPhBs8K7izeqP8yZL3b4DiXxkVcZEQBPBJOOX5sg==
X-Received: by 2002:a05:600c:4585:b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-493df09e3cbmr14351095e9.38.1783353505030;
        Mon, 06 Jul 2026 08:58:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 05/26] xen/riscv: rename enum intc_version to intc_variant
Date: Mon,  6 Jul 2026 17:57:46 +0200
Message-ID: <d8a27698b82abc2044ae33887af8132aa749c1f2.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783353505-4272068D-547A0081/10/73395122804
X-purgate-type: spam
X-purgate-size: 1633
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: 64883712EB1

Rename the enum to intc_variant and the structure member from hw_version
to hw_variant to better reflect that these values select between
different controller variants, not versions of the same one.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Add Suggested-by and Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - New patch. Prereq for the next patch.
---
---
 xen/arch/riscv/aplic.c            | 2 +-
 xen/arch/riscv/include/asm/intc.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 739e8dab3498..6a1255c5f403 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -35,7 +35,7 @@ static struct aplic_priv aplic = {
 };
 
 static struct intc_info __ro_after_init aplic_info = {
-    .hw_version = INTC_APLIC,
+    .hw_variant = INTC_APLIC,
 };
 
 static void __init aplic_init_hw_interrupts(void)
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index ecdc8a5e6577..675f703ec97f 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -10,7 +10,7 @@
 
 struct dt_device_node;
 
-enum intc_version {
+enum intc_variant {
     INTC_APLIC,
 };
 
@@ -18,7 +18,7 @@ struct cpu_user_regs;
 struct irq_desc;
 
 struct intc_info {
-    enum intc_version hw_version;
+    enum intc_variant hw_variant;
     const struct dt_device_node *node;
 
     /* number of irqs */
-- 
2.54.0


