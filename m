Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C455E692329
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 17:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493467.763391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQW7O-0006zv-Ob; Fri, 10 Feb 2023 16:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493467.763391; Fri, 10 Feb 2023 16:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQW7O-0006y3-Ly; Fri, 10 Feb 2023 16:19:22 +0000
Received: by outflank-mailman (input) for mailman id 493467;
 Fri, 10 Feb 2023 16:19:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQW7M-0006xw-Ir
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 16:19:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQW7M-0003GH-4F; Fri, 10 Feb 2023 16:19:20 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQW7L-0004zp-Rg; Fri, 10 Feb 2023 16:19:19 +0000
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
	bh=p6+oTOtiOTmEaR8NKZP2gD5Jp5xbNhPjcvyQOOSxhJY=; b=G725kLh6T59IPHHqk8e56agJmP
	ESDJlG7XfnSdCpNld+CPhykfjCAWRREtpJVCewTmaMWJg3plul7J8FRp/0ogqV73/rhvOLOPxe0Yk
	y3fdd8Mvh8J8QG52irB/8M3p0BwUHDbVTPZR3hGS7c1HabNF1/xuc/ysw+lvBz+DbNQ4=;
Message-ID: <5eb92203-2d99-7dfc-4f01-d92b7a23c3e5@xen.org>
Date: Fri, 10 Feb 2023 16:19:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-12-ayan.kumar.halder@amd.com>
 <ae501ac3-af2d-c4cb-3ea9-04dd946cdc51@xen.org>
 <eb4d4da7-0251-6efc-1311-6b236fdca6c4@amd.com>
 <3655dce9-f795-3d37-3236-d95d74c865ff@xen.org>
 <1e5d905c-0511-ed80-c899-e679d955775d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1e5d905c-0511-ed80-c899-e679d955775d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/02/2023 15:39, Ayan Kumar Halder wrote:
> 
> On 09/02/2023 11:45, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 07/02/2023 15:34, Ayan Kumar Halder wrote:
>>>
>>> On 20/01/2023 11:06, Julien Grall wrote:
>>>> Hi Ayan,
>>> Hi Julien,
>>>>
>>>> On 17/01/2023 17:43, Ayan Kumar Halder wrote:
>>>>> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
>>>>> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
>>>>> "Virtualization Translation Control Register" for the bit 
>>>>> descriptions.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>> Changes from -
>>>>>
>>>>> v1 - New patch.
>>>>>
>>>>>   xen/arch/arm/p2m.c | 10 +++++++---
>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>>> index 948f199d84..cfdea55e71 100644
>>>>> --- a/xen/arch/arm/p2m.c
>>>>> +++ b/xen/arch/arm/p2m.c
>>>>> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>>>>>       register_t val = 
>>>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>>>     #ifdef CONFIG_ARM_32
>>>>> -    if ( p2m_ipa_bits < 40 )
>>>>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>>>>           panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>>>>                 p2m_ipa_bits);
>>>>>   -    printk("P2M: 40-bit IPA\n");
>>>>> -    p2m_ipa_bits = 40;
>>>>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>>>>> +    p2m_ipa_bits = PADDR_BITS;
>>>>> +#ifdef CONFIG_ARM_PA_32
>>>>> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
>>>>> +#else
>>>>>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>>>> +#endif
>>>>
>>>> I am wondering whether this is right time to switch to an array like 
>>>> the arm64 code? This would allow to use 32-bit IPA also when Xen 
>>>> support 64-bit physical address.
>>>
>>> In AArch64, we use ID_AA64MMFR0_EL1.PARange to determine the physical 
>>> address range supported at runtime. This is then used as an index 
>>> into pa_range_info[] to determine t0sz, root_order, etc.
>>
>> It is using both the ID_AA64MMFR0_EL1 but also p2m_ipa_bits to decide 
>> the size.
> Ack.
>>
>>>
>>> However, for AArch32 I do not see an equivalent register (similar to 
>>> ID_AA64MMFR0_EL1) or any register to determine the physical address 
>>> range. Thus, I will prefer to keep the code as it is unless you 
>>> suggest any alternative.
>>
>> I looked at the Arm Arm and indeed it doesn't look like there are 
>> equivalent for ID_AA64MMFR0_EL1.PARange.
>>
>> However, my point was less about reading the system register but more 
>> about the fact we could have the code a bit more generic and avoid the 
>> assumption that PADDR_BITS is only modified when CONFIG_ARM_PA_32 is set.
> 
> I had a rework at the patch. Please let me know if the following looks 
> better.
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 948f199d84..bc3bdf5f3e 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2266,14 +2266,35 @@ void __init setup_virt_paging(void)
>       register_t val = 
> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
> 
>   #ifdef CONFIG_ARM_32
> -    if ( p2m_ipa_bits < 40 )
> +    static const struct {
> +        unsigned int pabits; /* Physical Address Size */
> +        unsigned int t0sz;   /* Desired T0SZ */
> +        unsigned int sl0;    /* Desired SL0 */

Hmmm... Why don't you include the root order? In fact...

> +    } pa_range_info[] __initconst = {
> +        [0] = { 32,     32,     1 },
> +        [1] = { 40,     24,     1 },

... looking at the ARMv7 specification (see B3-1345 in ARM DDI 0406C.d), 
the root page-table is only concatenated for 40-bits.

> +    };
> +    int i = 0;
> +
> +    if ( p2m_ipa_bits < PADDR_BITS )
> +        panic("P2M: Not able to support %u-bit IPA at the moment\n",
> +              p2m_ipa_bits);

