Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3657FF642
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645065.1006867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k2Z-0002Ep-Hf; Thu, 30 Nov 2023 16:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645065.1006867; Thu, 30 Nov 2023 16:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k2Z-0002CA-Ds; Thu, 30 Nov 2023 16:37:27 +0000
Received: by outflank-mailman (input) for mailman id 645065;
 Thu, 30 Nov 2023 16:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6V2q=HL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r8k2Y-0002Am-GK
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:37:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda756b5-8f9e-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:37:24 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 185B64EE0739;
 Thu, 30 Nov 2023 17:37:23 +0100 (CET)
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
X-Inumbo-ID: bda756b5-8f9e-11ee-9b0f-b553b5be7939
Message-ID: <dcf64e9b-3e2f-423e-bc8c-0062c80acae8@bugseng.com>
Date: Thu, 30 Nov 2023 17:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: improve scheduled analyses
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>
References: <36ea68b24a1e336ef9170b7f89949d282ee1e746.1700752056.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2311291911350.3533093@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2311291911350.3533093@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/11/23 04:13, Stefano Stabellini wrote:
> On Thu, 23 Nov 2023, Simone Ballarin wrote:
>> The scheduled analyses are intended to maintain an overall vision
>> of the MISRA complaince of the entire project. For this reason,
>> the file exclusions in "out_of_scope.ecl" should not be applied.
>>
>> This patch amends ECLAIR settings to prevent exempting files for
>> scheduled analyses.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> ---
>> Changes in v2:
>> - drop changes to inhibit test and build stages in scheduled pipelines.
>> ---
>>   automation/eclair_analysis/ECLAIR/action.settings |  2 +-
>>   automation/eclair_analysis/ECLAIR/analysis.ecl    | 12 ++++++++++--
>>   automation/gitlab-ci/analyze.yaml                 |  2 ++
>>   3 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
>> index f96368ffc7..3cba1a3afb 100644
>> --- a/automation/eclair_analysis/ECLAIR/action.settings
>> +++ b/automation/eclair_analysis/ECLAIR/action.settings
>> @@ -134,7 +134,7 @@ push)
>>       badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} #${jobId}"
>>       ;;
>>   auto_pull_request)
>> -    git remote remove autoPRRemote || true
>> +    git remote remove autoPRRemote 2>/dev/null || true
>>       git remote add autoPRRemote "${autoPRRemoteUrl}"
>>       git fetch -q autoPRRemote
>>       subDir="${ref}"
>> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
>> index fe418d6da1..2507a8e787 100644
>> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
>> @@ -2,7 +2,13 @@
>>   -project_name=getenv("ECLAIR_PROJECT_NAME")
>>   -project_root=getenv("ECLAIR_PROJECT_ROOT")
>>   
>> --setq=data_dir,getenv("ECLAIR_DATA_DIR")
>> +setq(data_dir,getenv("ECLAIR_DATA_DIR"))
>> +setq(analysis_kind,getenv("ANALYSIS_KIND"))
>> +setq(scheduled_analysis,nil)
>> +
>> +strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
>> +strings_map("scheduled-analysis",500,"","^.*$",0)
>> +map_strings("scheduled-analysis",analysis_kind)
>>   
>>   -verbose
>>   
>> @@ -15,7 +21,9 @@
>>   
>>   -eval_file=toolchain.ecl
>>   -eval_file=public_APIs.ecl
>> --eval_file=out_of_scope.ecl
>> +if(scheduled_analysis,
>> +    eval_file("out_of_scope.ecl")
>> +)
> 
> 
> Overall the patch looks much better. Only one question: shouldn't it be
> 
>    if not scheduled_analysis
> 
> instead of:
> 
>    if scheduled_analysis
> 
> I don't know the language of analysis.ecl but we are supposed to add
> out_of_scope.ecl in all cases except for scheduled_analysis. Looking at
> this change it seems to do the opposite?

yes, you're right. I will fix the guard in v3.
> 
> 
>>   -eval_file=deviations.ecl
>>   -eval_file=call_properties.ecl
>>   -eval_file=tagging.ecl
>> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
>> index bd9a68de31..6631db53fa 100644
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -28,6 +28,8 @@
>>     extends: .eclair-analysis
>>     allow_failure: true
>>     rules:
>> +    - if: $CI_PIPELINE_SOURCE == "schedule"
>> +      when: never
>>       - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
>>         when: manual
>>       - !reference [.eclair-analysis, rules]
>> -- 
>> 2.34.1
>>
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


