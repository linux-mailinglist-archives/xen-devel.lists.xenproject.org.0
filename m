Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC4B2FE46
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088820.1446576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Av-0006tE-5M; Thu, 21 Aug 2025 15:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088820.1446576; Thu, 21 Aug 2025 15:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Au-0006o8-TF; Thu, 21 Aug 2025 15:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1088820;
 Thu, 21 Aug 2025 15:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qver=3B=bounce.vates.tech=bounce-md_30504962.68a73a82.v1-bb370819b5b149d495099cb9f5ca2153@srs-se1.protection.inumbo.net>)
 id 1up7As-0005nU-Pv
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:58 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22aa5e85-7ea3-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:25:58 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bQ578pzBsW3G6
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bb370819b5b149d495099cb9f5ca2153; Thu, 21 Aug 2025 15:25:54 +0000
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
X-Inumbo-ID: 22aa5e85-7ea3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789954; x=1756059954;
	bh=/Czx8f0L7Yqqc5qG+Tcn2zb8zTijEnp/eSv/Biuz900=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WTdQR4K5L6BWIfPcdAWHFo0zZvCS4cAGVXGqbSZRmQgmqt4mLDZ+qxvrQ//3XpzIL
	 j2pdIi5GDO4gEmn+YXMW1NGjeCAfVljMIHyQSXtM4acroEuDLA0p5sIIfYsg2X1uGd
	 9xqP35TTNZqteTbS+5orl0fedIpEnTWcbMPt/rMhDmd7oADFH5Iz446INNDovqrkS8
	 XTIFX+OXvRTe4jx79YVhRzI9JOZxrmdRBYqmGZ7WZrU3HZLJa9lCN5SraG7vMWSpdx
	 odlEYRurFBRA8M0lPVXZgcfm5fJIIuP4vpbrCOtQudGBTNoj4TQY6ZNIXuUX9qm1CM
	 AqbBYevNr4Nlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789954; x=1756050454; i=teddy.astie@vates.tech;
	bh=/Czx8f0L7Yqqc5qG+Tcn2zb8zTijEnp/eSv/Biuz900=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=amLby1t3+xc6rNfVfowZdIU5xG+rg2l/Cq2si2st6wdmErRVoTUjuzzWzYqhINqg4
	 tuO/pScW/vzzwflpVCM8OR2rIBOtCtAz43RY/rJQiOR9OQ9EOyXxWm5TFMJPfwMQAC
	 dkt1j7vTF3UrXgIg3ic47eyuAM8c3Uve5hlDKJCZOmLm6GYydGKWU/en7KMnpl9ct3
	 Bki/KHKQeFv+S6zB5qSXF3Uh1bIFkRLVR/76t86CejQuFW/73ZnDUeBVt992S1OpiD
	 6bFTInLWMKlLpREFgJvnU6G8+nXoUDQg2qpt9Mwdnni1XT+r8TDNuTsfdp70Oo+IZg
	 sw2uxeWbfX+zA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=206/9]=20sched:=20Extract=20do=5Fpoll=20main=20logic=20into=20vcpu=5Fpoll?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789954201
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <812a818e263cb8287634cea5241fe076beacc39f.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bb370819b5b149d495099cb9f5ca2153?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

do_poll takes sched_poll* as parameter, but that's actually in guest memory
(so it's more a guest handle). Split its copy from/to guest logic from
the main logic, so that we have a separate vcpu_poll which takes the sched_poll
parameters directly.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/sched/core.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 13fdf57e57..b2c784c60e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1437,21 +1437,13 @@ static void vcpu_block_enable_events(void)
     vcpu_block();
 }
 
-static long do_poll(const struct sched_poll *sched_poll)
+static long vcpu_poll(unsigned int nr_ports, uint64_t timeout, evtchn_port_t *ports)
 {
     struct vcpu   *v = current;
     struct domain *d = v->domain;
-    evtchn_port_t  port = 0;
     long           rc;
     unsigned int   i;
 
-    /* Fairly arbitrary limit. */
-    if ( sched_poll->nr_ports > 128 )
-        return -EINVAL;
-
-    if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
-        return -EFAULT;
-
     set_bit(_VPF_blocked, &v->pause_flags);
     v->poll_evtchn = -1;
     set_bit(v->vcpu_id, d->poll_mask);
@@ -1478,13 +1470,9 @@ static long do_poll(const struct sched_poll *sched_poll)
     if ( local_events_need_delivery() )
         goto out;
 
-    for ( i = 0; i < sched_poll->nr_ports; i++ )
+    for ( i = 0; i < nr_ports; i++ )
     {
-        rc = -EFAULT;
-        if ( __copy_from_guest_offset(&port, sched_poll->ports, i, 1) )
-            goto out;
-
-        rc = evtchn_port_poll(d, port);
+        rc = evtchn_port_poll(d, ports[i]);
         if ( rc )
         {
             if ( rc > 0 )
@@ -1493,11 +1481,11 @@ static long do_poll(const struct sched_poll *sched_poll)
         }
     }
 
-    if ( sched_poll->nr_ports == 1 )
-        v->poll_evtchn = port;
+    if ( nr_ports == 1 )
+        v->poll_evtchn = ports[0];
 
-    if ( sched_poll->timeout != 0 )
-        set_timer(&v->poll_timer, sched_poll->timeout);
+    if ( timeout != 0 )
+        set_timer(&v->poll_timer, timeout);
 
     TRACE_TIME(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
@@ -1511,6 +1499,20 @@ static long do_poll(const struct sched_poll *sched_poll)
     return rc;
 }
 
+static long do_poll(struct sched_poll *sched_poll)
+{
+    evtchn_port_t ports[128];
+
+    /* Fairly arbitrary limit */
+    if ( sched_poll->nr_ports > 128 )
+        return -EINVAL;
+
+    if ( copy_from_guest(ports, sched_poll->ports, sched_poll->nr_ports) )
+        return -EFAULT;
+
+    return vcpu_poll(sched_poll->nr_ports, sched_poll->timeout, ports);
+}
+
 /* Voluntarily yield the processor for this allocation. */
 long vcpu_yield(void)
 {
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


