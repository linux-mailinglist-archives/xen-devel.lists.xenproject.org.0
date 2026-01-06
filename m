Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16458CF754C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 09:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195891.1513771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2cd-0001vI-IV; Tue, 06 Jan 2026 08:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195891.1513771; Tue, 06 Jan 2026 08:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2cd-0001tD-FR; Tue, 06 Jan 2026 08:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1195891;
 Tue, 06 Jan 2026 08:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VhM6=7L=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vd2cb-0001t7-ST
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 08:40:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3dd83e-eadb-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 09:40:55 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id CC60B4EE3C04;
 Tue,  6 Jan 2026 09:40:53 +0100 (CET)
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
X-Inumbo-ID: 6a3dd83e-eadb-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767688854;
	b=IgCoRWlKNnf/Dv7E0nbzSuQ/YkMHzfyqJdyNfFGRoGbRYXobZNF6cRERNTQq3vtMlQMU
	 A3Jn2O6/Vqp4/vdgFEiwdLVCjOhKCbSu1wX8eHr6NVmSvP/59o+npBBgDA0/wWivI9u8y
	 onaLW0Y/cA3H8rhAVXGhSi4yKqNvGr+SESJ7eYs1eYffha198zEp/UO+3dy0W/m6lT/f4
	 /iJ5XUrJRC/8rpgMX0DMfjeQq99CCcBX6nvmpMaCli3lgBqJPS4Vlq7662WCBXYKs54CG
	 ITI2h/aGjuOrTZ0z04NLya9Gd7RtNZBPJM1Ak+MEX/p3uPGrWuoQPSU4LEXayA1DNK1Oj
	 BleelDtJke28AzY2W9cO2w0InJ84iQeeUtk+/qzLDM5ooOBOfnNwWGdvyZRRuPqNhCva/
	 Nl2Nkp36z1JDKI5IIvzrMDP/RIPaMEejnQaV7aVImYR4WzTjmhTvwvR9R/VpXLn2/8/Uk
	 CwLoqHCn5LlbWBM5keIq7zRQH5b2fdS3b46rwh7liYKth8AnTttz+Ws67Fu0uwBgOKmUc
	 u+L4viiyr3fsQKN4LID+/Del/c8q8BJCD5CTs/LBxFhvDB0nCYAst7YehFyeAwZ/zQF0x
	 T8bMKeiDEZnM4RpsvCqRuBGox93w7b9sHOTKxL5PKOlaqj2usUZRndj5CtI5T+8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767688854;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=nPf2LAuIWbTF6a75nZl47tigpN5euymIO5ZZ4SIV92o=;
	b=rDGyXkg0jSII2p1KayKvupX2wKaTdwJhKa5N4pGz8JgfxWdEavFtl1OETW+ZJ0dOL5vh
	 wVJ4j3aG7vJA63FmJDjH/rJ3SgcSU7iuErXITg2A/n3J4pDVvAZVeS0tLDCNNrGpyiuKt
	 GLYHQ25Xgv5LbnUROgyWBCKTfQRM4Vs0iq9rR+vMs5ZXxorwFQ6UGncAcg2+nnxEtAvZl
	 7lm6EkjEVXvQbmeWkqeKdYCwr5Mp/K20zD2sdjXTuEZp6ytZ5S9zxE6ajlaFwOuSLIHWK
	 /nAL/3SnkUTw5KxgUQAXgQRtkM32wrxQAK+mFLzBvvtN+Y8FAT8cSdAMuxKbTyRfWwmVM
	 Y/T2Hun9G4YrwHv91SJ5owto/PzmkdezdgE7dcrYHHyT8dYaqrZJZl0//zo3yTM+942E6
	 m4cFqmUTZZpeeRUMsRg4EdsbGaovoRH/v2szsAcSbtwAw8krJzqv+mDan74Ee/jVyvLix
	 p+2cnWo/jMvkvBKfb1gDlz5eTG0FXllFwdc3279oraZWGKhhHLZAc9G+Txyd7NNl8Jxek
	 8UIfSuRNy9DZDuZAbHr3w9LKFR+3WiNnijod5KusI9abtB1FBIrbub9cSXfuQ+7NVzMTg
	 SLxp9NQiyFZRfmUXHihaAmOUi1lfkelj3tyE9/FQiN+palz6qPL4jQmoNZ+28rM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 06 Jan 2026 09:40:53 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
In-Reply-To: <541EF107-3536-4525-ACC2-065A9A13481B@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
 <541EF107-3536-4525-ACC2-065A9A13481B@arm.com>
Message-ID: <543958adfed3e5547141d56341c2788d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-06 09:26, Bertrand Marquis wrote:
> Hi Nicolas,
> 
> On this subject, could you help me understand what the following error 
> mean and how I should fix that:
> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/eclair/ARM64/12604499722/PROJECT.ecd;/by_service/MC3A2.R20.12.html
> 

