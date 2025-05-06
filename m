Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94EDAACBD3
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977810.1364757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLiG-0008F8-VR; Tue, 06 May 2025 17:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977810.1364757; Tue, 06 May 2025 17:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLiG-0008Da-PF; Tue, 06 May 2025 17:04:12 +0000
Received: by outflank-mailman (input) for mailman id 977810;
 Tue, 06 May 2025 17:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkOl=XW=bounce.vates.tech=bounce-md_30504962.681a3e8e.v1-ded5974a2ff842878c883815f8678456@srs-se1.protection.inumbo.net>)
 id 1uCLY9-00058E-FA
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:53:45 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6883d8e-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:53:44 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4ZsPby2618z7064j4
 for <xen-devel@lists.xenproject.org>; Tue,  6 May 2025 16:53:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ded5974a2ff842878c883815f8678456; Tue, 06 May 2025 16:53:34 +0000
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
X-Inumbo-ID: a6883d8e-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1746550414; x=1746820414;
	bh=fItoXDfcJHVJurWCoS7c4R6EdAt4qPJgrbuFX4XZ8VY=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ax6he6nssMtjkNV7M9C7mqrOnGgPCpHfooBVrMF1ESw2dSMbnqBN73O3bFlVwc0L/
	 4sTJhTQIGRrYpGLLvymxUBVIo7Uj9C2008bFFvRxQO8L1lt5rq4p4L9th3aof3JWQd
	 +L55Y9SwYVQ5Z62VfnoDgKh0RdI3WXgBCVdzejMfIL+NirAsh/AxqzI4Ty7LfXhtW8
	 Wix2Hx0VY9LCvUf11rr5t0aM90gOJt+uyNqTa/PI5nLGI77fB/NESHqNNPKewtqp2R
	 dMz/wOUBZ7dVdbzkeL43B2J43hrc1lEp83QXXHYLosIV0PbX3YYEOh6oA5pFMqGjbD
	 rq0PYgc+jyEaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1746550414; x=1746810914; i=teddy.astie@vates.tech;
	bh=fItoXDfcJHVJurWCoS7c4R6EdAt4qPJgrbuFX4XZ8VY=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=w72qnaYs/AwEmfdPdeyaJvHIczOpkIclV5xghStXGFzhrCE2OZTlsSgP2swbZSmOg
	 HwjsKclfGMHB1rH87G/kXA/bqzGcilhJJfUv8wOIt8WLK2wCxCBpLqwUK2honG2HE7
	 KsEdSx3j6q6aBqDxLcIc1osz7dkgSuUpXE+2mqGIX2u3gWh5PVl5ZK7+IHrKUtIQIJ
	 1gfCJzvbBNscgV1zpV6S+lhGuGhAQDeZoVY9UZf7kA8xpWtti2CLCBroqf1dGPPGjI
	 mnmAtc5Iy9KDRme7PjN9m2eKJBkjwciTKp+0r2lux6O8EcH7GvwOIVxyoduyewjnL6
	 YYxpAD4Z90oEg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20Add=20lockdown=20mode?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1746550413366
Message-Id: <28b1d569-2f9a-45b7-9e94-09c9c0d73d20@vates.tech>
To: "Kevin Lampis" <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
References: <20250506162347.1676357-1-kevin.lampis@cloud.com>
In-Reply-To: <20250506162347.1676357-1-kevin.lampis@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ded5974a2ff842878c883815f8678456?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250506:md
Date: Tue, 06 May 2025 16:53:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Kevin,

> The intention of lockdown mode is to prevent attacks from a rogue dom0
> userspace from compromising the system.

Do we consider Dom0 kernel-space as well (thus Dom0 as a whole), or only 
userland, what about privcmd device (which can issue hypercalls) ?

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


