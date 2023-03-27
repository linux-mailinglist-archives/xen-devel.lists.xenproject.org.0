Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30C6CAA15
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 18:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515372.798166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpTO-0004w7-M0; Mon, 27 Mar 2023 16:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515372.798166; Mon, 27 Mar 2023 16:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgpTO-0004u0-JI; Mon, 27 Mar 2023 16:13:30 +0000
Received: by outflank-mailman (input) for mailman id 515372;
 Mon, 27 Mar 2023 16:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dqr1=7T=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pgpTN-0004tt-I2
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 16:13:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee40efc-ccba-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 18:13:27 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so5666904wms.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 09:13:27 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c365800b003ef71d541cbsm2279124wmq.1.2023.03.27.09.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:13:26 -0700 (PDT)
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
X-Inumbo-ID: 4ee40efc-ccba-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679933607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jWK7DJewWhB76sKBU5USq0WS7TermcVDq89Y08sBTnY=;
        b=eBdrb2ZbX+p4rhw5mrsSJWhyNPVxt2NIKcmTIXsbadf8RU633scKyGTgAujqUc6uSO
         FLYp8ey4xvD1Sd5YSoa7tAJLCAWKtQ4kp/6X6Jo8WhecCni6OxKZ7sqFykGJcOuNfCqy
         /9nwx4GZDSQDM5I2qaaSlvmTzHKbGebYnOFrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679933607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWK7DJewWhB76sKBU5USq0WS7TermcVDq89Y08sBTnY=;
        b=f8vkfGoi/epnmUHms68pp0c1z4YDGRcrsXn68PaNaRvuOSsGMIEZ5Xs/lAekQnmF+1
         ynGRg7QcI+Ko0+2mb8yTeErkB1zk7zDIptpIbaVlyRk7oYqgqGTNgiPs5fXIoCBjkUei
         dHx4MALurEqyLa3tGZRI41W3G4QYOl1XIE1d93yQYjnU73rUI3C150++merJBj0grIG8
         3XqK0EToEiKRPh5mcbuRZVE9Vj2uflO/m2pnGYeq/E9uR2ywSZ6P+oV41zCw4M3S18JA
         4O1NcTRlV4rqPhSpQvZeRcWp2MI3fppCEq2Juz6ZIAr1KNhPv2OANn3YqS8X2Kjh+Gt9
         lImA==
X-Gm-Message-State: AO0yUKUzpQEZtYWrng+P9EUypFKMgQ2+Ytezmy7eCkN4UQnrT65UTxnQ
	WCTrMvIQfYvpquufAxJkvPInTR+95bib//GNwGVTmQ==
X-Google-Smtp-Source: AK7set+6xBiJuvOLT+3mNY8PjVz5frXqC3d4AUMXSMTYf6+/0hjg/fk2FjTSeR6lgc/k4A2XsMYVug==
X-Received: by 2002:a1c:4b02:0:b0:3ee:4481:5415 with SMTP id y2-20020a1c4b02000000b003ee44815415mr10063583wma.26.1679933607146;
        Mon, 27 Mar 2023 09:13:27 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Wei Liu <wl@xenproject.org>
Subject: [PATCH 1/2] xenalyze: Handle start-of-day ->RUNNING transitions
Date: Mon, 27 Mar 2023 17:13:25 +0100
Message-Id: <20230327161326.48851-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent xentrace highlighted an unhandled corner case in the vcpu
"start-of-day" logic, if the trace starts after the last running ->
non-running transition, but before the first non-running -> running
transition.  Because start-of-day wasn't handled, vcpu_next_update()
was expecting p->current to be NULL, and tripping out with the
following error message when it wasn't:

vcpu_next_update: FATAL: p->current not NULL! (d32768dv$p, runstate RUNSTATE_INIT)

where 32768 is the DEFAULT_DOMAIN, and $p is the pcpu number.

Instead of calling vcpu_start() piecemeal throughout
sched_runstate_process(), call it at the top of the function if the
vcpu in question is still in RUNSTATE_INIT, so that we can handle all
the cases in one place.

Sketch out at the top of the function all cases which we need to
handle, and what to do in those cases.  Some transitions tell us where
v is running; some transitions tell us about what is (or is not)
running on p; some transitions tell us neither.

If a transition tells us where v is now running, update its state;
otherwise leave it in INIT, in order to avoid having to deal with TSC
skew on start-up.

If a transition tells us what is or is not running on p, update
p->current (either to v or NULL).  Otherwise leave it alone.

If neither, do nothing.

Reifying those rules:

- If we're continuing to run, set v to RUNNING, and use p->first_tsc
  as the runstate time.

- If we're starting to run, set v to RUNNING, and use ri->tsc as the
  runstate time.

- If v is being deschedled, leave v in the INIT state to avoid dealing
  with TSC skew; but set p->current to NULL so that whatever is
  scheduled next won't trigger the assert in vcpu_next_update().

- If a vcpu is waking up (switching from one non-runnable state to
  another non-runnable state), leave v in INIT, and p in whatever
  state it's in (which may be the default domain, or some other vcpu
  which has already run).

