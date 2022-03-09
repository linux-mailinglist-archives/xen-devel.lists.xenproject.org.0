Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87E4D3AD7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 21:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288068.488500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2fy-0003Zg-5O; Wed, 09 Mar 2022 20:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288068.488500; Wed, 09 Mar 2022 20:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2fy-0003XE-2J; Wed, 09 Mar 2022 20:12:50 +0000
Received: by outflank-mailman (input) for mailman id 288068;
 Wed, 09 Mar 2022 20:12:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nS2fw-0003X8-MK
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 20:12:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS2fw-0004AH-1k; Wed, 09 Mar 2022 20:12:48 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS2fv-0002XW-Rc; Wed, 09 Mar 2022 20:12:47 +0000
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
	bh=JNjqY7BWV/QrjUDQuOSLAYaNkz8Cn0KW7dVGSssa7Vs=; b=KoRn1E8BZZfe3xp5a3LFc0Il2N
	oMy9lhWHqIAOKnD4RRjmNn13gEs/SBkvpdwZ3VwnQNoCcim2/MO16vC+ud4WXJWmB0XFFXqY9Svyk
	mj3Un+D5mSkycoUt3hvPnoIco0QqQd+wFYjb/2IOBDjoPrwP6e/T8n1BIKHZEnP63opI=;
Message-ID: <0509b0eb-0f3b-8a26-4202-0011201c3fac@xen.org>
Date: Wed, 9 Mar 2022 20:12:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 05/36] xen/arm: compute LLC way size by hardware
 inspection
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-6-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-6-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> The size of the LLC way is a crucial parameter for the cache coloring
> support, since it determines the maximum number of available colors on
> the platform.  This parameter can currently be retrieved only from
> the way_size bootarg and it is prone to misconfiguration nullifying the
> coloring mechanism and breaking cache isolation.

Reading this sentence, I think the command line option should be 
introduced after this patch (assuming this is necessary). This will 
avoid undoing/fixing a "bug" that was introduced by the same series.

> 
> Add an alternative and more safe method to retrieve the way size by
> directly asking the hardware, namely using CCSIDR_EL1 and CSSELR_EL1
> registers.
> 
> This method has to check also if at least L2 is implemented in the
> hardware since there are scenarios where only L1 cache is availble, e.g,

In the previous patch, the description for the Kconfig suggests that the 
cache coloring will only happen on L2. But here you are also adding L1. 
So I think the documentation needs to be updated.

Typo: s/availble/available/

> QEMU.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/coloring.c | 76 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index 8f1cff6efb..e3d490b453 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -25,7 +25,10 @@
>   #include <xen/lib.h>
>   #include <xen/errno.h>
>   #include <xen/param.h>
> +


NIT: I think this belongs to patch #4.

> +#include <asm/sysregs.h>

Please order the include alphabetically.

>   #include <asm/coloring.h> > +#include <asm/io.h>

You don't seem to use read*/write* helper. So why do you need this?
>   
>   /* Number of color(s) assigned to Xen */
>   static uint32_t xen_col_num;
> @@ -39,6 +42,79 @@ static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
>   
>   static uint64_t way_size;
>   
> +#define CTR_LINESIZE_MASK 0x7
> +#define CTR_SIZE_SHIFT 13
> +#define CTR_SIZE_MASK 0x3FFF
> +#define CTR_SELECT_L2 1 << 1
> +#define CTR_SELECT_L3 1 << 2
> +#define CTR_CTYPEn_MASK 0x7
> +#define CTR_CTYPE2_SHIFT 3
> +#define CTR_CTYPE3_SHIFT 6
> +#define CTR_LLC_ON 1 << 2
> +#define CTR_LOC_SHIFT 24
> +#define CTR_LOC_MASK 0x7
> +#define CTR_LOC_L2 1 << 1
> +#define CTR_LOC_NOT_IMPLEMENTED 1 << 0

We already define some CTR_* in processor.h. Please any extra one there.

> +
> +
> +/* Return the way size of last level cache by asking the hardware */
> +static uint64_t get_llc_way_size(void)

