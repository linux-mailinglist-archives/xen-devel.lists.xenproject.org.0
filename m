Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76019C5E3FC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 17:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162773.1490296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJwin-0005jg-HW; Fri, 14 Nov 2025 16:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162773.1490296; Fri, 14 Nov 2025 16:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJwin-0005hC-EJ; Fri, 14 Nov 2025 16:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1162773;
 Fri, 14 Nov 2025 16:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ooD=5W=bounce.vates.tech=bounce-md_30504962.69175993.v1-469cd3eab40649e79b67003d05c65955@srs-se1.protection.inumbo.net>)
 id 1vJwim-0005h6-84
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 16:32:24 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e0d0aed-c177-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 17:32:21 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d7N2q47wMzCf9RlV
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 16:32:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 469cd3eab40649e79b67003d05c65955; Fri, 14 Nov 2025 16:32:19 +0000
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
X-Inumbo-ID: 7e0d0aed-c177-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763137939; x=1763407939;
	bh=eXLgTxppW7YAJWwm3TS/tlQb0nifMGgYjeK8MLTbGt8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Ic5MUn/O7z1nh6m0pZ9kESx/31R6+TswED91fFzoTpSsBX8loT+K90tOIZogVYbk9
	 63G4yyQoNrZvGOZOvKNyfh8Vt2NfUrrvpPmcOHupPri1tbMR2uK0z9wAQHrZzivFeE
	 BQJ8zGz/0VeNU1iHUZZmghwW1hGfEcm94v8LJO9rqewrfWyy3HufSBlE0QnWU1IGtL
	 ivSA1OGRK5ErGme6MMWa0OVAOXtdMaQ8vktu47j3fqDnL7KmMLR6uVOK9xUFVyS4qP
	 rx+g+t+jGrYfCHf8lcfgRGwZgj3+4XCJ2l1zQO57npHDf+jfTpEnInjiuNcYYkOASQ
	 jay+Nf5nBX2/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763137939; x=1763398439; i=teddy.astie@vates.tech;
	bh=eXLgTxppW7YAJWwm3TS/tlQb0nifMGgYjeK8MLTbGt8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=kTBQT0O7aA02ILgqy2ctfx3dJ9cn1SPdNS85qIK2S34BavUkfb5rupwnB5pLwbrA1
	 pw7Ceg3VSbc8soG+SSBHFH5tULAr7y58yjQZNh6f6NvQcHGiTqbX81co05LSgTYS+O
	 7qyimkvk+pn0+2prO2JCA7h43OUJCr/0lKzD6g1nZ97FZIQKxoaPB3SDHgIQXPcUAS
	 UJ4PmAEKc+oZjYSyGFQkkgcOBZvEOeWlSzQ7ZCuA3YU0dKPHeamo1aL6oF5rUh8kMJ
	 5AGWQLxyZg6WJMCEQAyb4SylFjVk956KquDBL6GDQQTzdR/xeW2eBqNISq7t6gONSl
	 cM5PdeSzfLEiQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20ioreq:=20Check=20for=20out=20of=20bounds=20vCPU=20ID?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763137938262
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <f6cc34ce96693545ba9b8db6fe668c37c80f16c5.1763137553.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.469cd3eab40649e79b67003d05c65955?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251114:md
Date: Fri, 14 Nov 2025 16:32:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

A 4K page appears to be able to hold 128 ioreq entries, which luckly
matches the current vCPU limit. However, if we decide to increase the
vCPU limit, that doesn't hold anymore and this function would now
silently fetch a out of bounds pointer.

All architectures have no more than 128 as vCPU limit on HVM guests,
and have pages that are at most 4 KB, so this case doesn't occurs in
with the current limits.

Make sure that out of bounds attempts are reported and adjust the around
logic to at worst crash the offending domain instead.

No functional change.

Reported-by: Julian Vetter <julian.vetter@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - check and report instead of ASSERT and eventually crash offending domain

 xen/common/ioreq.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..a2a2dafe85 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -100,7 +100,14 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
     ASSERT((v == current) || !vcpu_runnable(v));
     ASSERT(p != NULL);
 
-    return &p->vcpu_ioreq[v->vcpu_id];
+    if ( likely(v->vcpu_id < (PAGE_SIZE / sizeof(struct ioreq))) )
+        return &p->vcpu_ioreq[v->vcpu_id];
+    else
+    {
+        gprintk(XENLOG_ERR, "Out of bounds vCPU %pv in ioreq server\n", v);
+        WARN();
+        return NULL;
+    }
 }
 
 /*
@@ -154,9 +161,17 @@ bool vcpu_ioreq_pending(struct vcpu *v)
 static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
-    unsigned int state = p->state;
+    unsigned int state;
     uint64_t data = ~0;
 
+    if ( unlikely(!p) )
+    {
+        domain_crash(sv->vcpu->domain);
+        return false;
+    }
+
+    state = p->state;
+
     smp_rmb();
 
     /*
@@ -354,7 +369,10 @@ static void ioreq_server_update_evtchn(struct ioreq_server *s,
     {
         ioreq_t *p = get_ioreq(s, sv->vcpu);
 
-        p->vp_eport = sv->ioreq_evtchn;
+        if ( likely(p) )
+            p->vp_eport = sv->ioreq_evtchn;
+        else
+            WARN();
     }
 }
 
@@ -1274,6 +1292,9 @@ int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
             evtchn_port_t port = sv->ioreq_evtchn;
             ioreq_t *p = get_ioreq(s, curr);
 
+            if ( unlikely(!p) )
+                break;
+
             if ( unlikely(p->state != STATE_IOREQ_NONE) )
             {
                 gprintk(XENLOG_ERR, "device model set bad IO state %d\n",
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


