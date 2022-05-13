Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF15264AD
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328528.551579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWNX-0000s9-E3; Fri, 13 May 2022 14:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328528.551579; Fri, 13 May 2022 14:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWNX-0000p8-9X; Fri, 13 May 2022 14:34:51 +0000
Received: by outflank-mailman (input) for mailman id 328528;
 Fri, 13 May 2022 14:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O871=VV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1npWNV-0000ox-P5
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:34:49 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d75215f6-d2c9-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 16:34:48 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id m1so11699913wrb.8
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 07:34:48 -0700 (PDT)
Received: from [192.168.0.194] (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 n27-20020adf8b1b000000b0020c5253d900sm2383523wra.76.2022.05.13.07.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:34:47 -0700 (PDT)
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
X-Inumbo-ID: d75215f6-d2c9-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b0bdCsiXuc25La2RdnHt8t3/RjJymyZdSIqScGL3aOY=;
        b=kPeg737SrsJXzljeml7OqNCU+M+5kc83qpI8JJzQdu9GA+d9BOogSpa+Fc3qxr35R6
         nTVhNFtYwnlN6EprVlfkJRxOMwJUn23YqKT5uNswNyvKIFx9ezJ+XHgYgxvI+kztmSML
         qVx4VHVmK1NGmAU85TSpSwVZngtvTl1rLVLCMIPu72/id5+mKOBWda220AWbFnWB9Ii8
         f4lDPCUsJav8eVuU9sjZOQ0uPT422lBF78q5U6XWsAFXFBBODxV6rs/E3gHoA5BZT3m3
         i4Xje+WLhe1mg3UzvdmCryu/QLpOhsyUmWyVlNeCWYbj40GuFnFGzX33Eu5Z02lh19E2
         HpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b0bdCsiXuc25La2RdnHt8t3/RjJymyZdSIqScGL3aOY=;
        b=JiV2xOukRVQgBk0nJaRUX3tmyYzO1G5p7u6x338BaRYcva8t+IU0UnzxRdmsnBNGR0
         SxUAmgD3ubgS/fiY9aOZ552RE5Zcynv9Vv62asH+pbbDL2yQAEc6CWJWLspnOMUEH0Ts
         glzBSLXmWowLbXA36HvDDy7TLycyPrM6ZSUrUKkCBb4iS4EiV9d4YU1Xkf7Ep+ODVhmx
         cA0lNIbXmHCYZcH6m87mDqOeHQ2GzKslNVN6cBUcXaLqts/S7cdVHPfYsAWlRL88RvlH
         2M8eHuTG+dGad6CVz98OhCFjKnVaRq1YVG8gtkkgv7MloLFz/VTMb6POzdcbO9BeoWHt
         88Dg==
X-Gm-Message-State: AOAM531PyEK2agu7KigfuW0dtqIxmCoVHdRjK48P7x+bpIYkNzde/0iu
	FUnft98KqA53lBMkvBvztpGgoQ==
X-Google-Smtp-Source: ABdhPJxemVK2oIeMwHFpdnfa7pxOZ4eNap/1vKiG4mS2+sayiv9bp+sSzx1W1uz3PQggZMvzfD6fWQ==
X-Received: by 2002:adf:9dcc:0:b0:20a:ed44:fd48 with SMTP id q12-20020adf9dcc000000b0020aed44fd48mr4278768wre.120.1652452488083;
        Fri, 13 May 2022 07:34:48 -0700 (PDT)
Message-ID: <9b10c3d3-05d4-c08b-efd6-2cb106f58dea@minervasys.tech>
Date: Fri, 13 May 2022 16:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 05/36] xen/arm: compute LLC way size by hardware
 inspection
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-6-marco.solieri@minervasys.tech>
 <0509b0eb-0f3b-8a26-4202-0011201c3fac@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
In-Reply-To: <0509b0eb-0f3b-8a26-4202-0011201c3fac@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien

On 09/03/22 21:12, Julien Grall wrote:

