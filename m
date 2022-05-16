Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDF52810B
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 11:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329716.552966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqXNA-0007eb-D1; Mon, 16 May 2022 09:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329716.552966; Mon, 16 May 2022 09:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqXNA-0007c9-AF; Mon, 16 May 2022 09:50:40 +0000
Received: by outflank-mailman (input) for mailman id 329716;
 Mon, 16 May 2022 09:50:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqXN8-0007c3-SW
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 09:50:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqXN8-00075F-KO; Mon, 16 May 2022 09:50:38 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqXN8-0004fD-Dk; Mon, 16 May 2022 09:50:38 +0000
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
	bh=JGiBT55wN7BpDZsXrzl+DX9CIM0lBBSWzHedA+YIRKk=; b=CwlhQ9xjiqoq5Cv2v15eGxZXYW
	8zU82RGrfDweRRqIgt3C6GCvg5/MvwykLAcQKuwowdNP0zokYpyb6sLngTbRlJGmacI5KBhWH74eO
	dXTpMfRkurIQonferVbgvLOuWfsm1IFWYtrHrKoUPs95DSNWGpHaUCn26j0vFQfstSwg=;
Message-ID: <d6457564-d29b-9dc5-7338-b06808bd7a6c@xen.org>
Date: Mon, 16 May 2022 10:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220516084517.76071-1-julien@xen.org>
 <2E233152-FF46-42CF-B2CD-62E0BBE793C3@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2E233152-FF46-42CF-B2CD-62E0BBE793C3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/05/2022 10:24, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 16 May 2022, at 09:45, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
>> alloc/free" extended the checks in the buddy allocator to catch any
>> use of the helpers from context with interrupts disabled.
>>
>> Unfortunately, the rule is not followed in the LPI code when allocating
>> the pending table:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<000000000022a678>] alloc_xenheap_pages+0x178/0x194 (PC)
>> (XEN)    [<000000000022a670>] alloc_xenheap_pages+0x170/0x194 (LR)
>> (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
>> (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
>> (XEN)    [<000000000027b4e4>] gicv3_lpi_init_rdist+0x54/0x324
>> (XEN)    [<0000000000279898>] arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46
>> (XEN)    [<0000000000279bfc>] arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0x20/0x50
>> (XEN)    [<0000000000277054>] gic_init_secondary_cpu+0x18/0x30
>> (XEN)    [<0000000000284518>] start_secondary+0x1a8/0x234
>> (XEN)    [<0000010722aa4200>] 0000010722aa4200
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
>> (XEN) ****************************************
>>
>> For now the patch extending the checks has been reverted, but it would
>> be good to re-introduce it (allocation with interrupt is not desirable).
>>
>> The logic is reworked to allocate the pending table when preparing the
>> CPU.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>> xen/arch/arm/gic-v3-lpi.c | 81 ++++++++++++++++++++++++++++-----------
>> 1 file changed, 59 insertions(+), 22 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>> index e1594dd20e4c..77d9d05c35a6 100644
>> --- a/xen/arch/arm/gic-v3-lpi.c
>> +++ b/xen/arch/arm/gic-v3-lpi.c
>> @@ -18,6 +18,7 @@
>>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> +#include <xen/cpu.h>
>> #include <xen/lib.h>
>> #include <xen/mm.h>
>> #include <xen/param.h>
>> @@ -234,18 +235,13 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>>      write_u64_atomic(&hlpip->data, hlpi.data);
>> }
>>
>> -static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
>> +static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
>> {
>> -    uint64_t val;
>>      void *pendtable;
>>
>> -    if ( this_cpu(lpi_redist).pending_table )
>> +    if ( per_cpu(lpi_redist, cpu).pending_table )
>>          return -EBUSY;
>>
>> -    val  = GIC_BASER_CACHE_RaWaWb << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
>> -    val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
>> -    val |= GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT;
>> -
>>      /*
>>       * The pending table holds one bit per LPI and even covers bits for
>>       * interrupt IDs below 8192, so we allocate the full range.
>> @@ -265,13 +261,38 @@ static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
>>      clean_and_invalidate_dcache_va_range(pendtable,
>>                                           lpi_data.max_host_lpi_ids / 8);
>>
>> -    this_cpu(lpi_redist).pending_table = pendtable;
>> +    per_cpu(lpi_redist, cpu).pending_table = pendtable;
>>
>> -    val |= GICR_PENDBASER_PTZ;
>> +    return 0;
>> +}
>> +
>> +static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
>> +{
>> +    const void *pendtable = this_cpu(lpi_redist).pending_table;
>> +    uint64_t val;
>> +
> 
> Should we add an assert here to check if we are to early in boot ?
> That would also implicitly explain that allocation is done during CPU_PREPARE so this should not be called before.

Do you mean something like:

if ( !pendtable )
{
   ASSERT_UNREACHABLE();
   return -ENOMEM;
}

> 
>> +    if ( !pendtable )
>> +        return -ENOMEM;
>>
>> +    ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
> 
> This ASSERT is already done in gicv3_lpi_allocate_pendtable but it makes sense to have it closer to the place where we actually set the register.
> Otherwise this assert can never be triggered.

So the ASSERT() would end up to be triggered if the code in 
gicv3_allocate_pendtable() is incorrect.

> Can you remove the one in the allocation function and also copy the comment that was on top of it here ?

I would like to the keep as it is. The check in 
gicv3_allocate_pendtable() happens also in debug build and would allow 
to catch any problem before the CPU is even running.

In general, I would like to move to most of the checks when preparing 
the CPU so there are less chance for failures when the CPU is booting.

The ASSERT is here only to catch any misuse of the function.

>> @@ -381,6 +410,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
>> int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>> {
>>      unsigned int nr_lpi_ptrs;
>> +    int rc;
>>
>>      /* We rely on the data structure being atomically accessible. */
>>      BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>> @@ -413,7 +443,14 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>>
>>      printk("GICv3: using at most %lu LPIs on the host.\n", MAX_NR_HOST_LPIS);
>>
>> -    return 0;
>> +    /* Register the CPU notifier and allocate memory for the boot CPU */
>> +    register_cpu_notifier(&cpu_nfb);
>> +    rc = gicv3_lpi_allocate_pendtable(smp_processor_id());
>> +    if ( rc )
>> +        printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
>> +               smp_processor_id());
> 
> On secondary cores nothing equivalent will be printed and in the cal path there
> will be nothing printed at all which could make debugging complex.
> Can you move this print into gicv3_lpi_allocate_pendtable ?

Good point. I will do that in the next version.

Cheers,

-- 
Julien Grall

