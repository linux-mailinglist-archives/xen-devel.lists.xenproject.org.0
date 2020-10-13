Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D06128CF67
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6214.16502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKbW-0005AV-Tt; Tue, 13 Oct 2020 13:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6214.16502; Tue, 13 Oct 2020 13:44:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKbW-0005A4-QO; Tue, 13 Oct 2020 13:44:38 +0000
Received: by outflank-mailman (input) for mailman id 6214;
 Tue, 13 Oct 2020 13:44:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKbV-00059y-Qx
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:44:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5af6508-6873-4015-b46f-fa9738b81bbd;
 Tue, 13 Oct 2020 13:44:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB2E2AC82;
 Tue, 13 Oct 2020 13:44:35 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKbV-00059y-Qx
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:44:37 +0000
X-Inumbo-ID: d5af6508-6873-4015-b46f-fa9738b81bbd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5af6508-6873-4015-b46f-fa9738b81bbd;
	Tue, 13 Oct 2020 13:44:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602596676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sLalaXgyFQWB0q6HknwBauDenwgCZwL0plyLm2JloY=;
	b=rbtAZfomdm/r5efKJas4pya4N+EiuT3RZTargKaKjepFUe1zFLpzS/JjzydWcBxre/l6qa
	gq4164dcrS52gp2pMS8PmhehoutGdIgzFYZtxh+WEAYEEH5nDbG9Ez+u4w+HP4vKloMdrt
	oawbVi3qEXuoQKG5so04AKC5uHlKJ8M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EB2E2AC82;
	Tue, 13 Oct 2020 13:44:35 +0000 (UTC)
Subject: Re: [PATCH] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201006162327.93055-1-roger.pau@citrix.com>
 <a98d6cb1-0b1d-8fb8-8718-c65e02e448bb@citrix.com>
 <20201007164117.GH19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef0631f7-f509-d0ca-773e-0758587a55bb@suse.com>
Date: Tue, 13 Oct 2020 15:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007164117.GH19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.10.2020 18:41, Roger Pau Monné wrote:
> On Wed, Oct 07, 2020 at 01:06:08PM +0100, Andrew Cooper wrote:
>> On 06/10/2020 17:23, Roger Pau Monne wrote:
>>> Currently a PV hardware domain can also be given control over the CPU
>>> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
>>
>> This might be how the current logic "works", but its straight up broken.
>>
>> PERF_CTL is thread scope, so unless dom0 is identity pinned and has one
>> vcpu for every pcpu, it cannot use the interface correctly.
> 
> Selecting cpufreq=dom0-kernel will force vCPU pinning. I'm not able
> however to see anywhere that would force dom0 vCPUs == pCPUs.

Unless there are other overriding command line options, doesn't the
way sched_select_initial_cpu() works guarantee this?

>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index d8ed83f869..41baa3b7a1 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1069,6 +1069,12 @@ extern enum cpufreq_controller {
>>>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>>>  } cpufreq_controller;
>>>  
>>> +static inline bool is_cpufreq_controller(const struct domain *d)
>>> +{
>>> +    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
>>> +            is_hardware_domain(d));
>>
>> This won't compile on !CONFIG_X86, due to CONFIG_HAS_CPUFREQ
> 
> It does seem to build on Arm, because this is only used in x86 code:
> 
> https://gitlab.com/xen-project/people/royger/xen/-/jobs/778207412
> 
> The extern declaration of cpufreq_controller is just above, so if you
> tried to use is_cpufreq_controller on Arm you would get a link time
> error, otherwise it builds fine. The compiler removes the function on
> Arm as it has the inline attribute and it's not used.
> 
> Alternatively I could look into moving cpufreq_controller (and
> is_cpufreq_controller) out of sched.h into somewhere else, I haven't
> looked at why it needs to live there.
> 
>> Honestly - I don't see any point to this code.  Its opt-in via the
>> command line only, and doesn't provide adequate checks for enablement. 
>> (It's not as if we're lacking complexity or moving parts when it comes
>> to power/frequency management).
> 
> Right, I could do a pre-patch to remove this, but I also don't think
> we should block this fix on removing FREQCTL_dom0_kernel, so I would
> rather fix the regression and then remove the feature if we agree it
> can be removed.

I agree.

Jan

