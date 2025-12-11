Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34AACB64AA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184224.1506722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiR5-00052U-V0; Thu, 11 Dec 2025 15:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184224.1506722; Thu, 11 Dec 2025 15:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiR5-00050P-SA; Thu, 11 Dec 2025 15:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1184224;
 Thu, 11 Dec 2025 15:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTiR4-00050J-06
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:18:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2a9883d-d6a4-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 16:18:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9FFD54EEBF88;
 Thu, 11 Dec 2025 16:18:22 +0100 (CET)
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
X-Inumbo-ID: a2a9883d-d6a4-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765466303;
	b=IwnClSH2ERZzme6LFUkhSbXcD2vykIhdg+uE2hYbfgdLNP2AVQaDlu4KHijls8R84tYz
	 aUvW+iSvgE7cGqfiiXePPc1DRVyVVwdzTrUf3ECewrRz7RPtoKv4LcbtjCC3dZ1Ja1pqV
	 NSDBPtseXbxv1EGvz+Fs3q75Ww3w7qn4kY9jkBSIn579YLVdzJasAoXoYXOdmwEDrmslT
	 IFuEZVwEYjCDwM4TLK+OInvY1w78ziBcg8DO2yY02xDxsNUayjS4lN2oabdZu9+k08cv3
	 2tgBvleevvU+ALJBJwTvb62+mnAYgUwDhtFC3+p1MpA1U9B7E7wgvJCWGFHGrIdZLIcpB
	 nFS/AGtYMOjkZASkyxzWVKZv2iUtxRwTnU5TUAZacfha8OTZncfqWbL0Wf6o9/9bfixte
	 yQM5AOr6VxYR/+lfUmEzgXJKOEivmDenOFawboUrjdWZtKPd4U4eFj1iDibUucDCfasWk
	 LKNrHnr7o97YIoB1Ukg+G1fPpNgllmDOFb0oe+pWu/RUQdr2CwbTWlnHo5NStivDwFCHG
	 TqCxUB69PlAao6Ecp5AwXWEXxiBm3q7MFO6HkqMD8tV0cM3lxB2kbN4BGzwoKAVYbznlN
	 1+bUCXREvcZROe+PfO/QBZWT9ssLeLGnma7CkhMDfb1UCUUfM0mkDbE6GxFbXG8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765466303;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=IgIn2ddkSJbd41T8gExz/vf+ehlQlgxRgDoZXDSPDWo=;
	b=2a2gZ2aOUPdJes1pDm5zDr6dkUVk+LlVhNjbvjZ7ORBxjJ60g7ul1HpyTYRTNoZ9yC7r
	 goBHTkq0oSG48OkPfSC9wgDj2NTfWPY/hBJqr0BJVSxVlpEb1G6GOVoOqG2Kk9aX5+z+2
	 Y1qiccTC9Ma9Je5JZ5GmMFXZQg74/92kTLbYN6Nu6/BjYzWhGhfSsOpO9u5u/xamvElCw
	 D/7sYFeCLPiG15dGd9ZYEXrm2bun2StsDcIvso/IAUPSJE/GbH7qEOT0pcPkQzHaOWpCM
	 mApBfOjHhd5Z7/9IqrNmGtBb8rLTLFWjhoK0WVd+qm0KpOCdulZT3w0szTuju/Cmc5OAG
	 C7gitTE+51v1dXkyLBVIwdf5sHel0UPiunRHQZ+SPLl46OPr42KW+WsEUkNxxPWLWyq05
	 Fo3IG7WIs8hPhqxl5vX9ZEABDpG8cb+mQHG1uSppJ5jBnRFW6oa8JHErrMAaSAgrHIXEm
	 gV9Dq2nNv/tzKWJduG1BGz56Djg6V7W/ff4RUV9OKDPCnswL3afX6oueFsFD/JEafdG0e
	 6vBQZVCB4ym4EB1ntlaPrvhk0sEj9OgC2w5wMw4pk/jTM7Z1uGWAMri7k2SPNvWdOYdxW
	 Dad1TPuY5SgdVGuHj/TXAzsYEpDnyOz1l4MbN/PjkspO5iMdPeziq67LCTyogDM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765466303; bh=qk5+1cbZFi4Ga2kf47fLs9/D/yVTd57PjBrgnPoS41k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BrYAhEVsUQjqAh+JFT1AlmSQ9NJqXWCiKeGyf7gFA1QY4i7JaTfthNqz43UOIJiod
	 X4LjMgNGRTQnFeasRQLRiqhbp1lSJjsiaGkKxLao0LE/ZK9xLI2Mhnj2tXUJjuSj4A
	 WqTvN3oLlEbXqHA2jMhCCIWVnOvHBRf/iY4D5mLgWlqQodPR3NJpMN3Vw8hAivQaXY
	 RuqpqMffEe2Cj/myKGt1j+NlDJ/cUxCJxHuVOaW/N7/a/HInL4xvXS4clGPNwmau0k
	 GqtgTXcWY43YPzm0vUB/ZYPgTCkpnplnwH7+Z3H1u+rGIgbhvH4gwrmNIRlb6/MM1Q
	 Hy8Rl7KAzgb5Q==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 16:18:22 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@gmail.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] automation/eclair: Run *-testing jobs only in some
 branches
In-Reply-To: <8335c03a-0635-4a97-98d2-4f12ab352d5a@citrix.com>
References: <cf852fe2b233bf98e57bcf82d4c9253b59aa17ab.1765459392.git.nicola.vetrini@bugseng.com>
 <8335c03a-0635-4a97-98d2-4f12ab352d5a@citrix.com>
Message-ID: <d8d4165c1e8fc550d42b2930c8a176cd@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 15:27, Andrew Cooper wrote:
> On 11/12/2025 1:34 pm, Nicola Vetrini wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> These jobs should not run in regular scans, but only in 
>> xen-project/people
>> repositories and branches to speed up pipeline execution.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This should alleviate some of the recent delays of the ECLAIR 
>> pipelines
>> ---
>>  automation/gitlab-ci/analyze.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/automation/gitlab-ci/analyze.yaml 
>> b/automation/gitlab-ci/analyze.yaml
>> index 5ddfe37903..88bc42f5c3 100644
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -52,6 +52,8 @@ eclair-x86_64-testing:
>>    tags:
>>      - eclair-analysis-testing
>>    rules:
>> +    - if: $CI_PROJECT_PATH !~ /^xen-project\/people/.*$/
>> +      when: never
>>      - if: $ECLAIR_TESTING
>>        when: always
>>      - !reference [.eclair-analysis:triggered, rules]
>> @@ -110,6 +112,8 @@ eclair-ARM64-testing:
>>    tags:
>>      - eclair-analysis-testing
>>    rules:
>> +    - if: $CI_PROJECT_PATH !~ /^xen-project\/people/.*$/
>> +      when: never
>>      - if: $ECLAIR_TESTING
>>        when: always
>>      - !reference [.eclair-analysis:triggered, rules]
> 
> Thanks for the patch, but Gitlab thinks there's a syntax error.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2209479095
> 
> The / after people needs escaping, like it's done elsewhere.  The 
> result is:
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2209482948
> 
> which is looking far more healthy.
> 
> With that fixed, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> and I'll be taking this fairly promptly.

Ah, right. Should have done a test run. Thanks for the fix

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

