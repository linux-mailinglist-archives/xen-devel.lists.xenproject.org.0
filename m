Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B130E782EF1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 18:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587754.919143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8FF-000554-AW; Mon, 21 Aug 2023 16:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587754.919143; Mon, 21 Aug 2023 16:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8FF-00052m-7W; Mon, 21 Aug 2023 16:59:13 +0000
Received: by outflank-mailman (input) for mailman id 587754;
 Mon, 21 Aug 2023 16:59:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY8FD-00052g-PP
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 16:59:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8FC-00040g-U7; Mon, 21 Aug 2023 16:59:10 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8FC-0003vU-No; Mon, 21 Aug 2023 16:59:10 +0000
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
	bh=sm96LL/Ueuw7bpfF5KoaNjdtAjMXB9S5tqnKzZvLavc=; b=RGQFogqdy7Gt5vuyAPstEbn0aZ
	RFDugCbX4h1Fag76Y89RVSDQQX4pPjlMS4CEynEPTXVu2VIi8ENHt1Jn9jICi5cbK28Cn2AkNVjrX
	bQRnf6AsV31kGZg1rMbOMCw6G2IdQ51jEv7lPYTcuLUB9a/Ho5it+uhqM3MF7gj3G0U0=;
Message-ID: <42d720af-f0fd-4c05-8637-05bf16dfeed1@xen.org>
Date: Mon, 21 Aug 2023 17:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm: vgic: Use 'unsigned int' rather than 'int'
 whenever it is possible
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-3-julien@xen.org>
 <alpine.DEB.2.22.394.2308171602450.6458@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2308171602450.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/08/2023 00:04, Stefano Stabellini wrote:
