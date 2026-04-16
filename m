Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBldMUsF4WkuogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:50:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0D4113B2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283737.1565876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOyz-0000Xe-9e; Thu, 16 Apr 2026 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283737.1565876; Thu, 16 Apr 2026 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOyz-0000V2-6v; Thu, 16 Apr 2026 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1283737;
 Thu, 16 Apr 2026 15:50:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e10539.v1-85e8c2739d4043d4abe69bf7fc95e86c@bounce.vates.tech>)
 id 1wDOyy-0000Uu-3g
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:50:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOyx-006MIj-GT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:50:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e10539.v1-85e8c2739d4043d4abe69bf7fc95e86c@bounce.vates.tech>)
 id 69e1052c-e002-0a2a0a5209dd-0a2a450baad6-42
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:50:19 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e10539.v1-85e8c2739d4043d4abe69bf7fc95e86c@bounce.vates.tech>)
 id 69e10539-212f-0a2a450b0019-c602890b188d-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:50:19 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fxMsj33pYzDRSZM5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:50:17 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 85e8c2739d4043d4abe69bf7fc95e86c; Thu, 16 Apr 2026 15:50:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776354617; x=1776624617;
	bh=yNzeAHDQtjP0qF/KOsIk4v0+tmx3LTDv5o5PUVahFG0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FUTGnUmBPYcKl5Px7q4IhntcTTtjufZebQ6/9HQtLVUBr6ZDDA5IzmKaamV5gt7Ja
	 ye55VABhdeeMvMfpPTVo72Lpfkn6rWlNYyK2OoqCn6O2K4g0MBvYdnd1DbFlkA/pfL
	 MFGQfdOD82vTmKG3vvab1pYRYNvTZ6ohScmVk+nmfYqDAG/fsum+4lWMSNgxi1tG5Q
	 Je2HuEYelnByLJJjoNuGfmLb0q857+d/gYafn3A9pbhnbzJh5FvlMfnpVIamoK2BSz
	 cvmzBACY7nmg+A4m4TU2kc6tcb75CiBus7P3gIULSI8SL1/G92WsQu6Xy2RNiUyAlG
	 BGE0nr0v18r3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776354617; x=1776615117; i=anthony.perard@vates.tech;
	bh=yNzeAHDQtjP0qF/KOsIk4v0+tmx3LTDv5o5PUVahFG0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rCys1Hynnj3LhLzcld0X09/s3muRPSwaXn5abbiUrm70ZwywiSeY0+RYH1GOeLEps
	 pDInwFMdv9fqmLdCgA5sJyFjrekQGsa7gTmTLX/PrJIqgoXH6O6l5E9soGr1qNPasP
	 0t6Ftq0X2zkMZDtj4vMpEPxaxhVNkF7npS0iMbk99FbaihCzYrwoyLciCegW0XKJj2
	 rV/R7vrxCAE+CWzhAhuFWyGfU8sABFgeXfwe6u+A9zecBN21AF2qV6gQI+LI+NxX5D
	 ffnS1vm+TbYYo6j+tm+7E5WrAyveH9Gd3jLwBN9KnVyRp5fhjhSRTyCNwhYBTurfdK
	 4EUcVI1hY9vlw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=202/6]=20CI:=20make=20test-artifacts=20repo/branch/job=20customizable?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776354616209
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <aeEFNz_yebXqgyoi@l14>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com> <2d5d25d864058dcd9d139fd2115b88f82ba12424.1774999414.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <2d5d25d864058dcd9d139fd2115b88f82ba12424.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.85e8c2739d4043d4abe69bf7fc95e86c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260416:md
Date: Thu, 16 Apr 2026 15:50:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1776354619-7D56BF3B-926FE146/0/0
X-purgate-type: clean
X-purgate-size: 940
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.713];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 77D0D4113B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:24:51AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Allow choosing which artifacts branch and job to use for Linux. This
> allows running the same tests for different Linux versions, without
> duplicating a lot of yaml sections.
> 
> Similarly, make the repo path itself configurable too. The main purpose
> is to ensure the test pipeline triggered from any repo will fetch linux
> artifact from the right repo. But with a minor change of using that
> variable for rootfs and microcode artifacts too, it allows testing
> test-artifacts repo changes without needing to modify gitlab-ci.yml in
> xen.git at all.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