This will break compilation as you are introducing get_llc_way_size() 
but not using it.

I would suggest to fold this patch in the next one.

> +{
> +    uint32_t cache_sel = READ_SYSREG64(CSSELR_EL1);

The return type for READ_SYSREG64() is uint64_t. That said, the 
equivalent register on 32bit is CSSELR which is 32-bit. So this should 
be READ_SYSREG() and the matching type is register_t.

> +    uint32_t cache_global_info = READ_SYSREG64(CLIDR_EL1);

Same remark here. Except the matching register is CLIDR.

> +    uint32_t cache_info;
> +    uint32_t cache_line_size;
> +    uint32_t cache_set_num;
> +    uint32_t cache_sel_tmp;
> +
> +    printk(XENLOG_INFO "Get information on LLC\n");
> +    printk(XENLOG_INFO "Cache CLIDR_EL1: 0x%"PRIx32"\n", cache_global_info);
> +
> +    /* Check if at least L2 is implemented */
> +    if ( ((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_MASK)

This is a bit confusing. cache_global_info is storing CLIDR_* but you 
are using macro starting with CTR_*.

Did you intend to name the macros CLIDR_*?

The same remark goes for the other use of CTR_ below. The name of the 
macros should match the register they are meant to be used on.

> +        == CTR_LOC_NOT_IMPLEMENTED )

I am a bit confused this the check here. Shouln't you check that Ctype2 
is notn 0 instead?

> +    {
> +        printk(XENLOG_ERR "ERROR: L2 Cache not implemented\n");
> +        return 0;
> +    }
> +
> +    /* Save old value of CSSELR_EL1 */
> +    cache_sel_tmp = cache_sel;
> +
> +    /* Get LLC index */
> +    if ( ((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_CTYPEn_MASK)
> +        == CTR_LLC_ON )

I don't understand this check. You define CTR_LLC_ON to 1 << 2. So it 
would be 0b10. From the field you checked, this value mean "Data Cache 
Only". How is this indicating the which level to chose?

But then in patch #4 you wrote we will do cache coloring on L2. So why 
are we selecting L3?

> +        cache_sel = CTR_SELECT_L2;
> +    else
> +        cache_sel = CTR_SELECT_L3;
> +
> +    printk(XENLOG_INFO "LLC selection: %u\n", cache_sel);
> +    /* Select the correct LLC in CSSELR_EL1 */
> +    WRITE_SYSREG64(cache_sel, CSSELR_EL1);

This should be WRITE_SYSREG().

> +
> +    /* Ensure write */
> +    isb();
> +
> +    /* Get info about the LLC */
> +    cache_info = READ_SYSREG64(CCSIDR_EL1);
> +
> +    /* ARM TRM: (Log2(Number of bytes in cache line)) - 4. */

 From my understanding "TRM" in the Arm world refers to a specific 
processor. In this case we want to quote the spec. So we usually say 
"Arm Arm".

> +    cache_line_size = 1 << ((cache_info & CTR_LINESIZE_MASK) + 4);
> +    /* ARM TRM: (Number of sets in cache) - 1 */
> +    cache_set_num = ((cache_info >> CTR_SIZE_SHIFT) & CTR_SIZE_MASK) + 1;

The shifts here are assuming that FEAT_CCIDX is not implemented. I would 
be OK if we decide to not support cache coloring on such platform. 
However, we need to return an error if a user tries to use cache 
coloring on such platform.

> +
> +    printk(XENLOG_INFO "Cache line size: %u bytes\n", cache_line_size);
> +    printk(XENLOG_INFO "Cache sets num: %u\n", cache_set_num);
> +
> +    /* Restore value in CSSELR_EL1 */
> +    WRITE_SYSREG64(cache_sel_tmp, CSSELR_EL1);
> +
> +    /* Ensure write */
> +    isb();
> +
> +    return (cache_line_size * cache_set_num);
> +}
> +
>   /*************************
>    * PARSING COLORING BOOTARGS
>    */

Cheers,

-- 
Julien Grall

