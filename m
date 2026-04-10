Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDVcJVIt2Wl+nAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 19:03:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391FC3DADA6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 19:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279586.1563961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBFFL-00073z-Tp; Fri, 10 Apr 2026 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279586.1563961; Fri, 10 Apr 2026 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBFFL-00072B-QJ; Fri, 10 Apr 2026 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1279586;
 Fri, 10 Apr 2026 16:40:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruslichenko.r@gmail.com>) id 1wBEud-0004ce-Ol
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 16:40:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBEud-00GILx-4t
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 18:40:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 69d92808-e002-0a2a0a5209dd-0a2a4509c3b6-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 18:40:55 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 69d92816-bf79-0a2a45090019-d155dd35e810-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 18:40:55 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so1518543f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:40:55 -0700 (PDT)
Received: from thinkpad-t470s.. (93-138-230-56.adsl.net.t-com.hr.
 [93.138.230.56]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43d63de2a74sm9148616f8f.3.2026.04.10.09.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 09:40:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775839254; x=1776444054; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2MeOwOQ0HpzPcQqHFqvJhQPkk3zuHdR2kp1S4waI/Y=;
        b=NFd8cvwowwrgrHBayC1FeAFp5rfctjN3P3lIzetmZT07Y8fnV2XY54bTusXlwb3D5z
         GNhaoQX2GbBNfKdi3xlNXWxdazkh9WsirjkSfcx2xHLvur9tziXbbrRYWYEkb+MaFb2t
         1rOXA+qKvnqtXNQEXqv3XVsvoACa64mnPcuEBk9LCUC6ZlKkMIYFvCZufkF1Rrqf+8nJ
         9uULkOXM1Dlcvbq68IVzyxEvgtuMksL/DDDmLgjRcEpE1MLVUoqTvwrLtizFJVzwvCpq
         +vdNU1ZLBbEIrvm9mP/6Pk+hDkXlRC+Xf/qSN8Vt1xBcte9zW3M2/+yKRfCHep9PV8dl
         TGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775839254; x=1776444054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2MeOwOQ0HpzPcQqHFqvJhQPkk3zuHdR2kp1S4waI/Y=;
        b=ct8I4oN+oNlkR3H/nhpMQp7H6ToQouEZul0MwMCeJMTL4LzkWZWaGATuxBwm7gWh4v
         vmvW8OKyRq2lLt9mqGaZCNEJNBUkNs04Ve49M3pi+1YqDnevMsgGbLCCBOgKvoy9BRbK
         +LMES04Ce54rIJWTxK5nIh8exqkrI40vdC2UwYOpu53//HxxgyIslfcxR++p+CMDCSwb
         PybPrdqgcy8PAKFKoGI2rkjxR+n3WMDsHZ4Kh+Yei1kyYCBA7q0rP/QancDQhB1GPNCz
         dY+gzctjVgFV68hw1oN2oqroHmxYH3PdAjeN20VPIPlfDe1R6f6wZadr0VJfPgRfH5Vl
         sikg==
X-Gm-Message-State: AOJu0Yw9MpYrVas/qWT1Okp+8fQ6ZLc9LGMQvOLFqo8htkYh6nTrL10m
	lY3XVf+KxufDHG8VpqdYR7fJxqfCoVoGwaJB5qn3iVK6HKhZxlI/4+hQLEjtCLeh
X-Gm-Gg: AeBDietOq6Lnk347PS0e0J/VLDVaBqhZlVb7nV5U59hD55KigXi0AMQGRh0x1tH1NQH
	86QneOHQlYJsDPJzms9spxUA+YcX15+z6jGplUyi+oP1k4BeB8ykuOryiFKjtFoMizAc4HVvbSd
	CUaAoMGVZM7GgiRjqcFzOU+JvaNY2hvAMhAQP6k9rbX5YzYYynj9LtpN6mDdUn8CTaRL0lc25u0
	WihXEU0WOGErWzTj/U47zuNocr/5CKG9Pv0TL6rbpwaxAv41jZrMQQd+gAAk24tvmuzbTp0036o
	PqYShDv2h3saAxC9bP+bQRAQNpWi/DEEGllK5OWQGkVAoJiOZAtIW7T9Wjy+CpBtWp4a9mSvbB9
	ggWklPiLe0RNB4eTUgxSgtL7ph9+uC3ytaZV/7WgRd6Dlb8a3oDDM3YgCZcKPojd1+54aMdpy7N
	Nbk6HGkw1DQoLO1iiJWbSfp/+fUoWEQOxHU68Cs0JzU2Ns/W9exD95itsXLbsHuPb1Q0Y=
X-Received: by 2002:a05:6000:611:b0:43d:613:33d8 with SMTP id ffacd0b85a97d-43d642b9e4amr6075919f8f.29.1775839253942;
        Fri, 10 Apr 2026 09:40:53 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: volodymyr_babchuk@epam.com,
	Ruslan_Ruslichenko@epam.com,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH] xen/sched: fix scheduler callback verification on init
Date: Fri, 10 Apr 2026 18:40:39 +0200
Message-ID: <20260410164039.1000284-1-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775839255-5CDF7152-028EBDF8/0/0
X-purgate-type: clean
X-purgate-size: 1916
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:Ruslan_Ruslichenko@epam.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ruslichenkor@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruslichenkor@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 391FC3DADA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

During core scheduler initialization, each registered scheduler
is sanity tested in two steps:

- it must provide required callbacks (e.g. init, do_schedule).
- if global_init callback is present, it must succeed.

If any of the steps fail, scheduler entry is cleared in global
'schedulers' array.

However, in the current implementation, if verification fails during
the first step, the scheduler entry is cleared but verification
sequence is not interrupted. This lead to NULL pointer dereference
when subsequent required callbacks verified, and possible during
the second step.

The patch fixes the crashes by adding check inside sched_test_func
macro and skipping the call to a global_init if first step did not pass.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 xen/common/sched/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a57d5dd929..4270c89491 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3017,7 +3017,7 @@ void __init scheduler_init(void)
     for ( i = 0; i < NUM_SCHEDULERS; i++)
     {
 #define sched_test_func(f)                               \
-        if ( !schedulers[i]->f )                         \
+        if ( schedulers[i] && !schedulers[i]->f )        \
         {                                                \
             printk("scheduler %s misses .%s, dropped\n", \
                    schedulers[i]->opt_name, #f);         \
@@ -3034,6 +3034,9 @@ void __init scheduler_init(void)
 
 #undef sched_test_func
 
+        if ( !schedulers[i] )
+            continue;
+
         if ( schedulers[i]->global_init && schedulers[i]->global_init() < 0 )
         {
             printk("scheduler %s failed initialization, dropped\n",
-- 
2.43.0


