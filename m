Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948907CC57A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 16:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618257.961685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qskeP-0001kD-O8; Tue, 17 Oct 2023 14:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618257.961685; Tue, 17 Oct 2023 14:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qskeP-0001hC-L9; Tue, 17 Oct 2023 14:02:25 +0000
Received: by outflank-mailman (input) for mailman id 618257;
 Tue, 17 Oct 2023 14:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy8C=F7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qskeO-0001h6-NF
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 14:02:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cadab038-6cf5-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 16:02:22 +0200 (CEST)
Received: from [157.138.166.97] (unknown [157.138.166.97])
 by support.bugseng.com (Postfix) with ESMTPSA id 871E04EE0738;
 Tue, 17 Oct 2023 16:02:21 +0200 (CEST)
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
X-Inumbo-ID: cadab038-6cf5-11ee-9b0e-b553b5be7939
Message-ID: <49c60949-f654-4ea8-b04f-756d38f22ce4@bugseng.com>
Date: Tue, 17 Oct 2023 16:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] arm/gic: address violations of MISRA C:2012
 Rule 8.2
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <e55bfe55e0c34e96692f397ff69365bc0819fd90.1697207038.git.federico.serafini@bugseng.com>
 <d2a58398-e381-4b0d-b5cc-ab1ed7f6c7fb@xen.org>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <d2a58398-e381-4b0d-b5cc-ab1ed7f6c7fb@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/23 10:53, Julien Grall wrote:
> Hi,
> 
> On 13/10/2023 16:24, Federico Serafini wrote:
>> Add missing parameter names, no functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/arm/include/asm/gic.h | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/gic.h 
>> b/xen/arch/arm/include/asm/gic.h
>> index f1ef347edc..03f209529b 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -246,7 +246,7 @@ void gic_set_irq_type(struct irq_desc *desc, 
>> unsigned int type);
>>   /* Program the GIC to route an interrupt */
>>   extern void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int 
>> priority);
>> -extern int gic_route_irq_to_guest(struct domain *, unsigned int virq,
>> +extern int gic_route_irq_to_guest(struct domain *d, unsigned int virq,
>>                                     struct irq_desc *desc,
>>                                     unsigned int priority);
>> @@ -330,11 +330,11 @@ struct gic_hw_operations {
>>       /* Initialize the GIC and the boot CPU */
>>       int (*init)(void);
>>       /* Save GIC registers */
>> -    void (*save_state)(struct vcpu *);
>> +    void (*save_state)(struct vcpu *v);
>>       /* Restore GIC registers */
>> -    void (*restore_state)(const struct vcpu *);
>> +    void (*restore_state)(const struct vcpu *v);
>>       /* Dump GIC LR register information */
>> -    void (*dump_state)(const struct vcpu *);
>> +    void (*dump_state)(const struct vcpu *v);
>>       /* hw_irq_controller to enable/disable/eoi host irq */
>>       hw_irq_controller *gic_host_irq_type;
>> @@ -369,9 +369,9 @@ struct gic_hw_operations {
>>       /* Clear LR register */
>>       void (*clear_lr)(int lr);
>>       /* Read LR register and populate gic_lr structure */
>> -    void (*read_lr)(int lr, struct gic_lr *);
>> +    void (*read_lr)(int lr, struct gic_lr *lr_reg);
>>       /* Write LR register from gic_lr structure */
>> -    void (*write_lr)(int lr, const struct gic_lr *);
>> +    void (*write_lr)(int lr, const struct gic_lr *lr_reg);
> 
> Are the parameters name meant to match the declaration of the callbacks?
> I am asking it because I see there are some inconsistencies between the 
> declaration in GICv3 and GICv2. So this may want to be harmonized.
> 
> Cheers,
> 

I can propose another patch that also changes parameter names
of gicv3_write_lr() as well as adding the missing ones in gic.h.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

