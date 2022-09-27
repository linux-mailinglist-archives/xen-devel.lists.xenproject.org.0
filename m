Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABA5EB84A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 05:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412199.655454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tP-0003d0-Lo; Tue, 27 Sep 2022 03:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412199.655454; Tue, 27 Sep 2022 03:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tP-0003Zn-Hf; Tue, 27 Sep 2022 03:04:19 +0000
Received: by outflank-mailman (input) for mailman id 412199;
 Tue, 27 Sep 2022 03:04:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZci=Z6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1od0tN-0002Wn-N3
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 03:04:17 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 126bfb2c-3e11-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 05:04:16 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 16DCB5C0194;
 Mon, 26 Sep 2022 23:04:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 23:04:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 23:04:15 -0400 (EDT)
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
X-Inumbo-ID: 126bfb2c-3e11-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664247856; x=1664334256; bh=bVEPwgLcbq+BZ1Wl7+Gkkocayb9AhcjX3Ls
	ejAExFkI=; b=l6pbj9Ojnwg8wA/IiuSwALGS1l2xZ96b9R4dZqI0hqOuZ/5OY0g
	kTlBJQYsnb+cxSvycEQ17gAu1FgbAdYqUamg6htQEGYbsAh8AR8rTNoKdRzMBRNv
	+0QUGyjcFZiqxOUlZWWHHbuSCbD93kPoDegn48lISK9pB16bFhiLaB3S3UlCF8Yu
	0HPsB+PDaAsfzkG0Jzlpsqv/VqNWdw1mFleGfIV8iXesOh/SiRipJ4qmV29DO0Pa
	QqR4Fw459OOPbRKWyGAPHm+K91VB9Tz+ez73AhHS+6q3CL8v7y0qVIZoTst91RcF
	z+sGiQzMo8wJpz9QvWIiimER20QdGq7Z5Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664247856; x=1664334256; bh=bVEPwgLcbq+BZ
	1Wl7+Gkkocayb9AhcjX3LsejAExFkI=; b=ZmdooMZN0BCcdS/rDTwwrNLYEIBCV
	0lTv4hGq2wWwci8x0r2+eVV7S/+Um2jMRxBJDwaseF+KWXqz5hod6u2wpnrBoZ/W
	DDlczt0ztAp7Q8iRdfZhH+T4meVjgOihkZrPC2CmAbPLfnrcLX5FXyjx+a5yYFUq
	eivnM2evkO1wAdSzAS8RaINXWYlXfs694urDS1MVdDdhV1NHBeIqouALQUqd2GTT
	tEBrFIxstOS23ilk/TAMNmXYzETbPyQwVfLFPBeidoXtGX4ux+FtCEKWjc2DECRm
	7cVq3PwOAlUCnQZECEeuYbAyOBUuZXN9URGIcYELXY9QVkRVLpPdOS9fw==
X-ME-Sender: <xms:L2gyY035uL2LSv6vJ2ZUaB8BLhUhK0GKuC-EbPEFl2q0UXUhJu5mgg>
    <xme:L2gyY_Fvr9gR2tQmpcA9iYuSP2pnr9HqdyMIsjdBpCFZCXSv657_GS4n3oZbcRw_F
    Jllmyym1X_aLLI>
X-ME-Received: <xmr:L2gyY86H0QgIsajriz9bEJfAfSUf0lYteXB5QZNXeGCklz-0d-IewLhhDLiOfgkjH4gD1eQ0ecTP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:L2gyY91SBRw0HYX_-9_oC3smw1zH8jwQ3e8mfZuwxwJNBSB8qj0h3g>
    <xmx:L2gyY3Gatvww961mtULWvFbTdOO35ZfaaZS_XkI0-omCp07Y7VYCHQ>
    <xmx:L2gyY2_kk4ecBViZCMUBSjf3pc7P2vUK347vTG5nup9m2H7yi6CCsA>
    <xmx:MGgyY8QkljstV4IXTb-85TU_9iuz_QDtm0m4zpkTHv0nZeTd8OYnpg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/5] libxl: Fix race condition in domain suspension
Date: Mon, 26 Sep 2022 23:04:00 -0400
Message-Id: <f2c2a7728ea18bdcdc91d5ccbec1a9d93a49c33e.1664236600.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664236600.git.demi@invisiblethingslab.com>
References: <cover.1664236600.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if the domain has suspended after setting the XenStore watch to
prevent race conditions.  Also check if a guest has suspended when the
timeout handler is called, and do not consider this to be a timeout.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 tools/libs/light/libxl_dom_suspend.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index d276b3c17e70105c19c82e9da570a24297d039f5..42c0e0a152e04fab34152d711564ffe148f24a4c 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -209,7 +209,8 @@ static void domain_suspend_common_wait_guest_evtchn(libxl__egc *egc,
         libxl__ev_evtchn *evev);
 static void suspend_common_wait_guest_watch(libxl__egc *egc,
       libxl__ev_xswatch *xsw, const char *watch_path, const char *event_path);
-static void suspend_common_wait_guest_check(libxl__egc *egc,
+/* Returns true if a callback was called, false otherwise */
+static bool suspend_common_wait_guest_check(libxl__egc *egc,
         libxl__domain_suspend_state *dsps);
 static void suspend_common_wait_guest_timeout(libxl__egc *egc,
       libxl__ev_time *ev, const struct timeval *requested_abs, int rc);
@@ -426,7 +427,7 @@ static int check_guest_status(libxl__gc *gc, const uint32_t domid,
     return 0;
 }
 
-static void suspend_common_wait_guest_check(libxl__egc *egc,
+static bool suspend_common_wait_guest_check(libxl__egc *egc,
         libxl__domain_suspend_state *dsps)
 {
     STATE_AO_GC(dsps->ao);
@@ -441,7 +442,7 @@ static void suspend_common_wait_guest_check(libxl__egc *egc,
 
     if (!(info.flags & XEN_DOMINF_shutdown))
         /* keep waiting */
-        return;
+        return false;
 
     shutdown_reason = (info.flags >> XEN_DOMINF_shutdownshift)
         & XEN_DOMINF_shutdownmask;
@@ -452,11 +453,15 @@ static void suspend_common_wait_guest_check(libxl__egc *egc,
     }
 
     LOGD(DEBUG, domid, "guest has suspended");
+    dsps->guest_responded = 1;
+    libxl__xswait_stop(gc, &dsps->pvcontrol);
     domain_suspend_common_guest_suspended(egc, dsps);
-    return;
+    return true;
 
  err:
+    libxl__xswait_stop(gc, &dsps->pvcontrol);
     domain_suspend_common_done(egc, dsps, ERROR_FAIL);
+    return true;
 }
 
 static void suspend_common_wait_guest_timeout(libxl__egc *egc,
@@ -464,6 +469,8 @@ static void suspend_common_wait_guest_timeout(libxl__egc *egc,
 {
     libxl__domain_suspend_state *dsps = CONTAINER_OF(ev, *dsps, guest_timeout);
     STATE_AO_GC(dsps->ao);
+    if (suspend_common_wait_guest_check(egc, dsps))
+        return;
     if (rc == ERROR_TIMEDOUT) {
         LOGD(ERROR, dsps->domid, "guest did not suspend, timed out");
         rc = ERROR_GUEST_TIMEDOUT;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

