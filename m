Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB162800C73
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 14:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645546.1007759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93pD-0003ev-ED; Fri, 01 Dec 2023 13:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645546.1007759; Fri, 01 Dec 2023 13:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r93pD-0003dH-9r; Fri, 01 Dec 2023 13:44:59 +0000
Received: by outflank-mailman (input) for mailman id 645546;
 Fri, 01 Dec 2023 13:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkum=HM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r93pB-0003dB-Pa
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 13:44:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0685a08-904f-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 14:44:57 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 054484EE073C;
 Fri,  1 Dec 2023 14:44:55 +0100 (CET)
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
X-Inumbo-ID: d0685a08-904f-11ee-98e5-6d05b1d4d9a1
Message-ID: <0e3acb5e-b1ff-40dd-8f63-d5806527321c@bugseng.com>
Date: Fri, 1 Dec 2023 14:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a295b44a9fbb02f962720e086588437876e02ce3.1701430079.git.maria.celeste.cesario@bugseng.com>
 <a33ffc19-1e1c-4126-aba4-4a2b0ee24cf4@xen.org>
 <ca2d37aa-fb8f-4b49-8909-ad7d4065a59c@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <ca2d37aa-fb8f-4b49-8909-ad7d4065a59c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/23 14:03, Jan Beulich wrote:
> On 01.12.2023 12:48, Julien Grall wrote:
>> On 01/12/2023 11:37, Simone Ballarin wrote:
>>> --- a/xen/arch/arm/include/asm/regs.h
>>> +++ b/xen/arch/arm/include/asm/regs.h
>>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>>>    
>>>    static inline bool guest_mode(const struct cpu_user_regs *r)
>>>    {
>>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() - (const uintptr_t)(r);
>>
>> NIT: The const should not be necessary here. Am I correct?
>>
>>> --- a/xen/arch/x86/include/asm/regs.h
>>> +++ b/xen/arch/x86/include/asm/regs.h
>>> @@ -6,7 +6,8 @@
>>>    
>>>    #define guest_mode(r)                                                         \
>>>    ({                                                                            \
>>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);         \
>>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() -             \
>>> +                                                        (const uintptr_t(r)); \
>>
>> Was this compiled on x86? Shouldn't the last one be (const uintptr_t)(r))?
> 
> And again with the stray const-s dropped and with indentation adjusted.
> 

I will remove the const in the first parameter and fix the indentation
in the following way:

unsigned long diff = (uintptr_t)guest_cpu_user_regs() -                \
                      (const uintptr_t)(r);                             \

> Jan
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


