Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C0A54E060
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 13:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350575.576975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1o7u-0002Kc-RZ; Thu, 16 Jun 2022 11:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350575.576975; Thu, 16 Jun 2022 11:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1o7u-0002Iq-NI; Thu, 16 Jun 2022 11:57:30 +0000
Received: by outflank-mailman (input) for mailman id 350575;
 Thu, 16 Jun 2022 11:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBKC=WX=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1o1o7s-0002Ij-G1
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 11:57:29 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8cba4d-ed6b-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 13:57:25 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 04:57:22 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.162])
 ([10.249.169.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 04:57:19 -0700
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
X-Inumbo-ID: 7b8cba4d-ed6b-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655380645; x=1686916645;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vt9FDqWl7wNQvJndTqqsfdy8FikwMx61g6XTDAM0IIg=;
  b=AD+xoyt/D2Llogm78wSujhioTYl1kES1sEAa3ZENowYxDDs2A4urvsIv
   3XDBkrTOTuieLC1KivdkXwL18u9d+OB274yCpwzByN4Y40dvqZf73Xzhp
   nXOFLkfQ5rpF9eNHpHtQz5EMVXRjiqoXGv2FWLv1ziDytt7IEzuCfJtZL
   WyEdvwE/VSp/xiFPsWnsQbOpZ4OZzm+F+1BxR3gBG1pFggV4ie9SGaWgW
   XQIRbWtJCmXOVE+mL6xdxsyi55WDIL7CjWeImqY0YLpI7ryk57sUvgf+w
   5J5CgHLMOaU3Oalf4TD4+ZiqjF5S+Rfct48fjIOpk/1yu1JhbZZB0+cvi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259693690"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="259693690"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="831528917"
Message-ID: <3c64db19-00fe-05bf-ac4d-6ef4201b6aa0@intel.com>
Date: Thu, 16 Jun 2022 19:57:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Beulich, Jan"
 <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Qiang, Chenyi" <chenyi.qiang@intel.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <BN9PR11MB5276B16CB69514120B7E0E318CA79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <4f2c4d5b-dab8-c9d2-f4c2-b8cd44011630@intel.com>
 <YqHGzuJ+D0WjaW+6@Air-de-Roger>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <YqHGzuJ+D0WjaW+6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/2022 6:09 PM, Roger Pau Monné wrote:
> On Thu, Jun 09, 2022 at 03:39:33PM +0800, Xiaoyao Li wrote:
>> On 6/9/2022 3:04 PM, Tian, Kevin wrote:
>>> +Chenyi/Xiaoyao who worked on the KVM support. Presumably
>>> similar opens have been discussed in KVM hence they have the
>>> right background to comment here.
>>>
>>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>>> Sent: Thursday, May 26, 2022 7:12 PM
>>>>
>>>> Under certain conditions guests can get the CPU stuck in an unbounded
>>>> loop without the possibility of an interrupt window to occur on
>>>> instruction boundary.  This was the case with the scenarios described
>>>> in XSA-156.
>>>>
>>>> Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
>>>> if no interrupt window occurs for a specified amount of time.  Note
>>>> that using the Notify VM Exit avoids having to trap #AC and #DB
>>>> exceptions, as Xen is guaranteed to get a VM Exit even if the guest
>>>> puts the CPU in a loop without an interrupt window, as such disable
>>>> the intercepts if the feature is available and enabled.
>>>>
>>>> Setting the notify VM exit window to 0 is safe because there's a
>>>> threshold added by the hardware in order to have a sane window value.
>>>>
>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Changes since v1:
>>>>    - Properly update debug state when using notify VM exit.
>>>>    - Reword commit message.
>>>> ---
>>>> This change enables the notify VM exit by default, KVM however doesn't
>>>> seem to enable it by default, and there's the following note in the
>>>> commit message:
>>>>
>>>> "- There's a possibility, however small, that a notify VM exit happens
>>>>      with VM_CONTEXT_INVALID set in exit qualification. In this case, the
>>>>      vcpu can no longer run. To avoid killing a well-behaved guest, set
>>>>      notify window as -1 to disable this feature by default."
>>>>
>>>> It's not obviously clear to me whether the comment was meant to be:
>>>> "There's a possibility, however small, that a notify VM exit _wrongly_
>>>> happens with VM_CONTEXT_INVALID".
>>>>
>>>> It's also not clear whether such wrong hardware behavior only affects
>>>> a specific set of hardware,
>>
>> I'm not sure what you mean for a specific set of hardware.
>>
>> We make it default off in KVM just in case that future silicon wrongly sets
>> VM_CONTEXT_INVALID bit. Becuase we make the policy that VM cannot continue
>> running in that case.
>>
>> For the worst case, if some future silicon happens to have this kind silly
>> bug, then the existing product kernel all suffer the possibility that their
>> VM being killed due to the feature is default on.
> 
> That's IMO a weird policy.  If there's such behavior in any hardware
> platform I would assume Intel would issue an errata, and then we would
> just avoid using the feature on affected hardware (like we do with
> other hardware features when they have erratas).
> 
> If we applied the same logic to all new Intel features we won't use
> any of them.  At least in Xen there are already combinations of vmexit
> conditions that will lead to the guest being killed.

The reason is that, currently no case will set the VM_CONTEXT_INVALID 
bit, people in KVM community are cautious on the uncertainty. No one in 
what case the VM_CONTEXT_INVALID will be in the future.

Anyway, that's only the worry from KVM reviewers.

>>>> in a way that we could avoid enabling
>>>> notify VM exit there.
>>>>
>>>> There's a discussion in one of the Linux patches that 128K might be
>>>> the safer value in order to prevent false positives, but I have no
>>>> formal confirmation about this.  Maybe our Intel maintainers can
>>>> provide some more feedback on a suitable notify VM exit window
>>>> value.
>>
>> The 128k is the internal threshold for SPR silicon. The internal threshold
>> is tuned by Intel for each silicon, to make sure it's big enough to avoid
>> false positive even when user set vmcs.notify_window to 0.
>>
>> However, it varies for different processor generations.
>>
>> What is the suitable value is hard to say, it depends on how soon does VMM
>> want to intercept the VM. Anyway, Intel ensures that even value 0 is safe.
> 
> Ideally we need a fixed default value that's guaranteed to work on all
> possible hardware that supports the feature, or alternatively a way to
> calculate a sane default window based on the hardware platform.
> 
> Could we get some wording added to the ISE regarding 0 being a
> suitable default value to use because hardware will add a threshold
> internally to make the value safe?

We will work with internal architects on this.

> Thanks, Roger.


