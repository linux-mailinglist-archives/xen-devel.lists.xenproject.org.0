Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C082579CC4F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600232.935885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg01R-0001Qs-Hm; Tue, 12 Sep 2023 09:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600232.935885; Tue, 12 Sep 2023 09:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg01R-0001Ou-E3; Tue, 12 Sep 2023 09:49:29 +0000
Received: by outflank-mailman (input) for mailman id 600232;
 Tue, 12 Sep 2023 09:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg01P-00015x-GJ
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:49:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a910de04-5151-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:49:26 +0200 (CEST)
Received: from [192.168.1.9] (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id EA7324EE0744;
 Tue, 12 Sep 2023 11:49:25 +0200 (CEST)
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
X-Inumbo-ID: a910de04-5151-11ee-8786-cb3800f73035
Message-ID: <baad5453-00b3-3a91-0921-df108b3c6d86@bugseng.com>
Date: Tue, 12 Sep 2023 11:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 01/10] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <e78d0868a635fe9fba851bb8c2cfc80ba6d73491.1694510856.git.simone.ballarin@bugseng.com>
 <fb421d34-64d0-f9c1-e44d-d3622ac8c3b7@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <fb421d34-64d0-f9c1-e44d-d3622ac8c3b7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/23 11:46, Jan Beulich wrote:
> On 12.09.2023 11:36, Simone Ballarin wrote:
>> Some headers, under specific circumstances (documented in a comment at
>> the beginning of the file), explicitly avoid inclusion guards: the caller
>> is responsible for including them correctly.
>>
>> These files are not supposed to comply with Directive 4.10:
>> "Precautions shall be taken in order to prevent the contents of a header
>> file being included more than once"
>>
>> This patch adds deviation cooments for headers that avoid guards.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> ---
>> Changes in v2:
>> - use the format introduced with doc/misra/safe.json instead of
>>    a generic text-based deviation
>> ---
>>   docs/misra/safe.json                        | 8 ++++++++
>>   xen/include/public/arch-x86/cpufeatureset.h | 1 +
>>   xen/include/public/errno.h                  | 1 +
>>   3 files changed, 10 insertions(+)
>>
>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>> index 39c5c056c7..db438c9770 100644
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -20,6 +20,14 @@
>>           },
>>           {
>>               "id": "SAF-2-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.D4.10"
>> +            },
>> +            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
>> +            "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
>> +        },
> 
> With this ...
> 
>> +        {
>> +            "id": "SAF-3-safe",
>>               "analyser": {},
>>               "name": "Sentinel",
>>               "text": "Next ID to be used"
>> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
>> index 6b6ce2745c..eac1ae4b2a 100644
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -23,6 +23,7 @@
>>    * their XEN_CPUFEATURE() being appropriate in the included context.
>>    */
>>   
>> +/* SAF-1-safe header that leaves it up to the caller to include them correctly */
>>   #ifndef XEN_CPUFEATURE
>>   
>>   /*
>> diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
>> index 5a78a7607c..8b60ac74ae 100644
>> --- a/xen/include/public/errno.h
>> +++ b/xen/include/public/errno.h
>> @@ -17,6 +17,7 @@
>>    * will unilaterally #undef XEN_ERRNO().
>>    */
>>   
>> +/* SAF-1-safe header that leaves it up to the caller to include them correctly */
>>   #ifndef XEN_ERRNO
>>   
>>   /*
> 
> ... you mean SAF-2-safe in both code comments. I did point out the problem
> with the sequential numbering (and resulting rebasing mistakes) when the
> scheme was introduced.
> 
> I also think the comments are too verbose. I don't mind them having an
> indication what specific issue they are about, but it shouldn't be more
> than a couple of words. Here maybe "omitted inclusion guard".
> 
> Jan

Yes, you are right: I've made a mistake when rebasing against 
origin/staging.

I will wait more comments on the series, then I will submit v3
with the correct IDs.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


