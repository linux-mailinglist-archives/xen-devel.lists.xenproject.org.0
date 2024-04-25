Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D298B1E3C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 11:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711967.1112324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvaL-0000zu-Cf; Thu, 25 Apr 2024 09:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711967.1112324; Thu, 25 Apr 2024 09:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvaL-0000yR-A0; Thu, 25 Apr 2024 09:40:09 +0000
Received: by outflank-mailman (input) for mailman id 711967;
 Thu, 25 Apr 2024 09:40:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8uWZ=L6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzvaJ-0000yL-Im
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 09:40:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb89a38b-02e7-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 11:40:05 +0200 (CEST)
Received: from [192.168.1.20] (host-79-36-52-167.retail.telecomitalia.it
 [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 457E24EE0739;
 Thu, 25 Apr 2024 11:40:04 +0200 (CEST)
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
X-Inumbo-ID: cb89a38b-02e7-11ef-b4bb-af5377834399
Message-ID: <74f86426-b3bb-4af7-85ca-15851acee6fd@bugseng.com>
Date: Thu, 25 Apr 2024 11:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: reorganize pipelines
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
References: <fe1fe9c964d1f2ba3cb46cbaf798cf698f341386.1713885065.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2404241704430.3940@ubuntu-linux-20-04-desktop>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2404241704430.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/24 02:06, Stefano Stabellini wrote:
> On Tue, 23 Apr 2024, Federico Serafini wrote:
>> From: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> Introduce accepted_guidelines.sh: a script to autogenerate the
>> configuration file accepted.ecl from docs/misra/rules.rst which enables
>> all accepted guidelines.
>>
>> Introduce monitored.ecl: a manual selection of accepted guidelines
>> which are clean or almost clean, it is intended to be used for the
>> analyses triggered by commits.
>>
>> Reorganize tagging.ecl:
>>    -Remove "accepted" tags: keeping track of accepted guidelines tagging
>>     them as "accepted" in the configuration file tagging.ecl is no
>>     longer needed since docs/rules.rst is keeping track of them.
>>    -Tag more guidelines as clean.
>>
>> Reorganize eclair pipelines:
>>    - Set1, Set2, Set3 are now obsolete: remove the corresponding
>>      pipelines and ecl files.
>>    - Amend scheduled eclair pipeline to use accepted.ecl.
>>    - Amend triggered eclair pipeline to use monitored.ecl.
>>
>> Rename and improve action_check_clean_regressions.sh to print a
>> diagnostic in case a commit introduces a violation of a clean guideline.
>>
>> An example of diagnostic is the following:
>>
>> Failure: 13 regressions found for clean guidelines
>>    service MC3R1.R8.2: (required) Function types shall be in prototype form with named parameters:
>>     violation: 13
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> Fantastic work, thank you!
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Is this patch safe to commit now? Or would it cause gitlab-ci breakage?

Yes, it is safe because the ECLAIR analysis is still allowed to fail.
Committing this patch wouldn't break the CI but it will highlight some 
regressions with the orange badge and the following messages:

arm:

Failure: 5 regressions found for clean guidelines
   service MC3R1.R1.1: (required) The program shall contain no 
violations of the standard C syntax and constraints, and shall not 
exceed the implementation's translation limits:
    violation: 5

x86:

Failure: 2 regressions found for clean guidelines
   service MC3R1.R8.2: (required) Function types shall be in prototype 
form with named parameters:
    violation: 2

(George just sent a patch to address the regressions of Rule 8.2.)

> 
> One question below.
> 
> 
>> -
>>   ####################
>>   # Clean guidelines #
>>   ####################
>>   
>>   -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>>   
>> --service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
>> +-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
>>   }
> 
> Is this list different from monitored.ecl? If so, why? If not, maybe we
> don't need to repeat the list here as well?

Quick answer: this list is different from monitored.ecl and the two
lists must coexist.

Here, we are "tagging" some guidelines as "clean":
this list is crucial and will be (manually) updated every time a new
guideline reaches 0 violations, it shall not be removed because this tag
allows ECLAIR to print a diagnostic and fail in case unjustified
violations are found for the tagged guidelines.

The monitored.ecl is the list of guidelines which are analyzed at each
commit: the list shall include all the guidelines tagged as "clean"
(to do the proper regressions checks) but the monitored list can also
include some accepted guidelines for which it may be interesting to see
the number of violations at each commit, for example, we put there some
almost-clean guidelines (guidelines with few violations left but not yet
tagged as clean yet).
Introducing new violations of monitored but not-clean guidelines will
not cause a failure.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

