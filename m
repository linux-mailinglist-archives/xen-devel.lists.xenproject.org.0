Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B02C2DAD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36623.68602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbjJ-0005TO-21; Tue, 24 Nov 2020 17:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36623.68602; Tue, 24 Nov 2020 17:03:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbjI-0005Sz-Us; Tue, 24 Nov 2020 17:03:48 +0000
Received: by outflank-mailman (input) for mailman id 36623;
 Tue, 24 Nov 2020 17:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khbjH-0005Su-F5
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:03:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e6a02dc-2c6f-4796-ab4b-3ec88003fed7;
 Tue, 24 Nov 2020 17:03:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C957FAC2D;
 Tue, 24 Nov 2020 17:03:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khbjH-0005Su-F5
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:03:47 +0000
X-Inumbo-ID: 7e6a02dc-2c6f-4796-ab4b-3ec88003fed7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7e6a02dc-2c6f-4796-ab4b-3ec88003fed7;
	Tue, 24 Nov 2020 17:03:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606237425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BC94yTNxLr0ndaAF4GPuK/aP1erxAAwVav17KS4KiW0=;
	b=MG/r3YB6gkWnw/aMhJq/NNaHta/B46cqqXQXZ7XZxG2Nhkfp9bGBQet7mYUspKX6urCcrb
	H4k09lmCgeenggxoS/e9PRFzOV1Na13SFnnxJdQTcNgHKcLT6T4WRGcPjjyEzTz4KNH2Dq
	iwuCz39mVaBsf3MtwEHJKmTMlCWQAow=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C957FAC2D;
	Tue, 24 Nov 2020 17:03:45 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] evtchn: double per-channel locking can't hit identical
 channels
Message-ID: <db0b16f8-2053-5ec3-f73a-c1c8fcdb9444@suse.com>
Date: Tue, 24 Nov 2020 18:03:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Inter-domain channels can't possibly be bound to themselves, there's
always a 2nd channel involved, even when this is a loopback into the
same domain. As a result we can drop one conditional each from the two
involved functions.

With this, the number of evtchn_write_lock() invocations can also be
shrunk by half, swapping the two incoming function arguments instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -326,23 +326,18 @@ static long evtchn_alloc_unbound(evtchn_
 
 static void double_evtchn_lock(struct evtchn *lchn, struct evtchn *rchn)
 {
-    if ( lchn <= rchn )
-    {
-        evtchn_write_lock(lchn);
-        if ( lchn != rchn )
-            evtchn_write_lock(rchn);
-    }
-    else
-    {
-        evtchn_write_lock(rchn);
-        evtchn_write_lock(lchn);
-    }
+    ASSERT(lchn != rchn);
+
+    if ( lchn > rchn )
+        SWAP(lchn, rchn);
+
+    evtchn_write_lock(lchn);
+    evtchn_write_lock(rchn);
 }
 
 static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
 {
-    if ( lchn != rchn )
-        evtchn_write_unlock(lchn);
+    evtchn_write_unlock(lchn);
     evtchn_write_unlock(rchn);
 }
 

