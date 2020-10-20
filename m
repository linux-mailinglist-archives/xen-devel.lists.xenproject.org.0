Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCFD293E28
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9654.25373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsKG-0000ss-Lc; Tue, 20 Oct 2020 14:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9654.25373; Tue, 20 Oct 2020 14:09:20 +0000
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
	id 1kUsKG-0000sT-I7; Tue, 20 Oct 2020 14:09:20 +0000
Received: by outflank-mailman (input) for mailman id 9654;
 Tue, 20 Oct 2020 14:09:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsKF-0000sI-9H
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:09:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c630dad3-4799-4377-bdf2-79302f110b96;
 Tue, 20 Oct 2020 14:09:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17FC8AE09;
 Tue, 20 Oct 2020 14:09:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsKF-0000sI-9H
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:09:19 +0000
X-Inumbo-ID: c630dad3-4799-4377-bdf2-79302f110b96
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c630dad3-4799-4377-bdf2-79302f110b96;
	Tue, 20 Oct 2020 14:09:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603202957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHlxyP/F7gGB3JnsejxTwZrkjVu1g48ZBzUOABAs6/Y=;
	b=JDune0olJKBYxz3oNa5Q4OKvF+6lqD1XXXV2w7i4WOChIGlL/NE0j+H0YGt+sHz9A+UJOC
	tkrCocscQmxWy1M6S0bh/fEITVMIH2vzuKCozSJG90HSiitkOhZfBKFP6vMMLYQwmxDZUg
	zeFj/VNEFQuGXWJ9BZuUcsiscIXqRIE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 17FC8AE09;
	Tue, 20 Oct 2020 14:09:17 +0000 (UTC)
Subject: [PATCH v2 3/8] evtchn: rename and adjust guest_enabled_event()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <119ad32e-91f0-5c1d-c400-de78ab816839@suse.com>
Date: Tue, 20 Oct 2020 16:09:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The function isn't about an "event" in general, but about a vIRQ. The
function also failed to honor global vIRQ-s, instead assuming the caller
would pass vCPU 0 in such a case.

While at it also adjust the
- types the function uses,
- single user to make use of domain_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/cpu/mcheck/vmce.h
+++ b/xen/arch/x86/cpu/mcheck/vmce.h
@@ -5,9 +5,9 @@
 
 int vmce_init(struct cpuinfo_x86 *c);
 
-#define dom0_vmce_enabled() (hardware_domain && hardware_domain->max_vcpus \
-        && hardware_domain->vcpu[0] \
-        && guest_enabled_event(hardware_domain->vcpu[0], VIRQ_MCA))
+#define dom0_vmce_enabled() \
+    (hardware_domain && \
+     evtchn_virq_enabled(domain_vcpu(hardware_domain, 0), VIRQ_MCA))
 
 int unmmap_broken_page(struct domain *d, mfn_t mfn, unsigned long gfn);
 
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -778,9 +778,15 @@ out:
     return ret;
 }
 
-int guest_enabled_event(struct vcpu *v, uint32_t virq)
+bool evtchn_virq_enabled(const struct vcpu *v, unsigned int virq)
 {
-    return ((v != NULL) && (v->virq_to_evtchn[virq] != 0));
+    if ( !v )
+        return false;
+
+    if ( virq_is_global(virq) && v->vcpu_id )
+        v = domain_vcpu(v->domain, 0);
+
+    return v->virq_to_evtchn[virq];
 }
 
 void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -85,8 +85,8 @@ int alloc_unbound_xen_event_channel(
     xen_event_channel_notification_t notification_fn);
 void free_xen_event_channel(struct domain *d, int port);
 
-/* Query if event channel is in use by the guest */
-int guest_enabled_event(struct vcpu *v, uint32_t virq);
+/* Query whether a vIRQ is in use by the guest. */
+bool evtchn_virq_enabled(const struct vcpu *v, unsigned int virq);
 
 /* Notify remote end of a Xen-attached event channel.*/
 void notify_via_xen_event_channel(struct domain *ld, int lport);


