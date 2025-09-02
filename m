Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF109B40E83
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107411.1457839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXUX-0003rw-B9; Tue, 02 Sep 2025 20:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107411.1457839; Tue, 02 Sep 2025 20:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXUX-0003pt-8b; Tue, 02 Sep 2025 20:20:33 +0000
Received: by outflank-mailman (input) for mailman id 1107411;
 Tue, 02 Sep 2025 20:20:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utXUW-0003pn-Bd
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:20:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utXUV-0033HQ-1q;
 Tue, 02 Sep 2025 20:20:31 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utXUV-00DZLI-1n;
 Tue, 02 Sep 2025 20:20:31 +0000
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
	bh=cavwInxVrptAo+kg5d+eS1AAfpE5abQwXQa8JwJOk4M=; b=cFVZkB4/vPyhLJns/1mfyAZ0Za
	oknJt1pATn1AssFwL1ZfjWNUSzI4LWDWqv33K1663LlQxF/zgqxJF/qikO1KpUOeWlI1y1Ks0iz6Q
	0nqSkpUtqmAaLWNt+ZlWJuwBg5FjXI8oj1XYLDf+aQKgNR+1y55ARps4u2vhqRSmeGHY=;
Message-ID: <fac231ba-3d79-4eaa-9a23-4ae7aebc62f3@xen.org>
Date: Tue, 2 Sep 2025 21:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
 <06ff285f-39d5-4ffd-b842-6d776bb793ac@xen.org>
 <a10ae626-126d-4afc-acce-1e699a9d68e2@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a10ae626-126d-4afc-acce-1e699a9d68e2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Leonid,

On 02/09/2025 18:26, Leonid Komarianskyi wrote:
> Hi Julien,
> 
> Thank you for your review and suggestions.
> 
> On 02.09.25 19:55, Julien Grall wrote:
>> Hi Leonid,
>>
>> On 29/08/2025 17:06, Leonid Komarianskyi wrote:
>>> @@ -782,46 +804,81 @@ static int
>>> __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>>>        {
>>>        case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>>>        case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
>>> +    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
>>>            /* We do not implement security extensions for guests, write
>>> ignore */
>>>            goto write_ignore_32;
>>>        case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
>>> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
>>>            if ( dabt.size != DABT_WORD ) goto bad_width;
>>> -        rank = vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
>>> +        if ( reg >= GICD_ISENABLERnE )
>>> +            rank = vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
>>> +                                        DABT_WORD);
>>> +        else
>>> +            rank = vgic_rank_offset(v, 1, reg - GICD_ISENABLER,
>>> DABT_WORD);
>>
>> While I understand the desire to try to avoid code duplication. I feel
>> this is making the code a lot more complicating and in fact riskier
>> because...
>>
>>>            if ( rank == NULL ) goto write_ignore;
>>>            vgic_lock_rank(v, rank, flags);
>>>            tr = rank->ienable;
>>>            vreg_reg32_setbits(&rank->ienable, r, info);
>>> -        vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
>>> +        if ( reg >= GICD_ISENABLERnE )
>>> +            vgic_enable_irqs(v, (rank->ienable) & (~tr),
>>> +                             EXT_RANK_IDX2NUM(rank->index));
>>> +        else
>>> +            vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
>>
>> ... you now have to keep both "if" the same. Unless we can have a
>> version to avoid "ifs" everywhere (maybe using macros), I would rather
>> create a separate funciton to handle eSPIs.
>>
>> Cheers,
>>
> 
> The main idea of V5 of this patch is to consolidate similar code and
> keep the pairs of regular SPIs and their eSPI counterparts in the same
> place to simplify any future modifications of these pairs. If
> eSPI-specific registers are moved to a separate function, it would
> result in code duplication. Additionally, I think it would be easier to
> miss updating the code for one register of the SPI/eSPI pair while
> modifying the code for the other..

I understand your reasoning, but in this case, we need to try to keep 
the code as common as possible and reduce the number of ifs. Looking at 
the patch again, we seem to often use "EXT_RANK_IDX2NUM(rank->index)"
and this is why we have the second "if", for instance here. I think it 
would be preferable if "index" store the proper value.

An alternative would be to process the 3rd parameters separately.

The next big one to takle is:

if ( reg >= ... )
    vgic_ext_rank_...(...)
else
    vgic_rank(...)

Ideally I would like to provide an helper that can figure out whether 
this is an eSPI or not. Looking at the pattern, I think we would 
introduce a new helper which rather than taking a relative offset take 
the reg offset, the base for SPIs and the base for eSPIs.

Cheers,

-- 
Julien Grall


