Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372C2EAB8A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61921.109233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm5e-00081v-5j; Tue, 05 Jan 2021 13:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61921.109233; Tue, 05 Jan 2021 13:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm5e-00081W-2e; Tue, 05 Jan 2021 13:09:34 +0000
Received: by outflank-mailman (input) for mailman id 61921;
 Tue, 05 Jan 2021 13:09:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm5c-00081Q-WD
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:09:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87474077-90a6-4260-b7b1-ab1383ecc613;
 Tue, 05 Jan 2021 13:09:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 523B4AD19;
 Tue,  5 Jan 2021 13:09:31 +0000 (UTC)
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
X-Inumbo-ID: 87474077-90a6-4260-b7b1-ab1383ecc613
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZmBD7Vu9gEKBGq3iumpz+92oYKBoj1HFDeHDpU2UJo=;
	b=GUGoDOkt4j3ZuksV4UmryzD+IkUOkuoq9fji3WggObuHNt/A0IIsvRakI539Ybe3ajc4X0
	JMeLm0rlzdml50docBklx66dhAvonxZCMLjv7iLt5HkYiUvDoMB0ZaXl+G26dXsJM90TJ0
	1J3F9MnrP0c8UxszJg3Ln0mGFeq5LzU=
Subject: [PATCH v4 02/10] evtchn: bind-interdomain doesn't need to hold both
 domains' event locks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <8b21ff13-d6ea-3fa5-8d87-c05157112e4b@suse.com>
Date: Tue, 5 Jan 2021 14:09:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The local domain's lock is needed for the port allocation, but for the
remote side the per-channel lock is sufficient. The per-channel locks
then need to be acquired slightly earlier, though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -355,18 +355,7 @@ static long evtchn_bind_interdomain(evtc
     if ( (rd = rcu_lock_domain_by_id(rdom)) == NULL )
         return -ESRCH;
 
-    /* Avoid deadlock by first acquiring lock of domain with smaller id. */
-    if ( ld < rd )
-    {
-        spin_lock(&ld->event_lock);
-        spin_lock(&rd->event_lock);
-    }
-    else
-    {
-        if ( ld != rd )
-            spin_lock(&rd->event_lock);
-        spin_lock(&ld->event_lock);
-    }
+    spin_lock(&ld->event_lock);
 
     if ( (lport = get_free_port(ld)) < 0 )
         ERROR_EXIT(lport);
@@ -375,15 +364,19 @@ static long evtchn_bind_interdomain(evtc
     if ( !port_is_valid(rd, rport) )
         ERROR_EXIT_DOM(-EINVAL, rd);
     rchn = evtchn_from_port(rd, rport);
+
+    double_evtchn_lock(lchn, rchn);
+
     if ( (rchn->state != ECS_UNBOUND) ||
          (rchn->u.unbound.remote_domid != ld->domain_id) )
         ERROR_EXIT_DOM(-EINVAL, rd);
 
     rc = xsm_evtchn_interdomain(XSM_HOOK, ld, lchn, rd, rchn);
     if ( rc )
+    {
+        double_evtchn_unlock(lchn, rchn);
         goto out;
-
-    double_evtchn_lock(lchn, rchn);
+    }
 
     lchn->u.interdomain.remote_dom  = rd;
     lchn->u.interdomain.remote_port = rport;
@@ -407,8 +400,6 @@ static long evtchn_bind_interdomain(evtc
  out:
     check_free_port(ld, lport);
     spin_unlock(&ld->event_lock);
-    if ( ld != rd )
-        spin_unlock(&rd->event_lock);
     
     rcu_unlock_domain(rd);
 


