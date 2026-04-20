Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMecD11G5mk+uAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:29:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A442E38F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286246.1567351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqYo-0004vn-8n; Mon, 20 Apr 2026 15:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286246.1567351; Mon, 20 Apr 2026 15:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqYo-0004ss-5q; Mon, 20 Apr 2026 15:29:18 +0000
Received: by outflank-mailman (input) for mailman id 1286246;
 Mon, 20 Apr 2026 15:29:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e6464a.v1-2d3ff4bb5334467fb90e2e3739eaca1c@bounce.vates.tech>)
 id 1wEqYm-0004sm-Nj
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:29:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqYm-00BQx7-4m
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:29:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e6464a.v1-2d3ff4bb5334467fb90e2e3739eaca1c@bounce.vates.tech>)
 id 69e64643-2eae-0a2a0a5409dd-0a2a4508acb2-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:29:16 +0200
Received: from [198.2.187.30] (helo=mail187-30.suw11.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e6464a.v1-2d3ff4bb5334467fb90e2e3739eaca1c@bounce.vates.tech>)
 id 69e6464a-63b5-0a2a45080019-c602bb1e1bfd-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:29:15 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-30.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fzqCZ3szMzP0Jn2l
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:29:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2d3ff4bb5334467fb90e2e3739eaca1c; Mon, 20 Apr 2026 15:29:14 +0000
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
	s=mte1; t=1776698954; x=1776968954;
	bh=zrDGop4vqMVPetlkme5uH9vCu0jZJzVmxo6QNeagp3c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sfJVELw4+A8zgB5OB6zjspix4q4Bp5XVqxcMCVxFbnKDkp7uTjCxlyJoT3qGP0ovG
	 9IsAdtypw/w0f1lNQWSENnarRo63ytJvqlSpYntMQuDEBi0HVxKPijawBTiNKzVKuG
	 Wxrr5bwxcL8GKSAoqml3vELO/IsR20U3HwLybhidJ/eRpsUFdfGybIr4qarQ1nZfYJ
	 hsxFZleCEjAnCtjpqN8WuMpzayxpoeOtskRG+EqimulGh+SHivHz7JoH9RAn+im1JQ
	 ZvAEyq8n3jriLHaQzA+nI6XJiV3dY2SfiJXDM7bhzZvKqKERxb6Hg8yJIh7KS3wHXe
	 DgRkcZO0zxCCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776698954; x=1776959454; i=yann.sionneau@vates.tech;
	bh=zrDGop4vqMVPetlkme5uH9vCu0jZJzVmxo6QNeagp3c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CnD9fh5WTIOMfkyn2yuq0Muyz145oTN8KsOsxJE4QZANwt/Fae/R68zIOI6O2QXu4
	 K2cuR2pI8I6QxTSpZrqMbgeL2vtSsih6vASAz85BnWIk8GRrxQsMmQLizamigxoS1x
	 n1OX5OCULTZREpZxWYxGmBBmXTLPaMq5JyOlQ2Sm5eMfR1dH/hxRJCElfioFklLq1e
	 TyzLQabmP6Qo3uavO7igzXMooQSqka6rFW7eOK6YAUQAj8Voigl36ajIKK3TWHTkK3
	 Oig3IGPI9i/558cSSLNQUe4PLYU0kTEwPhfQ4HE+ct7TEBwwl0loIQ937V61u+sxIT
	 V1XyGwf1BoqGA==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/8]=20xen/arm:=20Implement=20p2m=5Fset=5Fentry=20for=20MPU=20systems?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776698952944
Message-Id: <6cb62e24-54e2-4ae8-823f-8cc37af9c224@vates.tech>
To: "Luca Fancellu" <Luca.Fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, "Penny Zheng" <Penny.Zheng@arm.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <Bertrand.Marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Wei Chen" <Wei.Chen@arm.com>, "Hari Limaye" <Hari.Limaye@arm.com>, "Harry Ramsey" <Harry.Ramsey@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com> <20260420142524.1804073-2-luca.fancellu@arm.com> <758d9182-aa50-4c60-9834-bf8136c4ef3d@vates.tech> <9D8E2C9A-FAA4-49C4-BABB-968B61314B90@arm.com>
In-Reply-To: <9D8E2C9A-FAA4-49C4-BABB-968B61314B90@arm.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2d3ff4bb5334467fb90e2e3739eaca1c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 15:29:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1776698956-C1161DB1-A9DBF543/0/0
X-purgate-type: clean
X-purgate-size: 1042
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[yann.sionneau@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Wei.Chen@arm.com,m:Hari.Limaye@arm.com,m:Harry.Ramsey@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.sionneau@vates.tech,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.463];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DC3A442E38F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 17:28, Luca Fancellu wrote:
> Hi Yann,
> 
>> On 20 Apr 2026, at 16:23, Yann Sionneau <yann.sionneau@vates.tech> wrote=
:
>>
>> On 4/20/26 16:27, Luca Fancellu wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> Implement the function `p2m_set_entry`, which is responsible for
>>> inserting a new entry into the p2m tables, for MPU systems.
>>>
>> Hello Luca,
>>
>> It seems this patch does not apply on master if I'm not mistaken.
> 
> This serie applies on top of these patches:
> https://patchwork.kernel.org/project/xen-devel/list/?series=3D1083371
> 
> In the cover letter I wrote:
> 
> ```
> [=E2=80=A6]
> The serie is based on another serie in the mailing list: "Fifth MPU Serie=
s".
> [=E2=80=A6]
> ```
> 
> Cheers,
> Luca
> 
> 

Oopsy, sorry for the noise, I checked but ... it seems I did not read 
the cover letter carefully enough :)

Regards,

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




