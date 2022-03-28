Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E340C4E9C5B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 18:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295532.502979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsLP-0001wc-6X; Mon, 28 Mar 2022 16:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295532.502979; Mon, 28 Mar 2022 16:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsLP-0001tT-2w; Mon, 28 Mar 2022 16:35:51 +0000
Received: by outflank-mailman (input) for mailman id 295532;
 Mon, 28 Mar 2022 16:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3mb0=UH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nYsLM-0001bP-SI
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 16:35:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e27243e-aeb5-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 18:35:47 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16484853341111019.3383598102412;
 Mon, 28 Mar 2022 09:35:34 -0700 (PDT)
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
X-Inumbo-ID: 1e27243e-aeb5-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648485335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=igLa5rrgqXD8BtnvtWDcd8QtD2YhuJsidTbhq8xclPYX8W8sVoSoQPcy7ZQZLgYYCfog6EgdvHbNZjrgnC/RZHaK80oHBdV0/rSQ2L2WoNx5naw2QjyC55MPvJeG4Y1Ik/tskn+HEcQMFrdFVLQ9tumRbqN6Qk74P13Asi1bEEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648485335; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uUcmLp9iUV0l9g/8T7dC0MuLoMQAvOO25/oX3bNXbyA=; 
	b=adFuagm5xE9KYVSQMY2U+DnT61D/bo1d0TlEtb5p//SohFBDAM2zT1ZsT+MDq8lfxdFcVBG6ezhMDGjkfPeUGGVv3x5hp48YXjD9a9EQD22XCVHGOg1lLEWReXR0meGjaFtYlu0lVukfSAOvK5Bq80kYrHF/YHx7CCCEoteaUas=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648485335;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=uUcmLp9iUV0l9g/8T7dC0MuLoMQAvOO25/oX3bNXbyA=;
	b=EfY7jhppw9ObHMCEsgHyVx6XeGiCZU/kVOmkxKKt2r+5iyB9yVfQZeRzHwSPu4Wl
	5iAugho6+BZ9jm6GB7l5pXm1BLi0flK7ck3nUzWddJTvu+gD6/8rBm0F5l1cewWNEx3
	FCdXuaA9tkzsl+DmvyErAJ0HX10n3g+B64rzvJrA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: scott.davis@starlab.io,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Date: Mon, 28 Mar 2022 16:36:22 -0400
Message-Id: <20220328203622.30961-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220328203622.30961-1-dpsmith@apertussolutions.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

During domain construction under dom0less and hyperlaunch it is necessary to
allocate at least the event channel for xenstore and potentially the event
channel for the core console. When dom0less and hyperlaunch are doing their
construction logic they are executing under the idle domain context. The idle
domain is not a privileged domain, it is not the target domain, and as a result
under the current default XSM policy is not allowed to allocate the event
channel.

This patch only addresses the event channel situation by adjust the default XSM
policy for xsm_evtchn_unbound to explicitly allow system domains to be able to
make the allocation call.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/event_channel.c | 4 ++--
 xen/include/xsm/dummy.h    | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index ffb042a241..c9c3876ee9 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -306,7 +306,7 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
         ERROR_EXIT_DOM(port, d);
     chn = evtchn_from_port(d, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
+    rc = xsm_evtchn_unbound(XSM_OTHER, d, chn, alloc->remote_dom);
     if ( rc )
         goto out;
 
@@ -1366,7 +1366,7 @@ int alloc_unbound_xen_event_channel(
         goto out;
     chn = evtchn_from_port(ld, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, ld, chn, remote_domid);
+    rc = xsm_evtchn_unbound(XSM_OTHER, ld, chn, remote_domid);
     if ( rc )
         goto out;
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 58afc1d589..bd31ce43f9 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -294,8 +294,12 @@ static XSM_INLINE int cf_check xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
 static XSM_INLINE int cf_check xsm_evtchn_unbound(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    XSM_ASSERT_ACTION(XSM_OTHER);
+
+    if ( is_system_domain(current->domain) )
+        return xsm_default_action(XSM_HOOK, current->domain, d);
+    else
+        return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static XSM_INLINE int cf_check xsm_evtchn_interdomain(
-- 
2.20.1


