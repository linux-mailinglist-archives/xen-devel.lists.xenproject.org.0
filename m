Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E55EB848
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 05:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412196.655421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tL-0002pM-G3; Tue, 27 Sep 2022 03:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412196.655421; Tue, 27 Sep 2022 03:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od0tL-0002mT-Cx; Tue, 27 Sep 2022 03:04:15 +0000
Received: by outflank-mailman (input) for mailman id 412196;
 Tue, 27 Sep 2022 03:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZci=Z6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1od0tK-0002Wn-2U
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 03:04:14 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fb06a2b-3e11-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 05:04:12 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CDC15C0193;
 Mon, 26 Sep 2022 23:04:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 26 Sep 2022 23:04:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 23:04:10 -0400 (EDT)
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
X-Inumbo-ID: 0fb06a2b-3e11-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1664247851; x=1664334251; bh=jh+Frhwmh5e9JCT1Ke46iLV+JdKVkMGqf4f
	rllkpN/Q=; b=16v6Q6OYYkHyRXIFYk3fIXCc5kxp/x8ZzzFI9kCroshhXUCyFJG
	U9kAtnvUVBp3uyiBdEjQ7fJRo0HwH5XsPwynrwQoK1gFtB52fgeeOpkCN6ZUwI1n
	Ne4N1I2yJjieq3BgLyF10ziJP+Piktqug3ZRa0eyA8GkQl2giu4AoB/tHApDTiY4
	KP40jNX07ugI1zo/XX4SqOal3opBFrMW8VAkpo3ytDn72vwtDSnIWWAmQ4SyGFVX
	l8Jx46yJ5OhgRluDWPbF/ssOwqZbIKQA7qrANksfuiwA4LTj2R8h9b350N3Iz0py
	MmKDcTldHKKTHI8zrOE7XkwI4p5IQgv26NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1664247851; x=1664334251; bh=jh+Frhwmh5e9J
	CT1Ke46iLV+JdKVkMGqf4frllkpN/Q=; b=gZ4D83zX/uTM0NwvNsn/VTSvBwumz
	U1AFa+B9CcmlkwonHsDLRJBKlGavhiTuJ7waSOzO0cWA9kaKSEQTfHLd7ZdOWfId
	Egx9aCN1UNhoua89qzl9dpkYkCc6/qMY30c4tmlL3KQtDh1XuFNpGw5v4rkUDJGJ
	n95n8CUIlXAsFe0DI42y16Qk3HtgySRuklGSg2Lrckso9bDS0fFSf2Kt6x5q8wcr
	iVWwJWhyP58ce5a/ctlEFb5dhZOXt9E8R/hz19y555NKJ+KOIX6TCQCn9KPyc5oP
	UsEkmvMBIqOcocX1QwnEM6aOd5mK6ivaxXUpF80O44ufXUDe0OW2JQlag==
X-ME-Sender: <xms:K2gyYzbyz1Gy87cP2SLtuYHXE46QSJPF8YQ91VqpN3DQ6wjqf4KKnw>
    <xme:K2gyYybB5A7waP1_OgBOUx1kx2CFzMsulQSFI9k41hTB8vRPxj2Xehdu9gQbJ1VeI
    GFYG50mtpGOt50>
X-ME-Received: <xmr:K2gyY1-5VtfdIoBaNhlnmkH8Zs2r3CbxfSk3Zjf42ajCJZlJhV2MQy42I1qbAc6QHpgoxhep663H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:K2gyY5qz7yQ4V4imHA0Dv1e9XoHhq4XdQgLCoEFI9plbA6AoTfwi-Q>
    <xmx:K2gyY-qYp283S2OJS9W_Q5yq1eED9B3Z_YGtyY6nVM-032nzkQIhoQ>
    <xmx:K2gyY_TzXIKPoV3ExBNJMfhzQrPRKCJ2iM6UEn0QufRMOmZFrPONIA>
    <xmx:K2gyY10ZMamrPY6qVfiyCAxDkYLvTXYyN1ej5szvF-9RMoTb7jNF4g>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/5] libxl: Add a utility function for domain resume
Date: Mon, 26 Sep 2022 23:03:57 -0400
Message-Id: <6fcc32dc0747a081eb4b182dae1a483c6d1258f4.1664236600.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664236600.git.demi@invisiblethingslab.com>
References: <cover.1664236600.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is necessary to all xs_resume_domain after any successful call to
xc_domain_resume, so that XenStore is notified of the resumption.
However, it is also very easy to forget to call this.  This took me
several days to debug.

Fix this by adding a utility function to resume a domain and then notify
XenStore of the resumption.  This function does not resume any device
model, so it is still internal to libxl, but it makes future changes to
libxl much less error-prone.  It also makes libxl itself smaller.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 tools/libs/light/libxl_dom_suspend.c | 41 +++++++++++++++------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index 4fa22bb7391049f2ea4ac32f21660212053bd4bc..fa50e8801f35d173a99ae5dd19eb941649e14019 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -451,6 +451,22 @@ int libxl__domain_resume_device_model_deprecated(libxl__gc *gc, uint32_t domid)
     return 0;
 }
 
+/* Just resumes the domain.  The device model must have been resumed already. */
+static int domain_resume_raw(libxl__gc *gc, uint32_t domid, int suspend_cancel)
+{
+    if (xc_domain_resume(CTX->xch, domid, suspend_cancel)) {
+        LOGED(ERROR, domid, "xc_domain_resume failed");
+        return ERROR_FAIL;
+    }
+
+    if (!xs_resume_domain(CTX->xsh, domid)) {
+        LOGED(ERROR, domid, "xs_resume_domain failed");
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
 int libxl__domain_resume_deprecated(libxl__gc *gc, uint32_t domid, int suspend_cancel)
 {
     int rc = 0;
@@ -469,16 +485,7 @@ int libxl__domain_resume_deprecated(libxl__gc *gc, uint32_t domid, int suspend_c
         }
     }
 
-    if (xc_domain_resume(CTX->xch, domid, suspend_cancel)) {
-        LOGED(ERROR, domid, "xc_domain_resume failed");
-        rc = ERROR_FAIL;
-        goto out;
-    }
-
-    if (!xs_resume_domain(CTX->xsh, domid)) {
-        LOGED(ERROR, domid, "xs_resume_domain failed");
-        rc = ERROR_FAIL;
-    }
+    rc = domain_resume_raw(gc, domid, suspend_cancel);
 out:
     return rc;
 }
@@ -660,19 +667,9 @@ static void domain_resume_done(libxl__egc *egc,
     /* Convenience aliases */
     libxl_domid domid = dmrs->domid;
 
-    if (rc) goto out;
-
-    if (xc_domain_resume(CTX->xch, domid, dmrs->suspend_cancel)) {
-        LOGED(ERROR, domid, "xc_domain_resume failed");
-        rc = ERROR_FAIL;
-        goto out;
-    }
+    if (!rc)
+        rc = domain_resume_raw(gc, domid, dmrs->suspend_cancel);
 
-    if (!xs_resume_domain(CTX->xsh, domid)) {
-        LOGED(ERROR, domid, "xs_resume_domain failed");
-        rc = ERROR_FAIL;
-    }
-out:
     dmrs->callback(egc, dmrs, rc);
 }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

