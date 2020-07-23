Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75E22B2EC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydUF-000747-MT; Thu, 23 Jul 2020 15:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydUF-000740-0y
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:50:23 +0000
X-Inumbo-ID: 3735fdda-ccfc-11ea-873e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3735fdda-ccfc-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:50:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E135AC83;
 Thu, 23 Jul 2020 15:50:29 +0000 (UTC)
Subject: [PATCH v3 5/8] evtchn: add compat struct checking for newer sub-ops
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Message-ID: <99e52b76-de0f-13ac-f37a-6e14cd4b566f@suse.com>
Date: Thu, 23 Jul 2020 17:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Various additions to the interface did not get mirrored into the compat
handling machinery. Luckily all additions were done in ways not making
any form of translation necessary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/compat/xlat.c
+++ b/xen/common/compat/xlat.c
@@ -54,6 +54,22 @@ CHECK_evtchn_op;
 #undef xen_evtchn_status
 #undef xen_evtchn_unmask
 
+#define xen_evtchn_expand_array evtchn_expand_array
+CHECK_evtchn_expand_array;
+#undef xen_evtchn_expand_array
+
+#define xen_evtchn_init_control evtchn_init_control
+CHECK_evtchn_init_control;
+#undef xen_evtchn_init_control
+
+#define xen_evtchn_reset evtchn_reset
+CHECK_evtchn_reset;
+#undef xen_evtchn_reset
+
+#define xen_evtchn_set_priority evtchn_set_priority
+CHECK_evtchn_set_priority;
+#undef xen_evtchn_set_priority
+
 #define xen_mmu_update mmu_update
 CHECK_mmu_update;
 #undef xen_mmu_update
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -66,8 +66,12 @@
 ?	evtchn_bind_vcpu		event_channel.h
 ?	evtchn_bind_virq		event_channel.h
 ?	evtchn_close			event_channel.h
+?	evtchn_expand_array		event_channel.h
+?	evtchn_init_control		event_channel.h
 ?	evtchn_op			event_channel.h
+?	evtchn_reset			event_channel.h
 ?	evtchn_send			event_channel.h
+?	evtchn_set_priority		event_channel.h
 ?	evtchn_status			event_channel.h
 ?	evtchn_unmask			event_channel.h
 ?	gnttab_cache_flush		grant_table.h


