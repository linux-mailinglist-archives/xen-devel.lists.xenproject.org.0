Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B967365BA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 10:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551468.861022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBWO6-0000M6-OO; Tue, 20 Jun 2023 08:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551468.861022; Tue, 20 Jun 2023 08:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBWO6-0000Jk-Lg; Tue, 20 Jun 2023 08:06:54 +0000
Received: by outflank-mailman (input) for mailman id 551468;
 Tue, 20 Jun 2023 08:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8C9p=CI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBWO6-0000Je-6m
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 08:06:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8c5e43-0f41-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 10:06:53 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.46.142.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 89AAD4EE0737;
 Tue, 20 Jun 2023 10:06:50 +0200 (CEST)
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
X-Inumbo-ID: 6a8c5e43-0f41-11ee-b234-6b7b168915f2
Message-ID: <d93d9232-213b-e6b3-c390-9e93d63bd3a3@bugseng.com>
Date: Tue, 20 Jun 2023 10:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v2 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <3f8d720c09d603edcc608b1b73423c35ea8f6e3f.1687167502.git.nicola.vetrini@bugseng.com>
 <637d2a61-2c30-76a4-60b0-cf4d979c59be@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <637d2a61-2c30-76a4-60b0-cf4d979c59be@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/06/23 12:10, Julien Grall wrote:
> Hi,
> 
> On 19/06/2023 10:56, Nicola Vetrini wrote:
>> In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few 
>> occurrences
>> of nested '//' character sequences inside C-style comment blocks, 
>> which violate
>> Rule 3.1. The patch aims to resolve those by removing the nested 
>> comments.
> 
> I think it is important to understand/explain what was the intention of 
> the // before removing them because, IMHO, the new approach doesn't 
> convey the same information. Before...
> 
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com
>> Changes:
>> - Resending the patch with the right maintainers in CC.
>> Changes in V2:
>> - Split the patch into a series and reworked the fix.
>> - Apply the fix to the arm32 `flushtlb.h' file, for consistency
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>   xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c 
>> b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 720aa69ff2..f410863e10 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -1047,10 +1047,10 @@ static int arm_smmu_atc_inv_domain(struct 
>> arm_smmu_domain *smmu_domain,
>>        * before we read 'nr_ats_masters' in case of a concurrent call to
>>        * arm_smmu_enable_ats():
>>        *
>> -     *    // unmap()            // arm_smmu_enable_ats()
>> +     *    unmap()                arm_smmu_enable_ats()
> 
> ... with the // it would be clearer that the code below belongs to each 
> function. But now, it leads to think there are a call to 'unmap' which 
> it then followed by TLBI+SYNC.
> 
> In this case, I would propose to use --- <function> ---

It seems a good suggestion to me.

> 
>>        *    TLBI+SYNC            atomic_inc(&nr_ats_masters);
>>        *    smp_mb();            [...]
>> -     *    atomic_read(&nr_ats_masters);    pci_enable_ats() // writel()
>> +     *    atomic_read(&nr_ats_masters);    pci_enable_ats() (i.e. 
>> writel())
> 
> NIT: I think 'see' would be better than 'i.e.' because I read it as 
> pci_enable_ats() is a simple writel().

Ok.

> 
>>        *
>>        * Ensures that we always see the incremented 'nr_ats_masters' 
>> count if
>>        * ATS was enabled at the PCI device before completion of the TLBI.
> 
> Cheers,
> 

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

