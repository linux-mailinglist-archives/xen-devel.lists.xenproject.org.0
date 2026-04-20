Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK2fNaL45WlHpwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 11:57:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF69C4291F2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 11:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285558.1566553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5N-0001Fm-Ml; Mon, 20 Apr 2026 09:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285558.1566553; Mon, 20 Apr 2026 09:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5N-0001Dm-K1; Mon, 20 Apr 2026 09:38:33 +0000
Received: by outflank-mailman (input) for mailman id 1285558;
 Mon, 20 Apr 2026 09:38:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e5f415.v1-2562406edfd4437cb382af627caa7011@bounce.vates.tech>)
 id 1wEl5M-0001Dg-He
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:38:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEl5L-00AEIs-QA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:38:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e5f415.v1-2562406edfd4437cb382af627caa7011@bounce.vates.tech>)
 id 69e5f412-5cb7-0a2a0a5109dd-0a2a450a9e6c-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:31 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e5f415.v1-2562406edfd4437cb382af627caa7011@bounce.vates.tech>)
 id 69e5f415-56b3-0a2a450a0019-c602890b5271-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:31 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fzgQs3lJ1zDRT5HY
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:38:29 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 2562406edfd4437cb382af627caa7011; Mon, 20 Apr 2026 09:38:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="julian.vetter@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776677909; x=1776947909;
	bh=QE5mUC97O9np+hjQ/d+sTOK0LSQ1Hp/wQ2SjgL069Qk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=XZRGFnAI38bN9P5WCnMjJrELG/LITRa12DYRre5vuTGYsXct7o7JOGe6EoFPB8US6
	 +C2Mfc89xXZXZ+bdVR3IYX985NL/MSLnGW54+9kcd17hAc7aeCY1Q45+WGbjOVO7ux
	 RyjdVYgPLBHxUfgkifIWgTPRUCUc1rE1dXyKlVzwcV0Paudu6tE3EEQa7xAqEBDowd
	 5utMCQkJtRRcHWFuUAd0XSIt3NHtaOJHrcCv/ijgfmrWo2ZdNG3qWMMVUqYk6gk4mH
	 Vhqt/FjWQvjLdyjt8m5dSrLDHw89IcZYF7JlFowMDTUXXS+L+I4WaD4r+i5KnIYaJe
	 iyC6+zWapJQVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776677909; x=1776938409; i=julian.vetter@vates.tech;
	bh=QE5mUC97O9np+hjQ/d+sTOK0LSQ1Hp/wQ2SjgL069Qk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MuNphuZzYgliH+3rPVvCBNynLpLIH9FzUO0S2pkiQEn1iHVNuI/AFsVUpk/iQxn2e
	 LfSIJnCnxuh+6VQAiWfVRhoOTEHCTaXYzEJRGM+ORNa0N6HmiIRE6ayXImrq5r7fxc
	 r6G+wuoDxftfM7faO3qklULSN8d7NQoUrtTO5Hn6LTVbLxxX1HkAjEie4lqWzs740m
	 tX3rDWgCh57uVQL4mJi2SWEael0DHeiw1PpeUXwOSBfLrFgUs5HAHgkDOffgfJrGv8
	 ne1BgGZ672vcPiqKiDrI4SpIDH7Vp1q/TGrhCdMdfCXIvOTkl9TUyzkloEk3x2G3MS
	 d4o1Cs4Vz20jg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v6=200/3]=20Support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776677908510
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260420093820.825969-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2562406edfd4437cb382af627caa7011?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 09:38:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776677911-80C788B7-73BFD4C6/0/0
X-purgate-type: clean
X-purgate-size: 1241
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.090];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CF69C4291F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jan,
thank you again for your thorough feedback. I have addressed your
comments. I just have one remaining issue. For the temporary MFNs array
I now use a static array, i.e., mfns[IOREQ_NR_PAGES_MAX], with a
IOREQ_NR_PAGES_MAX = DIV_ROUND_UP(HVM_MAX_VCPUS, PAGE_SIZE / sizeof(ioreq_t)).
Is this appropriate? Or should I leave the HVM_MAX_VCPUS out of this and
instead use a fixed constant value? Also for now I haven't taken the
path to permanently store the MFNs as you suggested. I'm not sure, but I
don't think it's really necessary. Since this array will rarely exceed
the size of 2 or 3.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Julian Vetter (3):
  ioreq: switch ioreq page allocation to vmap
  ioreq: Indent ioreq_server_alloc_mfn() body one level deeper
  x86/ioreq: Extend ioreq server to support multiple ioreq pages

 xen/arch/x86/hvm/ioreq.c |  63 ++++++++++++++++---
 xen/common/ioreq.c       | 127 ++++++++++++++++++++++++++-------------
 xen/include/xen/ioreq.h  |  13 +++-
 3 files changed, 151 insertions(+), 52 deletions(-)

-- 
2.53.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


