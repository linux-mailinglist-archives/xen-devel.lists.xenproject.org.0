Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A7371687
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121638.229416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZT9-0002fj-Ph; Mon, 03 May 2021 14:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121638.229416; Mon, 03 May 2021 14:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZT9-0002fK-Li; Mon, 03 May 2021 14:22:43 +0000
Received: by outflank-mailman (input) for mailman id 121638;
 Mon, 03 May 2021 14:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldZT8-0002fF-2A
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:22:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e3e2dcf-7981-472b-a806-d40f7047c150;
 Mon, 03 May 2021 14:22:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47EE2B2E3;
 Mon,  3 May 2021 14:22:39 +0000 (UTC)
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
X-Inumbo-ID: 9e3e2dcf-7981-472b-a806-d40f7047c150
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620051759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54ugadqo6jk1DJ6iuEFaNypD8iMhvQy14YPAp7q2tG4=;
	b=W03zWk2Z6oM2XlFVtzLa2FvpQ9Qa1Fegf37WwojQ8rklIP1reaW8mmjDHK/NHoYPQM4HwM
	5MdNoj5oqeUkoZ768YRHCkGR4er7+leh2X1GlqOveHYyhboz2pvOpNATFwEsbmof9S+yU8
	8v9tQHCRJMC+8J42KZgr6F/VDc9mwpc=
Subject: Re: [PATCH v3 03/22] x86/xstate: re-size save area when CPUID policy
 changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <8ba8f016-0aed-277b-bbea-80022d057791@suse.com>
 <5a954be8-e213-36d8-27da-4c51243dc280@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f515fdfb-d1a6-56d8-5db3-ebddeed23806@suse.com>
Date: Mon, 3 May 2021 16:22:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5a954be8-e213-36d8-27da-4c51243dc280@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 15:57, Andrew Cooper wrote:
> On 22/04/2021 15:44, Jan Beulich wrote:
>> vCPU-s get maximum size areas allocated initially. Hidden (and in
>> particular default-off) features may allow for a smaller size area to
>> suffice.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Use 1ul instead of 1ull. Re-base.
>> ---
>> This could be further shrunk if we used XSAVEC / if we really used
>> XSAVES, as then we don't need to also cover the holes. But since we
>> currently use neither of the two in reality, this would require more
>> work than just adding the alternative size calculation here.
>>
>> Seeing that both vcpu_init_fpu() and cpuid_policy_updated() get called
>> from arch_vcpu_create(), I'm not sure we really need this two-stage
>> approach - the slightly longer period of time during which
>> v->arch.xsave_area would remain NULL doesn't look all that problematic.
>> But since xstate_alloc_save_area() gets called for idle vCPU-s, it has
>> to stay anyway in some form, so the extra code churn may not be worth
>> it.
>>
>> Instead of cpuid_policy_xcr0_max(), cpuid_policy_xstates() may be the
>> interface to use here. But it remains to be determined whether the
>> xcr0_accum field is meant to be inclusive of XSS (in which case it would
>> better be renamed) or exclusive. Right now there's no difference as we
>> don't support any XSS-controlled features.
> 
> I've been figuring out what we need to for supervisors states.  The
> current code is not in a good shape, but I also think some of the
> changes in this series take us in an unhelpful direction.

From reading through the rest your reply I'm not sure I see what you
mean. ORing in host_xss at certain points shouldn't be a big deal.

> I've got a cleanup series which I will post shortly.  It interacts
> texturally although not fundamentally with this series, but does fix
> several issues.
> 
> For supervisor states, we need use XSAVES unilaterally, even for PV. 
> This is because XSS_CET_S needs to be the HVM kernel's context, or Xen's
> in PV context (specifically, MSR_PL0_SSP which is the shstk equivalent
> of TSS.RSP0).
> 
> 
> A consequence is that Xen's data handling shall use the compressed
> format, and include supervisor states.  (While in principle we could
> manage CET_S, CET_U, and potentially PT when vmtrace gets expanded, each
> WRMSR there is a similar order of magnitude to an XSAVES/XRSTORS
> instruction.)

I agree.

> I'm planning a host xss setting, similar to mmu_cr4_features, which
> shall be the setting in context for everything other than HVM vcpus
> (which need the guest setting in context, and/or the VT-x bodge to
> support host-only states).  Amongst other things, all context switch
> paths, including from-HVM, need to step XSS up to the host setting to
> let XSAVES function correctly.
> 
> However, a consequence of this is that the size of the xsave area needs
> deriving from host, as well as guest-max state.  i.e. even if some VMs
> aren't using CET, we still need space in the xsave areas to function
> correctly when a single VM is using CET.

Right - as said above, taking this into consideration here shouldn't
be overly problematic.

> Another consequence is that we need to rethink our hypercall behaviour. 
> There is no such thing as supervisor states in an uncompressed XSAVE
> image, which means we can't continue with that being the ABI.

I don't think the hypercall input / output blob needs to follow any
specific hardware layout.

> I've also found some substantial issues with how we handle
> xcr0/xcr0_accum and plan to address these.  There is no such thing as
> xcr0 without the bottom bit set, ever, and xcr0_accum needs to default
> to X87|SSE seeing as that's how we use it anyway.  However, in a context
> switch, I expect we'll still be using xcr0_accum | host_xss when it
> comes to the context switch path.

Right, and to avoid confusion I think we also want to move from
xcr0_accum to e.g. xstate_accum, covering both XCR0 and XSS parts
all in one go.

> In terms of actual context switching, we want to be using XSAVES/XRSTORS
> whenever it is available, even if we're not using supervisor states. 
> XSAVES has both the inuse and modified optimisations, without the broken
> consequence of XSAVEOPT (which is firmly in the "don't ever use this"
> bucket now).

The XSAVEOPT anomaly is affecting user mode only, isn't it? Or are
you talking of something I have forgot about?

> There's no point ever using XSAVEC.  There is no hardware where it
> exists in the absence of XSAVES, and can't even in theoretical
> circumstances due to (perhaps unintentional) linkage of the CPUID data. 
> XSAVEC also doesn't use the modified optimisation, and is therefore
> strictly worse than XSAVES, even when MSR_XSS is 0.
> 
> Therefore, our choice of instruction wants to be XSAVES, or XSAVE, or
> FXSAVE, depending on hardware capability.

Makes sense to me (perhaps - see above - minus your omission of
XSAVEOPT here).

Jan

