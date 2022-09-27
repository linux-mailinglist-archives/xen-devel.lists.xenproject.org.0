Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671825EB846
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 05:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412200.655464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tR-0003ub-01; Tue, 27 Sep 2022 03:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412200.655464; Tue, 27 Sep 2022 03:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tQ-0003r4-Rg; Tue, 27 Sep 2022 03:04:20 +0000
Received: by outflank-mailman (input) for mailman id 412200;
 Tue, 27 Sep 2022 03:04:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZci=Z6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1od0tP-0002Wn-62
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 03:04:19 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 133b6b87-3e11-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 05:04:18 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AB235C018F;
 Mon, 26 Sep 2022 23:04:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 23:04:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 23:04:16 -0400 (EDT)
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
X-Inumbo-ID: 133b6b87-3e11-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664247857; x=1664334257; bh=e866Y8JCmjNsNcx13FdeVQqHWG+JkkDT0Yl
	HuT4uoZM=; b=LDOyqebkTTqgORPbNfdQxFqwHefTI26vgpX2JbSvVp6oxxZcXH7
	FA1Uq4cdVMW7py8Cygm7b7hP9Jscj5KJeV8ZJ+2MzdhLsGcoTkvzcQwv7FFw3e0L
	CM3ZFAaPjQpRGi985FU8Rv9fkR9DMIIA+UeF7APBCH3Thb3Keu/DSSWV3QbLclM5
	xl05QOFkITWf+d62nsBv0RzHvof8HPw08iOef8T0qW+gYMsQpnfusySVPm7uZVIN
	qkkUF+3JF/tLfNBbW+1ndubolrsS3IyWAenERZjMWWAS8YyKCfJTKplsh7mh3Gyd
	f69+wxpatDOBU7NkAQJusPBZXREhY6XtnOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664247857; x=1664334257; bh=e866Y8JCmjNsN
	cx13FdeVQqHWG+JkkDT0YlHuT4uoZM=; b=XU7Mdz1v/AlV79K/VMFk+HzFX3eDl
	NK+/Ps0miTvN2XhIrBk9EitGPHkoOruLNPCNFS4hz7eJBi/04FSgjFJvDM9SeDVg
	cxKnMsXN9FkVqdDR4JJRLKLt9Gb+EZutrdoiGCDyyOHpaSdOepudB7/knba2D2DC
	ddoNvHY0eAYe1o3bXBYohFqFnbtOSdBpyaNjpLJHWILvResv4azSDNfSHDdul4U5
	SW1Vs2thjpDJARivepKf2jAAsmMeXlc8pWn9KTHPrpb33Onq1tvJGED76a2Tt7U8
	T85YOmESSd7CuHv53gNvfEdUiTCXRIWwm0OOv2jSF1lpE5qPtv/tIW0ZA==
X-ME-Sender: <xms:MWgyYxIgiQON211bn5m_anNCtysYuKeE8dmjH1THXwHjaYxAPfBO_w>
    <xme:MWgyY9LvwCjYcvKqQ-IJhJYsf3Hz6gg7jydFWWhYXehV7AvJ_mYt-AGTvuTpGWPZJ
    R3PE5sXtNbOcq0>
X-ME-Received: <xmr:MWgyY5sgldqcFn889qvA9BZpEv-kJ3MJNRF-0nyeXGO3JBy0ttLhnsxi2mfTv2eiqaPLK_hxaevC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:MWgyYyaQkco9BvwL2PI5znmqX_aL9L44BAAJRRn6ZiiSOhKUuAOOXw>
    <xmx:MWgyY4ZIyBqDCd13HQlepixQI4D9vV4m3_P3M8xHM1jB3xPEykZoww>
    <xmx:MWgyY2Dh3eiqR4ozXwvEkqTAXiAR7X9rvZD-x8MXbdPATdsL7Ups1w>
    <xmx:MWgyY3mgBUtl54ELCxsZsJjI5ktLN7qdDENWoclfWa-2wKzYGvoB0Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 5/5] libxl: Add additional domain suspend/resume logs
