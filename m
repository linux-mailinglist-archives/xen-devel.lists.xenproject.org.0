Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHiALNt6HWrEbAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 14:28:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13361F429
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 14:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323864.1589535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU1jU-0003qB-Sv; Mon, 01 Jun 2026 12:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323864.1589535; Mon, 01 Jun 2026 12:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU1jU-0003ol-Pv; Mon, 01 Jun 2026 12:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1323864;
 Mon, 01 Jun 2026 12:27:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wU1jT-0003of-8q
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 12:27:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU1jS-00DFwl-3e
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 14:27:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1d7a93-2eae-0a2a0a5409dd-0a2a4505dee6-2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 14:27:02 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a1d7a95-aaa8-0a2a45050019-d155dd32c137-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 14:27:02 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-45ef82204c6so1080834f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 05:27:01 -0700 (PDT)
Received: from notebook.. ([85.107.102.236]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c152570sm104722385e9.9.2026.06.01.05.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 05:27:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780316821; x=1780921621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgycVY9EBdUKD1bfsQlIih14isXYfHifTpzvwDUdd64=;
        b=jv+hkHg56jjYz/0g5rWmkkyaD9LmXgmL34guloDSc0wYbfIwtqljdmh6OJ6PVt9K2l
         PR7NYceiM/+jDrbgI4jREEOZRtVgodWiZll7yoXcpxCLk/tQglScjfuNDxw+MhbEUnf8
         LXk1KLdLlvjRb89RHz0FhRs9FTcxNHwZMmcDx7kU4SZI7D/hFkvD6u1iMopGH37rjHQ/
         6WL2AuyBu5eHMzwXj0v4p/ZFMsdb6PEmOfaAcRX4GZQo2jNqpTgsr/G128Tlbu6rfkQk
         HdJ6WfZo0R2xrNaSRGEGHe1JEMcPXQ0nYxaCCNse8p4xXzrNh3/6Du67bmNvVDndP/h/
         qiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780316821; x=1780921621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FgycVY9EBdUKD1bfsQlIih14isXYfHifTpzvwDUdd64=;
        b=q035w3apiLSLg1hjZ3srNSIQJFNq7Bn3j9wGUmyH3anONvBBd3aea48kW1XkKMwrTf
         /9V+5t1j3v0nWyNRzZ7J1Fjd/hjzPe2sPNvD7C7IluSU7tIkQpLkrHqQFPPdBw5d/Jkf
         tWTt71lwBMk3JFaynDT1SgWX6nL85I4k3NUa/QV4noae2ez/mngQ/oGykeFmP7MYD3Ne
         Ztec/8awhfXiPviwwpD7M5EzZAuTT855GM2gIRT5UNIHOXTIxBFQU106cfQGyOWd2l3F
         od6YMONmGoHWiCOC5oem0DXOj7GZSSySryTuuNpsButTomCjF1HIUqnQBlAj8n31Gkjx
         YwgA==
X-Gm-Message-State: AOJu0Yxbu0ES9KeIIASPzKoCOBCmgLSmu+aZ3Yn8DKlN9RiuJVZWsCo+
	HoOt2JB+vZKlwekYHwmf/bj4QRrzZVgrYWuoAsadq1TNIocoRZ3oOuv6Se4Tug==
X-Gm-Gg: Acq92OETC3QPurO1Lg2inpRYo+DriuyMwQam/naZJTVVvMrg0KPslqUKOyO0a2kgJOD
	qLFpL4mkHepwd4Imoxxjja9ulggUZFSglqcEF7OKoZVm8uP7iJRW4qWqoIC715hBRSkAzCY56qY
	UZAfovr7sPDQz7ObL+Yn/72TJ8jly3Sa2ERbulXvzV5o2szHjGILFE/f1i3Ssh37N1G4ukshMwQ
	7pinZyks3og2cY35bwI3rSwqwvTC5EYuPnUNSczhv7Dwsr0yssHHFxXbRODXDqBwKiRsSnzamiR
	DiszCMxOGUz4iQDpIwUJ6Om7/7qFJCcmj0bhCb80VkXm2x9iuNKnvDxUedrpD5Ux7TMLVydaoWb
	wjnrKCp/LlopNrigQVvFfDPvNur9nT46yD12JgT0ZFuu3x8u5KkbFdUO95+SNaKmsSC2n7fnuf/
	6kQS8twvldVNK1Xxn5DZHg/4C8v//Uf6LVsp0=
X-Received: by 2002:a05:600c:a305:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-490a2933b47mr151322475e9.20.1780316821070;
        Mon, 01 Jun 2026 05:27:01 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jgross@suse.com,
	dfaggioli@suse.com,
	jbeulich@suse.com,
	gwd@xenproject.org,
	stewart.hildebrand@amd.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2] xen/sched: fix stale file and function references in comments
