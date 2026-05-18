Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEflAFK6CmoB6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5F567283
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311553.1581671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOs2l-0003J8-VV; Mon, 18 May 2026 07:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311553.1581671; Mon, 18 May 2026 07:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOs2l-0003GB-Ro; Mon, 18 May 2026 07:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1311553;
 Mon, 18 May 2026 07:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wOs2k-0003G5-55
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOs2j-001ud6-HE
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:05:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 6a0aba3d-e002-0a2a0a5209dd-0a2a4508d59e-18
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:05:37 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 6a0aba40-63b5-0a2a45080019-d98c6eacd6f2-1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:05:36 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B765445BF;
 Mon, 18 May 2026 00:05:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E34B3F85F;
 Mon, 18 May 2026 00:05:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779087935; bh=cagP/lu5HxqlLYxu0yTLdLWRdQYKnbIua195LoF4ZVE=;
	h=From:To:Cc:Subject:Date:From;
	b=Et0KtNd1ibeWJ3jCwReWPy1CNjtvAYNeRpZ09mEU+MZJ3C5Yjck6btU9ff2R07i0V
	 +tCdr1DerW10EcLujZzzmgmOjXK5DCaGDcs/yg9NZZjPGbDJoQ632iXgOtJFQOp1p0
	 ylnMqSI+xBKKXiKg7ovGMdbNZ/lfsMfow10bKA7E=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gic-v3: Fix redistributor wakeup polling
Date: Mon, 18 May 2026 08:05:24 +0100
Message-Id: <20260518070524.19813-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779087937-BF171DB1-F11F92C7/0/0
X-purgate-type: clean
X-purgate-size: 1447
X-Rspamd-Queue-Id: A9B5F567283
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

gicv3_enable_redist() clears GICR_WAKER.ProcessorSleep and then waits for
GICR_WAKER.ChildrenAsleep to clear, as required after waking a
redistributor.

However, the polling loop currently uses "while ( timeout )". Since
timeout is initially false, the loop runs only once unless the timeout
path has already been reached. As a result, Xen can continue before the
redistributor has completed wakeup.

Use an unconditional loop, matching the surrounding timeout/break pattern,
so the code polls until either ChildrenAsleep is clear or the deadline is
reached.

While there, also fix the timeout message. This path polls
GICR_WAKER.ChildrenAsleep, not an RWP bit, so "RWP timeout" is misleading.

Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/gic-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7f365cdbe9df..bb946dc11375 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -828,11 +828,11 @@ static int gicv3_enable_redist(void)
         }
         cpu_relax();
         udelay(1);
-    } while ( timeout );
+    } while ( 1 );
 
     if ( timeout )
     {
-        dprintk(XENLOG_ERR, "GICv3: Redist enable RWP timeout\n");
+        dprintk(XENLOG_ERR, "GICv3: Redist wakeup timeout\n");
         return 1;
     }
 
-- 
2.34.1


