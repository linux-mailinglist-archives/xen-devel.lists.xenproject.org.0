Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EDAE37F6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022144.1397874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcGL-0004Ar-TQ; Mon, 23 Jun 2025 08:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022144.1397874; Mon, 23 Jun 2025 08:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcGL-00049S-PP; Mon, 23 Jun 2025 08:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1022144;
 Mon, 23 Jun 2025 08:10:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uTcGK-00049F-Hi
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:10:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTcGH-00G9TQ-2d;
 Mon, 23 Jun 2025 08:10:41 +0000
Received: from [2a02:8012:3a1:0:bd17:6d03:6e6c:1c7e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTcGH-00EPgv-1z;
 Mon, 23 Jun 2025 08:10:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=krBuP0IdZM306p3T4ltfVgSHjY9Q40+rNCfzXEpjTEg=; b=W7eXribMkNQLxXQxcfR393iT3F
	GHvTrqGmn3Ax0n/iQI0OSxWQga4LGSzR/tA7DFqJOD/sC6OLqfepFNKd23azvXr4t7BGAflJV0GO8
	8RekWKaoedRAnwCz21AREST0CUF/3J1YynEkDWPqCZF5v0Puh6dyGWInB/IA3s0gTXnY=;
Message-ID: <6810fc4a-eab3-4b03-a009-b4f359a4e886@xen.org>
Date: Mon, 23 Jun 2025 09:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface as
 per ARM DEN 0057A
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Koichiro Den <den@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-5-den@valinux.co.jp>
 <alpine.DEB.2.22.394.2506221616330.8066@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506221616330.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/06/2025 00:26, Stefano Stabellini wrote:
> On Sun, 22 Jun 2025, Koichiro Den wrote:
  > If so, then we should have a check here and return "not supported" for
> 32-bit callers.

We already have a generic check to confirm 32-bit domain are not using 
the 64-bit convention. See [1]. So no need for a per-call one.

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vsmc.c;h=6081f14ed0c195306029c5aba7309bee44193fa4;hb=HEAD#l272

-- 
Julien Grall


