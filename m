Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8575BFB6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 09:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567377.886349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMkYr-0002XA-Rv; Fri, 21 Jul 2023 07:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567377.886349; Fri, 21 Jul 2023 07:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMkYr-0002VI-P4; Fri, 21 Jul 2023 07:28:25 +0000
Received: by outflank-mailman (input) for mailman id 567377;
 Fri, 21 Jul 2023 07:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIrH=DH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMkYp-0002VC-Pg
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 07:28:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c1691d8-2798-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 09:28:22 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id A0A984EE0C89;
 Fri, 21 Jul 2023 09:28:20 +0200 (CEST)
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
X-Inumbo-ID: 2c1691d8-2798-11ee-b23a-6b7b168915f2
Message-ID: <8891a642-853b-7e1c-6d91-21e09793fd51@bugseng.com>
Date: Fri, 21 Jul 2023 09:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/arm: optee: provide an initialization for struct
 arm_smccc_res
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <a86604d6c85a0d516b8e29258ffebb2841dc6aff.1689863236.git.nicola.vetrini@bugseng.com>
 <b245a0da-0a21-8405-6744-22b86ba994a5@xen.org>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <b245a0da-0a21-8405-6744-22b86ba994a5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/07/23 17:54, Julien Grall wrote:
> Hi Nicola,
> 
> On 20/07/2023 15:29, Nicola Vetrini wrote:
>> The local variables with type 'struct arm_smccc_res' are initialized
>> just after the declaration to avoid any possible read usage prior
>> to any write usage, which would constitute a violation of
>> MISRA C:2012 Rule 9.1.
>>
>> This is already prevented by suitable checks in the code,
>> but the correctness of this approach is difficult to prove and
>> reason about.
> 
> So I looked at the implementation of arm_smccc_smc(). For arm64, it is 
> (simplified):
> 
> if ( cpus_have_const_cap(ARM_SMCCC_1_1) )
>     arm_smccc_1_1_smc(__VA_ARGS__);
> else
>     arm_smccc_1_0_smc(_VA_ARGS__);
> 
> In arm_smccc_1_1_smc(), we will explicitly initialize __res:
> 
> if ( ___res )
>    *___res = (typeof(*___res)) {r0, r1, r2, r3};
> 
> 
> Whereas for arm_smccc_1_0_smc(), we would call assembly function. I 
> assuming this is the problem?
> 
> I think this is similar to the discussion we had on set_interrupts() and 
> dt_set_cells(). If so, couldn't we tell ECLAIR that 
> __arm_smccc_1_0_smc() will always initialize *res?
> 

This is slightly different because of the chained variadic macro 
expansions of arm_smccc_smc. I could have stated that arm_smccc_smc 
initializes its args, but because it's variadic I can't narrow it down 
to a specific index, therefore the property is not correct, because the 
input arguments are instead expected to be read by the macro. The same 
reasoning applies for all variadic macros that have some input and 
output parameters, not just this one.

In the end, if these were fixed-argument functions or macros we can aim 
for that, and that would obsolete this patch.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

