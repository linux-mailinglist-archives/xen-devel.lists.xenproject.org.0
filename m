Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE15871ADA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 11:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688703.1073169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRxT-0005tF-Jx; Tue, 05 Mar 2024 10:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688703.1073169; Tue, 05 Mar 2024 10:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhRxT-0005rG-Gr; Tue, 05 Mar 2024 10:23:39 +0000
Received: by outflank-mailman (input) for mailman id 688703;
 Tue, 05 Mar 2024 10:23:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ATxC=KL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rhRxS-0005r6-Bm
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 10:23:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6db66b2e-dada-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 11:23:37 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 37CF24EE0737;
 Tue,  5 Mar 2024 11:23:37 +0100 (CET)
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
X-Inumbo-ID: 6db66b2e-dada-11ee-afda-a90da7624cb6
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 11:23:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org, Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 06/10] arm/smmu: address some violations of MISRA C
 Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2402291451390.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <8bbf294d832b973648e84e5d837b1878a84f7645.1709219010.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402291451390.853156@ubuntu-linux-20-04-desktop>
Message-ID: <cdaa1cd34535b48ab2057c24fec18f63@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 23:53, Stefano Stabellini wrote:
> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/drivers/passthrough/arm/smmu.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/xen/drivers/passthrough/arm/smmu.c 
>> b/xen/drivers/passthrough/arm/smmu.c
>> index 625ed0e41961..83196057a937 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -242,7 +242,7 @@ struct arm_smmu_xen_device {
>>  	struct iommu_group *group;
>>  };
>> 
>> -#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->iommu)
>> +#define dev_archdata(dev) ((struct arm_smmu_xen_device 
>> *)(dev)->iommu)
>>  #define dev_iommu_domain(dev) (dev_archdata(dev)->domain)
>>  #define dev_iommu_group(dev) (dev_archdata(dev)->group)
> 
> this is OK
> 
> 
>> @@ -627,7 +627,7 @@ struct arm_smmu_master_cfg {
>>  };
>>  #define INVALID_SMENDX			-1
>>  #define for_each_cfg_sme(cfg, i, idx, num) \
>> -	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
>> +	for (i = 0; idx = (cfg)->smendx[i], (i) < (num); ++(i))
> 
> The first i = 0 is missing parentheses?
> Also idx misses parentheses?

This is another case where the parentheses around the lhs are deviated 
currently. It's up to the maintainers to decide whether to add them 
regardless of that for consistency, or to keep it as is.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

