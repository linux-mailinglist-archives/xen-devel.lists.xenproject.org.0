Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC31743AF0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 13:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557444.870788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCRs-0000k3-AO; Fri, 30 Jun 2023 11:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557444.870788; Fri, 30 Jun 2023 11:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCRs-0000i3-7Z; Fri, 30 Jun 2023 11:38:00 +0000
Received: by outflank-mailman (input) for mailman id 557444;
 Fri, 30 Jun 2023 11:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SFwN=CS=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qFCRr-0000hx-93
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 11:37:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fa7ec36-173a-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 13:37:58 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d9865b8a2so1868799a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 04:37:58 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7db43000000b0051a4361f3efsm6617282edt.61.2023.06.30.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 04:37:57 -0700 (PDT)
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
X-Inumbo-ID: 8fa7ec36-173a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688125077; x=1690717077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/LI/Muc6+gIT2fOpPCQSPl2WmUiu9rE0EERxsNn5vo=;
        b=dbBHYQkFwC0IIWY+SBc5LEVBR3N2espN106dMOISx2H2lApD2e7eXgd08IfHk1YFTf
         PPB1IhBmTpmZXws8eDXxl6alPDV2XnL3Ua2hbMwC9S9bMMv5Paxn2fLy2Coqdpb2wdKD
         G90xMshqS13xecjZ8X/siU+mpxhrqC0r7pbJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125077; x=1690717077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/LI/Muc6+gIT2fOpPCQSPl2WmUiu9rE0EERxsNn5vo=;
        b=HmZfoUY5MOW07N3sVwPlQpzMEuOuJuVEo3y2hSYsaoeJf1C/ghA2JVOnvchFT88D1j
         +dCfLs7OeTEqNaeER8OyjUIfMQOvPBjQHl4IibN/0mdZ0uvqRB4lNqtkjhUWz8jX4NdV
         m5GQzCZbszHtcUauzJusiUFkUi198+U3qgEUgI3ZErT6poUcD+YSCRTt78LZ+A9TdBZO
         ilyR7dwy6YrCXhBjSCEVvJUX1f0eRpUBnlvAKt4/7gLV2rBXWcHcRqyXgcuHKgq/rlaR
         wihGwQOaUChLmnLQ6fPC+WoOvOwAVa3FqfS6hPjgJWWYftzhth4A6/wctge2WcVsEQRr
         ryTg==
X-Gm-Message-State: ABy/qLaO60Dosvn+HB8GXwlMeT+Hg7WHKalCUw1y/nKLBlF9f5qWXW6I
	x9i7nsfTK4Uou2UYXDU9oer+O4ninePhMF/V5v8=
X-Google-Smtp-Source: APBJJlETAWgc5qUwa2MgtETqTA3OYLt3JAiz6zG+yZUBLPKT/zRcArDNSt1DV8D7+GqZaAwA0x1yVA==
X-Received: by 2002:a05:6402:34e:b0:51d:9883:afdf with SMTP id r14-20020a056402034e00b0051d9883afdfmr1450546edw.12.1688125077484;
        Fri, 30 Jun 2023 04:37:57 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 2/2] credit: Don't steal vcpus which have yielded
Date: Fri, 30 Jun 2023 12:37:56 +0100
Message-Id: <20230630113756.672607-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630113756.672607-1-george.dunlap@cloud.com>
References: <20230630113756.672607-1-george.dunlap@cloud.com>
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
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/credit.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index b8bdfd5f6a..7754e9b3a0 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -296,14 +296,10 @@ __runq_insert(struct csched_unit *svc)
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
 
@@ -319,6 +315,11 @@ __runq_remove(struct csched_unit *svc)
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
@@ -1638,6 +1639,13 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
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
@@ -1955,11 +1963,6 @@ static void cf_check csched_schedule(
         dec_nr_runnable(sched_cpu);
     }
 
-    /*
-     * Clear YIELD flag before scheduling out
-     */
-    clear_bit(CSCHED_FLAG_UNIT_YIELD, &scurr->flags);
-
     do {
         snext = __runq_elem(runq->next);
 
@@ -1974,10 +1977,11 @@ static void cf_check csched_schedule(
         /*
          * SMP Load balance:
          *
-         * If the next highest priority local runnable UNIT has already eaten
-         * through its credits, look on other PCPUs to see if we have more
-         * urgent work... If not, csched_load_balance() will return snext, but
-         * already removed from the runq.
+         * If the next highest priority local runnable UNIT has
+         * already eaten through its credits (and we're below the
+         * balancing ratelimit), look on other PCPUs to see if we have
+         * more urgent work... If we don't, csched_load_balance() will
+         * return snext, but already removed from the runq.
          */
         if ( snext->pri <= CSCHED_PRI_TS_OVER
              && now - spc->last_load_balance > prv->load_balance_ratelimit) {
-- 
2.25.1