>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> ---
>>   xen/arch/arm/coloring.c | 76 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>
>> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
>> index 8f1cff6efb..e3d490b453 100644
>> --- a/xen/arch/arm/coloring.c
>> +++ b/xen/arch/arm/coloring.c
>> @@ -25,7 +25,10 @@
>>   #include <xen/lib.h>
>>   #include <xen/errno.h>
>>   #include <xen/param.h>
>> +
>
>
> NIT: I think this belongs to patch #4.
>
>> +#include <asm/sysregs.h>
>
> Please order the include alphabetically.
>
>>   #include <asm/coloring.h> > +#include <asm/io.h>
>
> You don't seem to use read*/write* helper. So why do you need this?
>>     /* Number of color(s) assigned to Xen */
>>   static uint32_t xen_col_num;
>> @@ -39,6 +42,79 @@ static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
>>     static uint64_t way_size;
>>   +#define CTR_LINESIZE_MASK 0x7
>> +#define CTR_SIZE_SHIFT 13
>> +#define CTR_SIZE_MASK 0x3FFF
>> +#define CTR_SELECT_L2 1 << 1
>> +#define CTR_SELECT_L3 1 << 2
>> +#define CTR_CTYPEn_MASK 0x7
>> +#define CTR_CTYPE2_SHIFT 3
>> +#define CTR_CTYPE3_SHIFT 6
>> +#define CTR_LLC_ON 1 << 2
>> +#define CTR_LOC_SHIFT 24
>> +#define CTR_LOC_MASK 0x7
>> +#define CTR_LOC_L2 1 << 1
>> +#define CTR_LOC_NOT_IMPLEMENTED 1 << 0
>
> We already define some CTR_* in processor.h. Please any extra one there.
>
>> +
>> +
>> +/* Return the way size of last level cache by asking the hardware */
>> +static uint64_t get_llc_way_size(void)
>
> This will break compilation as you are introducing get_llc_way_size() 
> but not using it.
>
> I would suggest to fold this patch in the next one.
>
>> +{
>> +    uint32_t cache_sel = READ_SYSREG64(CSSELR_EL1);
>
> The return type for READ_SYSREG64() is uint64_t. That said, the 
> equivalent register on 32bit is CSSELR which is 32-bit. So this should 
> be READ_SYSREG() and the matching type is register_t.
Since we don't want to support arm32, should I stick with 
READ_SYSREG64() or switch to the generic one you
pointed me out?
>> +    uint32_t cache_global_info = READ_SYSREG64(CLIDR_EL1);
>
> Same remark here. Except the matching register is CLIDR.
>
>> +    uint32_t cache_info;
>> +    uint32_t cache_line_size;
>> +    uint32_t cache_set_num;
>> +    uint32_t cache_sel_tmp;
>> +
>> +    printk(XENLOG_INFO "Get information on LLC\n");
>> +    printk(XENLOG_INFO "Cache CLIDR_EL1: 0x%"PRIx32"\n", 
>> cache_global_info);
>> +
>> +    /* Check if at least L2 is implemented */
>> +    if ( ((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_MASK)
>
> This is a bit confusing. cache_global_info is storing CLIDR_* but you 
> are using macro starting with CTR_*.
>
> Did you intend to name the macros CLIDR_*?
>
> The same remark goes for the other use of CTR_ below. The name of the 
> macros should match the register they are meant to be used on.
You are right for the naming mistakes. Should I add those defines in 
some specific file or
can they stay here?
>> +        == CTR_LOC_NOT_IMPLEMENTED )
>
> I am a bit confused this the check here. Shouln't you check that 
> Ctype2 is notn 0 instead?
I should check a little bit better how this automatic probing thing 
actually works
and we also have to clarify better what is the LLC for us, so that I 
know what we
should really test for in this function. Probably you're right though.
>> +    {
>> +        printk(XENLOG_ERR "ERROR: L2 Cache not implemented\n");
>> +        return 0;
>> +    }
>> +
>> +    /* Save old value of CSSELR_EL1 */
>> +    cache_sel_tmp = cache_sel;
>> +
>> +    /* Get LLC index */
>> +    if ( ((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_CTYPEn_MASK)
>> +        == CTR_LLC_ON )
>
> I don't understand this check. You define CTR_LLC_ON to 1 << 2. So it 
> would be 0b10. From the field you checked, this value mean "Data Cache 
> Only". How is this indicating the which level to chose?
>
> But then in patch #4 you wrote we will do cache coloring on L2. So why 
> are we selecting L3?
1 << 2 is actually 0b100 which stands for "Unified cache". Still I don't 
know if this is
the best way to test what we want.
>> +        cache_sel = CTR_SELECT_L2;
>> +    else
>> +        cache_sel = CTR_SELECT_L3;
>> +
>> +    printk(XENLOG_INFO "LLC selection: %u\n", cache_sel);
>> +    /* Select the correct LLC in CSSELR_EL1 */
>> +    WRITE_SYSREG64(cache_sel, CSSELR_EL1);
>
> This should be WRITE_SYSREG().
>
>> +
>> +    /* Ensure write */
>> +    isb();
>> +
>> +    /* Get info about the LLC */
>> +    cache_info = READ_SYSREG64(CCSIDR_EL1);
>> +
>> +    /* ARM TRM: (Log2(Number of bytes in cache line)) - 4. */
>
> From my understanding "TRM" in the Arm world refers to a specific 
> processor. In this case we want to quote the spec. So we usually say 
> "Arm Arm".
>
>> +    cache_line_size = 1 << ((cache_info & CTR_LINESIZE_MASK) + 4);
>> +    /* ARM TRM: (Number of sets in cache) - 1 */
>> +    cache_set_num = ((cache_info >> CTR_SIZE_SHIFT) & CTR_SIZE_MASK) 
>> + 1;
>
> The shifts here are assuming that FEAT_CCIDX is not implemented. I 
> would be OK if we decide to not support cache coloring on such 
> platform. However, we need to return an error if a user tries to use 
> cache coloring on such platform.
>
In my understanding, if FEAT_CCIDX is implemented then CCSIDR_EL1 is a 
64-bit register.
So it's just a matter of probing for FEAT_CCIDX and in that case 
changing the way we access
that register (since the layout changes too).

Thanks.

- Carlo Nonato


