Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHtpCrInFGrfKAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:42:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D15C952F
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319149.1586875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSla-0000eH-Q3; Mon, 25 May 2026 10:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319149.1586875; Mon, 25 May 2026 10:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSla-0000c1-MY; Mon, 25 May 2026 10:42:38 +0000
Received: by outflank-mailman (input) for mailman id 1319149;
 Mon, 25 May 2026 10:26:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wRSVX-0005lI-Oc
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 10:26:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRSVW-000GgL-Tw
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:26:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a14236e-bab6-0a2a0a5309dd-0a2a4505ca10-42
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:26:02 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1423ba-aaa8-0a2a45050019-d155d02bb915-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:26:02 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6896c80480cso1598102a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 03:26:02 -0700 (PDT)
Received: from notebook.. ([88.230.47.198]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-688baf2e7adsm3761499a12.20.2026.05.25.03.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 03:26:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779704762; x=1780309562; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5d3Ya/F7IfVOFokA2NomGTXVfkbkxpmf5NDrwFphHO0=;
        b=WwZwwnsuvK5FXc5gFsaujIP3dAvQTMHHNJ+CCFlNQNhWR57v3CTqKqG0PkeijFVmhe
         OwAVNHtmZmxP+ArPjdsc9BKU37PoaCy+T37CWaUuJ4xiHXBLtzE+MZZzde8b1WB4Bfqs
         SywLm3jevyoWg/IMTo5yr46XU0ElVuG6SjI5F24mG8VZ7osI6MEd3ne9TtPR3125X+eF
         t2ev9eMr5hUYSV/H6n/qDp1re4LrP3pQBCSrcZUq6hm8JNlJt4z/aTr0j37ywRqTWO+h
         IzOeQRGnh3+WFLU/NUPaMO8vVibYT1jT2tQs59Me9ngrAEZ4nWh0fkaXdlXFnSDHmUUU
         dfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704762; x=1780309562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d3Ya/F7IfVOFokA2NomGTXVfkbkxpmf5NDrwFphHO0=;
        b=W2f7g5Mz1Lgkg0kIikz/z/1nHDsWH3Gl0IKYtE1ZZBUics64Ob6EC6smEIJog1gfVt
         Q7+H/Mrl/pwy2qoC78Se3zVVedEcLJV1iS2ZJzJVb8HP+q1lmTGC7r8IdYbZ4TfQ3oiC
         RHahMsl8bmjngkdmCVaD1Bua7VKYXe6OFwR4dX806BS7hhrfne5oUelBg6ZPleL8QoK6
         KB3F4OFEyuQeP/6jSvQ+bHST/6IlcgqvYYz18iDD+s5DTfYkPovMJH3Wecsn1ZKjSrqs
         jWwE9vxma3hA9ick20GVFU+/TxKM3g0EKLZJ6QtIYafvKAG/+rVH+0qlcb5Y6AuV+0ek
         CG6g==
X-Gm-Message-State: AOJu0YxxUzrXIDFjjl+FosN2GWx5AARtsSVpeeCo9C7MH8SP4OAvMSeO
	36TK8WnHQ7TPrIHGRvd5U32TyoMk84XpOExxm64Xbx3P62hnHl5i0H8Ofg4VEw==
X-Gm-Gg: Acq92OGzaox9kiE/EWvAaS/4TL11XElvdhhey5w4NKZ4c9e8tTLAUOPNtQOapgzT+c9
	Q8YY/MQnBcT5Z22h3Psf5XmC0p32u/gqT2kYPdTzF9UeshfOHInLQ221L5KFMz0gIdUfPWzboSv
	FaqEBGDr/lvH5wikHtGG50Rek627hBIqtAsdDZqE0VOspSZIsYpbtVi/UYojA5tLTtZna5pPwkr
	Xca7yAusdN8qqLel2Ldki7aUm8mDdESktqS7cY9ShS8xYA0Sjw7RhcFla/n6rQvSaNZTuQednCO
	jDFIxN+T03lcqGEBQKMmeLPSns9loBrs3xGE9p6Aq3tUMGH0vM8N5mWqvVJhHM2cyyA9ft5i+E5
	WxOhyqlISC0Tu9hTlX9BSNSIJ0DUWvUSAoH9Kdgfe2QCfFebSZxXQwgdtN5e/765VhG8uWNZHql
	h0CmkM+ffYh4Vvcbt9uqfRxfY=
X-Received: by 2002:a05:6402:42d5:b0:689:9e58:f2de with SMTP id 4fb4d7f45d1cf-6899e58f312mr1598350a12.1.1779704762201;
        Mon, 25 May 2026 03:26:02 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	stewart.hildebrand@amd.com,
	jbeulich@suse.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH] xen/sched: fix stale file path comments in common/sched directory
