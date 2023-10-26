Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B327D7EA1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623597.971583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvuU-0005JA-Bo; Thu, 26 Oct 2023 08:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623597.971583; Thu, 26 Oct 2023 08:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvuU-0005HV-8h; Thu, 26 Oct 2023 08:40:10 +0000
Received: by outflank-mailman (input) for mailman id 623597;
 Thu, 26 Oct 2023 08:40:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvvuS-0005HP-UA
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:40:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvvuS-0005g4-NG; Thu, 26 Oct 2023 08:40:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvvuS-00030J-IA; Thu, 26 Oct 2023 08:40:08 +0000
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
	bh=ALYKZ0Csqj7MRVAlh6QuhdWSOl74qWJdyWx0jcYBKtg=; b=ul28d0HEfpps/sKsqTlmo5XW6q
	MZwhKJzy7eLSklPbId8s0pLH7tba7ATTBF6M5g2ChfNRRH/fxgZS2oIef/xnQP8aV7030hYouxZRK
	W/oMzA+8+0hRC8oYPbrXG6Xyg6r08SsXcOmrhH30s/D/YODZuK8sYop5+DnF7Io6BPwc=;
Message-ID: <12be1b5e-2bdc-49bc-aeea-3372291ced8a@xen.org>
Date: Thu, 26 Oct 2023 09:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN] xen/arm: arm32: Use adr_l instead of load_paddr for getting
 address of symbols
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com
References: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
 <6c4c8023-1d6b-426d-9c9d-c45f01c9c5d2@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c4c8023-1d6b-426d-9c9d-c45f01c9c5d2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2023 18:59, Michal Orzel wrote:
> Hi Ayan,
> 
> On 25/10/2023 19:03, Ayan Kumar Halder wrote:
>> Before the MMU is turned on, the address returned for any symbol will always be
>> physical address. Thus, one can use adr_l instead of load_paddr.
>>
>> create_table_entry() now takes an extra argument to denote if it is called after
>> the mmu is turned on or not.  If it is called with mmu on, then it uses
>> load_paddr to get the physical address of the page table symbol.
> I wonder if we need this extra complexity.

+1. We used to request the caller to tell whether the MMU is on. But 
this made the code more complex. So I decided to remove it completely.

> Can we just remove load_paddr macro completely (I have a plan to do this for arm64 mmu head.S)
> and open code it in create_table_entry? I don't think there is any benefit in
> having the if/else there to use either load_paddr or adr_l. This function will also go
> into arm32 mmu head.S.

While I was ok (I am not 100% happy) with open-coding load_paddr in 
arm64, I would rather not do it on Arm32 because I still haven't figured 
out whether I would need other use (which could not be replaced with 
adr_l) when fixing the secondary CPU boot code (it is still not
compliant with the Arm Arm).

So the question here is what do we gain by removing load_paddr 
completely? We still need a register allocate for the offset, and the 
macro makes it clearer what's the code is about.

Cheers,

-- 
Julien Grall

