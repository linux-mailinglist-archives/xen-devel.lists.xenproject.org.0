Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3834A73403
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929383.1332010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnyI-0001Ef-29; Thu, 27 Mar 2025 14:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929383.1332010; Thu, 27 Mar 2025 14:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnyH-0001Cf-Vm; Thu, 27 Mar 2025 14:12:37 +0000
Received: by outflank-mailman (input) for mailman id 929383;
 Thu, 27 Mar 2025 14:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwmD=WO=bounce.vates.tech=bounce-md_30504962.67e55ccc.v1-b67d07b3874d4e8999d0f32c8c847b9b@srs-se1.protection.inumbo.net>)
 id 1txnyF-0001CE-HN
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:12:35 +0000
Received: from mail133-26.atl131.mandrillapp.com
 (mail133-26.atl131.mandrillapp.com [198.2.133.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845b90b2-0b15-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 15:12:29 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-26.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZNlwX2qwtzKsbNVh
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 14:12:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b67d07b3874d4e8999d0f32c8c847b9b; Thu, 27 Mar 2025 14:12:28 +0000
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
X-Inumbo-ID: 845b90b2-0b15-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743084748; x=1743354748;
	bh=Ier6FjZvBD+LLBVf8D2hJQZeOU3HJ0lbuROWkezwWpA=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=l5VWCyurLvzGAFikT3w5N6SaOcFACcouGAyoL0RCWJZlXGcu4MInFLZYm/rY4WjVr
	 z9fEjrfAHiLRGTb3KzNMxIMnDc+eJHdlIhBmQOtgh+9RYS+v3j2CahgSA2bMoqefYH
	 THAM+ssVKBy3/FVoT39ZsYco0L6p1hp20DVzvQ9OylxiSRb6uvGjAZufiB2K1WdQ23
	 FQ0XgDjZ6DE1yacuOix9ncRBD+1yhDHM/iPSr4zoQeBAuqFmSTp3uBttxfjLHv/A/q
	 kRNpQw19pyljl5UZK4xjHeDd1Lcj5XVTTxDQARVEdgMK71X7W7mL0DXly/Rt45PQ6h
	 bNLaztdKGHY3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743084748; x=1743345248; i=teddy.astie@vates.tech;
	bh=Ier6FjZvBD+LLBVf8D2hJQZeOU3HJ0lbuROWkezwWpA=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=fiXwhXRx9Ur6wQoB4oXG2nX0veotXH8WoR5Mx08V7qinzZCkc/DdP/b4LnNYs0tAJ
	 a3wMjjijuIudLeI/g2oEVGFUcItKElAo26Fn77ccTTPGj3uYC/WhLOEzUwJw1mdBTz
	 Dqlyq4MIEZed+S15k7+TmdwiyQc6xEEdMcIS5hKbql6PD4HKC3CP0pkw/2st7k+3bh
	 rUagN8YfwRsSUH2xjTu8b8HSqatYQ31F95YFMemakBVaj+Da3nPJpmpqg63nZ617BX
	 HPDnueCkA0QwJlQMiS5j7M2ddaBejzsP58a6ef3Sh2h7ck3p3kP1BFVRklVnmt9u2S
	 Oaer7MtK0srcA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Allocating=20SEV=20C-bit-cleared=20pages=20(without=20relying=20on=20swiotlb)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743084747829
Message-Id: <b16ec2d7-4a84-482f-b875-d7c152facab5@vates.tech>
To: linux-kernel@vger.kernel.org, linux-mm@vger.kernel.org
Cc: Xen-devel <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b67d07b3874d4e8999d0f32c8c847b9b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250327:md
Date: Thu, 27 Mar 2025 14:12:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Linux mailing list !

For porting Linux code to make it work on Xen with AMD-SEV, I need to 
change the allocation of some pages to use "shared pages" (C-bit 
cleared) instead of private pages (C-bit set, which is the default kind) 
as these pages needs to be shared with the hypervisor/Dom0.

Is there a facility to allocate pages with C-bit cleared (and if not 
running under SEV, just allocate a plain page) ? Current Linux code for 
SEV seems to only rely on swiotlb as access to shared page is mostly 
made through DMA-kind devices (e.g virtio or emulated device), but I 
don't think it is the best approach.

Regards
Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

