Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90292E979
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757486.1166452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtoP-0006PQ-8b; Thu, 11 Jul 2024 13:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757486.1166452; Thu, 11 Jul 2024 13:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtoP-0006Mv-5W; Thu, 11 Jul 2024 13:26:17 +0000
Received: by outflank-mailman (input) for mailman id 757486;
 Thu, 11 Jul 2024 13:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw7m=OL=bounce.vates.tech=bounce-md_30504962.668fdd75.v1-6142b93e9f1d4ab39d1c0bc4022d058d@srs-se1.protection.inumbo.net>)
 id 1sRtoO-0006Mp-7T
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:26:16 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 253926e7-3f89-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:26:14 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKb8j2RMjzB5pVJW
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 13:26:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6142b93e9f1d4ab39d1c0bc4022d058d; Thu, 11 Jul 2024 13:26:13 +0000
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
X-Inumbo-ID: 253926e7-3f89-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720704373; x=1720964873;
	bh=9LN5ChWi/SQ67mcN5TxeH1Qu81Y0RZwu1qFXqq0uDWY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YOAwmVz3dAfGfXBdpjAc7WOOoVYbwtaKJQVf45fDc+9eglbbpEqHiAEEYkfp4/L6N
	 a+aF27paPpL60tk2ASk0r+7qx/dgdeClpbthqYpP18npn7uPi15LqhL7zhTcHnDcM7
	 0dukIbxhPb0mxiWB+3MZ5nQSCK1MJWcw6TXWCjh3zLrP671XCA1sUS147fCVLP8dSQ
	 Q3e2DOYxdkQG7t5kV6qb7RJkG3UFAWkDy/Xs5m32886n09wCa1K/ZoH0t2EcyXlgdK
	 0P0niikx+f/oewZmXHY7Dx8nr2vltz3cGRGPkaeEuwxMRZY9v6ihEzNdAPYuR5jYCm
	 ddMDX8R12XxcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720704373; x=1720964873; i=anthony.perard@vates.tech;
	bh=9LN5ChWi/SQ67mcN5TxeH1Qu81Y0RZwu1qFXqq0uDWY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bsmYsbBeo4pRXLRk1zBhxeKOm5MyBx00FAKUXU2tXrE3JtP93yrPxHkvlGQANixve
	 /JCgAZwtmoZQuCL12W3p+fO+3WOMrSCiVSwdjNbsV/FrTnYymXBsjmKYCdPfP9CMGH
	 ZTyOL8Gn5QJda+AsA8pJZEPZjA07f6gwVZsAIkUf5z0tAoLhoUhk3RbTk+uVs2cBmv
	 5Ior5UjtjpW95exUivUkdGzOjuRG6UvMnT5oeVSYZ4GZqi4sDfiEHchjJW3BrWsJcb
	 27R6Xnb5VfjquBV+QKkjvO/1uUxECo4H8poKuZ8Eh1CRBA19NKSvalBYb4RFRJPfvG
	 QzoRZBau0cPMA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2005/12]=20CI:=20Drop=20Ubuntu=20Trusty=20testing?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720704371723
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/dc4gwBjNF49i4@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-6-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-6-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6142b93e9f1d4ab39d1c0bc4022d058d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 13:26:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:10PM +0100, Andrew Cooper wrote:
> This is also End of Life.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

