Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA065EB84B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 05:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412198.655442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tO-0003KV-1K; Tue, 27 Sep 2022 03:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412198.655442; Tue, 27 Sep 2022 03:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tN-0003IA-T4; Tue, 27 Sep 2022 03:04:17 +0000
Received: by outflank-mailman (input) for mailman id 412198;
 Tue, 27 Sep 2022 03:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZci=Z6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1od0tM-0002Wn-AB
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 03:04:16 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11511f31-3e11-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 05:04:15 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A0A25C0197;
 Mon, 26 Sep 2022 23:04:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 26 Sep 2022 23:04:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 23:04:13 -0400 (EDT)
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
X-Inumbo-ID: 11511f31-3e11-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664247854; x=1664334254; bh=rfEB4qq1us
	gnZZFHzDZCUIOiVtuMjqLlDvfmQ2Nupnk=; b=b4L0AAU5yoKuVvM9hbud7Jan6f
	QZzf5HHlM1Y7GOBhUDjEJsKcFBbOywnOHsZHqg7T0x7wDU+r19dK2ozH8Mr3pdpD
	i46TaXr0b+0RDvvpOMreancL/h8dbybFPb2haz68zwPWZAq6j1Dwe/krRYrdRfc5
	Sfky5udi49camu4MEsGHoiV9jaeioyzQlzbUd4D4fMXdILdcKFVZ9xlshiKHqqrB
	kYb1K3HB4VcTlUbgToP/8F7CE7IqCUVfDwHFOUbwh8hZcadxYN0EWJ7LDXSCXD8j
	yta/7aqX86/jeOR9mVlxBaRcOQXyhmOnYbQJP0RsFB2+MPSrMcucOgMxwdcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664247854; x=
	1664334254; bh=rfEB4qq1usgnZZFHzDZCUIOiVtuMjqLlDvfmQ2Nupnk=; b=N
	RN+tstDGAIb10rEkDvX99cdTa3dE9c9cM2HNuxqXu/puRrCGRwYkZjakYa0Ybo7F
	6SxuqvJqUibtSEzDdf4nHi+/ygV/NHaHy+RLC0bxo9W6Ctesr01pMyLbeVuTwKPu
	6GCdydSqJLpTBXtuBCFlQJiLJAlZTTwQKzYo8qzQesj/WxnExHVDuCkDkUhNXqwR
	+hxKRy62+fKgefX2+PxyVKOFW2atLVrR/CMbrEYvZssg+o7oe/jULwdJV5EkXmmy
	scu9s33QoO9KWFKlvsQlWdcxic6Xzqxbjcd/HtuhiAtGJoV8CGzPTNGno4UHDMpn
	NSIZ7VDMbEwMgWCt212ZQ==
X-ME-Sender: <xms:LmgyY4wzC3AHTpdb16CzLJB4Hzjj-EIE4_M8EMjuOpCRTBIARJxI6g>
    <xme:LmgyY8TWGvpBnXDqC4AJVlvKc3fvzuvtwBed7jXtsK3LUeSBlLmeQMJttL3c0eqBO
    xDbC_AXa-G2Bzk>
X-ME-Received: <xmr:LmgyY6XhcYbQtSKqSDiwCBU9l-UhRkxLFvtOo-fkul1VyOhoCjWQlFHnss3cxHAKhGhcKcWeH01d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvuefggfekffduhedtffeuffff
    tddtfeeihffggfejtddutdfguefftedvudehgfenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:LmgyY2i9Nu48hyABvOfAoGQ-jFzLhxV7Qx2wN7i7U5WWDHf9dTo-uw>
    <xmx:LmgyY6DZnaOQ1bmTRIAGqbBDvnjIsvgGepkS3r14iUH1XyQdWc99CQ>
    <xmx:LmgyY3IFIlz36rCvE1TgJEyEY_4xv4xmMvJ5kTC1ilGmwMEIrrLbUw>
    <xmx:LmgyY1Pn5n4TXJ_V_yRMUkrtMgIGaUhM-ca5o0TGhqFMxMaMUxigGw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/5] libxl: Properly suspend stubdomains
