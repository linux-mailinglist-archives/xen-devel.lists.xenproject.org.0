Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C135C00EC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 17:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409833.652810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1Sj-0000pI-MU; Wed, 21 Sep 2022 15:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409833.652810; Wed, 21 Sep 2022 15:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob1Sj-0000nJ-IN; Wed, 21 Sep 2022 15:16:33 +0000
Received: by outflank-mailman (input) for mailman id 409833;
 Wed, 21 Sep 2022 15:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SYn=ZY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ob1Si-0000nD-IU
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 15:16:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ca88dcc-39c0-11ed-9374-c1cf23e5d27e;
 Wed, 21 Sep 2022 17:16:30 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 166377338234190.41874380517845;
 Wed, 21 Sep 2022 08:16:22 -0700 (PDT)
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
X-Inumbo-ID: 5ca88dcc-39c0-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; t=1663773385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BVT42Uz5FnrFyisddM56XrDdGxcxVksqaY9rB8dwvjn5MtzCun4/ujOSWqlhcCm6QA9UpUkYNBatnC4P4CILGX3qsiLDLeI15elFyWuLwkbJ0/80BquEQzgZPurf80VIseotRPkNcqkinCjlw2vlmjed1A2jK0s69blyupctJWk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663773385; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=NDoK6DyexoYdIaow3/4JAZN25fIJLHqdzOzXM8IXl3o=; 
	b=HmwmuD7LiUoYSwCAu+DPgrydrL0+BxUdcyLJOeLhRzbsCT/6VyLxC16Wkn+6UBT+tl4F8rKvFByklodGbvnvT6clIv7hQxE0KU0/OcAHwzec88O6D9fuFvDNHHyeUcyOMDCWP53a/8lTYmJb/xVMkFI5R0jX193oDjsmSt7fWHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663773385;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=NDoK6DyexoYdIaow3/4JAZN25fIJLHqdzOzXM8IXl3o=;
	b=OTIKK0g4TKU+VBESBzAlJqmGEG5nII6ja3EZnhn6ZOS/eBC9vyROzpu6xhNU01Mo
	yPitSUAAAo0FuEHw+cBxO+0cP8hVWAbjMZjB22AiOGQaG6fdSywJ4TCV+0mdENXC5uX
	FiWkfP1UpmmTUobVl/I0yhDW9N1ffiRF6fuJH1y8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jandryuk@gmail.com,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v2] xsm/flask: adjust print messages to use %pd
Date: Wed, 21 Sep 2022 11:16:14 -0400
Message-Id: <20220921151614.9400-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Print messages from flask use an inconsistent format when printing the domain
id. When referencing system domains, the domain id is printed which is not
immediately identifiable. The %pd conversion specifier provides a consistent
and clear way to format for the domain id. In addition this will assist in
aligning FLASK with current hypervisor code practices.

While addressing the domain id formating, two relatd issues were addressed.
The first being that avc_printk() was not applying any conversion specifier
validation. To address this, the printf annotation was added to avc_printk() to
help ensure the correct types are passed to each conversion specifier. The second
was concern that source and target domains were being appropriately reported for
an AVC. This was addressed by simplifying the conditional logic.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---

Changes in v2:
 - Grossly simplified the conditional logic for printing source/target domids
   to address concerns raised by Jan.

 xen/xsm/flask/avc.c   | 16 ++++++++--------
 xen/xsm/flask/hooks.c |  3 +--
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index 4a75ec97e2..3d39e55cae 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -113,7 +113,8 @@ struct avc_dump_buf {
     u32 free;
 };
 
-static void avc_printk(struct avc_dump_buf *buf, const char *fmt, ...)
+static void __attribute__ ((format (printf, 2, 3)))
+    avc_printk(struct avc_dump_buf *buf, const char *fmt, ...)
 {
     int i;
     va_list args;
@@ -565,15 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 
     if ( a && (a->sdom || a->tdom) )
     {
-        if ( a->sdom && a->tdom && a->sdom != a->tdom )
-            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
-        else if ( a->sdom )
-            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
-        else
-            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
+        if ( a->sdom )
+            avc_printk(&buf, "source=%pd ", a->sdom);
+        if ( a->tdom && a->tdom != a->sdom )
+            avc_printk(&buf, "target=%pd ", a->tdom);
     }
     else if ( cdom )
-        avc_printk(&buf, "domid=%d ", cdom->domain_id);
+        avc_printk(&buf, "current=%pd ", cdom);
+
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


