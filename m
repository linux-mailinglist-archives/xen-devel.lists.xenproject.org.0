Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2EA123FD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872496.1283463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2px-000567-Pw; Wed, 15 Jan 2025 12:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872496.1283463; Wed, 15 Jan 2025 12:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2px-00054L-Lv; Wed, 15 Jan 2025 12:49:33 +0000
Received: by outflank-mailman (input) for mailman id 872496;
 Wed, 15 Jan 2025 12:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1j5=UH=bounce.vates.tech=bounce-md_30504962.6787aed8.v1-d67a2728358243fda3b10060ba8dc933@srs-se1.protection.inumbo.net>)
 id 1tY2pw-00054F-96
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:49:32 +0000
Received: from mail128-16.atl41.mandrillapp.com
 (mail128-16.atl41.mandrillapp.com [198.2.128.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2902f50a-d33f-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:49:30 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4YY5RX4zmFzRKLksS
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:49:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d67a2728358243fda3b10060ba8dc933; Wed, 15 Jan 2025 12:49:28 +0000
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
X-Inumbo-ID: 2902f50a-d33f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736945368; x=1737205868;
	bh=ouzQwij4o4a18W/BqmyqWTKXE0e0aWIWkzIz4grj4Os=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HmGKtOKe2WOlb6kUZ9gd1U/0l2dr47X+iEtn1h6PXbcc7F6SPGuTqYWJEetDfHKfe
	 fmrRDfnIsUtMZuarq69TWZzUNg+ddurUX87zrnGRe+RlgUI3OM+Jjgnx7MgqXkxOxY
	 s6AFiXuDhmPAoG0Xe29wEe2qJfBfy3i5asnW6ET0InxmB6XKT+Zmzyd93OitYJOVOI
	 mFu2u4SyfiO0fMEVg7TOITR+xI67Tjgv2khHpg0VHoZzmeDimcs2sb08rMUKtPlHFG
	 BSvAwfc6JpNmzupLvkU/hMJn6EPRuakypVmjFFr1FvZ1soapon89BElIqovPpUGg1i
	 iLtHSxgKpSPWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736945368; x=1737205868; i=yann.dirson@vates.tech;
	bh=ouzQwij4o4a18W/BqmyqWTKXE0e0aWIWkzIz4grj4Os=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Te3PADkbbnsLhmcbzasLscufaFtGp+DcnbnJqUHTSFMjoltLsIpVW05VPvME3VIa/
	 NhlkJ7QKrlxjvp7AE0IR60jlDhj8TiIMVCcSW334EsfznazY3WL0rfBGpBKZBXytF9
	 0MMaQLkx8bnY25WsxYBhOFVFX5+r0uW5+xksA10v2U0Ht+d0EJxlaOTjJYbEmLIHPB
	 yT1WcbksXNSn5LQDhzku2RjabuS+S9XUzavgn9FALd7g6RhzFd3PdkRmP58fXd+gjX
	 yk7caiBo0GLf3ASmz4GJCzWcAq4teGwpmM1V4T24T8ZFz0pdb+3F+I5Pa0/qorT4gO
	 zxUZMQdQbGt4g==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/3]=20xen:=20common:=20add=20ability=20to=20enable=20stack=20protector?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736945367490
Message-Id: <b90911b1-88c5-48df-89ca-d1ee755d01a2@vates.tech>
To: "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com> <20241211020424.401614-3-volodymyr_babchuk@epam.com>
In-Reply-To: <20241211020424.401614-3-volodymyr_babchuk@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d67a2728358243fda3b10060ba8dc933?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:49:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/11/24 03:04, Volodymyr Babchuk wrote:
> +menu "Compiler options"
> +
> +config STACK_PROTECTOR
> +	bool "Stack protector"
> +	depends on HAS_STACK_PROTECTOR
> +	help
> +	  Enable the Stack Protector compiler hardening option. This inserts a
> +	  canary value in the stack frame of functions, and performs an integrity
> +	  check on exit.
> +
> +endmenu
> +

Since the previous patch lets room for other components to add Stack 
Protector support, wouldn't it be useful to make it more obvious what 
the scope of this option is?



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

