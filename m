Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB0B27AC4C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:56:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqpP-0004DF-EL; Mon, 28 Sep 2020 10:56:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqpO-0004D9-C7
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:56:18 +0000
X-Inumbo-ID: 809d7d92-3d87-4b15-b2fd-40239f5670d4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 809d7d92-3d87-4b15-b2fd-40239f5670d4;
 Mon, 28 Sep 2020 10:56:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzaITT0sR3eKgr9vS2zQdHUk+Tx53cRBKfsTil/SkmQ=;
 b=CBAgCk51gqJC4Lfk5Vurzo8R4RD8XfWV6Kbt8GMm1/aUv4ihrpKPqYjok2HK3cYppB1VHw
 sqOJQBPZMvaPlhRx+eQpwXZ6ynX04iW6itpTnlmPvLT+tECb3RW6LELgutCldqKilExT80
 X+XX8l1ojLkhnSK3/rjPGdfI7sG+SE0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED72BAD82;
 Mon, 28 Sep 2020 10:56:16 +0000 (UTC)
Subject: [PATCH 01/12] evtchn: refuse EVTCHNOP_status for Xen-bound event
 channels
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <e7331fa6-e557-4319-6137-2c2525f78822@suse.com>
Date: Mon, 28 Sep 2020 12:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Callers have no business knowing the state of the Xen end of an event
channel.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -933,6 +933,11 @@ int evtchn_status(evtchn_status_t *statu
     }
 
     chn = evtchn_from_port(d, port);
+    if ( consumer_is_xen(chn) )
+    {
+        rc = -EACCES;
+        goto out;
+    }
 
     rc = xsm_evtchn_status(XSM_TARGET, d, chn);
     if ( rc )


