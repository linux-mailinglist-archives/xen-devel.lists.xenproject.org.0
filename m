Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020AAC127D7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 02:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151925.1482476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDYBM-0001ua-1C; Tue, 28 Oct 2025 01:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151925.1482476; Tue, 28 Oct 2025 01:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDYBL-0001rW-Rj; Tue, 28 Oct 2025 01:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1151925;
 Tue, 28 Oct 2025 01:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvtB=5F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vDYBK-0001rO-Fw
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 01:07:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75b110da-b39a-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 02:07:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id CFDD44EEBC5F;
 Tue, 28 Oct 2025 02:07:21 +0100 (CET)
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
X-Inumbo-ID: 75b110da-b39a-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1761613641;
	b=PFTvpHcfQjyUjaZRniKA8YeWold0Fe7WL3ezvRIAr5aCtZUKL+D6TqQ83QugsBPhbEhR
	 WGGaL7w2H6DCUIKR9siHyExkIyCCScX6EXEa/UFWsTm5jsy0RBeM7YURIw2WukdX4XVFR
	 RhotV1qkLqWua0aLD9S6fwyLcFvRIbGHyYvrW5A5zcv8ylu7d7Dn6DM5vKixMqmmvX5Jj
	 UWsndFs/DlrEE36QMKm4dHh5C3kTOqclg0AMpBPvB0gp/2cdZzk437lF5A38JlkjEOhNE
	 O0LhysXLK9rzcjQj6//8W7gtkJMxdMcnLMBlwFj0TLb5CKb1MNvRkELVkbvUbRRSwwaIb
	 4xQIzHm7YOLhyts0ugleA76onZxFn5kzeys1wj115Z5vR7V4KtzOeZ0+O/IzJoPFWNJXX
	 r0GDGMy4O7X511gBW9Yzo2FfoPWK/7ZiVBtD0ftMrwW5IqTQgLb2kO/fsZmggzsvtmfLG
	 L2orCe/BqYLgXcQjImkAS2r4SpEV8dm8+Y4GCZUaFQW3HRnM6s/RXEjWdhTLIlQTxg2em
	 YgKTMgXpvx2JlYEUDcD+p32VDxlmKiTCh9866SLsQAXRUuHhjl6jFkO9rHatl823KzLVl
	 4w4zshNniK5z6tZ9A2andiJinbdJt7Mkqilx2whuz1VODTWWWD8vzZG17RWiE5A=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1761613641;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=jxp5tNcS/nhc4CJTFG9bzC7gB58PeQRZu2UTTVAvRAM=;
	b=GIOCC4gIyt4mdaaTgpaDnPEoP+KV/0blG3E92Q3SImeJHhkVLJn4db7AFAUWrF+chMqF
	 3chU+2xD0LM22vKDZx2bzZvQs4GeuNZ16SEpG3R10X/HtAypbxMYmmEUy6yeebzP6Uq7X
	 PS5KvhZ7J4Wk+VTbp+Fxi7t4wh+pybLSrUn99XTqZjRN5gdswhna8BghsMODPvExmaaw0
	 /mtI7uxWRSMhu9jGOWwKBU87p2S4F4OR2r3VB9GmRwtSPbmDpjAeyLWYF2RuJCxAExWzv
	 /r1tmJbcBDt8AdtgPgjcJ6jgfSe8HXrbjTkxEZt1LRj1Wu8/D7zR8zUvyAoL731ovyOtB
	 3CN2k2O8ug3MIWrLjprQwPfmzZY2NlZn9Yv7MT6s3hN5gappbgdBlzI9Ks1q6fSHcQuEu
	 pEBMDSckaIrTTwllqoshwTstup3FKBNvkFNAPLXY7h/IvhDOy1xX42vzORGu0iCFKJbQ0
	 E/Ic44VvUx5h7NI/V6v4aa1MK5Kr+HGuHPTFKIxP3jnmXm7eNXmc5xoxwqGCemE7ABmbw
	 ddS9HpCn9nIDOhRaS2FExAYRifji+848XcD12JQwwrH8P7V4iMPJ5vrjkNxInLXgbWGyR
	 LWYjlmvn/po1XX2iGWpjB4cyHelaXOgahIOEBcE1jVdIxIvx75VyIgSmiKr5ZoY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1761613641; bh=rO+2P3+i8tmLXOZ5zyoE5EJNKSnq2o32dwuk2JNDO30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JXxwN6bxvG85/lhBvH1YNcwtvFVcbvmksnwkHV+PjmChlgplFcTWfANSJe+qGRVAF
	 yiNWv6LG/oRWeDke/pPgvh/5vxRkfgD58ltuk90KGahTqFeBPRsXBS8RFswLlbHdCl
	 aG6gXtTnIyxTwW2QGZ84pFwxSHriDQv6tXv87PPBqgPT7mjEcCub7hp4LPFZ64/f9X
	 yqUqWLKkOL3KpoZLd4+bcQlJKJgLVXu9PdkD0y03bN1kwLYsHo3w1X0uNwS8FJgBpg
	 xgg4JQtZXBL3ZCMrOA4Wi+Pog+yQCUWVWGqgfkH9AT19K4iNrIuvMT+tlIm218eqoF
	 4TnGMuAfn1lUA==
