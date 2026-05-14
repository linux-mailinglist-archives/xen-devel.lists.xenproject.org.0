Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMfvKauRBWrfYgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 11:11:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C89F53FA04
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 11:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308755.1580119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNS5X-0004dx-5K; Thu, 14 May 2026 09:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308755.1580119; Thu, 14 May 2026 09:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNS5X-0004cP-2I; Thu, 14 May 2026 09:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1308755;
 Thu, 14 May 2026 09:10:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wNS5W-0004cJ-9M
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 09:10:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNS5V-005B0q-MJ
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 11:10:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a05917a-5cb7-0a2a0a5109dd-0a2a4501b2c4-38
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 11:10:37 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a05918d-c1f2-0a2a45010019-d155a731f05e-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 11:10:37 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5a85b30dd54so7717652e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 02:10:37 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a90f11a7a0sm342068e87.24.2026.05.14.02.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 02:10:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778749837; x=1779354637; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEnvo9OmaIrifU4IF1NjzdEIguWJngIg2w/0p8PT3os=;
        b=qzai1i5DRdf851JTfRhiRMDgRqN90YY3Q31iosIbC01pt3rMnERgAk86QxAT7JGP9s
         ZjT5a0UrszQswsGFtRVfwqGOOq56vP/Qq/KeUFZaSVqPBE6SGdyQITFycWvZ3/nP7ffJ
         hnBFiPq//jMUJUd2MPaOSEITKyDr5/3bCtv5WQoznQ3Fq4/2w1+1YWPVTeqf7GPzU3Xq
         K8ubY3a1rFtFRarUwVgVg2XY/7lNOcyg5Mb+Xb+3lyFYPjNZ4V2BxkuDoewm5/WZ+Ohw
         7tcMTqmJYOgDXKPqGGiey5RgChUTzhDfznjHQh2lwVRpnhZ0p/a2uVHU6kscV05sSINh
         /Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749837; x=1779354637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEnvo9OmaIrifU4IF1NjzdEIguWJngIg2w/0p8PT3os=;
        b=YDp+rUz48UBbIBhN8IGbEZRElwuRc8gde9cQrYIYw6Arnzj6C9P2rbqX59+g5f4pF4
         x4+UdOksOiXChAf66xIz/NNPA97dKznB9UsaYBpGScziFRmhnqRykKfumuZsvNmXeRb8
         iQXSdp792zshb5TCDKbdwC7rrTkp1fyCid0WsY9myWRlUrKMEVhPKt1vLOJzkNgHnZXg
         rjd2WxefDI+VCGWnV20nkr9/m3aV89tZqgxl751D8BCpBCMS9Bj1RWwakwpri2HKhEPt
         hOa0JFgnBbWNZcZWWqoXs7vimaiAdnllL9Th1/kpfkz3YVLxwiPfqUx0EHSlmCYiXzzn
         B+tA==
X-Gm-Message-State: AOJu0YwUN0xx2ROmQUhCYwdii2K3hu8G2EMxdXyR7Zx9iHejAOpUzls1
	pUclab3vVOyJHLcn8wfpcEKEo3SpF96O/XbxQd8JVvhUH53w3lnmSV+b8k3anw==
X-Gm-Gg: Acq92OHAoi0sSDgIrlii6uAKKFOC1HLOZA+jd8Y139QGODcsxSZQmWSscatpw0Pf1hl
	dBGczDH/AQfzuDqyd9Ao14hEaFc+J8Siuv9zZlg+JV3Sp9N2fM0twcN29c+IOwc53l6+gw5+Xeh
	BpdIvzNltPVIsM/uy4NEaFHyap1kN1j1OIASpHyBpEpL37t380K1J52oWV3TSwzU96HZooKTPfT
	Dqkrmgd/hvu0sStcwFeQ7l681oKvy8MJZhtHTPO+La08Nd8LQhPYu0QcQqHJAKVTknACcZ0FWWA
	gKtT75ClNReYIrPzlVQonc2wnUc/Tsw/3NV/g/E/m2S32w2klOAWtgxsUGI+Y+cHq4eqN66PFyq
	aVSnjEZa8mwekvlnfHm2MXg2KBmBT1ScmcygZ/N+0xtfGuKc/lUvwdWlnIeWldgshErDQec1GCN
	6WxzRcwch/7qziY4mTTd4OdO1eYw==
X-Received: by 2002:a05:6512:3186:b0:5a8:6931:ddea with SMTP id 2adb3069b0e04-5a8f37c31d9mr2050765e87.3.1778749836559;
        Thu, 14 May 2026 02:10:36 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH] xen/arm: gic-v3: Wait for redistributor RWP using the right bit
Date: Thu, 14 May 2026 12:08:13 +0300
Message-ID: <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778749837-B6342FF4-3695D959/0/0
X-purgate-type: clean
X-purgate-size: 2933
X-Rspamd-Queue-Id: 0C89F53FA04
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

gicv3_do_wait_for_rwp() is used for both distributor and
redistributor writes. The CTLR register is at offset 0 for both,
but the RWP bit is not in the same position.

For GICD_CTLR, RWP is bit 31. For GICR_CTLR, bit 31 is UWP,
while RWP is bit 3. The redistributor wait path was therefore
polling UWP instead of RWP.

UWP covers upstream writes, including Generate SGI packets, and is
not a substitute for redistributor register write completion. The
existing redistributor callers need RWP semantics for redistributor
register writes such as GICR_ICENABLER0 and GICR_CTLR updates.

Add GICR_CTLR_RWP and pass the expected RWP bit to the shared
helper.

Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3.c                  | 14 +++++++++-----
 xen/arch/arm/include/asm/gic_v3_defs.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7f365cdbe9..dfd5d44603 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -274,16 +274,20 @@ static void gicv3_enable_sre(void)
     isb();
 }
 
-/* Wait for completion of a distributor change */
-static void gicv3_do_wait_for_rwp(void __iomem *base)
+/* Wait for completion of a distributor/redistributor change */
+static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
 {
     uint32_t val;
     bool timeout = false;
     s_time_t deadline = NOW() + MILLISECS(1000);
 
     do {
+        /*
+         * GICD_CTLR and GICR_CTLR are both at offset 0, so this is
+         * valid for either a distributor or redistributor base.
+         */
         val = readl_relaxed(base + GICD_CTLR);
-        if ( !(val & GICD_CTLR_RWP) )
+        if ( !(val & rwp_bit) )
             break;
         if ( NOW() > deadline )
         {
@@ -300,12 +304,12 @@ static void gicv3_do_wait_for_rwp(void __iomem *base)
 
 static void gicv3_dist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD);
+    gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
 }
 
 static void gicv3_redist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD_RDIST_BASE);
+    gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
 }
 
 static void gicv3_wait_for_rwp(int irq)
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index c373b94d19..3714cfeb7d 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -146,6 +146,7 @@
 #define GICR_NSACR                   (0x0E00)
 
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_RWP                (1U << 3)
 
 #define GICR_TYPER_PLPIS             (1U << 0)
 #define GICR_TYPER_VLPIS             (1U << 1)
-- 
2.43.0


