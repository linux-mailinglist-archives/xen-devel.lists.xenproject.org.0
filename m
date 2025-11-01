Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05817C278DD
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 07:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154850.1484522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vF5FT-0006dm-1m; Sat, 01 Nov 2025 06:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154850.1484522; Sat, 01 Nov 2025 06:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vF5FS-0006bS-Um; Sat, 01 Nov 2025 06:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1154850;
 Sat, 01 Nov 2025 06:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYsC=5J=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vF5FR-0006b3-5e
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 06:38:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de4e767-b6ed-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 07:37:58 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A36064EE8C8B;
 Sat,  1 Nov 2025 07:37:56 +0100 (CET)
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
X-Inumbo-ID: 4de4e767-b6ed-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1761979076;
	b=PTyPmulIHclyO2Qkz15+Mb9lzqKlMS58ABhxjgDQuYQIIGm0BZuAhnV0ri0wDGGnvHIc
	 dmB3gcMQnNne0D2MtfCMId4Yz0OpF82YXZyxjDL2Zd4MZsyhE0rEi/L2VBoaBGTjOkYad
	 pXg8eGlQaOGxyutTruwH8bGvR8MeyqC5g85I1c8oryaBRO+zUopsuqhjouX1Mvs5FDLfY
	 MbH3SbKmUi8JDwoiOK6/BEAUJnVSh3UEMc4o2JwrJeIzwFtSOPt87oWF+7yfIxpkdkdsU
	 7WbaDNRj8HpHQVY1vpAUnULz9/A5qtRcfhyPnFKY4LYhDoVk77hzkH7w/ti7vsNW7+fOd
	 5M/EDqd5D445PR4bJV18ADaIAr/kK08T5Sdf1svDpUs8PGQjOS5wRTeDjZzquxlAq/Zeh
	 cmqL7dAYBZaXjPZCHuGYdMVuh+Wis35c4hukk3/LVo9qdXKl1gwVS83HeHiEW/D+ostKw
	 ixXxmQiugmyc+XHOpn3AxjE56UlhaNYbCliOUO96UuSFymXfO5ZPwVmDO41LZDgvVtA3t
	 HgpgTWVL6kRTcFEOtjXmLa5nom6SI5G0qhBJjAtPdsBp9aUlSGV1xeNMBFBVopAlGeDmQ
	 lSgpLABVJPJNTdifw7n5c3ZoHiKGqpJ7Hd397QrLvoN3k+z/i96dQtCtrdxck9E=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1761979076;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dzfz4lp5jGZyHnaFvwGlIWDOyeYcfV/ytR+E+baJEq8=;
	b=aoVv9laG0qFXkMeHg3kPa4zSXdWfEPrzqViiNnhGJv1ax/DY+WT3NX9/iN1w7wxjAOxt
	 ki0uEzrXlztQ1TEvlfgQoyx8zwi79Y2weUxccCU0DfHUB325O/F00kO0NEtYa2u2EdCk9
	 xUgjvxu8B///QMuyBmAdc/4gMOgNwDF1rczZ+4BvdJbK1WrsqDI2nsjp5oXypxFK0hY0d
	 ZhzrlxQ7fRhDhVy810JTq8/tKo1kNktXi2NrNn71OpGLatsI9pIfq5Tn4yrFPfow0uqx7
	 zT5ThDWmmHAHIpcyfc99UUViQ8pCjRIhSjunRVuKDMCuKIp1OgS3P2Ap0aM8wA2x9CTYg
	 VmqlJUyQkzk8liiXhjkTX41DTjkJA34tPlsV8vmAKG0vCEhcsZHaMPlJNh7P4K/wEs0w6
	 6Yq9AQ0UP/uczZj/nwn8mAOqfRlPORyOaapGZrKDeGByo0pePZ5hNFow8RpI3DOj9p6oG
	 RA6+lNibCCr22MTa4v5KjQuayVR7WhaHDOoNnnIlmu0gXkQsnx4ptU4EKU+xqYDloxDoy
	 NkruGA77JPksD4rrpKcvvn0ccdoODoW6hi3kQJq0y0MTEIMOJMpGgDOPvOcTYS2AeoMp0
	 JdkiWsXnIV+O3JoaPj6FFQrzWWtxCVHoUrMcFcrwLgOgerxyYIlIn/S7tSANr/c=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1761979076; bh=0hoXtm2+MOmQvXHPNnG7OY2wGJmZTbIWW6onKx2+Z0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ex8WtOtoqDm+FNHAtvVYXLxoUgMHo9LVMqWmiq1SMLrAkeA97bgF91ANtqUPaJZtH
	 sK2W0s3M7dFIct1ENTrZAX++bXgS1yo8vfUNgyRSvspaVPjtNgQnhqcgA8R+vVX0HZ
	 S00ugZGZQVKzDBx3fkjPyqoIj9+FgUkjKfwFw1eFd+bwfAnL7e9l86RU2MYAYQOKks
	 yEXge5cYkTW3WcWpoJHUGuEWFijPShbkVV5s3lp2Z4z9IOU+xleaoOONSTCbuEYLZV
	 pwl2MKEJ09nEjrghFh5qqqfAbAMp75upJzHXFIFDc/bKF+KFSIVOHzVA71LeH+b9oz
	 lURxHJ6Pr0w3Q==
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 07:37:56 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v3] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <alpine.DEB.2.22.394.2510311255210.495094@ubuntu-linux-20-04-desktop>
References: <876da816d5aacdb688599fd1d50efca2f856d080.1761897244.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2510311255210.495094@ubuntu-linux-20-04-desktop>
Message-ID: <5d70118c343eafbea6d9b4c2f6134595@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-31 20:55, Stefano Stabellini wrote:
> On Fri, 31 Oct 2025, Nicola Vetrini wrote:
>> The following analysis jobs are performed:
>> - eclair-{x86_64,ARM64}: analyze Xen using the default configuration 
>> for
>>   that architecture; runs on runners tagged `eclair-analysis'.
>> 
>> - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration 
>> for
>>   safety, which is more restricted; runs on runners tagged
>>   `eclair-analysis-safety`.
>> 
>> - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
>>   configuration for the purposes of testing new runner updates; runs 
>> on
>>   runners tagged `eclair-analysis-testing`.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> CI pipeline: 
>> https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2130873833
>> 
>> Note: the eclair-ARM64 and eclair-x86_64 jobs are allowed to fail 
>> because the
>> configuration is not (yet) clean for all checked MISRA guidelines.
>> 
>> Changes in v3:
>> - Use a variable instead of testing the repository PATH to decide 
>> whether a job
>>   should be run for *-testing and *-safety analyses;
>> - Allow eclair-{x86_64,ARM64} default configurations to fail, as the 
>> configuration
>>   is not yet clean for MISRA.
>> Changes in v2:
>> - rebased to current staging;
>> - fixed regex path issue.
>> ---
>>  automation/gitlab-ci/analyze.yaml | 42 
>> ++++++++++++++++++++++++++++++-
>>  1 file changed, 41 insertions(+), 1 deletion(-)
>> 
>> diff --git a/automation/gitlab-ci/analyze.yaml 
>> b/automation/gitlab-ci/analyze.yaml
>> index d50721006740..fae55a23dbb5 100644
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -45,6 +45,22 @@ eclair-x86_64:
>>      LOGFILE: "eclair-x86_64.log"
>>      VARIANT: "X86_64"
>>      RULESET: "monitored"
>> +  allow_failure: true
> 
> Wouldn't "allow_failure: true" also change the behavior for the 
> existing
> jobs? I would think we want to continue not allowing failures for 
> those.
> I would think that at least eclair-x86_64-safety should not allow
> failures (like before this patch).
> 

Well spotted, for some reason I thought that it would be overwritten by 
the rules section in the extended job. I will put an explicit 
allow_failure: false in *-safety job to preserve their behavior, then 
when (if?) the eclair-{arm64,x86_64} jobs are also clean, we can remove 
both settings

> 
>> +eclair-x86_64-testing:
>> +  extends: eclair-x86_64
>> +  tags:
>> +    - eclair-analysis-testing
>> +  rules:
>> +    - if: $ECLAIR_TESTING
>> +      when: always
>> +    - !reference [.eclair-analysis:triggered, rules]
> 
> I imagine that ECLAIR_TESTING will be typically off in
> gitlab.com/xen-project/hardware/xen, right?
> 

It's not about the repo, but the runner environment. The runner(s) 
tagged with eclair-analysis-testing do have ECLAIR_TESTING set, while 
the ones tagged with eclair-analysis-safety and/or eclair-analysis have 
the ECLAIR_SAFETY variable defined.

> 
>> +eclair-x86_64-safety:
>> +  extends: eclair-x86_64
>> +  tags:
>> +    - eclair-analysis-safety
>> +  variables:
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_AMD=y
>>        CONFIG_INTEL=n
>> @@ -75,6 +91,10 @@ eclair-x86_64:
>>        CONFIG_DEBUG_LOCKS=n
>>        CONFIG_SCRUB_DEBUG=n
>>        CONFIG_XMEM_POOL_POISON=n
>> +  rules:
>> +    - if: $ECLAIR_SAFETY && $CI_COMMIT_BRANCH =~ /^staging$/
>> +      when: always
> 
> On the other hand, I expect that ECLAIR_SAFETY will be on in
> gitlab.com/xen-project/hardware/xen, right?
> 
> I don't think we need the extra check on "staging" as the branch
> on gitlab.com/xen-project/hardware/xen are very limited.
> 

Ok, can edit that out

> 
>> +    - !reference [.eclair-analysis:triggered, rules]
>> 
>>  eclair-ARM64:
>>    extends: .eclair-analysis:triggered
>> @@ -82,6 +102,22 @@ eclair-ARM64:
>>      LOGFILE: "eclair-ARM64.log"
>>      VARIANT: "ARM64"
>>      RULESET: "monitored"
>> +  allow_failure: true
> 
> Same comment for ARM
> 
> 
>> +eclair-ARM64-testing:
>> +  extends: eclair-ARM64
>> +  tags:
>> +    - eclair-analysis-testing
>> +  rules:
>> +    - if: $ECLAIR_TESTING
>> +      when: always
>> +    - !reference [.eclair-analysis:triggered, rules]
>> +
>> +eclair-ARM64-safety:
>> +  extends: eclair-ARM64
>> +  tags:
>> +    - eclair-analysis-safety
>> +  variables:
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_NR_CPUS=16
>>        CONFIG_GICV2=n
>> @@ -120,13 +156,17 @@ eclair-ARM64:
>>        CONFIG_DEBUG_LOCKS=n
>>        CONFIG_SCRUB_DEBUG=n
>>        CONFIG_XMEM_POOL_POISON=n
>> +  rules:
>> +    - if: $ECLAIR_SAFETY && $CI_COMMIT_BRANCH =~ /^staging$/
>> +      when: always
>> +    - !reference [.eclair-analysis, rules]
>> 
>>  .eclair-analysis:on-schedule:
>>    extends: .eclair-analysis
>>    rules:
>>      - if: $CI_PIPELINE_SOURCE != "schedule"
>>        when: never
>> -    - !reference [.eclair-analysis, rules]
>> +    - !reference [.eclair-analysis:triggered, rules]
>> 
>>  eclair-x86_64:on-schedule:
>>    extends: .eclair-analysis:on-schedule
>> --
>> 2.43.0
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

