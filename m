Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE007D825A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623766.971923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzF2-0004Aq-2S; Thu, 26 Oct 2023 12:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623766.971923; Thu, 26 Oct 2023 12:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzF1-000470-Vx; Thu, 26 Oct 2023 12:13:35 +0000
Received: by outflank-mailman (input) for mailman id 623766;
 Thu, 26 Oct 2023 12:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gVJW=GI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qvzF0-00045h-H1
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:13:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 152884ac-73f9-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 14:13:33 +0200 (CEST)
Received: from [192.168.1.15] (host-95-247-204-25.retail.telecomitalia.it
 [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 005C54EE0742;
 Thu, 26 Oct 2023 14:13:32 +0200 (CEST)
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
X-Inumbo-ID: 152884ac-73f9-11ee-98d5-6d05b1d4d9a1
Message-ID: <1f137be0-452d-4073-a79c-ffd8a501e434@bugseng.com>
Date: Thu, 26 Oct 2023 14:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 8.3
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <1c146f28cb19607ddd6741de4f7de051894a3381.1698314415.git.federico.serafini@bugseng.com>
 <662e9080-5648-47eb-95e6-41fcb618c68f@xen.org>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <662e9080-5648-47eb-95e6-41fcb618c68f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/23 12:25, Julien Grall wrote:
> Hi,
> 
> On 26/10/2023 11:04, Federico Serafini wrote:
>> Update ECLAIR configuration to deviate Rule 8.3 ("All declarations of
>> an object or function shall use the same names and type qualifiers")
>> for the following functions: guest_walk_tables_[0-9]+_levels().
>> Update file docs/misra/deviations.rst accordingly.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v2:
>>    - removed set_px_pminfo() from the scope of the deviation;
>>    - fixed tag of the commit.
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>>   docs/misra/deviations.rst                        | 6 ++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index d8170106b4..b99dfdafd6 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -204,6 +204,10 @@ const-qualified."
>>   
>> -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
>>   -doc_end
>> +-doc_begin="For functions guest_walk_tables_[0-9]+_levels(), 
>> parameter names of definitions deliberately differ from the ones used 
>> in the corresponding declarations."
>> +-config=MC3R1.R8.3,declarations={deliberate,"^guest_walk_tables_[0-9]+_levels\\(const struct vcpu\\*, struct p2m_domain\\*, unsigned long, walk_t\\*, uint32_t, gfn_t, mfn_t, void\\*\\)$"}
>> +-doc_end
>> +
>>   -doc_begin="The following variables are compiled in multiple 
>> translation units
>>   belonging to different executables and therefore are safe."
>>   -config=MC3R1.R8.6,declarations+={safe, 
>> "name(current_stack_pointer||bsearch||sort)"}
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 8511a18925..9423b5cd6b 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -121,6 +121,12 @@ Deviations related to MISRA C:2012 Rules:
>>            - xen/common/unxz.c
>>            - xen/common/unzstd.c
>> +   * - R8.3
>> +     - In some cases, parameter names used in the function definition
>> +       deliberately differ from the ones used in the corresponding 
>> declaration.
> 
> It would be helpful to provide a bit more reasoning in your commit 
> message why this was desired. At least for Arm and common code, I would 
> not want anyone to do that because it adds more confusion.
> 
>> +     - Tagged as `deliberate` for ECLAIR. Such functions are:
>> +         - guest_walk_tables_[0-9]+_levels()
> 
> I think you want to be a bit mores specific. Other arch may have such 
> function in the function and we don't want to deviate them from the start.
> 
> Cheers,
> 

Alright, thanks for the observation.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