Date: Mon, 25 May 2026 13:25:38 +0300
Message-Id: <20260525102539.27050-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779704762-DAF6E443-E18A59D2/0/0
X-purgate-type: clean
X-purgate-size: 4076
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,xenproject.org,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:frn1furkan10@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 808D15C952F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool coding to
dedicated directory") moved the scheduler files from xen/common/ to
xen/common/sched and renamed some of them, but did not update the
in-file path comments at the top of each file.

Update the comments to reflect the current file locations.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/arinc653.c     | 2 +-
 xen/common/sched/boot-cpupool.c | 2 +-
 xen/common/sched/compat.c       | 2 +-
 xen/common/sched/core.c         | 2 +-
 xen/common/sched/cpupool.c      | 2 +-
 xen/common/sched/credit.c       | 2 +-
 xen/common/sched/credit2.c      | 2 +-
 xen/common/sched/null.c         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index d8a5380557..f509915e9b 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -1,5 +1,5 @@
 /******************************************************************************
- * sched_arinc653.c
+ * common/sched/arinc653.c
  *
  * An ARINC653-compatible scheduling algorithm for use in Xen.
  *
diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
index 03be73efdd..38beec8ec7 100644
--- a/xen/common/sched/boot-cpupool.c
+++ b/xen/common/sched/boot-cpupool.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * xen/common/boot_cpupools.c
+ * common/sched/boot-cpupool.c
  *
  * Code to create cpupools at boot time.
  *
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index a02204ec9a..1bbbd8f717 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -1,5 +1,5 @@
 /****************************************************************************
- * schedule.c
+ * common/sched/compat.c
  *
  */
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a57d5dd929..e4577d41f7 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -4,7 +4,7 @@
  * (C) 2004      - Mark Williamson - Intel Research Cambridge
  ****************************************************************************
  *
- *        File: common/schedule.c
+ *        File: common/sched/core.c
  *      Author: Rolf Neugebauer & Keir Fraser
  *              Updated for generic API by Mark Williamson
  *
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f5459c2779..b1e0884842 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1,5 +1,5 @@
 /******************************************************************************
- * cpupool.c
+ * common/sched/cpupool.c
  * 
  * Generic cpupool-handling functions.
  *
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index e9a91d11c3..9c8075338e 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -2,7 +2,7 @@
  * (C) 2005-2006 - Emmanuel Ackaouy - XenSource Inc.
  ****************************************************************************
  *
- *        File: common/csched_credit.c
+ *        File: common/sched/credit.c
  *      Author: Emmanuel Ackaouy
  *
  * Description: Credit-based SMP CPU scheduler
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 75316d42b7..04e7b9a28c 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3,7 +3,7 @@
  * (C) 2009 - George Dunlap - Citrix Systems R&D UK, Ltd
  ****************************************************************************
  *
- *        File: common/sched_credit2.c
+ *        File: common/sched/credit2.c
  *      Author: George Dunlap
  *
  * Description: Credit-based SMP CPU scheduler
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index c8e327e3cd..aa136fa729 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -1,5 +1,5 @@
 /*
- * xen/common/sched_null.c
+ * common/sched/null.c
  *
  *  Copyright (c) 2017, Dario Faggioli, Citrix Ltd
  *
-- 
2.34.1