Date: Mon,  1 Jun 2026 15:26:43 +0300
Message-Id: <20260601122643.54773-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601053022.6044-1-frn1furkan10@gmail.com>
References: <20260601053022.6044-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780316822-E0867443-03BD990C/0/0
X-purgate-type: clean
X-purgate-size: 5043
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
	FREEMAIL_CC(0.00)[citrix.com,suse.com,xenproject.org,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:jbeulich@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:frn1furkan10@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frn1furkan10@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0B13361F429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several files in xen/common/sched still reference schedule.c in
their comments, which was the original name of xen/common/sched/core.c
before commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool
coding to dedicated directory") renamed and moved it. Some comments
also reference functions that no longer exist.

Rework the comments to remove stale file and function references.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/credit.c  |  9 +++++----
 xen/common/sched/credit2.c |  6 +++---
 xen/common/sched/rt.c      | 10 ++++------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 07656a57e9..328c802d0c 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -873,11 +873,12 @@ csched_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
     struct csched_unit *svc = CSCHED_UNIT(unit);
 
     /*
-     * We have been called by vcpu_migrate() (in schedule.c), as part
-     * of the process of seeing if vc can be migrated to another pcpu.
+     * We have been called, as part of the process of seeing if vc can be
+     * migrated to another pcpu.
+     *
      * We make a note about this in svc->flags so that later, in
-     * csched_unit_wake() (still called from vcpu_migrate()) we won't
-     * get boosted, which we don't deserve as we are "only" migrating.
+     * csched_unit_wake() we won't get boosted, which we don't deserve
+     * as we are "only" migrating.
      */
     set_bit(CSCHED_FLAG_UNIT_MIGRATING, &svc->flags);
     return get_sched_res(_csched_cpu_pick(ops, unit, true));
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 77475ee363..95946634d1 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -666,15 +666,15 @@ static inline bool has_cap(const struct csched2_unit *svc)
  * runq, _always_ happens by means of tickling:
  *  - when an unit wakes up, it calls csched2_unit_wake(), which calls
  *    runq_tickle();
- *  - when a migration is initiated in schedule.c, we call csched2_res_pick(),
+ *  - when a migration is initiated, we call csched2_res_pick(),
  *    csched2_unit_migrate() (which calls migrate()) and csched2_unit_wake().
  *    csched2_res_pick() looks for the least loaded runq and return just any
  *    of its processors. Then, csched2_unit_migrate() just moves the unit to
  *    the chosen runq, and it is again runq_tickle(), called by
  *    csched2_unit_wake() that actually decides what pcpu to use within the
  *    chosen runq;
- *  - when a migration is initiated in sched_credit2.c, by calling  migrate()
- *    directly, that again temporarily use a random pcpu from the new runq,
+ *  - when a migration is initiated, by calling migrate() directly,
+ *    that again temporarily use a random pcpu from the new runq,
  *    and then calls runq_tickle(), by itself.
  */
 
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 4b637aa9db..e2a5d43679 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -80,7 +80,6 @@
  * from all physical cpus.
  *
  * The lock is already grabbed when calling wake/sleep/schedule/ functions
- * in schedule.c
  *
  * The functions involes RunQ and needs to grab locks are:
  *    unit_insert, unit_remove, context_saved, runq_insert
@@ -894,8 +893,7 @@ rt_free_udata(const struct scheduler *ops, void *priv)
 }
 
 /*
- * It is called in sched_move_domain() and sched_init_vcpu
- * in schedule.c.
+ * It is called in sched_move_domain() and sched_init_vcpu()
  * When move a domain to a new cpupool.
  * It inserts units of moving domain to the scheduler's RunQ in
  * dest. cpupool.
@@ -1074,7 +1072,7 @@ runq_pick(const struct scheduler *ops, const cpumask_t *mask, unsigned int cpu)
 
 /*
  * schedule function for rt scheduler.
- * The lock is already grabbed in schedule.c, no need to lock here
+ * The lock is already grabbed by the caller, no need to lock here
  */
 static void cf_check
 rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
@@ -1168,7 +1166,7 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
 
 /*
  * Remove UNIT from RunQ
- * The lock is already grabbed in schedule.c, no need to lock here
+ * The lock is already grabbed by the caller, no need to lock here
  */
 static void cf_check
 rt_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
@@ -1281,7 +1279,7 @@ runq_tickle(const struct scheduler *ops, const struct rt_unit *new)
 /*
  * Should always wake up runnable unit, put it back to RunQ.
  * Check priority to raise interrupt
- * The lock is already grabbed in schedule.c, no need to lock here
+ * The lock is already grabbed by the caller, no need to lock here
  * TODO: what if these two units belongs to the same domain?
  */
 static void cf_check
-- 
2.34.1


