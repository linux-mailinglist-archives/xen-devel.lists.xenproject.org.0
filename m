Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8BA974F2E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796362.1205916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK9r-00035l-Mn; Wed, 11 Sep 2024 10:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796362.1205916; Wed, 11 Sep 2024 10:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK9r-00033G-JS; Wed, 11 Sep 2024 10:01:07 +0000
Received: by outflank-mailman (input) for mailman id 796362;
 Wed, 11 Sep 2024 10:01:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1soK9q-00033A-Iv
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:01:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1soK9p-0007tf-Hg; Wed, 11 Sep 2024 10:01:05 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1soK9p-00054J-BN; Wed, 11 Sep 2024 10:01:05 +0000
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
	bh=dsKhvNBhUALnWUrPmPzJ6i6IPFMiYXal4PtSSvk6H+c=; b=G0o3s4ODA7AFdCcOV6Y6yBW1t/
	m9tGVaspT+aqI6+hatFTlanJJbZv5yYd1Gwh1iC/xphVoj+5HLx5UDjTdgtDL8oKXvvOsi+6yzZOH
	1Gt2GeiGmUhgP1DoCN23COgK3gEASHGOz10W7ipqzVtOuWNG2pe6Zzg/9blzE9Q8XDNQ=;
Message-ID: <2dc23b55-4ecc-4682-9f8f-ceb43763de4e@xen.org>
Date: Wed, 11 Sep 2024 11:01:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/gicv3: Fix ICH_VTR_EL2.ListRegs mask
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240903122147.2226623-1-michal.orzel@amd.com>
 <024A34D9-7D40-437D-9CC2-2CCC25A5DC57@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <024A34D9-7D40-437D-9CC2-2CCC25A5DC57@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/09/2024 09:49, Bertrand Marquis wrote:
> Hi Michal,
> 
>> On 3 Sep 2024, at 14:21, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> According to GIC spec IHI 0069H.b (12.4.9), the ListRegs field of
>> ICH_VTR_EL2 can have value between 0b00000..0b01111, as there can
>> be maximum 16 LRs (field value + 1). Fix the mask used to extract this
>> value which wrongly assumes there can be 64 (case for GICv2).
>>
>> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Nice finding.

+1. I guess we haven't seen any issue so far because the bits afterwards 
are RES0.

> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Committed.

Cheers,

-- 
Julien Grall


