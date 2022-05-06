Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D851F51D6D7
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322954.544451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwJs-000419-GQ; Fri, 06 May 2022 11:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322954.544451; Fri, 06 May 2022 11:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwJs-0003xv-D4; Fri, 06 May 2022 11:40:24 +0000
Received: by outflank-mailman (input) for mailman id 322954;
 Fri, 06 May 2022 11:40:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmwJq-0003xp-UZ
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 11:40:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmwJq-0005Rh-Il; Fri, 06 May 2022 11:40:22 +0000
Received: from [54.239.6.185] (helo=[192.168.5.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmwJq-0002qz-Bn; Fri, 06 May 2022 11:40:22 +0000
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
	bh=W8x6LzBWusOs15c1UMfyH3kcsdbMXBPeYE6vUVLayE4=; b=S5DE60CqUdQ0GVHvF/aYXDL3To
	nH9cz+pR3Z+BGKkLne7WvMdy3ElHNW9riJLPah+m8UCJQuVwjt7rFPQe5L3DG1SqaeZTUfEFpdHNJ
	Fvx/cwM8/A28UKDRc/tItCsLgMKsLjzEdy+q07UtWv2z56Dlhr/N9jrPQ2RHrI9pPP+A=;
Message-ID: <a57af889-b231-2d34-7e0f-de0be920e00e@xen.org>
Date: Fri, 6 May 2022 12:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v8 0/7] Boot time cpupools
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20220421081645.40235-1-luca.fancellu@arm.com>
 <0EA6F35B-89E9-45AC-9274-567F86E67C6E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0EA6F35B-89E9-45AC-9274-567F86E67C6E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 06/05/2022 12:25, Luca Fancellu wrote:
> 
>> The example DT is instructing Xen to have two cpu pools, one having two phisical
>> cpus and the one having 4 phisical cpus, the last mentioned cpu pool uses the
>> null scheduler and from the /chosen node we can see that a dom0less guest will
>> be started on that cpu pool.
>>
>> In this particular case Xen must boot with different type of cpus, so the
>> boot argument hmp_unsafe must be enabled.
>>
>> Luca Fancellu (7):
>>   tools/cpupools: Give a name to unnamed cpupools
>>   xen/sched: create public function for cpupools creation
>>   xen/sched: retrieve scheduler id by name
>>   xen/cpupool: Create different cpupools at boot time
>>   xen/cpupool: Don't allow removing cpu0 from cpupool0
>>   arm/dom0less: assign dom0less guests to cpupools
>>   xen/cpupool: Allow cpupool0 to use different scheduler
>>
>> MAINTAINERS                            |   2 +-
>> docs/misc/arm/device-tree/booting.txt  |   5 +
>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++
>> tools/helpers/xen-init-dom0.c          |  37 +++-
>> tools/libs/light/libxl_utils.c         |   3 +-
>> xen/arch/arm/domain_build.c            |  19 +-
>> xen/arch/arm/include/asm/smp.h         |   3 +
>> xen/common/domain.c                    |   2 +-
>> xen/common/sched/Kconfig               |   7 +
>> xen/common/sched/Makefile              |   1 +
>> xen/common/sched/boot-cpupool.c        | 234 +++++++++++++++++++++++++
>> xen/common/sched/core.c                |  40 +++--
>> xen/common/sched/cpupool.c             |  43 ++++-
>> xen/include/public/domctl.h            |   5 +-
>> xen/include/xen/sched.h                |  53 ++++++
>> 15 files changed, 563 insertions(+), 31 deletions(-)
>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>> create mode 100644 xen/common/sched/boot-cpupool.c
>>
>> -- 
>> 2.17.1
>>
> 
> Ping?

You seemed to have forgotten to CC the relevant maintainers on each 
patch and the cover letter. I only got this e-mail because I have a 
filter for some keywords.

> 
> The v8 seems to be reviewed for all patch
> 
> https://patchwork.kernel.org/project/xen-devel/list/?series=634064

AFAICT, patchwork only tells you the number of reviewed-by tag. It 
doesn't tell you whether the patch was suitably reviewed.

Looking through the patches:
   #1: Ready
   #2: Ready
   #3: Ready
   #4: Missing review from the cpupool maintainers (Juergen or Dario)
   #5: Ready
   #6: Missing review from the cpupool maintainers
   #7: Ready

Cheers,

-- 
Julien Grall

