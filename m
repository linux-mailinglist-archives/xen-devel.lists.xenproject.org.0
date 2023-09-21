Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A3C7A9440
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606389.944285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIit-00054H-T5; Thu, 21 Sep 2023 12:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606389.944285; Thu, 21 Sep 2023 12:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIit-00052J-Q5; Thu, 21 Sep 2023 12:23:59 +0000
Received: by outflank-mailman (input) for mailman id 606389;
 Thu, 21 Sep 2023 12:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqFj=FF=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qjIis-0004xy-7l
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:23:58 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb718365-5879-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 14:23:55 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32179d3c167so755909f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 05:23:55 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d4005000000b0031c5dda3aedsm1620901wrp.95.2023.09.21.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 05:23:54 -0700 (PDT)
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
X-Inumbo-ID: bb718365-5879-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695299035; x=1695903835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND6JjdDALXmgUMQ6eVlffEnK99gwZtTIG42TlqB7sOk=;
        b=GDd7DlMzly7unkahiNv1p9gD70jWIKCcCwe3co9olUZoYUthQx3bhn7MLwMMvqcUF6
         F9lCHOoZPqRmeH9X/xyLA3konPT5hYnqgZfqEeXMNBhdbUz++BXPQVm6vs30NBpE7zNG
         HWJhevp1S7tlim64xIR6pi5Lb87K/OESgQv8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695299035; x=1695903835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND6JjdDALXmgUMQ6eVlffEnK99gwZtTIG42TlqB7sOk=;
        b=KsTC5v900+Am7xxTd/ExVrQSYZuu+Smqh28KOZEXE9plH9qNaq8av7jZC6ctudvJy6
         Tx1vjDtpH2r+QJTpi2gy1zSQir3DrHAmlhcNoy4USh5jsLAXYeisagkD4QEM74S6rhM/
         g+P9gPMpzkSzGovkjflULIqs5vmuoioh8pGYPtpLU0NcAXyFUQmwN5lvZa0jSB/P/TLs
         4j3SorPG859Oo/OQpELs4z5Qf3QQttBQt02C7GUL/6w+odcDHNcDWsqRQf3b8cqKXWuS
         ow35JLmzkWR+sUq1Did8OVw8nusuXHfS7upVnXNPQFlhuQKnQzEMv/KCJJ3l+PokYFYe
         sOLQ==
X-Gm-Message-State: AOJu0YxgXd1pI5F+09nUW++6FPltmALEWvByIEY6857/5Xt+DPD1T6qL
	pBdXkfQyJxwnKSqdfV1et1KmP7GgMVh/ATAShAg=
X-Google-Smtp-Source: AGHT+IGjwxRe2ylX66/0bx/FQE0r6xzF2bdDMVP4PCeaXLq53QDiJu9bRg6SNSp3yo0ySblFUN4cFw==
X-Received: by 2002:a5d:61cd:0:b0:31f:91ae:4509 with SMTP id q13-20020a5d61cd000000b0031f91ae4509mr5096426wrv.40.1695299034566;
        Thu, 21 Sep 2023 05:23:54 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
Date: Thu, 21 Sep 2023 13:23:52 +0100
Message-Id: <20230921122352.2307574-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921122352.2307574-1-george.dunlap@cloud.com>
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On large systems with many vcpus yielding due to spinlock priority
inversion, it's not uncommon for a vcpu to yield its timeslice, only
to be immediately stolen by another pcpu looking for higher-priority
work.

To prevent this:

* Keep the YIELD flag until a vcpu is removed from a runqueue

* When looking for work to steal, skip vcpus which have yielded

NB that this does mean that sometimes a VM is inserted into an empty
runqueue; handle that case.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Changes since v1:
- Moved a comment tweak to the right patch

CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/credit.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 5c06f596d2..38a6f6fa6d 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -298,14 +298,10 @@ __runq_insert(struct csched_unit *svc)
      * runnable unit if we can.  The next runq_sort will bring it forward
      * within 30ms if the queue too long. */
     if ( test_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags)
-         && __runq_elem(iter)->pri > CSCHED_PRI_IDLE )
-    {
+         && __runq_elem(iter)->pri > CSCHED_PRI_IDLE
+         && iter->next != runq)
         iter=iter->next;
 
-        /* Some sanity checks */
-        BUG_ON(iter == runq);
-    }
-
     list_add_tail(&svc->runq_elem, iter);
 }
 
@@ -321,6 +317,11 @@ __runq_remove(struct csched_unit *svc)
 {
     BUG_ON( !__unit_on_runq(svc) );
     list_del_init(&svc->runq_elem);
+
+    /*
+     * Clear YIELD flag when scheduling back in
+     */
+    clear_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags);
 }
 
 static inline void
@@ -1637,6 +1638,13 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
         if ( speer->pri <= pri )
             break;
 
+        /*
+         * Don't steal a UNIT which has yielded; it's waiting for a
+         * reason
+         */
+        if (test_bit(CSCHED_FLAG_UNIT_YIELD, &speer->flags))
+            continue;
+
         /* Is this UNIT runnable on our PCPU? */
         unit = speer->unit;
         BUG_ON( is_idle_unit(unit) );
@@ -1954,11 +1962,6 @@ static void cf_check csched_schedule(
         dec_nr_runnable(sched_cpu);
     }
 
-    /*
-     * Clear YIELD flag before scheduling out
-     */
-    clear_bit(CSCHED_FLAG_UNIT_YIELD, &scurr->flags);
-
     do {
         snext = __runq_elem(runq->next);
 
-- 
2.25.1