Date: Mon, 26 Sep 2022 23:03:59 -0400
Message-Id: <558648f541d1ae827493fe13ff12ba363bad2392.1664236600.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664236600.git.demi@invisiblethingslab.com>
References: <cover.1664236600.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, libxl neither pauses nor suspends a stubdomain when
suspending the domain it serves.  Qubes OS has an out-of-tree patch that
just pauses the stubdomain, but that is also insufficient: sys-net (an
HVM with an attached PCI device) does not properly resume from suspend
on some systems, and the stubdomain considers the TSC clocksource to be
unstable after resume.

This patch properly suspends the stubdomain.  Doing so requires creating
a nested libxl__domain_suspend_state structure and freeing it when
necessary.  Additionally, a new callback function is added that runs
when the stubdomain has been suspended.  libxl__qmp_suspend_save() is
called by this new callback.

Saving the state doesn't work on Qubes for two reasons:
 - save/restore consoles are not enabled (as requiring qemu in dom0)
 - avoid using QMP

Link: https://github.com/QubesOS/qubes-issues/issues/7404
Co-authored-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 tools/libs/light/libxl_dom_suspend.c | 171 ++++++++++++++++++++++++++++----
 tools/libs/light/libxl_internal.h    |   1 +
 2 files changed, 150 insertions(+), 22 deletions(-)

diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index d2a88ea34efb115a8f2b861daf5884d95f39e81d..d276b3c17e70105c19c82e9da570a24297d039f5 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -19,9 +19,9 @@
 
 /*====================== Domain suspend =======================*/
 
