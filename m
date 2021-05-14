Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2338120F
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127556.239763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhen0-000424-Ss; Fri, 14 May 2021 20:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127556.239763; Fri, 14 May 2021 20:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhen0-000403-PS; Fri, 14 May 2021 20:52:06 +0000
Received: by outflank-mailman (input) for mailman id 127556;
 Fri, 14 May 2021 20:52:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhemz-0003y3-6b
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:52:05 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a22dd97f-fa72-4fa7-9bdb-ccd91e95adc1;
 Fri, 14 May 2021 20:52:02 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16210251766101006.373208647906;
 Fri, 14 May 2021 13:46:16 -0700 (PDT)
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
X-Inumbo-ID: a22dd97f-fa72-4fa7-9bdb-ccd91e95adc1
ARC-Seal: i=1; a=rsa-sha256; t=1621025178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gav8mVX8+Lj1JTfaJ5VuA2M8Ok24RS6vhX8KXf7rzfCYSDnOwEX9lHL7tUX5ZzqYKiDW3WFLQO013z8LWtxccEbYRirT2dCeMCd9mpcjMwrQiD2bj5xQ8qc/KbgFgh0zAWM2sNa0lqvt7MAlzQ1/qUfae88DjwmbEf3m1dPEQZ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025178; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=j1TdhTTR8bEErLKTI/Pj6mQGmlE2NmJBrVMzKAEiNsk=; 
	b=F3fy2Nh05W9WnuoreC3Trcl43bodrA8xRhtVRbtpEO5L/1y1TtIU1LOsijI1X4ypb93E2ztMT4Axs2tvCt1XHSVmd+cNHSMCvvDWACJU+/MnZLkZih1ISUzFS/fbLHE41uvPROIkBQrHAFSp4gwY26cmSs6Hke2JSRdQRz8Ggis=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025178;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j1TdhTTR8bEErLKTI/Pj6mQGmlE2NmJBrVMzKAEiNsk=;
	b=l0Yqy5F4mMljqC6V6mAA1YlCL9AH9R+sJ+svxJS7KWKFiihOx1jFeIXx7swg3GUC
	xZBCzchv8qdcW/aae7e6VcaR5vGKgE3fVdRctLljQ5hp9JJibJ77JdCnp5Ob/2ko/Xo
	Rf1gQQBCtOqcX9wLFmfS9p9Ut7zDqYU6vpQeutcQ=
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
Subject: [RFC PATCH 08/10] xsm-silo: convert silo over to domain roles
Date: Fri, 14 May 2021 16:54:35 -0400
Message-Id: <20210514205437.13661-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This converts the SILO XSM module to function as an extension to the domain
roles system to implement an extended enforcement policy.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/silo.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 4850756a3d..3b3ca8fb84 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -17,9 +17,11 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#define XSM_NO_WRAPPERS
-#include <xsm/dummy.h>
 
+#include <xsm/xsm.h>
+#include <xsm/roles.h>
+
+#define SILO_ALLOWED_ROLES ( XSM_DOM_SUPER | XSM_DEV_BACK )
 /*
  * Check if inter-domain communication is allowed.
  * Return true when pass check.
@@ -29,8 +31,10 @@ static bool silo_mode_dom_check(const struct domain *ldom,
 {
     const struct domain *currd = current->domain;
 
-    return (is_control_domain(currd) || is_control_domain(ldom) ||
-            is_control_domain(rdom) || ldom == rdom);
+    return ( currd->xsm_roles & SILO_ALLOWED_ROLES ||
+            ldom->xsm_roles & SILO_ALLOWED_ROLES ||
+            rdom->xsm_roles & SILO_ALLOWED_ROLES ||
+            ldom == rdom );
 }
 
 static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
@@ -44,7 +48,7 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
     else
     {
         if ( silo_mode_dom_check(d1, d2) )
-            rc = xsm_evtchn_unbound(d1, chn, id2);
+            rc = xsm_validate_role(TARGET_PRIVS, current->domain, d1);
         rcu_unlock_domain(d2);
     }
 
@@ -55,7 +59,7 @@ static int silo_evtchn_interdomain(struct domain *d1, struct evtchn *chan1,
                                    struct domain *d2, struct evtchn *chan2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
+        return xsm_validate_role(XSM_NONE, d1, d2);
     return -EPERM;
 }
 
@@ -63,21 +67,21 @@ static int silo_grant_mapref(struct domain *d1, struct domain *d2,
                              uint32_t flags)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_mapref(d1, d2, flags);
+        return xsm_validate_role(XSM_NONE, d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_transfer(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_transfer(d1, d2);
+        return xsm_validate_role(XSM_NONE, d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_copy(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_copy(d1, d2);
+        return xsm_validate_role(XSM_NONE, d1, d2);
     return -EPERM;
 }
 
-- 
2.20.1


