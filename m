Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHunFyll+GlJtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:21:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1094BAE24
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299627.1574172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpUL-0003Z9-MR; Mon, 04 May 2026 09:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299627.1574172; Mon, 04 May 2026 09:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpUL-0003WB-Iv; Mon, 04 May 2026 09:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1299627;
 Mon, 04 May 2026 09:21:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wJpUK-0003W5-R0
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 09:21:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJpUK-00FQPa-33
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:21:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f86509-5cb7-0a2a0a5109dd-0a2a450a9314-10
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:21:16 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f8650b-56b3-0a2a450a0019-d155d02cb0db-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:21:16 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67389cf78b0so7569258a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 02:21:16 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.216])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67b86caae44sm3140490a12.12.2026.05.04.02.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 02:21:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777886475; x=1778491275; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkyQEgJUNM3LgfrP5sMqaw1jbx8pNrvLd2PNokV1c2g=;
        b=cQAbONbbhKykHzbLCOt5MJjd5Dd59g/WmLotIBtyZ8oUNtt/9ZCHwvjyBsYDEXrwiU
         dK9FAhycHsJFOn5OIID839DNfm2h31meEAsvdzM1x5j3kssmcffHkVWB01LZeMr5gIal
         QUA3kfIiUovrl2sOIHkux9K4kej5ZUEQeeYFyaHdMEA1q0wpJ5QcOYPKNeRNIchND7Dw
         Mlpnj3ZsiEoPdd/3uY6ppd9/P7TNqfuStPjTcatIH7f8uhyZz3oHbHRMvTyLNTlGF9pP
         /c+BOUnBRQgDY4PHGZQjwjdNI3iKk64K8eLTmxqS18e/uBLlDz0484CitRwkZ6YhwsiW
         Qp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886475; x=1778491275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkyQEgJUNM3LgfrP5sMqaw1jbx8pNrvLd2PNokV1c2g=;
        b=W0GWa07CXaoYKxHV8+48rmktqaTf+RYIybJmxmtvz4XAp94lyjD3Hc1UOzYN5KiLLO
         k0cAQs5mpUmRyPsWf3bEHKu599idZ8aZIzeZNQkywXKx3cdsZ81/lkj3cLuy0Na6Lh61
         xYsuIXw/6mZ8rCD99rv4Ti2ewQNiOZZrjTSqylAMC+G9jOdMJe44K/C6fJDLT/HzcKcC
         2D8IDFCyiQxUn8d8XwBXprRmDXU2b5u2/Nh1g6qxIwC8QVggoaJic3Aewewfb/sZj0eP
         Y0wpR8BVoJXHXZ8LpHaJrJeoY7bEtNVXj1szpkEZE91kfGzZ1FHVkrPAzUfKi+bg1d6w
         vtKQ==
X-Gm-Message-State: AOJu0Yw+QK4oWhwFfQtod5z0SV9rA8f7WwgboWkq8PH3uZu3rY9BJk+6
	BZ73PTuQPtryM5LpEmVgyfHznBkArPuf+hn7EOZT23WgfTp4pXS8NIJ8CqBpdFvg
X-Gm-Gg: AeBDieudiW+Mscr8jUUC4sP+zsWYXAMGmsEXaoB9Ka4Ylb8iDtCYrx8xV5vH8fb9cNR
	NQmYsi6TE49K21g7Ttcr2q2kPCFr0ABGFaJbnIaPgNCsgwOei5NGaeZSEEiPbFLZT/TH9QPx6i8
	4HbL8edsJo9QdEMEFibEtP38fxxomfmPMz70rgpCn/y+uaf46UtMg2PGFyeIykvh+r1y6Km2eks
	F2fTRB1PFCZPB6cmmYS13b8QSlKv8cdvBGWhNp5fTFucOIDLisr/I6HuHPrjb103qLuMvItGVSL
	G+eRazLr/f7NCDvQGoAyCrJxE0D0AYJRDQUigADci0uxvYmNTOZnm6PEGARE1HVPFFvZD+gdhxu
	SQwkRLMNM6m3i76WyjCY8Re984m4Ej1tJr3v6cwQFcql7Iqz1RWf3MK9o8A/mHHNRp33FNdSB2Y
	HKJfyhJi+AdMzI3eD33rROV9xirZGCRO0lzKZwJg==