Hi Bertrand,

the point here is that the macro parameter 'FFA_VERSION' is itself a 
macro. This means that inside 'FW_ABI' and similar macros one occurrence 
of the 'abi' macro parameter will be further expanded to the value of 
'FFA_VERSION', while the one used for stringification will not. This is 
potentially confusing for some programmers that do not know well the 
semantics of the preprocessor, which is why MISRA discourages it, but in 
these cases I would say it's very much intentional. There are already a 
few deviations for special cases (e.g. BUILD_BUG_ON uses the same 
pattern to print the condition), so I would suggest adding the macro 
FW_ABI to the deviation.

> Thanks
> Bertrand
> 
>> On 6 Jan 2026, at 08:33, Bertrand Marquis <Bertrand.Marquis@arm.com> 
>> wrote:
>> 
>> Hi Andrew,
>> 
>>> On 5 Jan 2026, at 19:14, Andrew Cooper <andrew.cooper3@citrix.com> 
>>> wrote:
>>> 
>>> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>>>> eclair-x86_64-testing:
>>>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>>>    LOGFILE: "eclair-ARM64.log"
>>>>    VARIANT: "ARM64"
>>>>    RULESET: "monitored"
>>>> +    EXTRA_XEN_CONFIG: |
>>>> +      CONFIG_ACPI=y
>>>> +      CONFIG_ARGO=y
>>>> +      CONFIG_ARM64_SVE=y
>>>> +      CONFIG_ARM_SMMU_V3=y
>>>> +      CONFIG_BOOT_TIME_CPUPOOLS=y
>>>> +      CONFIG_DEBUG_LOCK_PROFILE=y
>>>> +      CONFIG_DEBUG_TRACE=y
>>>> +      CONFIG_DEVICE_TREE_DEBUG=y
>>>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
>>>> +      CONFIG_EXPERT=y
>>>> +      CONFIG_FFA=y
>>>> +      CONFIG_FFA_VM_TO_VM=y
>>>> +      CONFIG_GICV3_ESPI=y
>>>> +      CONFIG_HAS_ITS=y
>>>> +      CONFIG_IOREQ_SERVER=y
>>>> +      CONFIG_IPMMU_VMSA=y
>>>> +      CONFIG_LIVEPATCH=y
>>>> +      CONFIG_LLC_COLORING=y
>>>> +      CONFIG_OPTEE=y
>>>> +      CONFIG_OVERLAY_DTB=y
>>>> +      CONFIG_PCI_PASSTHROUGH=y
>>>> +      CONFIG_PERF_ARRAYS=y
>>>> +      CONFIG_PERF_COUNTERS=y
>>>> +      CONFIG_STACK_PROTECTOR=y
>>>> +      CONFIG_UNSUPPORTED=y
>>>> +      CONFIG_VM_EVENT=y
>>>>  allow_failure: true
>>> 
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
>>> shows 122 failures in otherwise-clean guidelines.  Some observations:
>>> 
>>> llc-colouring.c uses binary literals.  These are safe to use now 
>>> since
>>> 4.21 with the updated toolchain baseline, but the Eclair config wants
>>> updating to allow this language extension.
>>> 
>>> ipmmu-vmsa.c has a git:// url inside a block comment, which is
>>> considered to be a Rule 3.1 violation.  In principle this ought to 
>>> fix it:
>>> 
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 7dee4a488d45..8f5fc6c93bc5 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is 
>>> negligible."
>>> 
>>> -doc_begin="Comments starting with '/*' and containing hyperlinks are 
>>> safe as
>>> they are not instances of commented-out code."
>>> --config=MC3A2.R3.1,reports+={safe, 
>>> "first_area(text(^.*https?://.*$))"}
>>> +-config=MC3A2.R3.1,reports+={safe, 
>>> "first_area(text(^.*(https?|git)://.*$))"}
>>> -doc_end
>>> 
>>> #
>>> 
>>> 
>>> but I've not tried it yet.
>>> 
>>> There's a R8.4 violation against __stack_chk_guard.  I think this 
>>> wants
>>> deviating locally, because it's a fairly magic construct.
>>> 
>>> Other than that, there's a smattering of violations.  Some will be 
>>> fixed
>>> by some work I've got pending for the x86 side of things, but most 
>>> are
>>> specific to arch/arm/.
>>> 
>> 
>> They are quite a lot of violations coming from ffa.
>> I have a pending serie on FF-A waiting to be reviewed/committed.
>> I can push something to fix the findings after it, if that is ok for 
>> you ?
>> 
>> I will retrigger the CI from the branch corresponding to my serie and 
>> work
>> from there.
>> 
>> In any case, very good thing to activate all those and check with the 
>> CI, thanks a lot :-)
>> 
>> Cheers
>> Bertrand
>> 
>>> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

