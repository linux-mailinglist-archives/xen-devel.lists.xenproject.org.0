Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201DBC9CA01
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 19:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176301.1500799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQV4x-0004L6-4O; Tue, 02 Dec 2025 18:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176301.1500799; Tue, 02 Dec 2025 18:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQV4x-0004IR-0u; Tue, 02 Dec 2025 18:26:23 +0000
Received: by outflank-mailman (input) for mailman id 1176301;
 Tue, 02 Dec 2025 18:26:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vQV4w-0004IL-76
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 18:26:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQV4v-003Gga-0Z;
 Tue, 02 Dec 2025 18:26:21 +0000
Received: from [2a02:8012:3a1:0:2026:f832:c2a8:fb4c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQV4u-006V1n-1g;
 Tue, 02 Dec 2025 18:26:21 +0000
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
	bh=q4bronLa0tHH9LcnTjL05f4EhnhgZmXUo79y2Y54kAo=; b=P2RYQhbugtb50di8oBseAGuRFD
	wPC1HaInIbMPvPcxGaKIBM2mRkm15G1C5IbnU0AT+LNSOINcNMn6dPiHcWYevBP6W/Iyr/pAJLpcF
	4eaiVtJTU9HPlkCB3szy8WYZkEkYtOr5YN/7AfT/Y4f6tlgll9J2K71V1j/VAKeQZFa4=;
Message-ID: <b3e97c6a-b93b-424f-a10e-1d3c93afbe35@xen.org>
Date: Tue, 2 Dec 2025 18:26:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
 <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org>
 <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Sorry for the late answer.

On 16/09/2025 11:19, Mykola Kvach wrote:
> On Sat, Sep 13, 2025 at 1:01 AM Julien Grall <julien@xen.org> wrote:
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>>    xen/arch/arm/irq.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>>> index 02ca82c089..17c7ac92b5 100644
>>> --- a/xen/arch/arm/irq.c
>>> +++ b/xen/arch/arm/irq.c
>>> @@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>> AFAIK, we are not using setup_irq() to handle SGIs because they are all
>> static and always enabled. Are you planning to handle dynamic SGIs? If
>> yes, then can you provide more details?As far as I know, there can be at least one “dynamic” SGI in Xen.
> 
> As far as I know, there is at least one “dynamic” SGI in Xen. For
> example, see ffa_notif.c in the functions ffa_notif_init_interrupt
> and ffa_notif_init, which handle initialization of such SGIs.

Bertrand can you comment on this? In particular, do we want the FFA SGIs 
to have the priority of the internal ones?

Cheers,

-- 
Julien Grall


