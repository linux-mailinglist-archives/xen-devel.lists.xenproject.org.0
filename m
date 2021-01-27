Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0349305562
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:16:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75798.136576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g0F-0005lL-W5; Wed, 27 Jan 2021 08:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75798.136576; Wed, 27 Jan 2021 08:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g0F-0005kv-SK; Wed, 27 Jan 2021 08:16:39 +0000
Received: by outflank-mailman (input) for mailman id 75798;
 Wed, 27 Jan 2021 08:16:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4g0E-0005ki-CH
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:16:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 088ee26f-2438-44ac-b47c-6ddbbf0d9055;
 Wed, 27 Jan 2021 08:16:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0570AF17;
 Wed, 27 Jan 2021 08:16:36 +0000 (UTC)
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
X-Inumbo-ID: 088ee26f-2438-44ac-b47c-6ddbbf0d9055
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611735397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpyRMXe7gyQJEoJJGBUBHj/cowjnW/uFCjUcSR4dZrw=;
	b=YOPgBPWtycIF312nHNy3XHFwMyg5jDj4ig9C8PLwYuHLp7mWC4dyfQ6lelf3SltfPsbKz6
	ho68v5JZPtfjgkErNLzXxKH3492P/knZKVY6k59rWW25usasKvDBALtofRi2OHucv34R5s
	NqX5WXa4BuTsR/kb+lZwpyTXdW3Qbic=
Subject: [PATCH v5 3/6] evtchn: slightly defer lock acquire where possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Message-ID: <d005ccb8-e4d3-7cc5-3734-c8afeb7b3bb0@suse.com>
Date: Wed, 27 Jan 2021 09:16:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

port_is_valid() and evtchn_from_port() are fine to use without holding
any locks. Accordingly acquire the per-domain lock slightly later in
evtchn_close() and evtchn_bind_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -610,17 +610,14 @@ int evtchn_close(struct domain *d1, int
     int            port2;
     long           rc = 0;
 
- again:
-    write_lock(&d1->event_lock);
-
     if ( !port_is_valid(d1, port1) )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
+        return -EINVAL;
 
     chn1 = evtchn_from_port(d1, port1);
 
+ again:
+    write_lock(&d1->event_lock);
+
     /* Guest cannot close a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn1)) && guest )
     {
@@ -1044,16 +1041,13 @@ long evtchn_bind_vcpu(unsigned int port,
     if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
         return -ENOENT;
 
-    write_lock(&d->event_lock);
-
     if ( !port_is_valid(d, port) )
-    {
-        rc = -EINVAL;
-        goto out;
-    }
+        return -EINVAL;
 
     chn = evtchn_from_port(d, port);
 
+    write_lock(&d->event_lock);
+
     /* Guest cannot re-bind a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn)) )
     {


