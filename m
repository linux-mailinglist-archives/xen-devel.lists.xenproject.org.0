Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DBA2DFF7A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57507.100671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjQ-0000f9-6O; Mon, 21 Dec 2020 18:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57507.100671; Mon, 21 Dec 2020 18:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjQ-0000e8-06; Mon, 21 Dec 2020 18:16:28 +0000
Received: by outflank-mailman (input) for mailman id 57507;
 Mon, 21 Dec 2020 18:16:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krPjO-0000Yt-1i
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:16:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c26f9d72-d98a-4135-ab13-a02dfca0b828;
 Mon, 21 Dec 2020 18:16:21 +0000 (UTC)
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
X-Inumbo-ID: c26f9d72-d98a-4135-ab13-a02dfca0b828
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608574581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=urlwgaA7ewlnkuu+TIgJoIZwJdSpHPYy7Pdzt1cR0Pw=;
  b=Ccjv2poHVOxQ2PteI7sEqDOvSXmNdrE1fFGGKY57SBV7qZ2nonQkIpS4
   fgH1lo5gcNjB2ycw5QSocjnoMvH+J41sTDoRGBQdMyRFSxU2UugRMlZzh
   BuLoN5vFxaBN0YEL0MgLXh9ilBtngV8+Jli783VUYSfSMHk4QzfZ8NBi9
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YM3is+7Zqq7V8NlCoaB8HckE19fpwhw6g/oSB9Nlw3U5Tvw3lNLeurhFXLG0q6HzmPtP1Vt6yd
 GDEVl5p1jIateQHhbHTGmRHS6KXmrnebYHDe1wWPcpOLvqZ8F4H+nVbgfF5Z5W10JiOsbtj5Qh
 m3HII8KswCQOiK4j0+m0fmUL319hk5NJ9MhnZAh9xPm5WMJ1GTaOetOZogH/kL5tUZdI6cdMeI
 wnErJIkn4lxsqG/04yvguXKumnXAV586kWuEVf2s/kkwFfOmjBvmgPMUws9E+L8WS2IoBuJXRr
 R/g=
X-SBRS: 5.2
X-MesageID: 33707596
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,437,1599537600"; 
   d="scan'208";a="33707596"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/domain: Introduce domain_teardown()
Date: Mon, 21 Dec 2020 18:14:45 +0000
Message-ID: <20201221181446.7791-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201221181446.7791-1-andrew.cooper3@citrix.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no common equivelent of domain_reliquish_resources(), which has
caused various pieces of common cleanup to live in inappropriate
places.

Perhaps most obviously, evtchn_destroy() is called for every continuation of
domain_reliquish_resources(), which can easily be thousands of times.

Create domain_teardown() to be a new top level facility, and call it from the
appropriate positions in domain_kill() and domain_create()'s error path.

No change in behaviour yet.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/common/domain.c     | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  8 +++++++
 2 files changed, 67 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index ce3667f1b4..ef1987335b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -273,6 +273,59 @@ static int __init parse_extra_guest_irqs(const char *s)
 custom_param("extra_guest_irqs", parse_extra_guest_irqs);
 
 /*
+ * Release resources held by a domain.  There may or may not be live
+ * references to the domain, and it may or may not be fully constructed.
+ *
+ * d->is_dying differing between DOMDYING_dying and DOMDYING_dead can be used
+ * to determine if live references to the domain exist, and also whether
+ * continuations are permitted.
+ *
+ * If d->is_dying is DOMDYING_dead, this must not return non-zero.
+ */
+static int domain_teardown(struct domain *d)
+{
+    BUG_ON(!d->is_dying);
+
+    /*
+     * This hypercall can take minutes of wallclock time to complete.  This
+     * logic implements a co-routine, stashing state in struct domain across
+     * hypercall continuation boundaries.
+     */
+    switch ( d->teardown.val )
+    {
+        /*
+         * Record the current progress.  Subsequent hypercall continuations
+         * will logically restart work from this point.
+         *
+         * PROGRESS() markers must not be in the middle of loops.  The loop
+         * variable isn't preserved across a continuation.
+         *
+         * To avoid redundant work, there should be a marker before each
+         * function which may return -ERESTART.
+         */
+#define PROGRESS(x)                             \
+        d->teardown.val = PROG_ ## x;           \
+        /* Fallthrough */                       \
+    case PROG_ ## x
+
+        enum {
+            PROG_done = 1,
+        };
+
+    case 0:
+    PROGRESS(done):
+        break;
+
+#undef PROGRESS
+
+    default:
+        BUG();
+    }
+
+    return 0;
+}
+
+/*
  * Destroy a domain once all references to it have been dropped.  Used either
  * from the RCU path, or from the domain_create() error path before the domain
  * is inserted into the domlist.
@@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
     if ( init_status & INIT_watchdog )
         watchdog_domain_destroy(d);
 
+    /* Must not hit a continuation in this context. */
+    ASSERT(domain_teardown(d) == 0);
+
     _domain_destroy(d);
 
     return ERR_PTR(err);
@@ -733,6 +789,9 @@ int domain_kill(struct domain *d)
         domain_set_outstanding_pages(d, 0);
         /* fallthrough */
     case DOMDYING_dying:
+        rc = domain_teardown(d);
+        if ( rc )
+            break;
         rc = evtchn_destroy(d);
         if ( rc )
             break;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index faf5fda36f..3f35c537b8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -525,6 +525,14 @@ struct domain
     /* Argo interdomain communication support */
     struct argo_domain *argo;
 #endif
+
+    /*
+     * Continuation information for domain_teardown().  All fields entirely
+     * private.
+     */
+    struct {
+        unsigned int val;
+    } teardown;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.11.0


