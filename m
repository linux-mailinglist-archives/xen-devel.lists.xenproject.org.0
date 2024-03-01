Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5486E45D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 16:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687738.1071517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4qR-0005l6-Fx; Fri, 01 Mar 2024 15:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687738.1071517; Fri, 01 Mar 2024 15:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4qR-0005iz-DB; Fri, 01 Mar 2024 15:30:43 +0000
Received: by outflank-mailman (input) for mailman id 687738;
 Fri, 01 Mar 2024 15:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBmU=KH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rg4qQ-0005it-Be
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 15:30:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a96e23fe-d7e0-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 16:30:41 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A5CFB4EE0737;
 Fri,  1 Mar 2024 16:30:40 +0100 (CET)
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
X-Inumbo-ID: a96e23fe-d7e0-11ee-afd8-a90da7624cb6
MIME-Version: 1.0
Date: Fri, 01 Mar 2024 16:30:40 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 02/10] xen/arm: address some violations of MISRA C
 Rule 20.7
In-Reply-To: <905119be-8731-4669-ac7f-c21aed6845dc@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <efdeb0e013c36e18b5545fbdb33a43bb3f87039c.1709219010.git.nicola.vetrini@bugseng.com>
 <905119be-8731-4669-ac7f-c21aed6845dc@suse.com>
Message-ID: <7c54b08875406e5b3a61325af124ae7f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 17:34, Jan Beulich wrote:
> On 29.02.2024 16:27, Nicola Vetrini wrote:
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -462,8 +462,8 @@ static bool has_ssbd_mitigation(const struct 
>> arm_cpu_capabilities *entry)
>>  #define MIDR_RANGE(model, min, max)     \
>>      .matches = is_affected_midr_range,  \
>>      .midr_model = model,                \
>> -    .midr_range_min = min,              \
>> -    .midr_range_max = max
>> +    .midr_range_min = (min),            \
>> +    .midr_range_max = (max)
> 
> Why min and max, but not model?
> 

All the constants in the full expansions are parenthesized via 
MIDR_CPU_MODEL, so it doesn't trigger any violation right now, but for 
consistency I'd better put parentheses there as well.

>> --- a/xen/arch/arm/include/asm/smccc.h
>> +++ b/xen/arch/arm/include/asm/smccc.h
>> @@ -122,7 +122,7 @@ struct arm_smccc_res {
>>  #define __constraint_read_7 __constraint_read_6, "r" (r7)
>> 
>>  #define __declare_arg_0(a0, res)                            \
>> -    struct arm_smccc_res    *___res = res;                  \
>> +    struct arm_smccc_res    *___res = (res);                \
>>      register unsigned long  r0 ASM_REG(0) = (uint32_t)a0;   \
> 
> Why res but not a0?
> 

Seems like it's never used in a non-compliant way, but you do have a 
point. Here and also below, to keep it consistent. I didn't look at all 
the violations yet, so I may have missed some. I did want to show a few 
patches also to gather opinions on what may/may not be accepted.

>> --- a/xen/arch/arm/include/asm/vgic-emul.h
>> +++ b/xen/arch/arm/include/asm/vgic-emul.h
>> @@ -6,11 +6,11 @@
>>   * a range of registers
>>   */
>> 
>> -#define VREG32(reg) reg ... reg + 3
>> -#define VREG64(reg) reg ... reg + 7
>> +#define VREG32(reg) (reg) ... (reg) + 3
>> +#define VREG64(reg) (reg) ... (reg) + 7
> 
> #define VREG32(reg) (reg) ... ((reg) + 3)
> #define VREG64(reg) (reg) ... ((reg) + 7)
> 
> ?
> 

The outer parentheses are not required, but I can add them if the 
maintainers share your view.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

