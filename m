Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58854A5EF1A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911602.1318011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseZa-0005xP-TN; Thu, 13 Mar 2025 09:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911602.1318011; Thu, 13 Mar 2025 09:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseZa-0005uu-QN; Thu, 13 Mar 2025 09:09:50 +0000
Received: by outflank-mailman (input) for mailman id 911602;
 Thu, 13 Mar 2025 09:09:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tseZY-0005um-Vq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:09:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tseZY-000eny-2q;
 Thu, 13 Mar 2025 09:09:48 +0000
Received: from [2a02:8012:3a1:0:f06b:e0c6:4c54:6a31]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tseZY-008RAh-1Y;
 Thu, 13 Mar 2025 09:09:48 +0000
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
	bh=Wq3du6Y6s7sCcH4ejFzU9KjzWJfzWzroFe8RpT9v6Bg=; b=i3suX4vFvI6xW5PnQK5daE4DEL
	YxDYO354XLOnZgbRQEw67MtCt19KZvNdvqey9RftqruRGkLfJZ21UYb86u0fvJk52WXd5KMytNZjZ
	KzZjdIReTp2wFisnmqDb5DGTFwUj+8P3TIb7vaLjU0BmPzpKFxhYUVR7VCu8dazufc+A=;
Message-ID: <d436ecbd-3f8f-4610-95da-3c9868713f4a@xen.org>
Date: Thu, 13 Mar 2025 09:09:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU
 system
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250312135258.1815706-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 12/03/2025 13:52, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> virt_to_maddr and maddr_to_virt are used widely in Xen code. So
> even there is no VMSA in MPU system, we keep the interface in MPU to
> don't change the existing common code.

Typo: I think you mean "to avoid changing".

> 
> In order to do that, move the virt_to_maddr() definition to mmu/mm.h,
> instead for maddr_to_virt() it's more difficult to isolate it under mmu/
> so it will be protected by #ifdef CONFIG_MMU.

I think defining maddr_to_virt() in asm/mm.h for the MMU but not the MPU 
is a bit odd. Can you provide more details on the exact issue?

And if it really can't be solved, then I would rather prefer if both 
virt_to_maddr() and maddr_to_virt() are defined in asm/mm.h for both the 
MPU and MMU because they are related to each other.

Cheers,

-- 
Julien Grall


