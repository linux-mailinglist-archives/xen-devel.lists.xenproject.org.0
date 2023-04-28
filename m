Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64DA6F12FB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527187.819509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9k-0003d2-5D; Fri, 28 Apr 2023 08:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527187.819509; Fri, 28 Apr 2023 08:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9j-0003b4-Tg; Fri, 28 Apr 2023 08:08:39 +0000
Received: by outflank-mailman (input) for mailman id 527187;
 Fri, 28 Apr 2023 08:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJ9i-00036x-6D
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:08:38 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0175b10-e59b-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 10:08:36 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso64347975e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:08:36 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b003f31da39b62sm2569464wmo.18.2023.04.28.01.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:08:35 -0700 (PDT)
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
X-Inumbo-ID: e0175b10-e59b-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669315; x=1685261315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLu7TscClVzVFwnxnkUi2eFFYfLdqDnUzBYuO4yEO4M=;
        b=MS6ycKFAY4yrzKVadA9O0uoVCowNIXOMxRBSbz1Xada8oMpsZ9G5KTsHr1wfuqoZBk
         VeJ3LEyktkgctiUxiKfqCBQhHyqBkQRYChGUwCfe+priBB2XqeKFv3TyNDAnBHwr6kjR
         8fPcrPPxt/z4WgFuY2aMsdfgV0BujO+FwHqNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669315; x=1685261315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLu7TscClVzVFwnxnkUi2eFFYfLdqDnUzBYuO4yEO4M=;
        b=OvL51uncN0b8WBa5bHf87Lz0mySOgUB/2uNv/MgO4iE8HZemC7Tcyd/p5AsP/wDhfi
         iGxMqmaoC6DVwSAZNk/HVlgugR5Cb3anpDKljR3PQpj92TI/9R47Vr5LMF62aUZwDLTX
         OPp6JN0y3uO7d+GqmMTQfYAY2OMV841VwnF5mg8co7/OBK3VJeZuDurS7JNueVRiZ3mU
         Uh2lFf2k/C22C0Ge492dc5zPbtaFsT9ThvpiAYnbOcdiBWHyweFSSIk1skCqa5bojDgF
         JVx/HIbk4AYOfFgr3uc1TpM17vuT6T23i1zGGY7ZfVv6QwkQSWR1Iq/3aqbQqTtUjJaZ
         yA6g==
X-Gm-Message-State: AC+VfDwpDAAvUucWzdCXCxBalF0guqThYvJqQNBKaCuiNfj8JriSWW8L
	zBvF/e2tkMXTyDGL21OwKkjGi7ogEKI4eC3cAR8=
X-Google-Smtp-Source: ACHHUZ5awrW5ndtj6h3K+RiEO1oWn0kIUfGYxK1DkO+FZrvVuXWn53EffJsqWvILbOxVSWqykPhuhA==
X-Received: by 2002:a7b:cb94:0:b0:3f1:7ba6:d5ab with SMTP id m20-20020a7bcb94000000b003f17ba6d5abmr3392523wmi.36.1682669315504;
        Fri, 28 Apr 2023 01:08:35 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 4/5] credit: Don't steal vcpus which have yielded
Date: Fri, 28 Apr 2023 09:08:31 +0100
Message-Id: <20230428080832.2461044-4-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428080832.2461044-1-george.dunlap@cloud.com>
References: <20230428080832.2461044-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On large systems with many vcpus yielding due to spinlock priority
inversion, it's not uncommon for a vcpu to yield its timeslice, only
to be immediately stolen by another pcpu looking for higher-priority
work.

To prevent this:

* Keep the YIELD flag until a vcpu is removed from a runqueue

* When looking for work to steal, skip vcpus which have yielded

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/common/sched/credit.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index b8bdfd5f6a..70a1a57ba6 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -319,6 +319,11 @@ __runq_remove(struct csched_unit *svc)
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
@@ -1638,6 +1643,13 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
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
@@ -1955,11 +1967,6 @@ static void cf_check csched_schedule(
         dec_nr_runnable(sched_cpu);
     }
 
-    /*
-     * Clear YIELD flag before scheduling out
-     */
-    clear_bit(CSCHED_FLAG_UNIT_YIELD, &scurr->flags);
-
     do {
         snext = __runq_elem(runq->next);
 
@@ -1974,10 +1981,11 @@ static void cf_check csched_schedule(
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


