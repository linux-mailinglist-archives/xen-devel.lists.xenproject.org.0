Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29AC27AC61
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:01:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMquf-0005lV-FJ; Mon, 28 Sep 2020 11:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMque-0005lK-Cn
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:01:44 +0000
X-Inumbo-ID: 726871cb-ce63-440d-aab5-dea35f89a6c1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 726871cb-ce63-440d-aab5-dea35f89a6c1;
 Mon, 28 Sep 2020 11:01:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CenzWT0+htNohYcB8mL2GQ4JbyBefC7VjC6YZI9XB+U=;
 b=WaXq3i1g9HUvqVRp+FzE6BIfJ8w1eBx6dEdhiAop3tsEgkutz4My2ymTxxh3nocMyrsVN9
 zwqAzhtoAUayXWtrNOKxS7rpB7VgULlOmKbs+HAAjPGnn/EvGHFzHzyN+njIFEZNAGPKzY
 9RdVbdCD10azjIygnBBIblVvtD4E0pw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9DD5AD82;
 Mon, 28 Sep 2020 11:01:42 +0000 (UTC)
Subject: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last
 queue" information
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com>
Date: Mon, 28 Sep 2020 13:01:42 +0200
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

Both evtchn->priority and evtchn->notify_vcpu_id could, prior to recent
locking adjustments, change behind the back of
evtchn_fifo_set_pending(). Neither the queue's priority nor the vCPU's
vcpu_id fields have similar properties, so they seem better suited for
the purpose. In particular they reflect the respective evtchn fields'
values at the time they were used to determine queue and vCPU.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -246,8 +246,8 @@ static void evtchn_fifo_set_pending(stru
         /* Moved to a different queue? */
         if ( old_q != q )
         {
-            evtchn->last_vcpu_id = evtchn->notify_vcpu_id;
-            evtchn->last_priority = evtchn->priority;
+            evtchn->last_vcpu_id = v->vcpu_id;
+            evtchn->last_priority = q->priority;
 
             spin_unlock_irqrestore(&old_q->lock, flags);
             spin_lock_irqsave(&q->lock, flags);


