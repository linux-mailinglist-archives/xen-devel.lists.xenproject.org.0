Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBBDAD3277
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 11:45:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010646.1388798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvXN-0005pG-5L; Tue, 10 Jun 2025 09:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010646.1388798; Tue, 10 Jun 2025 09:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvXN-0005np-2o; Tue, 10 Jun 2025 09:44:57 +0000
Received: by outflank-mailman (input) for mailman id 1010646;
 Tue, 10 Jun 2025 09:44:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uOvXL-0005nd-HU
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 09:44:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uOvX7-00BvNa-1y;
 Tue, 10 Jun 2025 09:44:41 +0000
Received: from [15.248.2.232] (helo=[10.24.66.12])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uOvX7-00CyiR-14;
 Tue, 10 Jun 2025 09:44:41 +0000
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
	bh=s8k0A/3N1dTxtmQ1Y1+hGkVqR12l8gHfFGNYVRJu8V8=; b=s+wELxFrv4EvgD/7tpsraHmmQX
	bLwHUhIEtRV0ZhC03snd1Cn6YO07T3AMs+K332BEwZUOxU98E/2NoiOpwJKFNt3ATZM+7V8EZgqC4
	C2klS5VCi+fETM5NktipSHmHepuyusoebRetQyb2dzVlhRDZhxyUTjB9JuwQuwxxnF/I=;
Message-ID: <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org>
Date: Tue, 10 Jun 2025 10:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Content-Language: en-GB
To: dmkhn@proton.me, Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-3-dmukhin@ford.com>
 <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
 <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org>
 <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken>
 <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com> <aEf1Hw+x35Yci/FS@kraken>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aEf1Hw+x35Yci/FS@kraken>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denis,

On 10/06/2025 10:04, dmkhn@proton.me wrote:
> On Tue, Jun 10, 2025 at 10:26:22AM +0200, Jan Beulich wrote:
>> On 10.06.2025 10:02, dmkhn@proton.me wrote:
>>> On Tue, Jun 10, 2025 at 08:53:12AM +0200, Jan Beulich wrote:
>>>> On 06.06.2025 23:29, Julien Grall wrote:
>>>>> Hi Denis,
>>>>>
>>>>> On 05/06/2025 23:05, Julien Grall wrote:
>>>>>> Hi Denis,
>>>>>>
>>>>>> On 28/05/2025 23:50, dmkhn@proton.me wrote:
>>>>>>> From: Denis Mukhin <dmkhn@proton.me>
>>>>>>>
>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>>>
>>>>>>> Remove the hardcoded domain ID 0 allocation for hardware domain and replace it
>>>>>>> with a call to get_initial_domain_id() (returns the value of hardware_domid on
>>>>>>> Arm).
>>>>>>
>>>>>> I am not entirely why this is done. Are you intending to pass a different domain ID? If so...
>>>>>>
>>>>>>>
>>>>>>> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_domain_id()
>>>>>>> ID is skipped during domain ID allocation to cover domU case in dom0less
>>>>>>> configuration. That also fixes a potential issue with re-using ID#0 for domUs
>>>>>>> when get_initial_domain_id() returns non-zero.
>>>>>>>
>>>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>>>>> ---
>>>>>>> Changes since v8:
>>>>>>> - rebased
>>>>>>> ---
>>>>>>>    xen/arch/arm/domain_build.c             | 4 ++--
>>>>>>>    xen/common/device-tree/dom0less-build.c | 9 +++------
>>>>>>>    xen/common/domain.c                     | 4 ++--
>>>>>>>    3 files changed, 7 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>>> index e9d563c269..0ad80b020a 100644
>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
>>>>>>
>>>>>> ... naming like create_dom0() probably wants to be renamed.
>>>>>>
>>>>>> That said, I am not convinced a domain other than 0 should have full privilege by default. So I would argue it should stay as ...
>>>>>>
>>>>>>>        if ( !llc_coloring_enabled )
>>>>>>>            flags |= CDF_directmap;
>>>>>>> -    domid = domid_alloc(0);
>>>>>>> +    domid = domid_alloc(get_initial_domain_id());
>>>>>>
>>>>>> ... 0.
>>>>>
>>>>> Looking at the implementation of get_initial_domain_id(), I noticed the behavior was changed for x86 by [1].
>>>>>
>>>>> Before, get_initial_domain_id() was returning 0 except for the PV shim.
>>>>> But now, it would could return the domain ID specified on the command line (via hardware_dom).
>>>>>
>>>>>  From my understanding, the goal of the command line was to create the hardware domain *after* boot. So initially we create dom0 and then initialize the hardware domain. With the patch below, this has changed.
>>>>>
>>>>> However, from the commit message, I don't understand why. It seems like we broke late hwdom?
>>>>>
>>>>> For instance, late_hwdom_init() has the following assert:
>>>>>
>>>>>      dom0 = rcu_lock_domain_by_id(0);
>>>>>      ASSERT(dom0 != NULL);
>>>>>
>>>>> Jan, I saw you were involved in the review of the series. Any idea why this was changed?
>>>>
>>>> I simply overlooked this aspect when looking at the change. You're right, things
>>>> were broken there. Unless a simple and clean fix can be made relatively soon, I
>>>> think this simply needs reverting (which may mean to revert any later commits
>>>> that depend on that). I can't help noting that in this console rework there were
>>>> way too many issues, and I fear more than just this one may have slipped
>>>> through. I therefore wonder whether taken as a whole this was/is worth both the
>>>> submitter's and all the reviewers' time.
>>>
>>> Yes, sorry, I overlooked late_hwdom_init() modification.
>>>
>>> IMO, the clean fix would be adding another command line parameter
>>> `control_domid` (with default value 0), make get_initial_domain_id() return it
>>> instead of current `hardware_domid` and update late_hwdom_init() to use
>>> `control_domid` insted of open-coded 0.
>>
>> No, no new command line option will address this. Original behavior needs to be
>> restored (either by correcting the earlier change or, as said, be reverting).
> 
> Correction of the earlier change:
> 
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/b7f194650307a08a9e6da5aa9fdd1f8a9afd67eb
> 
> re: command line option: I meant something like this:
> 
>    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/51a519de6ea73ff3b650fd9bd4f3c5c63f64c069

I am with Jan here. This used to work before without "control_domid", so 
we ought to keep the same.

But even if we are ok to break compatibility, I don't see the value of 
"control_domid". The implication of setting "hardware_domid" is you will
have a separate control domain. At which point, why would it matter to 
specify the domain ID?

Cheers,

-- 
Julien Grall