Date: Mon, 26 Sep 2022 23:04:01 -0400
Message-Id: <39c0faac0978315e0c79b9a25bb83dc0f951fed9.1664236600.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664236600.git.demi@invisiblethingslab.com>
References: <cover.1664236600.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was useful when debugging, but is not required.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 tools/libs/light/libxl_dom_suspend.c | 20 ++++++++++++++++++--
 tools/libs/light/libxl_domain.c      |  1 +
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index 42c0e0a152e04fab34152d711564ffe148f24a4c..55a172a46f8703661e696971bee07dce93117411 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -321,9 +321,11 @@ static void domain_suspend_common_pvcontrol_suspending(libxl__egc *egc,
     STATE_AO_GC(dsps->ao);
     xs_transaction_t t = 0;
 
-    if (!rc && !domain_suspend_pvcontrol_acked(state))
+    if (!rc && !domain_suspend_pvcontrol_acked(state)) {
         /* keep waiting */
+        LOGD(DEBUG, dsps->domid, "PV control callback without ack");
         return;
+    }
 
     libxl__xswait_stop(gc, &dsps->pvcontrol);
 
@@ -405,7 +407,10 @@ static void domain_suspend_common_wait_guest(libxl__egc *egc,
 static void suspend_common_wait_guest_watch(libxl__egc *egc,
       libxl__ev_xswatch *xsw, const char *watch_path, const char *event_path)
 {
+    EGC_GC;
     libxl__domain_suspend_state *dsps = CONTAINER_OF(xsw, *dsps, guest_watch);
+
+    LOGD(DEBUG, dsps->domid, "@releaseDomain watch fired, checking guest status");
     suspend_common_wait_guest_check(egc, dsps);
 }
 
@@ -440,9 +445,11 @@ static bool suspend_common_wait_guest_check(libxl__egc *egc,
     if (check_guest_status(gc, domid, &info, "suspending"))
         goto err;
 
-    if (!(info.flags & XEN_DOMINF_shutdown))
+    if (!(info.flags & XEN_DOMINF_shutdown)) {
+        LOGD(DEBUG, domid, "guest we were suspending has not shut down yet");
         /* keep waiting */
         return false;
+    }
 
     shutdown_reason = (info.flags >> XEN_DOMINF_shutdownshift)
         & XEN_DOMINF_shutdownmask;
@@ -469,11 +476,14 @@ static void suspend_common_wait_guest_timeout(libxl__egc *egc,
 {
     libxl__domain_suspend_state *dsps = CONTAINER_OF(ev, *dsps, guest_timeout);
     STATE_AO_GC(dsps->ao);
+    LOGD(DEBUG, dsps->domid, "Timeout callback triggered");
     if (suspend_common_wait_guest_check(egc, dsps))
         return;
     if (rc == ERROR_TIMEDOUT) {
         LOGD(ERROR, dsps->domid, "guest did not suspend, timed out");
         rc = ERROR_GUEST_TIMEDOUT;
+    } else {
+        LOGD(ERROR, dsps->domid, "error in timeout handler (code %d)", rc);
     }
     domain_suspend_common_done(egc, dsps, rc);
 }
@@ -628,6 +638,8 @@ void libxl__dm_resume(libxl__egc *egc,
     libxl_domid domid = dmrs->domid;
     libxl__ev_qmp *qmp = &dmrs->qmp;
 
+    LOGD(DEBUG, domid, "Resuming device model");
+
     dm_resume_init(dmrs);
 
     rc = libxl__ev_time_register_rel(dmrs->ao,
@@ -640,6 +652,7 @@ void libxl__dm_resume(libxl__egc *egc,
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
         const char *path, *state;
 
+        LOGD(DEBUG, domid, "Resuming legacy device model: stubdomain ID %" PRIu32, dm_domid);
         path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
         rc = libxl__xs_read_checked(gc, XBT_NULL, path, &state);
         if (rc) goto out;
@@ -706,6 +719,7 @@ void libxl__dm_resume(libxl__egc *egc,
         goto out;
     }
     default:
+        LOGD(ERROR, domid, "Invalid device model type, cannot resume");
         rc = ERROR_INVAL;
         goto out;
     }
@@ -782,6 +796,8 @@ void libxl__domain_resume(libxl__egc *egc,
     int rc = 0;
     libxl_domain_type type = libxl__domain_type(gc, dmrs->domid);
 
+    LOGD(DEBUG, dmrs->domid, "Resuming domain");
+
     if (type == LIBXL_DOMAIN_TYPE_INVALID) {
         rc = ERROR_FAIL;
         goto out;
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index a6b0b509cc04379e9d596a38644e3db5963011ea..e8e0894c8617a36f6fc13af73daa1ed290a466ce 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -566,6 +566,7 @@ int libxl_domain_suspend_only(libxl_ctx *ctx, uint32_t domid,
     dsps->ao = ao;
     dsps->domid = domid;
     dsps->type = type;
+    LOGD(DEBUG, domid, "Received request to suspend domain");
     rc = libxl__domain_suspend_init(egc, dsps, type);
     if (rc < 0) goto out_err;
     dsps->callback_common_done = domain_suspend_empty_cb;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

