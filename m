Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oY49EqmY32l6WgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:54:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824740509D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282510.1565087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0hM-000621-Nh; Wed, 15 Apr 2026 13:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282510.1565087; Wed, 15 Apr 2026 13:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0hM-0005zE-Jf; Wed, 15 Apr 2026 13:54:32 +0000
Received: by outflank-mailman (input) for mailman id 1282510;
 Wed, 15 Apr 2026 13:54:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df9361.v1-58b0a3bb1a944e24a0083559f9875d46@bounce.vates.tech>)
 id 1wD0hK-0005mE-Rh
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:54:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0hK-002UaC-75
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:54:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df9361.v1-58b0a3bb1a944e24a0083559f9875d46@bounce.vates.tech>)
 id 69df9895-2eae-0a2a0a5409dd-0a2a4504a5da-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:54:30 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df9361.v1-58b0a3bb1a944e24a0083559f9875d46@bounce.vates.tech>)
 id 69df9894-bb33-0a2a45040019-c602bb01fc7d-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:54:29 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fwhrx69gkzBsbN6V
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 58b0a3bb1a944e24a0083559f9875d46; Wed, 15 Apr 2026 13:32:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259937; x=1776529937;
	bh=cDN1jWQB46rVs3zOCKAJTcEcv7n7xu0idZzLK6Twz+k=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b7YKXzwBRqXevTTdluknHhPQVsV4/0GoTs6tYB6Fl1/uxvl6Il6b+bvwDmz9w4DKS
	 1ASvxd8tvRDh7cED8IQQci6fjhrNwua4ceUfLUM2pgU/fn2GHfIVaqJ3CcMbA7OJdW
	 BeN/oB+VMZf4Ti008he9IbImrciNxrTbbgbhcZBSFOccWu4MpLgCdrjXuzxiKOyzfY
	 8U6HdKOwesVOGC8/Pdw3nHkTT4N4l7S2M/M8ypcTGKnMNkKvtbiyEXd8MIAJ3OBbSU
	 zjnUAAZcXrnZOGxgaIZYMARWpKZyRHXhmmOWdLIdynJVaJJGcFWk+5/7E2JT09klrq
	 ZkLTRqhpZKv9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259937; x=1776520437; i=teddy.astie@vates.tech;
	bh=cDN1jWQB46rVs3zOCKAJTcEcv7n7xu0idZzLK6Twz+k=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KOXLsXqTIZ85Ipkyr+nrJkb5ifofsFfgCVQK8WLLIfkdBHiwZNLwzRy2Jas7SZx+p
	 ZcH2lCfnXHQbV95qHbyn6H1jYqgHgefHdykZDPl2UUsoEnsnezHTh0MR22Hz2S+UAp
	 YcJUeC9PLgawjOn3Zbkl2MyUtjzT5yXfAgAI6U788QAv/Z0a7n9bxh/7/SqIJShNT7
	 lqM4S8si0zgj1+XiMePpZLjZ36qgfPiwGY+yuq7EKfcAwEr0CYU+1ntzeIfCWDJUkb
	 hmlmigMNhcXdun8dQXzWudpPoMmzebfazBzI2qgeE1UTAsb2gzftQp9CaJMeujZYxy
	 KjFAUVnNyuFAg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=203/7]=20common:=20Introduce=20needs=5Ftlb=5Fflush=20vcpu=20field?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259936778
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <76d570a1b444a0bf2308389d9ed8bef8878b0c96.1776259594.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.58b0a3bb1a944e24a0083559f9875d46?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776261270-B112D51B-F48AC452/0/0
X-purgate-type: clean
X-purgate-size: 1892
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.839];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5824740509D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This field is meant to be used to schedule a TLB flush on the vCPU
before waking it up. This field can be set from another vCPU at any
time.

Schedule a TLB flush when the vCPU is migrated to another CPU.
This is needed as the vCPU-related TLB entries may be out of sync
with what happened on another core.

Currently, no architecture use this mechanism, but it is meant to
be used as a way to schedule a TLB flush on the vCPU.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/sched/core.c | 5 +++++
 xen/include/xen/sched.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a57d5dd929..f8e615b3af 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1188,7 +1188,12 @@ static void sched_unit_migrate_finish(struct sched_unit *unit)
 
     /* Wake on new CPU. */
     for_each_sched_unit_vcpu ( unit, v )
+    {
+        if ( old_cpu != new_cpu )
+            /* Migrating to another CPU needs TLB flush */
+            v->needs_tlb_flush = true;
         vcpu_wake(v);
+    }
 }
 
 static bool sched_check_affinity_broken(const struct sched_unit *unit)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 4b8ae21b51..a26c571015 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -224,6 +224,8 @@ struct vcpu
     bool             defer_shutdown;
     /* VCPU is paused following shutdown request (d->is_shutting_down)? */
     bool             paused_for_shutdown;
+    /* VCPU needs its TLB flushed before waking. */
+    bool             needs_tlb_flush;
     /* VCPU need affinity restored */
     uint8_t          affinity_broken;
 #define VCPU_AFFINITY_OVERRIDE    0x01
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