This check seems unnecessary now.

> +
> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
> +    p2m_ipa_bits = PADDR_BITS;
> +
> +    for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
> +        if ( p2m_ipa_bits == pa_range_info[i].pabits )
> +            break;
> +
> +    if ( i == ARRAY_SIZE(pa_range_info) )
>           panic("P2M: Not able to support %u-bit IPA at the moment\n",
>                 p2m_ipa_bits);
> 
> -    printk("P2M: 40-bit IPA\n");
> -    p2m_ipa_bits = 40;
> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
> +    val |= VTCR_T0SZ(pa_range_info[i].t0sz);
> +    val |= VTCR_SL0(pa_range_info[i].sl0);
> +

I think you can share a lot of code between arm64 and arm32. A diff 
below (not tested):

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 91df922e1c9f..05f26780a29d 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,16 +14,10 @@
  /* Holds the bit size of IPAs in p2m tables.  */
  extern unsigned int p2m_ipa_bits;

-#ifdef CONFIG_ARM_64
  extern unsigned int p2m_root_order;
  extern unsigned int p2m_root_level;
  #define P2M_ROOT_ORDER    p2m_root_order
  #define P2M_ROOT_LEVEL p2m_root_level
-#else
-/* First level P2M is always 2 consecutive pages */
-#define P2M_ROOT_ORDER    1
-#define P2M_ROOT_LEVEL 1
-#endif

  struct domain;

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d848f..6fda0b92230a 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2264,17 +2264,6 @@ void __init setup_virt_paging(void)
  {
      /* Setup Stage 2 address translation */
      register_t val = 
VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
-
-#ifdef CONFIG_ARM_32
-    if ( p2m_ipa_bits < 40 )
-        panic("P2M: Not able to support %u-bit IPA at the moment\n",
-              p2m_ipa_bits);
-
-    printk("P2M: 40-bit IPA\n");
-    p2m_ipa_bits = 40;
-    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
-    val |= VTCR_SL0(0x1); /* P2M starts at first level */
-#else /* CONFIG_ARM_64 */
      static const struct {
          unsigned int pabits; /* Physical Address Size */
          unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
@@ -2286,29 +2275,26 @@ void __init setup_virt_paging(void)
          [0] = { 32,      32/*32*/,  0,          1 },
          [1] = { 36,      28/*28*/,  0,          1 },
          [2] = { 40,      24/*24*/,  1,          1 },
+#ifdef CONFIG_ARM_64
          [3] = { 42,      22/*22*/,  3,          1 },
          [4] = { 44,      20/*20*/,  0,          2 },
          [5] = { 48,      16/*16*/,  0,          2 },
          [6] = { 52,      12/*12*/,  4,          2 },
          [7] = { 0 }  /* Invalid */
+#endif
      };

      unsigned int i;
      unsigned int pa_range = 0x10; /* Larger than any possible value */

+#ifdef CONFIG_ARM_64
      /*
       * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
configured
       * with IPA bits == PA bits, compare against "pabits".
       */
      if ( pa_range_info[system_cpuinfo.mm64.pa_range].pabits < 
p2m_ipa_bits )
          p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range].pabits;
-
-    /*
-     * cpu info sanitization made sure we support 16bits VMID only if all
-     * cores are supporting it.
-     */
-    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
-        max_vmid = MAX_VMID_16_BIT;
+#endif

      /* Choose suitable "pa_range" according to the resulted 
"p2m_ipa_bits". */
      for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
@@ -2324,12 +2310,22 @@ void __init setup_virt_paging(void)
      if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
!pa_range_info[pa_range].pabits )
          panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
pa_range);

-    val |= VTCR_PS(pa_range);
-    val |= VTCR_TG0_4K;
+#ifdef CONFIG_ARM_64
+    /*
+     * cpu info sanitization made sure we support 16bits VMID only if all
+     * cores are supporting it.
+     */
+    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
+        max_vmid = MAX_VMID_16_BIT;

      /* Set the VS bit only if 16 bit VMID is supported. */
      if ( MAX_VMID == MAX_VMID_16_BIT )
          val |= VTCR_VS;
+#endif
+
+    val |= VTCR_PS(pa_range);
+    val |= VTCR_TG0_4K;
+
      val |= VTCR_SL0(pa_range_info[pa_range].sl0);
      val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);

@@ -2341,7 +2337,7 @@ void __init setup_virt_paging(void)
             p2m_ipa_bits,
             pa_range_info[pa_range].pabits,
             ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
-#endif
+
      printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
             4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);

Cheers,

-- 
Julien Grall

