Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIH1BxhF5ml/twEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:24:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0A42E1EF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286209.1567315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqTI-0002q8-QY; Mon, 20 Apr 2026 15:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286209.1567315; Mon, 20 Apr 2026 15:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqTI-0002nB-NH; Mon, 20 Apr 2026 15:23:36 +0000
Received: by outflank-mailman (input) for mailman id 1286209;
 Mon, 20 Apr 2026 15:23:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e644f5.v1-e475ba9a7f064d5c8fc1508f57e39563@bounce.vates.tech>)
 id 1wEqTH-0002n5-SD
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:23:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqTH-007yMB-7O
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:23:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e644f5.v1-e475ba9a7f064d5c8fc1508f57e39563@bounce.vates.tech>)
 id 69e644e1-bab6-0a2a0a5309dd-0a2a4509e296-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:23:35 +0200
Received: from [198.2.187.30] (helo=mail187-30.suw11.mandrillapp.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e644f5.v1-e475ba9a7f064d5c8fc1508f57e39563@bounce.vates.tech>)
 id 69e644f5-2497-0a2a45090019-c602bb1e3ea3-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:23:34 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-30.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fzq513gLRzP0Jn38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:23:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e475ba9a7f064d5c8fc1508f57e39563; Mon, 20 Apr 2026 15:23:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="yann.sionneau@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776698613; x=1776968613;
	bh=kV4yzsjM74GryFLO6SljU6Vf0ow1kzlEiGIXTjrRB0g=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DmTwpQ/n2A8Y56w1O50Q7ku7QY8CkbYePus1hR3X9zLhIrn8lJ+UZoPrNPBf7SV2h
	 /R/abtyzVNMLxLikz2ME0VQgmDVxt2hLIfsICDChPfcRIvT/ndu+ESWeg02F005MPY
	 b+HIvbda2b808Qq+hp1tKom5J8PRDthkn/wNruNKS9uvzZMW70JFfjMYEKixhBCHp4
	 Wnc7wZwtIS2RuTJ+gxG0vifN815UUCTjnsASoD1faRuljAUYBkrQW6lNaPDCCuFTpy
	 U5M8IqTaRz2CJd+g2/BQ1GVZ4aq7ivXrx/14vO3B3GfsvbQaI9og3nyyvM+eRUwmVM
	 jr7/yoXmIPjAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776698613; x=1776959113; i=yann.sionneau@vates.tech;
	bh=kV4yzsjM74GryFLO6SljU6Vf0ow1kzlEiGIXTjrRB0g=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EGX8373pITeAtc5uWisrGxDmYto5IT9qWsWZKScOHyxQ/juvrcvslvQm8mAnc2wDA
	 b0ntm1R7Emt5Rx5MwIDTg4qtpwF6MYk662/Rrp8Sum+LxjvruGYnsERWLaxhdUKvPc
	 AAo1aHThYaPnTfTXM801omoVeZuDobT87WnC9+HhHegk/yeqXE3NqTIynlVZXm3kJA
	 ETtacMx3QYvJsnKH8WWu5wmcB6l93yNbByRPuqrR8Snxu1zi+fEu2sozfUcNeh7Vic
	 wxYbjfcRClpYclsJ/KIn+zrt1m3wMKQ5hchRhoy2vhh4/4RRD0U9Sc79lAXqvL6fpb
	 30jjCSvV/eVUA==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/8]=20xen/arm:=20Implement=20p2m=5Fset=5Fentry=20for=20MPU=20systems?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776698611667
Message-Id: <758d9182-aa50-4c60-9834-bf8136c4ef3d@vates.tech>
To: "Luca Fancellu" <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: "Penny Zheng" <Penny.Zheng@arm.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Wei Chen" <wei.chen@arm.com>, "Hari Limaye" <hari.limaye@arm.com>, "Harry Ramsey" <harry.ramsey@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com> <20260420142524.1804073-2-luca.fancellu@arm.com>
In-Reply-To: <20260420142524.1804073-2-luca.fancellu@arm.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e475ba9a7f064d5c8fc1508f57e39563?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 15:23:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776698614-42971A53-00DBC4D8/0/0
X-purgate-type: clean
X-purgate-size: 444
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yann.sionneau@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.sionneau@vates.tech,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.820];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 84B0A42E1EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 16:27, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Implement the function `p2m_set_entry`, which is responsible for
> inserting a new entry into the p2m tables, for MPU systems.
> 
Hello Luca,

It seems this patch does not apply on master if I'm not mistaken.
Regards,

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