-int libxl__domain_suspend_init(libxl__egc *egc,
-                               libxl__domain_suspend_state *dsps,
-                               libxl_domain_type type)
+static int libxl__domain_suspend_init_inner(libxl__egc *egc,
+                                            libxl__domain_suspend_state *dsps,
+                                            libxl_domain_type type)
 {
     STATE_AO_GC(dsps->ao);
     int rc = ERROR_FAIL;
@@ -35,6 +35,7 @@ int libxl__domain_suspend_init(libxl__egc *egc,
     libxl__ev_xswatch_init(&dsps->guest_watch);
     libxl__ev_time_init(&dsps->guest_timeout);
     libxl__ev_qmp_init(&dsps->qmp);
+    dsps->dm_dsps = dsps->parent_dsps = NULL;
 
     if (type == LIBXL_DOMAIN_TYPE_INVALID) goto out;
     dsps->type = type;
@@ -67,18 +68,95 @@ out:
     return rc;
 }
 
+static void domain_suspend_device_model_domain_callback(libxl__egc *egc,
+                                       libxl__domain_suspend_state *dsps,
+                                       int rc);
+
+int libxl__domain_suspend_init(libxl__egc *egc,
+                               libxl__domain_suspend_state *dsps,
+                               libxl_domain_type type)
+{
+    STATE_AO_GC(dsps->ao);
+    uint32_t const domid = dsps->domid;
+    int rc = libxl__domain_suspend_init_inner(egc, dsps, type);
+
+    LOGD(DEBUG, domid, "Initialized suspend state");
+    if (type != LIBXL_DOMAIN_TYPE_HVM ||
+        !libxl__stubdomain_is_linux_running(gc, domid))
+        return rc;
+
+    LOGD(DEBUG, domid, "Need to suspend stubdomain too");
+    /* need to suspend the stubdomain too */
+    uint32_t const dm_domid = libxl_get_stubdom_id(CTX, domid);
+    if (rc == 0 && dm_domid != 0) {
+        libxl__domain_suspend_state *dm_dsps;
+
+        GCNEW(dm_dsps);
+        dm_dsps->domid = dm_domid;
+        dm_dsps->ao = dsps->ao;
+
+        dm_dsps->type = libxl__domain_type(gc, dm_domid);
+        if (dm_dsps->type == LIBXL_DOMAIN_TYPE_PV ||
+            dm_dsps->type == LIBXL_DOMAIN_TYPE_PVH) {
+            rc = libxl__domain_suspend_init_inner(egc, dm_dsps, dm_dsps->type);
+        } else {
+            LOGD(ERROR, domid, "Stubdomain %" PRIu32 " detected as neither PV "
+                               "nor PVH (got %d), cannot suspend", dm_domid, dm_dsps->type);
+            rc = ERROR_FAIL;
+        }
+        if (rc)
+            libxl__domain_suspend_dispose(gc, dsps);
+        else {
+            dm_dsps->callback_common_done = domain_suspend_device_model_domain_callback;
+            dsps->dm_dsps = dm_dsps;
+            dm_dsps->parent_dsps = dsps;
+        }
+    }
+    return rc;
+}
+
 void libxl__domain_suspend_dispose(libxl__gc *gc,
                                    libxl__domain_suspend_state  *dsps)
 {
-    libxl__xswait_stop(gc, &dsps->pvcontrol);
-    libxl__ev_evtchn_cancel(gc, &dsps->guest_evtchn);
-    libxl__ev_xswatch_deregister(gc, &dsps->guest_watch);
-    libxl__ev_time_deregister(gc, &dsps->guest_timeout);
-    libxl__ev_qmp_dispose(gc, &dsps->qmp);
+    for (;;) {
+        libxl__xswait_stop(gc, &dsps->pvcontrol);
+        libxl__ev_evtchn_cancel(gc, &dsps->guest_evtchn);
+        libxl__ev_xswatch_deregister(gc, &dsps->guest_watch);
+        libxl__ev_time_deregister(gc, &dsps->guest_timeout);
+        libxl__ev_qmp_dispose(gc, &dsps->qmp);
+        if (dsps->dm_dsps == NULL)
+            break;
+        assert(dsps->parent_dsps == NULL);
+        assert(dsps->dm_dsps->parent_dsps == dsps);
+        dsps = dsps->dm_dsps;
+        assert(dsps->dm_dsps == NULL);
+    }
 }
 
 /*----- callbacks, called by xc_domain_save -----*/
 
+static void domain_suspend_device_model_domain_callback(libxl__egc *egc,
+                                       libxl__domain_suspend_state *dm_dsps,
+                                       int rc)
+{
+    STATE_AO_GC(dm_dsps->ao);
+    libxl__domain_suspend_state *dsps = dm_dsps->parent_dsps;
+    assert(dm_dsps->dm_dsps == NULL);
+    assert(dsps);
+    assert(dsps->dm_dsps == dm_dsps);
+    if (rc) {
+        LOGD(ERROR, dsps->domid,
+             "failed to suspend device model (stubdom id %d), rc=%d", dm_dsps->domid, rc);
+    } else {
+        LOGD(DEBUG, dsps->domid,
+             "Successfully suspended stubdomain (stubdom id %d)", dm_dsps->domid);
+    }
+    dsps->callback_device_model_done(egc, dsps, rc); /* must be last */
+}
+
+static void domain_suspend_callback_common(libxl__egc *egc,
+                                           libxl__domain_suspend_state *dsps);
+
 void libxl__domain_suspend_device_model(libxl__egc *egc,
                                        libxl__domain_suspend_state *dsps)
 {
@@ -86,6 +164,7 @@ void libxl__domain_suspend_device_model(libxl__egc *egc,
     int rc = 0;
     uint32_t const domid = dsps->domid;
     const char *const filename = dsps->dm_savefile;
+    libxl__domain_suspend_state *dm_dsps = dsps->dm_dsps;
 
     switch (libxl__device_model_version_running(gc, domid)) {
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
@@ -95,15 +174,24 @@ void libxl__domain_suspend_device_model(libxl__egc *egc,
         break;
     }
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-        /* calls dsps->callback_device_model_done when done */
-        libxl__qmp_suspend_save(egc, dsps); /* must be last */
+        if (dm_dsps) {
+            assert(dm_dsps->type == LIBXL_DOMAIN_TYPE_PVH ||
+                   dm_dsps->type == LIBXL_DOMAIN_TYPE_PV);
+            LOGD(DEBUG, domid, "Suspending stubdomain (domid %" PRIu32 ")",
+                 dm_dsps->domid);
+            /* calls dm_dsps->callback_common_done when done */
+            domain_suspend_callback_common(egc, dm_dsps); /* must be last */
+        } else {
+            LOGD(DEBUG, domid, "Stubdomain not in use");
+            /* calls dsps->callback_device_model_done when done */
+            libxl__qmp_suspend_save(egc, dsps); /* must be last */
+        }
         return;
     default:
         rc = ERROR_INVAL;
-        goto out;
+        break;
     }
 
-out:
     if (rc)
         LOGD(ERROR, dsps->domid,
              "failed to suspend device model, rc=%d", rc);
@@ -130,8 +218,6 @@ static void domain_suspend_common_done(libxl__egc *egc,
                                        libxl__domain_suspend_state *dsps,
                                        int rc);
 
-static void domain_suspend_callback_common(libxl__egc *egc,
-                                           libxl__domain_suspend_state *dsps);
 static void domain_suspend_callback_common_done(libxl__egc *egc,
                                 libxl__domain_suspend_state *dsps, int rc);
 
@@ -308,6 +394,7 @@ static void domain_suspend_common_wait_guest(libxl__egc *egc,
                                      suspend_common_wait_guest_timeout,
                                      60*1000);
     if (rc) goto err;
+
     return;
 
  err:
@@ -528,6 +615,7 @@ void libxl__dm_resume(libxl__egc *egc,
 {
     STATE_AO_GC(dmrs->ao);
     int rc = 0;
+    uint32_t dm_domid = libxl_get_stubdom_id(CTX, dmrs->domid);
 
     /* Convenience aliases */
     libxl_domid domid = dmrs->domid;
@@ -543,7 +631,6 @@ void libxl__dm_resume(libxl__egc *egc,
 
     switch (libxl__device_model_version_running(gc, domid)) {
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
-        uint32_t dm_domid = libxl_get_stubdom_id(CTX, domid);
         const char *path, *state;
 
         path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
@@ -563,14 +650,54 @@ void libxl__dm_resume(libxl__egc *egc,
         if (rc) goto out;
         break;
     }
-    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-        qmp->ao = dmrs->ao;
-        qmp->domid = domid;
-        qmp->callback = dm_resume_qmp_done;
-        qmp->payload_fd = -1;
-        rc = libxl__ev_qmp_send(egc, qmp, "cont", NULL);
+    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN: {
+        xc_domaininfo_t dm_info;
+
+        if (dm_domid == 0 /* || !libxl__stubdomain_is_linux_running() */) {
+            LOGD(DEBUG, domid, "Resuming dom0 device model using QMP");
+            qmp->ao = dmrs->ao;
+            qmp->domid = domid;
+            qmp->callback = dm_resume_qmp_done;
+            qmp->payload_fd = -1;
+            rc = libxl__ev_qmp_send(egc, qmp, "cont", NULL);
+            if (rc) goto out;
+            return;
+        }
+
+        LOGD(DEBUG, domid, "Resuming modern stubdomain: ID %" PRIu32, dm_domid);
+
+        rc = check_guest_status(gc, dm_domid, &dm_info, "resuming");
         if (rc) goto out;
-        break;
+
+        if ((dm_info.flags & XEN_DOMINF_paused)) {
+            rc = xc_domain_unpause(CTX->xch, dm_domid);
+            if (rc < 0) {
+                LOGED(ERROR, domid,
+                      "xc_domain_unpause failed for stubdomain %" PRIu32,
+                      dm_domid);
+                goto out;
+            }
+            LOGD(DEBUG, domid,
+                 "xc_domain_unpause succeeded for stubdomain %" PRIu32,
+                 dm_domid);
+        }
+
+        if ((dm_info.flags & XEN_DOMINF_shutdown)) {
+            int shutdown_reason =
+                (dm_info.flags >> XEN_DOMINF_shutdownshift)
+                & XEN_DOMINF_shutdownmask;
+            if (shutdown_reason != SHUTDOWN_suspend) {
+                LOGD(ERROR, domid, "stubdomain %d being resumed shut down"
+                     " with unexpected reason code %d",
+                     dm_domid, shutdown_reason);
+                rc = ERROR_FAIL;
+                goto out;
+            }
+
+            rc = domain_resume_raw(gc, dm_domid, dmrs->suspend_cancel);
+        }
+        goto out;
+    }
     default:
         rc = ERROR_INVAL;
         goto out;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 34063baf81c4eae81790e2f25cc37f5cf58eb196..37e5c98f63472e66100b6301d78ac0178cbf987e 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3615,6 +3615,7 @@ struct libxl__domain_suspend_state {
                               struct libxl__domain_suspend_state*, int rc);
     void (*callback_common_done)(libxl__egc*,
                                  struct libxl__domain_suspend_state*, int ok);
+    struct libxl__domain_suspend_state *dm_dsps, *parent_dsps;
 };
 int libxl__domain_suspend_init(libxl__egc *egc,
                                libxl__domain_suspend_state *dsps,
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

