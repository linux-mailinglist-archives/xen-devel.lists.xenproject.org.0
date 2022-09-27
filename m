Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E65EB849
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 05:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412197.655432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tM-00034M-Np; Tue, 27 Sep 2022 03:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412197.655432; Tue, 27 Sep 2022 03:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tM-00031v-Kc; Tue, 27 Sep 2022 03:04:16 +0000
Received: by outflank-mailman (input) for mailman id 412197;
 Tue, 27 Sep 2022 03:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZci=Z6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1od0tK-0002Wn-Qx
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 03:04:14 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 108669a6-3e11-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 05:04:13 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DEFB95C0198;
 Mon, 26 Sep 2022 23:04:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 26 Sep 2022 23:04:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 23:04:12 -0400 (EDT)
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
X-Inumbo-ID: 108669a6-3e11-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664247852; x=1664334252; bh=f6ZPHLSgD7XKJHqHB/XRr1A+xgGqvvyVHfV
	9tK3yBF8=; b=stP9n8OLysaRZAgI0hVUO5K5vvWrV3KynONeqKpOch8rKi2SGrM
	L8eJ2uKOWuK+29by+PEMGNMXhYhekWoT2P8brAIA3lEC04h09EnEFdI960dykbxW
	CeBK130vOgnOiKt32buiQaq6aA06eebe5d6wziEZq1aw0W9Jamd32a8lsKLPG5vQ
	A+NREmBzLlc60raErznpkvrzxRU3y916X+Z1oaLYH+tNNWsr25LQLUeRamxhojxi
	paNdyueOV9DmyG0NajCQPEQKczfworoYUTGvuAjTyYEqtIEvr3+Qr9d1CHU1o09b
	IBJfo/hATUdgCKKPdPJ3S+Ln7IfX/KhaS5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664247852; x=1664334252; bh=f6ZPHLSgD7XKJ
	HqHB/XRr1A+xgGqvvyVHfV9tK3yBF8=; b=L5QjJcMZbB5LyxexrgJcOojGggW8d
	gR9NOT3QqReStJ3u53F6k24dtHVd/DOQhX/PxaahaQ7dluPEDYRJIBCHSHtDOSJS
	z3T7B4I+x3+QydGnxdPlWwPL38RYnd6HPnk6WykynYj+XeYhLDNflG4985PsLomI
	9z2zoKXEDCia+nnQtzRj9SGoSWTyOQQGTyuA+IBenTXM3yPFbnAPplBlAfyM0/Sf
	AJv4Sfa9sxZOCYpMBMQuayjs6GUWKWhXrYQq9esdDVaWu5ttPKl+UNyxA1SKJbtG
	UVLnBte6QmPa0oEL9AoPfpkl8wbDF9vq2BYE81ZWCwTDohoX3UQBtOdyA==
X-ME-Sender: <xms:LGgyY5sqlHrIl5kn4D4tXcl0K8OgayYdbDKXvNoPT1gdMOND4vJwTA>
    <xme:LGgyYyeCN0jMj-oB7tkRGy1SS7Eez0ozhrqCqjoceLnLdaufTehzw2Dw-Lv3KLUjd
    77qVLmu94y1m3Y>
X-ME-Received: <xmr:LGgyY8zM5WNkxuvriI7EDHb2UwtjqUhbGiEBV4bCp6VSaQ2K9BWBiWdIJ2L_dZLNqrRktdvCz0LX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:LGgyYwPnyvfQOfbThkQ-g4BsC6j412QG9-ElesGhKED2lg9m_b3zxg>
    <xmx:LGgyY5_S-JmfCU2F3P2TxB8qSdcM4H_gaJoqUDfyFMl2nrGybwofVA>
    <xmx:LGgyYwUkp6mwPPXdyKsGpkfeodgWyZiBNCmUam2aH2x-5PDtY5XtFQ>
    <xmx:LGgyY7L0qVL2gKMr9AC89tCm4DTuGXHOGCy_9xpEO5eANKFEDY2MZg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/5] libxl: Add utility function to check guest status
Date: Mon, 26 Sep 2022 23:03:58 -0400
Message-Id: <3bbc7f9038049815bc2af1e4d901347160e09f7b.1664236600.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664236600.git.demi@invisiblethingslab.com>
References: <cover.1664236600.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is used to check that a guest has not been destroyed and to obtain
information about it.  It will be used in subsequent patches.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 tools/libs/light/libxl_dom_suspend.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index fa50e8801f35d173a99ae5dd19eb941649e14019..d2a88ea34efb115a8f2b861daf5884d95f39e81d 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -321,27 +321,36 @@ static void suspend_common_wait_guest_watch(libxl__egc *egc,
     suspend_common_wait_guest_check(egc, dsps);
 }
 
+static int check_guest_status(libxl__gc *gc, const uint32_t domid,
+                              xc_domaininfo_t *info, const char *what)
+{
+    int ret = xc_domain_getinfolist(CTX->xch, domid, 1, info);
+
+    if (ret < 0) {
+        LOGED(ERROR, domid, "unable to check for status of guest");
+        return ERROR_FAIL;
+    }
+
+    if (!(ret == 1 && info->domain == domid)) {
+        LOGED(ERROR, domid, "guest we were %s has been destroyed", what);
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
 static void suspend_common_wait_guest_check(libxl__egc *egc,
         libxl__domain_suspend_state *dsps)
 {
     STATE_AO_GC(dsps->ao);
     xc_domaininfo_t info;
-    int ret;
     int shutdown_reason;
 
     /* Convenience aliases */
     const uint32_t domid = dsps->domid;
 
-    ret = xc_domain_getinfolist(CTX->xch, domid, 1, &info);
-    if (ret < 0) {
-        LOGED(ERROR, domid, "unable to check for status of guest");
+    if (check_guest_status(gc, domid, &info, "suspending"))
         goto err;
-    }
-
-    if (!(ret == 1 && info.domain == domid)) {
-        LOGED(ERROR, domid, "guest we were suspending has been destroyed");
-        goto err;
-    }
 
     if (!(info.flags & XEN_DOMINF_shutdown))
         /* keep waiting */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

