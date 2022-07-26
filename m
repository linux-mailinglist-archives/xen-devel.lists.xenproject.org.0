Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6958196D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 20:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375652.608109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGP1R-000326-Er; Tue, 26 Jul 2022 18:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375652.608109; Tue, 26 Jul 2022 18:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGP1R-0002yu-BM; Tue, 26 Jul 2022 18:11:09 +0000
Received: by outflank-mailman (input) for mailman id 375652;
 Tue, 26 Jul 2022 18:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGP1Q-0002ym-Ji
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 18:11:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGP1Q-0006kC-B9; Tue, 26 Jul 2022 18:11:08 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGP1Q-0007lB-51; Tue, 26 Jul 2022 18:11:08 +0000
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
	bh=v35Sb7seWJdYScUDX7CES2kRKTJFMczWf6NQ9bdr4bU=; b=ZrZapO6IKbKZ2afNDAv2yna9vk
	Yn7ZwefO0CZ6n2lNfn/ieJE9VISdo4iT5KsAfLom9Ys26ocFd6yTVqyHD8PNrI1LjFPulk4ntsz8l
	4ToPeTpXSeqIDcLI8SensvPewRUmmzNnjKAO5RiDHEajgGqneuDMsXUB7kjnOEmgrCwY=;
Message-ID: <90dea818-accc-5c04-39f3-913ca366a3a9@xen.org>
Date: Tue, 26 Jul 2022 19:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] arm/vgic-v3: fix virq offset in the rank
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Hongda Deng <Hongda.Deng@arm.com>,
 Xen development discussion <xen-devel@lists.xenproject.org>, nd
 <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220715104620.3929121-1-Hongda.Deng@arm.com>
 <b19be266-82f5-eb14-36df-14a5b21b40bc@xen.org>
 <64095CA8-C1FC-4EF1-874C-E3E1962567EA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <64095CA8-C1FC-4EF1-874C-E3E1962567EA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/07/2022 18:54, Luca Fancellu wrote:
> 
> Hi Julien,

Hi Luca,

>>> /* Get the index in the rank */
>>> - offset &= virq & INTERRUPT_RANK_MASK;
>>> + offset = virq & INTERRUPT_RANK_MASK;
>>
>> AFAICT, vgic_fetch_irouter() has the same problem. Can you update it here as well?
> 
> I think that function is ok, because in there we have:
> 
> /* There is exactly 1 vIRQ per IROUTER */
> offset = offset  / NR_BYTES_PER_IROUTER;
> 
> /* Get the index in the rank */
> offset = offset & INTERRUPT_RANK_MASK;
> 
> Which is basically offset = (offset  / NR_BYTES_PER_IROUTER) & INTERRUPT_RANK_MASK;
> 
> Like in the counterpart (updated by this patch) vgic_store_irouter who has:
> 
> /* There is 1 vIRQ per IROUTER */
> virq = offset / NR_BYTES_PER_IROUTER;
> 
> […]
> 
> /* Get the index in the rank */
> offset = virq & INTERRUPT_RANK_MASK;
> 
> Which is the same as above

You are right. So the patch looks correct to me.

Although, I would still like the commit message to be clarified.

Cheers,

-- 
Julien Grall

