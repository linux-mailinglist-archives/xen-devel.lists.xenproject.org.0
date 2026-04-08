Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FnxMmoT1mngAwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 10:35:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2793B9232
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 10:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275493.1561286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAONA-0006VV-IC; Wed, 08 Apr 2026 08:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275493.1561286; Wed, 08 Apr 2026 08:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAONA-0006TV-FF; Wed, 08 Apr 2026 08:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1275493;
 Wed, 08 Apr 2026 08:34:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d61328.v1-71da37fbec604bb4a1412d3b56c179dc@bounce.vates.tech>)
 id 1wAON9-0006TP-5t
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 08:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAON8-009DM5-C7
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:34:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d61328.v1-71da37fbec604bb4a1412d3b56c179dc@bounce.vates.tech>)
 id 69d6131c-5cb7-0a2a0a5109dd-0a2a4505862c-32
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 10:34:50 +0200
Received: from [198.2.180.46] (helo=mail180-46.suw31.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d61328.v1-71da37fbec604bb4a1412d3b56c179dc@bounce.vates.tech>)
 id 69d61329-3760-0a2a45050019-c602b42e3004-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 10:34:50 +0200
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-46.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4frGZw5TVNz8XRyK6
 for <xen-devel@lists.xenproject.org>; Wed,  8 Apr 2026 08:34:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 71da37fbec604bb4a1412d3b56c179dc; Wed, 08 Apr 2026 08:34:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775637288; x=1775907288;
	bh=V15Ycdk9jaZJ7+p5Gd4ld56W5KMrZofjseDMn4uinCw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yIZZ9DxNIY4TQwh20gN21UE8RKXrlhr2iNaYiIVs2S3KuVX4DtA0VlBdZNtS0sxcm
	 KuTnNDZXwI1rw9TOMcbBTYHvDAUxjwklvlTGYWlgHPyqvvE34HTkO+uuBt/2RKq1qP
	 CIUu8A2MNIIO81vbsE0YUHEYsx8yn/uCopl3aSF6vvERwi/K/2OEl/FIoE7P7EVdYD
	 LzU+1rV1AQGWESBpr69kTCQ9Nah4jCg3e13fy4HDXW8m8p0t53MRbv8NHJq9V4tQEE
	 yMUfoLwwKr1sBw7dIo2GPzWxZpkopSFj/sOcHn30N+VQsVPmYOB6we6Nm0/PstWVgr
	 GtxobKm5drJ1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775637288; x=1775897788; i=teddy.astie@vates.tech;
	bh=V15Ycdk9jaZJ7+p5Gd4ld56W5KMrZofjseDMn4uinCw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=uyfT7i8Jl5sXFyTNuSFyTYLTM7VcDTfPHjuVSuzL9sZ+r4cdxSUDjvI0DAcQfXrMN
	 Sgc/0X8TQ1llFmAPMOZPiw4o6WehraWlmvL4WO4GM3idLhUiPOHPk3VLBp50Z8VqTa
	 TKNatiOXfWwjE06qREau4I039QkOc/5dZthUfKFhpr82FnmuRiagUQCZn7h0Tjx095
	 yCI7guG7EmcJ27qBYN0OBnSTIXN31zwN7b59tALAYN3sXCMCLk+qbbJFrmTD0zYOyg
	 Od0X8LXOZN7rnofXcC1uFrd+FC6ZkH249mB2yqXpKasJUBPjQ7S6dSnmYYETuzX6q8
	 EcNgSsc6XEZ+Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/emul:=20Remove=20ops->{read,write}=5Fsegment=20checks=20for=20swapgs?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775637287689
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <c29e790caae7642fe442fa68111582ffdb37177c.1775636817.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.71da37fbec604bb4a1412d3b56c179dc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260408:md
Date: Wed, 08 Apr 2026 08:34:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775637290-21B3896F-1106AE6A/0/0
X-purgate-type: clean
X-purgate-size: 1193
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.903];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6E2793B9232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove these checks now that we don't use these 2 ops anymore.

Amends: 4bedbe47eef4f ("x86/emul: Remove fallback path from SWAPGS")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/x86_emulate/0f01.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index 54bd6faf0f..4d36c7d289 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -187,8 +187,7 @@ int x86emul_0f01(struct x86_emulate_state *s,
     case 0xf8: /* swapgs */
         generate_exception_if(!mode_64bit(), X86_EXC_UD);
         generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
-        fail_if(!ops->read_segment || !ops->read_msr ||
-                !ops->write_segment || !ops->write_msr);
+        fail_if(!ops->read_msr || !ops->write_msr);
         if ( (rc = ops->read_msr(MSR_GS_BASE, &sreg.base,
                                  ctxt)) != X86EMUL_OKAY ||
              (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


