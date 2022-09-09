Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AC5B3480
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404084.646412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaea-0002W5-VI; Fri, 09 Sep 2022 09:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404084.646412; Fri, 09 Sep 2022 09:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaea-0002TW-S1; Fri, 09 Sep 2022 09:50:28 +0000
Received: by outflank-mailman (input) for mailman id 404084;
 Fri, 09 Sep 2022 09:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F1lU=ZM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oWaea-0002TQ-05
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:50:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8ce286-3024-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:50:11 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1662717021047525.9884923263767;
 Fri, 9 Sep 2022 02:50:21 -0700 (PDT)
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
X-Inumbo-ID: ca8ce286-3024-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; t=1662717023; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T2pjoDop4PScgy0bhPYHoRNazQyBfgBYg10Rp1CLOyyQ2hJkVtscy6Il7y/p8AxZUhLbJogiF2pzQjD7GDwRJmQZimxHnjUGeI6u9d0StTcYNHizzrQfqciT+f8pqq29kp7Mow5dQ5wOuVqXxFjX8GIx0ZkBUbgSqOne6gAkvRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662717023; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Buqqd0mdEOPtGi9ODN4NezM77ChBZhiRDygmgFSnS3M=; 
	b=K1FZMUjK2zPV50956dCMlVb3X0c9JY76SH5ocqRiK13nS13CQq9unNm5imOIuecIbdy52oywjSqZ+rSEp3axiSDlZr+UDMYxsm8oHDpVfwT6qcJYuriWazASlx7JJ7LSYTyGEaN7Mlh6pUtc1kIAuXaCaiy55dXA6x+ILHt/xAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662717022;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Buqqd0mdEOPtGi9ODN4NezM77ChBZhiRDygmgFSnS3M=;
	b=S7cevCpTAEdoYNTgJliMh7BqwHPa0hA9aXSClVv08Ex9aHiQInar+X8t5y0+Rxv6
	FnhDJpdfax3AksAWnyGmccNL6Z7uM0AdTh+3MdAah8bXS8zQJv6b28neYsOXPpBw2bf
	I5g0eH8O1HcBs+bxunY4tRSzD+pL0OPh6hM6IvmE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jandryuk@gmail.com
Subject: [PATCH] xsm/flask: adjust print messages to use %pd
Date: Fri,  9 Sep 2022 05:50:12 -0400
Message-Id: <20220909095012.4251-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Print messages from flask use an inconsistent format when printing the domain
id. The %pd conversion specifier provides a consistent way to format for the
domain id and aligns with the rest of the hypervisor code.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/avc.c   | 8 ++++----
 xen/xsm/flask/hooks.c | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index 4a75ec97e2..4a86681c81 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
     if ( a && (a->sdom || a->tdom) )
     {
         if ( a->sdom && a->tdom && a->sdom != a->tdom )
-            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
+            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
         else if ( a->sdom )
-            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
+            avc_printk(&buf, "source=%pd ", a->sdom);
         else
-            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
+            avc_printk(&buf, "target=%pd ", a->tdom);
     }
     else if ( cdom )
-        avc_printk(&buf, "domid=%d ", cdom->domain_id);
+        avc_printk(&buf, "current=%pd ", cdom);
     switch ( a ? a->type : 0 ) {
     case AVC_AUDIT_DATA_DEV:
         avc_printk(&buf, "device=%#lx ", a->device);
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8bd56644ef..a79281bdb0 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -281,8 +281,7 @@ static int cf_check flask_evtchn_interdomain(
     rc = security_transition_sid(sid1, sid2, SECCLASS_EVENT, &newsid);
     if ( rc )
     {
-        printk("security_transition_sid failed, rc=%d, Dom%d\n",
-               -rc, d2->domain_id);
+        printk("security_transition_sid failed, rc=%d, %pd\n", -rc, d2);
         return rc;
     }
 
-- 
2.20.1


