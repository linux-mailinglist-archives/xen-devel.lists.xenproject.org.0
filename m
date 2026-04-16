Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIBILEi04Gn5kwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 12:04:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8940CB16
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 12:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283193.1565471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDJaF-0001GY-6a; Thu, 16 Apr 2026 10:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283193.1565471; Thu, 16 Apr 2026 10:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDJaF-0001EC-3I; Thu, 16 Apr 2026 10:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1283193;
 Thu, 16 Apr 2026 10:04:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e0ad9a.v1-d274f2a866104456a30f2c4c29706734@bounce.vates.tech>)
 id 1wDJaD-0001E6-4q
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:04:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDJaC-009FEl-AA
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:04:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e0ad9a.v1-d274f2a866104456a30f2c4c29706734@bounce.vates.tech>)
 id 69e0b423-bab6-0a2a0a5309dd-0a2a4504df9a-46
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 12:04:24 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e0ad9a.v1-d274f2a866104456a30f2c4c29706734@bounce.vates.tech>)
 id 69e0b427-1dec-0a2a45040019-c602bb011ec8-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 12:04:23 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fxCZL1dGSzBscwFR
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:36:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d274f2a866104456a30f2c4c29706734; Thu, 16 Apr 2026 09:36:26 +0000
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
	s=mte1; t=1776332186; x=1776602186;
	bh=XBI41eIb5EU5Imt0X3QJY323Za5K20vqbhiyQsF2MHc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=cRWr7WXnNwYozjPEINg3E5OS0lcDqp7ZeTnf/4ocBGc0Yi3b8oZzDcx4rjO8TEZo6
	 +C8uaSW3RI30R46lLMR+jzOB/VPnlq3oSMeHFky1+3Aj8d+YL0JRgpQ/9QWbHdB6Ya
	 kTlQWg0ENxDDa4dleNr9E5UQ9vMZdwVcxpCi2j87I2gacNsLW3rv/hQTQKUnr8WKql
	 GCjYNW3kcvKwMMpC9EJGC43CJbYBgVH7FBGGrLs1LsVjZq+D+upsFgma7hnKK9S0GA
	 nh54hfQuredN64Z96qMRmKUKyw6OSRTF+F4SllcNbfvx/ah8wv2k4NR9eEU58OQUi8
	 VToQcfL9aZ/EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776332186; x=1776592686; i=teddy.astie@vates.tech;
	bh=XBI41eIb5EU5Imt0X3QJY323Za5K20vqbhiyQsF2MHc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=T3J/JuBolgwiwvEsS3HqPwR1e5LcLf1C6aW6xneZcUwET+zeTj0wGn6KP85BFc8N1
	 +qOzySUgBnteg7s3Wkpq36afJqbLBWFAURGg1jyBEojVHj2Hme1TjYLNpeLkE6jKcZ
	 S8F7YYCpAM58+09KMChJl9JzGTL9PEL7SZbQab1J8oDHH2+o0C4vQtq+lEVCGV8LKt
	 SQiwG9GI6yLtl8X/qq5ADhFjz1oTi389zzuYzzBT7zAuxE844aQHpU7GamR4xLBYMB
	 2Iu02RszTH39pPpvjMb5Ik2kPhKsqoinqXSABUXw+wdkq45PVJBKUVp3OoTdpwlXZy
	 y8gGpe34lmHcg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20x86/vmx:=20Avoid=20pausing=20on=20HVM=5FPARAM=5FIDENT=5FPT=20in=20additional=20cases?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776332185305
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <10315bf1a012edf4821f7386b3142e56b6c23e34.1776332054.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d274f2a866104456a30f2c4c29706734?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260416:md
Date: Thu, 16 Apr 2026 09:36:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776333864-293773FF-E3D5F8CB/0/0
X-purgate-type: clean
X-purgate-size: 1205
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.741];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4FD8940CB16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
- there is no vcpu
- unrestricted guest capability is used

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - rebased patches with staging

 xen/arch/x86/hvm/hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4a81afce02..61871dbd3e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4237,11 +4237,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
             rc = -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
+        v = domain_vcpu(d, 0);
+
         /*
          * Only actually required for VT-x lacking unrestricted_guest
          * capabilities.  Short circuit the pause if possible.
          */
-        if ( paging_mode_shadow(d) || !using_vmx() )
+        if ( paging_mode_shadow(d) || !using_vmx() || !v || vmx_unrestricted_guest(v)  )
         {
             d->arch.hvm.params[index] = value;
             break;
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


