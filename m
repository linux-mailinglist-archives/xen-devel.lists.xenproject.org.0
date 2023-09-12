Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10779CD21
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600313.935951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0HD-0000P8-DR; Tue, 12 Sep 2023 10:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600313.935951; Tue, 12 Sep 2023 10:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg0HD-0000Mp-Ap; Tue, 12 Sep 2023 10:05:47 +0000
Received: by outflank-mailman (input) for mailman id 600313;
 Tue, 12 Sep 2023 10:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg0HC-0000Mj-FW
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:05:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efbf4ae7-5153-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 12:05:44 +0200 (CEST)
Received: from [192.168.1.9] (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 313A94EE0749;
 Tue, 12 Sep 2023 12:05:43 +0200 (CEST)
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
X-Inumbo-ID: efbf4ae7-5153-11ee-9b0d-b553b5be7939
Message-ID: <ce839d89-931a-3595-584e-eab3f665cea3@bugseng.com>
Date: Tue, 12 Sep 2023 12:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 03/10] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <0c1fb82b539d939e7c6655a9a8f3d7fe8b213cef.1694510856.git.simone.ballarin@bugseng.com>
 <50e33371-8dc5-d4cb-a606-72d1ab005c21@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <50e33371-8dc5-d4cb-a606-72d1ab005c21@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/23 11:52, Jan Beulich wrote:
> On 12.09.2023 11:36, Simone Ballarin wrote:
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -36,6 +36,14 @@
>>           },
>>           {
>>               "id": "SAF-4-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.D4.10"
>> +            },
>> +            "name": "Dir 4.10: direct inclusion guard before",
>> +            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
>> +        },
>> +        {
>> +            "id": "SAF-5-safe",
>>               "analyser": {},
>>               "name": "Sentinel",
>>               "text": "Next ID to be used"
>> diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
>> index ccd26c5184..24f8c61a73 100644
>> --- a/xen/arch/arm/include/asm/hypercall.h
>> +++ b/xen/arch/arm/include/asm/hypercall.h
>> @@ -1,3 +1,4 @@
>> +/* SAF-3-safe direct inclusion guard before */
>>   #ifndef __XEN_HYPERCALL_H__
>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>   #endif
>> diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
>> index ec2edc771e..dfdfe80021 100644
>> --- a/xen/arch/x86/include/asm/hypercall.h
>> +++ b/xen/arch/x86/include/asm/hypercall.h
>> @@ -2,6 +2,7 @@
>>    * asm-x86/hypercall.h
>>    */
>>   
>> +/* SAF-3-safe direct inclusion guard before */
>>   #ifndef __XEN_HYPERCALL_H__
>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>   #endif
>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>> index 0a2b16d05d..190ada7800 100644
>> --- a/xen/include/xen/unaligned.h
>> +++ b/xen/include/xen/unaligned.h
>> @@ -3,6 +3,7 @@
>>    * without faulting, and at least reasonably efficiently.  Other architectures
>>    * will need to have a custom asm/unaligned.h.
>>    */
>> +/* SAF-3-safe direct inclusion guard before */
>>   #ifndef __ASM_UNALIGNED_H__
>>   #error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
>>   #endif
> 
> Apart from the recurring off-by-1, will this have the intended effect of
> Eclair still choking if there's then no inclusion guard following these
> early constructs?
> 
> Jan
> 

No, if you put something between the direct inclusion guard and the 
inclusion guard, no violation will be generated.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


