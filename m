Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5028950E2C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 22:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776612.1186772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdyUj-0005yV-8r; Tue, 13 Aug 2024 20:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776612.1186772; Tue, 13 Aug 2024 20:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdyUj-0005wS-4y; Tue, 13 Aug 2024 20:51:53 +0000
Received: by outflank-mailman (input) for mailman id 776612;
 Tue, 13 Aug 2024 20:51:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sdyUi-0005wM-98
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 20:51:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdyUg-0006u5-U3; Tue, 13 Aug 2024 20:51:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdyUg-0006dp-MM; Tue, 13 Aug 2024 20:51:50 +0000
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
	bh=kTfvASH6EAdkYsieFrVr8PxoW0IWuVb+/uvg/w1zBy4=; b=Kw0i9KQrewbGGMWGObKm1gBUzt
	wXDBo9QAVGGRcVytzlUBRZjqxxVeXcne7nmXcNixJb0Ju1kMxBhOiLUQ2UbLPXNA5tZTYwSBvRhjH
	/5/SIQl/fYVaCiWX5yKjjvkfnMozmcVBRV46JyU2P32a0YsQ+I9uav5RMIv7GYzRIEb4=;
Message-ID: <53f4c996-0034-47b5-ac7b-5fcf6d966012@xen.org>
Date: Tue, 13 Aug 2024 21:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Arm: correct FIXADDR_TOP
To: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <5b097aa2-7ced-4971-bd6e-96618bb6f2df@suse.com>
 <42b02774-c941-4903-be74-d58bf6b93b81@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <42b02774-c941-4903-be74-d58bf6b93b81@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/08/2024 12:57, Michal Orzel wrote:
> 
> 
> On 13/08/2024 13:49, Jan Beulich wrote:
>>
>>
>> While reviewing a RISC-V patch cloning the Arm code, I noticed an
>> off-by-1 here: FIX_PMAP_{BEGIN,END} being an inclusive range and
>> FIX_LAST being the same as FIX_PMAP_END, FIXADDR_TOP cannot derive from
>> FIX_LAST alone, or else the BUG_ON() in virt_to_fix() would trigger if
>> FIX_PMAP_END ended up being used.
>>
>> While touching this area also add a check for fixmap and boot FDT area
>> to not only not overlap, but to have at least one (unmapped) page in
>> between.
>>
>> Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Committed.

Cheers,

-- 
Julien Grall

