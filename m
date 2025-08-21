Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519F1B2FFEE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089038.1446734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up858-0002Vd-Cu; Thu, 21 Aug 2025 16:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089038.1446734; Thu, 21 Aug 2025 16:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up858-0002U1-A4; Thu, 21 Aug 2025 16:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1089038;
 Thu, 21 Aug 2025 16:24:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1up856-0002Tt-Og
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:24:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up855-00Gozu-32;
 Thu, 21 Aug 2025 16:24:04 +0000
Received: from [15.248.3.91] (helo=[10.24.67.183])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1up855-00BmB6-2x;
 Thu, 21 Aug 2025 16:24:04 +0000
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
	bh=v/D8RDxiaZ23GgVgrMUBT5uRIp8ISvpRrzKezJufkNo=; b=RuB00EQO7LE8EFovIpoCaTj4aQ
	c16gYOb+WeAKUb8iixrT/PxPvcXQ/wjXrz9sm6WFUivwU1p4UfB/LAQDYuyHd2Gcu2XreLnp7hR/4
	HsLhZa1uMUyzHdnOc4mjuhvx+OUhqKybCqg+219rDuoSqEaeBh2ataOsMkHpt9p1iMlY=;
Message-ID: <3beba113-1f6a-4360-bf18-92bdef6ac8f8@xen.org>
Date: Thu, 21 Aug 2025 17:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] xen/arm: gic: implement helper functions for
 INTID checks
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <51a017aeab39af14ba40ab76b56f317270c7afaa.1754568795.git.leonid_komarianskyi@epam.com>
 <877bywfzvj.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <877bywfzvj.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/08/2025 16:39, Volodymyr Babchuk wrote:
> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
> 
>> Introduced two new helper functions: gic_is_valid_irq and
>> gic_is_shared_irq. The first function helps determine whether an IRQ
>> number is less than the number of lines supported by hardware. The
>> second function additionally checks if the IRQ number falls within the
>> SPI range. Also, updated the appropriate checks to use these new helper
>> functions.
>>
>> The current checks for the real GIC are very similar to those for the
>> vGIC but serve a different purpose. For GIC-related code, the interrupt
>> numbers should be validated based on whether the hardware can operate
>> with such interrupts. On the other hand, for the vGIC, the indexes must
>> also be verified to ensure they are available for a specific domain. The
>> first reason for introducing these helper functions is to avoid
>> potential confusion with vGIC-related checks. The second reason is to
>> consolidate similar code into separate functions, which can be more
>> easily extended by additional conditions, e.g., when implementing
>> extended SPI interrupts.
>>
>> The changes, which replace open-coded checks with the use of the new
>> helper functions, do not introduce any functional changes, as the helper
>> functions follow the current IRQ index verification logic.
>>
>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>
>> ---
>> Changes in V2:
>> - introduced this patch
>> ---
>>   xen/arch/arm/gic.c             | 2 +-
>>   xen/arch/arm/include/asm/gic.h | 9 +++++++++
>>   xen/arch/arm/irq.c             | 2 +-
>>   3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index e80fe0ca24..eb0346a898 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>>   void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>   {
>>       ASSERT(priority <= 0xff);     /* Only 8 bits of priority */
>> -    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that don't exist */
>> +    ASSERT(gic_is_valid_irq(desc->irq));/* Can't route interrupts that don't exist */
>>       ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>>       ASSERT(spin_is_locked(&desc->lock));
>>   
>> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
>> index 541f0eeb80..ac0b7b783e 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
>>   
>>   /* Number of interrupt lines */
>>   extern unsigned int gic_number_lines(void);
>> +static inline bool gic_is_valid_irq(unsigned int irq)
> 
> We need to do something about naming, because this function completely
> ignores presence of LPIs. What I mean, that it will return "false" for
> any LPI, while you can't argue that LPI is a valid interrupt :)
> I understand that this is expected behavior by current callers, but the
> function name is misleading.
> 
> Name like "gic_is_valid_non_lpi()" seems to mouthful, but it is the best
> I can come up with.

AFAIU, there is no interrupt lines for LPIs. So what about 
gic_is_valid_line()?

> 
>> +{
>> +    return irq < gic_number_lines();
>> +}
>> +
>> +static inline bool gic_is_shared_irq(unsigned int irq)
>> +{
>> +    return (irq >= NR_LOCAL_IRQS && gic_is_valid_irq(irq));
> 
> Again, because of misleading name of gic_is_valid_irq() it may seem that
> this function will return "true" for LPIs as well...

Even if we rename gic_is_valid_irq(), the function name would be 
misleading because LPIs are shared. I think it would be better named
gic_is_spi(...);

Cheers,

-- 
Julien Grall


