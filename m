Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8513811F9
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127527.239697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lheiG-0007uT-Jg; Fri, 14 May 2021 20:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127527.239697; Fri, 14 May 2021 20:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lheiG-0007sc-FY; Fri, 14 May 2021 20:47:12 +0000
Received: by outflank-mailman (input) for mailman id 127527;
 Fri, 14 May 2021 20:47:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lheiE-0007sK-FP
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:47:10 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71ada7a0-8925-4181-85d8-6e9f193f8087;
 Fri, 14 May 2021 20:47:09 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025161143822.0352510861576;
 Fri, 14 May 2021 13:46:01 -0700 (PDT)
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
X-Inumbo-ID: 71ada7a0-8925-4181-85d8-6e9f193f8087
ARC-Seal: i=1; a=rsa-sha256; t=1621025162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JsZKcJD39Og/nefTLX+TvOb8CuRSrwy5xKtC5nMOOuJQ3FIprgsQzdlNbWUwEUhkOLIVba8MvBPkDaPFjWZV9CXOIKcnHI58pU+Lwp5DgrijIur0IvYjP6s3yYKq73JwAeU2EaZ3yDOCAD2DRZocIST1tI5vImDYDJAsL3H4gds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025162; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pRHPQ71We1MCZnJ3D/0BIGqhHZQGekLr/e7V1+0hc4U=; 
	b=RgmnKMbZibOUI5QLhhAhUDV0hzh0hJ0BxpoF5X8/7G4SK3Vy4FbCmryQh5TTsmW9sllub17dkarSS8DgCJrNaQ0OA+y53IQRvHyRkzksYyUK4U1agilS938k52JwSKl/AYr+SP2eo799ahGE7rs/rX2AKfAZNB+YuntaOTMJfD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025162;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pRHPQ71We1MCZnJ3D/0BIGqhHZQGekLr/e7V1+0hc4U=;
	b=F+BBWFRoj4QkNVc7nuq5NyUsNZAWwYOn5SOgjvONyRbOSz8BDYkdKlAmWYfhQ53W
	pY5fOALfVNc72XJAhcede0oFHclahwe9LEoUouToxSO4U7ExgNc4FFfzRrjPmmCmTYZ
	Ams3yJ27ozCjoe+zSzAsUpcu27Z2MP3ObcTfvVoU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 02/10] control domain: refactor is_control_domain
Date: Fri, 14 May 2021 16:54:29 -0400
Message-Id: <20210514205437.13661-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move to using the new Domain Control role as the backing to the
is_control_domain check.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/domain.c     | 3 +++
 xen/include/xen/sched.h | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index cdda0d1f29..26bba8666d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -556,6 +556,9 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_control_domain(). */
     d->is_privileged = is_priv;
 
+    if (is_priv)
+        d->xsm_roles = CLASSIC_DOM0_PRIVS;
+
     /* Sort out our idea of is_hardware_domain(). */
     if ( domid == 0 || domid == hardware_domid )
     {
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9b2c277ede..66b79d9c9f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -473,6 +473,8 @@ struct domain
 #define XSM_HW_CTRL   (1U<<8)  /* Hardware Control: domain with physical hardware access and its allocation for domain usage */
 #define XSM_HW_SUPER  (1U<<9)  /* Hardware Supervisor: domain that control allocated physical hardware */
 #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
+#define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
+		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
     uint32_t         xsm_roles;
 
     /* Which guest this guest has privileges on */
@@ -1049,7 +1051,7 @@ static always_inline bool is_control_domain(const struct domain *d)
     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
         return false;
 
-    return evaluate_nospec(d->is_privileged);
+    return evaluate_nospec(d->xsm_roles & XSM_DOM_SUPER);
 }
 
 #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
-- 
2.20.1


