Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4302BA508
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 09:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31743.62384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg25R-0005LQ-2N; Fri, 20 Nov 2020 08:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31743.62384; Fri, 20 Nov 2020 08:48:09 +0000
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
	id 1kg25Q-0005L1-Uy; Fri, 20 Nov 2020 08:48:08 +0000
Received: by outflank-mailman (input) for mailman id 31743;
 Fri, 20 Nov 2020 08:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg25P-0005Kw-C1
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:48:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f37ee631-3b8d-4940-a183-8d063e4770dc;
 Fri, 20 Nov 2020 08:48:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B81B8ACBA;
 Fri, 20 Nov 2020 08:48:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg25P-0005Kw-C1
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:48:07 +0000
X-Inumbo-ID: f37ee631-3b8d-4940-a183-8d063e4770dc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f37ee631-3b8d-4940-a183-8d063e4770dc;
	Fri, 20 Nov 2020 08:48:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605862085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=juElUg37bsElSjbjjv5bDRG8N72xCiELmwQbZh98AjY=;
	b=ivI1v+0FkW+ps6TCHn0BtXmweKKX+llG8m3JtExQ03ManK+ZChL7ZC7Wtb2sYWeRAyHc5s
	JCTV5kiDUCQChMLCsedzm5b2n9kmecZmX0dUHFREH5+oMSGfwkQ7mXCgFZ1DytzUtgy5w3
	b98h5R2xjyua1IZx/+uJ2H/y/uboytw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B81B8ACBA;
	Fri, 20 Nov 2020 08:48:05 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/IRQ: drop two unused variables
Message-ID: <75d17df8-706b-08e5-b839-33ed1ce44bf3@suse.com>
Date: Fri, 20 Nov 2020 09:48:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I didn't bother figuring which commit(s) should have deleted them while
removing their last uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1402,7 +1402,6 @@ void desc_guest_eoi(struct irq_desc *des
 {
     irq_guest_action_t *action;
     cpumask_t           cpu_eoi_map;
-    int                 irq;
 
     if ( !(desc->status & IRQ_GUEST) )
     {
@@ -1411,7 +1410,6 @@ void desc_guest_eoi(struct irq_desc *des
     }
 
     action = (irq_guest_action_t *)desc->action;
-    irq = desc - irq_desc;
 
     if ( unlikely(!test_and_clear_bool(pirq->masked)) ||
          unlikely(--action->in_flight != 0) )
@@ -1663,13 +1661,11 @@ int pirq_guest_bind(struct vcpu *v, stru
 static irq_guest_action_t *__pirq_guest_unbind(
     struct domain *d, struct pirq *pirq, struct irq_desc *desc)
 {
-    unsigned int        irq;
     irq_guest_action_t *action;
     cpumask_t           cpu_eoi_map;
     int                 i;
 
     action = (irq_guest_action_t *)desc->action;
-    irq = desc - irq_desc;
 
     if ( unlikely(action == NULL) )
     {

