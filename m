Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJg0M4o3FGpuKwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 13:50:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306AA5CA2E8
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 13:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319189.1586893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRTof-0001Ci-R9; Mon, 25 May 2026 11:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319189.1586893; Mon, 25 May 2026 11:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRTof-0001A5-OV; Mon, 25 May 2026 11:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1319189;
 Mon, 25 May 2026 11:49:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wRTod-00019x-Ve
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 11:49:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRToc-006Zda-Ta
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 13:49:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a143755-5cb7-0a2a0a5109dd-0a2a4504a612-16
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 13:49:50 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a14375e-1dec-0a2a45040019-d155da36bcd3-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 13:49:50 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-bcd3c190f71so1534788166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 04:49:50 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5eced0asm393643566b.39.2026.05.25.04.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 04:49:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779709790; x=1780314590; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jI01HwKooNheF6pO192at6Bii7Ij61+AZWCIl1TlZE=;
        b=Bt6anAjb/soC4PkBhlL6dR9AD7KpDJmp/XMZotXFIeheBt15ZbkBIMzbAiCJdKlg4a
         x7rEqLxIT8tGkO2GpTLL7lBg6qpJPxrV+HeEljbwx+4PgJ+AxWMUfjbaqGC7JbkEd1GQ
         XtLW6ulZwOba/GCIXWu8LMMysdDQ41d9XaaQC8o/Jad9pH7aPUXCcgEk7IhZDepkk6XZ
         eu0fz4emN5TRPB31+oY9lbQ+EtO1YnKyYEkeuqcZ0v0yn3FPT0UQYtcDkgksCapS42q5
         ekBn9yfqW9tZ+a14AVB5n18s8GP0tGQ8rhG8NhDUj8a9qgSE8oSW+2CLE2KADir5I7X7
         quSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709790; x=1780314590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jI01HwKooNheF6pO192at6Bii7Ij61+AZWCIl1TlZE=;
        b=adbMhumSrbkXqk7W3moT3Oj1+NnA1IwookqxG+sRq2RcVJSxewLhucuSQumE3JTBXl
         BRf2r4rkBhok7rOiS1LOoFaDjmlFzVjZZO4iWS52lnYGVADiBKUef+8vVC8XjI3RVwCL
         HCU2Y5bRdbhwFPECz1Imj5R/QvM8LMLwJgLUTF+NGONAh/u8Vzd7CR2MqplgsCvrEJMd
         wSgNi+3smgwP14Ntb6I8gjHo3gv4sKrdT6pTUIVcPyS/FPrC4GQ8/kM687yuKY4tMUIG
         bIZwXG/22Dynol8mbYiSDxdkPi83eRcW27eJyJhWaz2G6nR3fqdGCck8k5XnMaWCd9hi
         wEuw==
X-Gm-Message-State: AOJu0YyAcIRfleDoxtYzNb2zHCR2D2yMTmJSa7/hpzIS+exVfkWLmPLz
	vIspL0mJxOuEqkkq5kfIN1oWxUuo5Fek76o2SD8HB8LBIgh/bsvCnjRNqbXqi/uc
X-Gm-Gg: Acq92OEg96nNTkgD59EsE+41olO9zZpW6DozJ3NzM7/QA9PpPLMv9scgwOxDpx+cgfd
	HKc5sU/KqeApGhDMUgUqVqeyehABZ4VHWVXvT0r1GLIp0BHLpbyHWppRWGmUOZ05vysPK3Zg+sf
	MptFnR+dMjrtDgverTxU1RBUtSFabK8ZILM3IsBunVlyGqketEs9MB4f306MeFmni69iCcY6hfw
	E7X91TGARZUz0EMwwI7Bl1vVPNYDZd/7cJ9yDj9qQrp6opgnF6qSbSFyIJbxx1K5sUeGfPBxma4
	B06XsAVpe957GSj1MvJXymzep/e9m7sZ7QpYRzjAxKmInnwGom3pmt2dBq5wXjgJhPtZDiqZL9d
	pnb/q7ZuHLxZylrTH8mrBRm/AbBC9Yg8gpw+JhvXZPZnm79jkbIsfmkvP/oKpR+jRMLNjR/oi1v
	bP6t+bdzvC5O4Cha8Cd403y/M84Oc2zRnm06NE+xyTaPDEmw4=
X-Received: by 2002:a17:907:c06:b0:bd4:6da5:d5b2 with SMTP id a640c23a62f3a-bdd23cfc4d1mr766022466b.1.1779709789998;
        Mon, 25 May 2026 04:49:49 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Miccio <lucmiccio@gmail.com>,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2] xen/arm: scan CLIDR Ctype fields upwards when probing LLC
Date: Mon, 25 May 2026 14:47:35 +0300
Message-ID: <fc9f1babe0c320214c03b1d294398d411fa41254.1779708833.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779709790-2A9623FF-921348D1/0/0
X-purgate-type: clean
X-purgate-size: 4130
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:lucmiccio@gmail.com,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com,minervasys.tech];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 306AA5CA2E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- Use llc_level directly after the CLIDR scan instead of assigning it back to n.
- Add Reviewed-by tags from Luca and Michal.


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
 xen/arch/arm/llc-coloring.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 6f78817c57..f7b69f629f 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -22,22 +22,32 @@ unsigned int __init get_llc_way_size(void)
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
 
-    WRITE_SYSREG((n - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
+    WRITE_SYSREG((llc_level - 1) << CSSELR_LEVEL_SHIFT, CSSELR_EL1);
     isb();
 
     ccsidr_el1 = READ_SYSREG(CCSIDR_EL1);
@@ -56,7 +66,7 @@ unsigned int __init get_llc_way_size(void)
     num_sets = ((ccsidr_el1 >> ccsidr_numsets_shift) & ccsidr_numsets_mask) + 1;
 
     printk(XENLOG_INFO "LLC found: L%u (line size: %u bytes, sets num: %u)\n",
-           n, line_size, num_sets);
+           llc_level, line_size, num_sets);
 
     /* Restore value in CSSELR_EL1 */
     WRITE_SYSREG(csselr_el1, CSSELR_EL1);
-- 
2.43.0