MIME-Version: 1.0
Date: Tue, 28 Oct 2025 02:07:21 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN PATCH v2] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <alpine.DEB.2.22.394.2510271656380.495094@ubuntu-linux-20-04-desktop>
References: <1591f6a0c0f3524c4c613328293ed4e03cfc93ef.1761291003.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2510271656380.495094@ubuntu-linux-20-04-desktop>
Message-ID: <f6dbd7a74854cab064cf7ca76c68e44d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-28 00:58, Stefano Stabellini wrote:
> On Fri, 24 Oct 2025, Nicola Vetrini wrote:
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
> 
> Do you have a link to a successful pipeline?
> 
> Just making sure we are not breaking things.
> 

No; not yet, at least [1]. Without the right tags the safety runner 
can't pick up jobs.

[1] 
https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2117835680

> 
>> ---
>> Changes in v2:
>> - rebased to current staging;
>> - fixed regex path issue.
>> ---
>>  automation/gitlab-ci/analyze.yaml | 38 
>> +++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>> 
>> diff --git a/automation/gitlab-ci/analyze.yaml 
>> b/automation/gitlab-ci/analyze.yaml
>> index d50721006740..7bd644d75074 100644
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -45,6 +45,21 @@ eclair-x86_64:
>>      LOGFILE: "eclair-x86_64.log"
>>      VARIANT: "X86_64"
>>      RULESET: "monitored"
>> +
>> +eclair-x86_64-testing:
>> +  extends: eclair-x86_64
>> +  tags:
>> +    - eclair-analysis-testing
>> +  rules:
>> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
>> +      when: always
>> +    - !reference [.eclair-analysis:triggered, rules]
> 
> given that everyone can change this yaml file when pushing to their own
> branch, I think we should remove this, or (probably better) use a
> separate env variable to set the default
> 
> it is better not to use the path, I think
> 

That is a fair concern. One option would be to just use a project runner 
assigned to the people/bugseng/xen subproject, but that might be a bit 
inconvenient if we want to swap runners around. Another option, as you 
said, is keeping the regex in a variable, but this wont't prevent rogue 
modifications of the YAML. I might have found something runner-side with 
[2], but I need to dig deeper on that one.

[2] pre_build_script at 
https://docs.gitlab.com/runner/configuration/advanced-configuration/#the-runners-section
> 
>> +eclair-x86_64-safety:
>> +  extends: eclair-x86_64
>> +  tags:
>> +    - eclair-analysis-safety
>> +  variables:
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_AMD=y
>>        CONFIG_INTEL=n
>> @@ -75,6 +90,10 @@ eclair-x86_64:
>>        CONFIG_DEBUG_LOCKS=n
>>        CONFIG_SCRUB_DEBUG=n
>>        CONFIG_XMEM_POOL_POISON=n
>> +  rules:
>> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && 
>> $CI_COMMIT_BRANCH =~ /^staging$/
>> +      when: always
>> +    - !reference [.eclair-analysis:triggered, rules]
> 
> same here
> 
> 
>>  eclair-ARM64:
>>    extends: .eclair-analysis:triggered
>> @@ -82,6 +101,21 @@ eclair-ARM64:
>>      LOGFILE: "eclair-ARM64.log"
>>      VARIANT: "ARM64"
>>      RULESET: "monitored"
>> +
>> +eclair-ARM64-testing:
>> +  extends: eclair-ARM64
>> +  tags:
>> +    - eclair-analysis-testing
>> +  rules:
>> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/bugseng.*$/
>> +      when: always
>> +    - !reference [.eclair-analysis:triggered, rules]
> 
> and here
> 
> 
>> +eclair-ARM64-safety:
>> +  extends: eclair-ARM64
>> +  tags:
>> +    - eclair-analysis-safety
>> +  variables:
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_NR_CPUS=16
>>        CONFIG_GICV2=n
>> @@ -120,6 +154,10 @@ eclair-ARM64:
>>        CONFIG_DEBUG_LOCKS=n
>>        CONFIG_SCRUB_DEBUG=n
>>        CONFIG_XMEM_POOL_POISON=n
>> +  rules:
>> +    - if: $CI_PROJECT_PATH =~ /^xen-project\/hardware\/xen$/ && 
>> $CI_COMMIT_BRANCH =~ /^staging$/
>> +      when: always
>> +    - !reference [.eclair-analysis, rules]
> 
> and here

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