While here, fix the comment above vcpu_start; it's called when the
vcpu state is INIT, not when current is the default domain.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Anthony Perard <anthony.perard@cloud.com>
CC: Wei Liu <wl@xenproject.org>
---
 tools/xentrace/xenalyze.c | 159 ++++++++++++++++++++++++--------------
 1 file changed, 101 insertions(+), 58 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 5de167031e..9f6d9763ac 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -6885,39 +6885,86 @@ void vcpu_next_update(struct pcpu_info *p, struct vcpu_data *next, tsc_t tsc)
     p->lost_record.seen_valid_schedule = 1;
 }
 
-/* If current is the default domain, we're fixing up from something
- * like start-of-day.  Update what we can. */
-void vcpu_start(struct pcpu_info *p, struct vcpu_data *v) {
-    /* If vcpus are created, or first show up, in a "dead zone", this will
-     * fail. */
-    if( !p->current || p->current->d->did != DEFAULT_DOMAIN) {
-        fprintf(stderr, "Strange, p->current not default domain!\n");
-        error(ERR_FILE, NULL);
-        return;
-    }
+/* 
+ * If the vcpu in question is in state INIT, we're fixing up from something
+ * like start-of-day.  Update what we can.
+ */
+void vcpu_start(struct pcpu_info *p, struct vcpu_data *v,
+                int old_runstate, int new_runstate, tsc_t ri_tsc) {
+    tsc_t tsc;
+
+    /*
+     * 
+     * Cases:
+     * running -> running:
+     *  v -> running, using p->first_tsc
+     * {runnable, blocked} -> running:
+     *  v -> running, using ri->tsc
+     * running -> {runnable, blocked}:
+     *  Leave v INIT, but clear p->current in case another vcpu is scheduled
+     * blocked -> runnable:
+     *  Leave INIT, and also leave p->current, since we still don't know who's scheduled here
+     */
+
+    /* 
+     * NB that a vcpu won't come out of INIT until it starts running somewhere.  
+     * If this event is pcpu that has already seen a scheduling event, p->current
+     * should be null; if this is the first scheduling event on this pcpu, 
+     * p->current should be the default domain.
+     */
+    if( old_runstate == RUNSTATE_RUNNING ) {
+        if ( !p->current ||  p->current->d->did != DEFAULT_DOMAIN) {
+            fprintf(stderr, "Strange, p->current not default domain!\n");
+            error(ERR_FILE, NULL);
+            return;
 
-    if(!p->first_tsc) {
-        fprintf(stderr, "Strange, p%d first_tsc 0!\n", p->pid);
-        error(ERR_FILE, NULL);
+        }
+        
+        if(!p->first_tsc) {
+            fprintf(stderr, "Strange, p%d first_tsc 0!\n", p->pid);
+            error(ERR_FILE, NULL);
+        }
+
+        if(p->first_tsc <= p->current->runstate.tsc) {
+            fprintf(stderr, "Strange, first_tsc %llx < default_domain runstate tsc %llx!\n",
+                    p->first_tsc,
+                    p->current->runstate.tsc);
+            error(ERR_FILE, NULL);
+        }
+    
+        /* Change default domain to 'queued' */
+        runstate_update(p->current, RUNSTATE_QUEUED, p->first_tsc);
+
+        /* 
+         * Set current to NULL, so that if another vcpu (not in INIT)
+         * is scheduled here, we don't trip over the check in
+         * vcpu_next_update()
+         */
+        p->current = NULL;
     }
 
-    if(p->first_tsc <= p->current->runstate.tsc) {
-        fprintf(stderr, "Strange, first_tsc %llx < default_domain runstate tsc %llx!\n",
-                p->first_tsc,
-                p->current->runstate.tsc);
-        error(ERR_FILE, NULL);
+    /* TSC skew at start-of-day is hard to deal with.  Don't
+     * bring a vcpu out of INIT until it's seen to be actually
+     * running somewhere. */
+    if ( new_runstate != RUNSTATE_RUNNING ) {
+        fprintf(warn, "First schedule for d%dv%d doesn't take us into a running state; leaving INIT\n",
+                v->d->did, v->vid);
+
+        return;
     }
 
-    /* Change default domain to 'queued' */
-    runstate_update(p->current, RUNSTATE_QUEUED, p->first_tsc);
+    tsc = ri_tsc;
+    if ( old_runstate == RUNSTATE_RUNNING ) {
+        /* FIXME: Copy over data from the default domain this interval */
+        fprintf(warn, "Using first_tsc for d%dv%d (%lld cycles)\n",
+                v->d->did, v->vid, p->last_tsc - p->first_tsc);
 
-    /* FIXME: Copy over data from the default domain this interval */
-    fprintf(warn, "Using first_tsc for d%dv%d (%lld cycles)\n",
-            v->d->did, v->vid, p->last_tsc - p->first_tsc);
+        tsc = p->first_tsc;
+    }
 
     /* Simulate the time since the first tsc */
-    runstate_update(v, RUNSTATE_RUNNING, p->first_tsc);
-    p->time.tsc = p->first_tsc;
+    runstate_update(v, RUNSTATE_RUNNING, tsc);
+    p->time.tsc = tsc;
     p->current = v;
     pcpu_string_draw(p);
     v->p = p;
@@ -7021,6 +7068,13 @@ void sched_runstate_process(struct pcpu_info *p)
     last_oldstate = v->runstate.last_oldstate;
     v->runstate.last_oldstate.wrong = RUNSTATE_INIT;
 
+    /* Handle all "start-of-day" issues in one place.  This can be
+     * done before any of the other tracks or sanity checks. */
+    if ( v->runstate.state == RUNSTATE_INIT ) {
+        vcpu_start(p, v, sevt.old_runstate, sevt.new_runstate, ri->tsc);
+        return;
+    }
+
     /* Close vmexits when the putative reason for blocking / &c stops.
      * This way, we don't account cpu contention to some other overhead. */
     if(sevt.new_runstate == RUNSTATE_RUNNABLE
@@ -7190,32 +7244,27 @@ update:
      * or stopping actually running on a physical cpu. */
     if ( type == CONTINUE )
     {
-        if( v->runstate.state == RUNSTATE_INIT ) {
-            /* Start-of-day; account first tsc -> now to v */
-            vcpu_start(p, v);
-        } else {
-            /* Continue running.  First, do some sanity checks */
-            if ( v->runstate.state == RUNSTATE_LOST ) {
-                fprintf(warn, "WARNING: continue with d%dv%d in RUNSTATE_LOST.  Resetting current.\n",
-                        v->d->did, v->vid);
-                if ( p->current )
-                    vcpu_prev_update(p, p->current, ri->tsc, RUNSTATE_LOST);
-                vcpu_next_update(p, v, ri->tsc);
-            }
-            else if( v->runstate.state != RUNSTATE_RUNNING ) {
-                /* This should never happen. */
-                fprintf(warn, "FATAL: sevt.old_runstate running, but d%dv%d runstate %s!\n",
-                        v->d->did, v->vid, runstate_name[v->runstate.state]);
-                error(ERR_FILE, NULL);
-            } else if ( v->p != p ) {
-                fprintf(warn, "FATAL: continue on p%d, but d%dv%d p%d!\n",
-                        p->pid, v->d->did, v->vid,
-                        v->p ? v->p->pid : -1);
-                error(ERR_FILE, NULL);
-            }
-
-            runstate_update(v, RUNSTATE_RUNNING, ri->tsc);
+        /* Continue running.  First, do some sanity checks */
+        if ( v->runstate.state == RUNSTATE_LOST ) {
+            fprintf(warn, "WARNING: continue with d%dv%d in RUNSTATE_LOST.  Resetting current.\n",
+                    v->d->did, v->vid);
+            if ( p->current )
+                vcpu_prev_update(p, p->current, ri->tsc, RUNSTATE_LOST);
+            vcpu_next_update(p, v, ri->tsc);
+        }
+        else if( v->runstate.state != RUNSTATE_RUNNING ) {
+            /* This should never happen. */
+            fprintf(warn, "FATAL: sevt.old_runstate running, but d%dv%d runstate %s!\n",
+                    v->d->did, v->vid, runstate_name[v->runstate.state]);
+            error(ERR_FILE, NULL);
+        } else if ( v->p != p ) {
+            fprintf(warn, "FATAL: continue on p%d, but d%dv%d p%d!\n",
+                    p->pid, v->d->did, v->vid,
+                    v->p ? v->p->pid : -1);
+            error(ERR_FILE, NULL);
         }
+
+        runstate_update(v, RUNSTATE_RUNNING, ri->tsc);
     }
     else if ( sevt.old_runstate == RUNSTATE_RUNNING
               || v->runstate.state == RUNSTATE_RUNNING )
@@ -7232,10 +7281,7 @@ update:
          *   # (should never happen)
          */
         if( sevt.old_runstate == RUNSTATE_RUNNING ) {
-            if( v->runstate.state == RUNSTATE_INIT ) {
-                /* Start-of-day; account first tsc -> now to v */
-                vcpu_start(p, v);
-            } else if( v->runstate.state != RUNSTATE_RUNNING
+            if( v->runstate.state != RUNSTATE_RUNNING
                        && v->runstate.state != RUNSTATE_LOST ) {
                 /* This should never happen. */
                 fprintf(warn, "FATAL: sevt.old_runstate running, but d%dv%d runstate %s!\n",
@@ -7264,11 +7310,8 @@ update:
 
         vcpu_next_update(p, v, ri->tsc);
     }
-    else if ( v->runstate.state != RUNSTATE_INIT )
+    else
     {
-        /* TSC skew at start-of-day is hard to deal with.  Don't
-         * bring a vcpu out of INIT until it's seen to be actually
-         * running somewhere. */
         runstate_update(v, sevt.new_runstate, ri->tsc);
     }
 
-- 
2.25.1