X-Received: by 2002:a05:6402:5057:b0:676:6e7c:2e3b with SMTP id 4fb4d7f45d1cf-67c18122342mr2813961a12.7.1777886475082;
        Mon, 04 May 2026 02:21:15 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: scan CLIDR Ctype fields upwards when probing LLC
Date: Mon,  4 May 2026 12:19:06 +0300
Message-ID: <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777886476-4797E8B7-60F9D5E0/0/0
X-purgate-type: clean
X-purgate-size: 3387
X-Rspamd-Queue-Id: BD1094BAE24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]

From: Mykola Kvach <mykola_kvach@epam.com>

get_llc_way_size() currently scans CLIDR_EL1 Ctype fields from the
highest level downwards and stops at the first unified cache it finds.

However, CLIDR_EL1 describes the cache hierarchy from Ctype1 upwards.
Arm ARM DDI 0487J.a, D19.2.27 says that once software has seen a
Ctype value of 0b000 while reading from Ctype1 upwards, no caches
manageable by the architected set/way maintenance instructions exist at
further-out levels, and the higher Ctype fields must be ignored.

The current reverse scan can therefore select a unified cache level from
a Ctype field above the first no-cache level. Such a field is not part of
the architecturally described CLIDR/CCSIDR cache hierarchy and should not
be used for selecting the CCSIDR level.

Scan Ctype fields from L1 upwards, stop at the first no-cache level, and
keep the outermost unified cache observed before that point.

This preserves the result for regular cache hierarchies, while avoiding
selection of an architecturally ignored Ctype field.

Fixes: f4985fce6f0b ("xen/arm: add initial support for LLC coloring on arm64")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
This patch follows the xen-devel discussion:
https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00345.html

In that thread, Michal noted that the reverse scan was a simplification
rather than an intentional requirement, and that changing the
implementation would be fine.

Testing performed:
- standalone synthetic CLIDR tests covered both regular and pathological
  Ctype sequences and showed that the forward scan ignores unified cache
  levels above the first Ctype == 0b000 while the reverse scan can pick
  them
- Renesas H3ULCB booted with llc-coloring=on
---
 xen/arch/arm/llc-coloring.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 6f78817c57..3783f4c824 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -22,21 +22,33 @@ unsigned int __init get_llc_way_size(void)
     register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
     uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
     uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
-    unsigned int n, line_size, num_sets;
-
-    for ( n = CLIDR_CTYPEn_LEVELS; n != 0; n-- )
+    unsigned int n, line_size, num_sets, llc_level = 0;
+
+    /*
+     * CLIDR_EL1 Ctype fields are interpreted from Ctype1 upwards. Once a
+     * no-cache level is seen, higher Ctype fields are architecturally ignored
+     * for the CLIDR/CCSIDR set/way manageable cache hierarchy.
+     *
+     * Keep the outermost unified cache before that point.
+     */
+    for ( n = 1; n <= CLIDR_CTYPEn_LEVELS; n++ )
     {
         uint8_t ctype_n = (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
                            CLIDR_CTYPEn_MASK;
 
+        if ( ctype_n == 0b000 )
+            break;
+
         /* Unified cache (see Arm ARM DDI 0487J.a D19.2.27) */
         if ( ctype_n == 0b100 )
-            break;
+            llc_level = n;
     }
 
-    if ( n == 0 )
+    if ( !llc_level )
         return 0;
 
+    n = llc_level;
+
     WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
     isb();
 
-- 
2.43.0