> On Thu, 17 Aug 2023, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Switch to unsigned int for the return/parameters of the following
>> functions:
>>      * REG_RANK_NR(): 'b' (number of bits) and the return is always positive.
>>        'n' doesn't need to be size specific.
>>      * vgic_rank_offset(): 'b' (number of bits), 'n' (register index),
>>        's' (size of the access) are always positive.
>>      * vgic_{enable, disable}_irqs(): 'n' (rank index) is always positive
>>      * vgic_get_virq_type(): 'n' (rank index) and 'index' (register
>>        index) are always positive.
>>
>> Take the opportunity to propogate the unsignedness to the local
>> variable used for the arguments.
>>
>> This will remove some of the warning reported by GCC 12.2.1 when
>> passing the flags -Wsign-conversion/-Wconversion.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/include/asm/vgic.h | 11 +++++++----
>>   xen/arch/arm/vgic-v2.c          | 12 ++++++++++--
>>   xen/arch/arm/vgic.c             | 21 ++++++++++++---------
>>   3 files changed, 29 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
>> index 6901a05c0669..922779ce146a 100644
>> --- a/xen/arch/arm/include/asm/vgic.h
>> +++ b/xen/arch/arm/include/asm/vgic.h
>> @@ -252,7 +252,7 @@ struct vgic_ops {
>>    * Rank containing GICD_<FOO><n> for GICD_<FOO> with
>>    * <b>-bits-per-interrupt
>>    */
>> -static inline int REG_RANK_NR(int b, uint32_t n)
>> +static inline unsigned int REG_RANK_NR(unsigned int b, unsigned int n)
>>   {
>>       switch ( b )
>>       {
>> @@ -297,10 +297,13 @@ extern void gic_remove_from_lr_pending(struct vcpu *v, struct pending_irq *p);
>>   extern void vgic_init_pending_irq(struct pending_irq *p, unsigned int virq);
>>   extern struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq);
>>   extern struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq);
>> -extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n, int s);
>> +extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
>> +                                              unsigned int b,
>> +                                              unsigned int n,
>> +                                              unsigned int s);
>>   extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
>> -extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
>> -extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
>> +extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
>> +extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
>>   extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
>>                                     unsigned int rank);
>>   extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
>> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
>> index 2a2eda2e6f4c..0aa10fff0f10 100644
>> --- a/xen/arch/arm/vgic-v2.c
>> +++ b/xen/arch/arm/vgic-v2.c
>> @@ -161,7 +161,11 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>>   {
>>       struct hsr_dabt dabt = info->dabt;
>>       struct vgic_irq_rank *rank;
>> -    int gicd_reg = (int)(info->gpa - v->domain->arch.vgic.dbase);
>> +    /*
>> +     * gpa/dbase are paddr_t which size may be higher than 32-bit. Yet
>> +     * the difference will always be smaller than 32-bit.
>> +     */
>> +    unsigned int gicd_reg = info->gpa - v->domain->arch.vgic.dbase;
>>       unsigned long flags;
>>   
>>       perfc_incr(vgicd_reads);
>> @@ -403,7 +407,11 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>>   {
>>       struct hsr_dabt dabt = info->dabt;
>>       struct vgic_irq_rank *rank;
>> -    int gicd_reg = (int)(info->gpa - v->domain->arch.vgic.dbase);
>> +    /*
>> +     * gpa/dbase are paddr_t which size may be higher than 32-bit. Yet
>> +     * the difference will always be smaller than 32-bit.
>> +     */
>> +    unsigned int gicd_reg = info->gpa - v->domain->arch.vgic.dbase;
>>       uint32_t tr;
>>       unsigned long flags;
>>   
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index afcac791fe4b..269b804974e0 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -24,7 +24,8 @@
>>   #include <asm/gic.h>
>>   #include <asm/vgic.h>
>>   
>> -static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v, int rank)
>> +static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>> +                                                  unsigned int rank)
>>   {
>>       if ( rank == 0 )
>>           return v->arch.vgic.private_irqs;
>> @@ -38,17 +39,17 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v, int rank)
>>    * Returns rank corresponding to a GICD_<FOO><n> register for
>>    * GICD_<FOO> with <b>-bits-per-interrupt.
>>    */
>> -struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n,
>> -                                              int s)
>> +struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, unsigned int b,
>> +                                       unsigned int n, unsigned int s)
>>   {
>> -    int rank = REG_RANK_NR(b, (n >> s));
>> +    unsigned int rank = REG_RANK_NR(b, (n >> s));
>>   
>>       return vgic_get_rank(v, rank);
>>   }
>>   
>>   struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq)
>>   {
>> -    int rank = irq/32;
>> +    unsigned int rank = irq / 32;
>>   
>>       return vgic_get_rank(v, rank);
>>   }
>> @@ -324,14 +325,14 @@ void arch_move_irqs(struct vcpu *v)
>>       }
>>   }
>>   
>> -void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
>> +void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
>>   {
>>       const unsigned long mask = r;
>>       struct pending_irq *p;
>>       struct irq_desc *desc;
>>       unsigned int irq;
>>       unsigned long flags;
>> -    int i = 0;
>> +    unsigned int i = 0;
>>       struct vcpu *v_target;
>>   
>>       /* LPIs will never be disabled via this function. */
>> @@ -361,7 +362,9 @@ void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
>>   #define VGIC_ICFG_MASK(intr) (1U << ((2 * ((intr) % 16)) + 1))
>>   
>>   /* The function should be called with the rank lock taken */
>> -static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
>> +static inline unsigned int vgic_get_virq_type(struct vcpu *v,
>> +                                              unsigned int n,
>> +                                              unsigned int index)
>>   {
>>       struct vgic_irq_rank *r = vgic_get_rank(v, n);
>>       uint32_t tr = r->icfg[index >> 4];
>> @@ -374,7 +377,7 @@ static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
>>           return IRQ_TYPE_LEVEL_HIGH;
>>   }
>>   
>> -void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n)
>> +void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
>>   {
>>       const unsigned long mask = r;
>>       struct pending_irq *p;
> 
> It looks like you could also switch 'i' to unsigned int in
> vgic_enable_irqs like you did in vgic_disable_irqs

Indeed. I have updated the patch.

> 
> You could do that on commit:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

Cheers,

-- 
Julien Grall

