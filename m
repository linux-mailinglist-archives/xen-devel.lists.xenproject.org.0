Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC14001BE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178172.324096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnn-0002Kc-BA; Fri, 03 Sep 2021 15:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178172.324096; Fri, 03 Sep 2021 15:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnn-0002Ge-6P; Fri, 03 Sep 2021 15:08:23 +0000
Received: by outflank-mailman (input) for mailman id 178172;
 Fri, 03 Sep 2021 15:08:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAnm-00020o-6O
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:08:22 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c49e68bc-0cc8-11ec-af2e-12813bfff9fa;
 Fri, 03 Sep 2021 15:08:18 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681607871996.5359561303381;
 Fri, 3 Sep 2021 08:06:47 -0700 (PDT)
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
X-Inumbo-ID: c49e68bc-0cc8-11ec-af2e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630681613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AmnjgUxavzvlOgQThsUztE6rwLA9AR1eB9LLbjf1gN6C9YJEpPb01RiYrBLPwTDUqvUcyfBoETtfz+FrM9lGAzjdji/RjUI86EsOCH/2SMRu3MhhtE63l7MfRGbo/gF7Zp82gneuAiP36Etp/u0NPTQH9LMmKPgvOh3kSCJaViA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681613; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DHYiPbkr+NbOPJst4/lduNG0E/MNzNsNVs5R1f5AFDk=; 
	b=J0EIGjS1XMflXx/TZjog1zNaIfzg8OscC2cCqd50CL4ka5IynK+OIcQvt+Hv0dVFHiDFt2riVKSHWXyRDjEJJ2YsX3lTD4xGa+tnHLgH9Y7wJsHTC9JmpZcvfnlvqFLzT001Liu2eUURuPzN3pDcVXc6FpXq3Tfme/8GwKafWMQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681613;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DHYiPbkr+NbOPJst4/lduNG0E/MNzNsNVs5R1f5AFDk=;
	b=Brrsy+5tS9Yt7RWJtCGbyKNNj4+oiAse7W5CsQOOu0cqWs+vJD/flMRPYzEEF45K
	CxCT7RaTtN8LPe06fEy/6YHMs8elfUoHwWS0CCI0qM4VAYIBlc+QAlZtM598UcKZpi5
	wKa6SJJi+0qdf8SdhusQ8iixemr3TFZBa8eLMnHE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 09/11] silo: remove circular xsm hook call
Date: Fri,  3 Sep 2021 15:06:27 -0400
Message-Id: <20210903190629.11917-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

SILO implements a few XSM hooks to extended the decision logic beyond
what is defined in the dummy/default policy. For each of the hooks, it
falls back to the dummy/default policy. The fall back is done a slight
round-about way. This commit makes the direct call to the default policy's
logic, xsm_default_action().

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/silo.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 6db793f35c..56a330a831 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -17,6 +17,7 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
+#include <xsm/xsm-core.h>
 #include <xsm/dummy.h>
 
 /*
@@ -43,7 +44,7 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
     else
     {
         if ( silo_mode_dom_check(d1, d2) )
-            rc = xsm_evtchn_unbound(d1, chn, id2);
+            rc = xsm_default_action(XSM_TARGET, current->domain, d1);
         rcu_unlock_domain(d2);
     }
 
@@ -54,7 +55,7 @@ static int silo_evtchn_interdomain(struct domain *d1, struct evtchn *chan1,
                                    struct domain *d2, struct evtchn *chan2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
@@ -62,21 +63,21 @@ static int silo_grant_mapref(struct domain *d1, struct domain *d2,
                              uint32_t flags)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_mapref(d1, d2, flags);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_transfer(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_transfer(d1, d2);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_copy(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_copy(d1, d2);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
@@ -86,14 +87,14 @@ static int silo_argo_register_single_source(const struct domain *d1,
                                             const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_argo_register_single_source(d1, d2);
+        return 0;
     return -EPERM;
 }
 
 static int silo_argo_send(const struct domain *d1, const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_argo_send(d1, d2);
+        return 0;
     return -EPERM;
 }
 
-- 
2.20.1


