Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0FFB15519
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 00:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063189.1428985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsVk-0000w9-Ts; Tue, 29 Jul 2025 22:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063189.1428985; Tue, 29 Jul 2025 22:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsVk-0000th-Qt; Tue, 29 Jul 2025 22:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1063189;
 Tue, 29 Jul 2025 22:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqJK=2K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ugsVj-0000tb-Ef
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 22:09:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe37a15-6cc8-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 00:09:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 684B5A54CFC;
 Tue, 29 Jul 2025 22:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47498C4CEEF;
 Tue, 29 Jul 2025 22:09:08 +0000 (UTC)
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
X-Inumbo-ID: afe37a15-6cc8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753826964;
	bh=RAX0ptam6yjbCQMvq2VhzLR8Acf4ahNsVHNzqOc05C4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pN/4QWLAZXD8sO5tkedALTwtpkrmyP4db2GwSVzkscNwU92xn9J3FBOtYQ5ZXDrnO
	 qD0bjYKsMU8zpVk3MGjxmSiAxqX6VWD/5SBepBR4vO0Fir3NNPcZYOpNiwGDd/bw72
	 ruocBegbQxhbGzdNCX1MR5tH0uU9p3xzY+6M/rWJqk/cjUDYEKiyliIcBtjl7TKVoE
	 0MMx76clW7N1B9r9LQkh3VRMxilQI62cd8YJqSbAkM/DfX6JzfD2yrKBtsp2/wndjg
	 sM1kNpdPPypT8sH4cixGj2hLx4sQUKp7CJlGO9AkgsYZIbxkU67HYzqpc0bjmJNQP+
	 Fm3D3dLxAUbsQ==
Date: Tue, 29 Jul 2025 15:09:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
In-Reply-To: <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507291507580.468590@ubuntu-linux-20-04-desktop>
References: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com> <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com> <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jul 2025, Dmytro Prokopchuk1 wrote:
> On 7/23/25 16:58, Jan Beulich wrote:
> > On 23.07.2025 12:12, Dmytro Prokopchuk1 wrote:
> >> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> @@ -568,6 +568,14 @@ C99 Undefined Behaviour 45: Pointers that do not point into, or just beyond, the
> >>   -config=MC3A2.R18.2,reports+={safe, "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
> >>   -doc_end
> >>   
> >> +-doc_begin="Consider relational pointer comparisons in kernel-related sections as safe and compliant."
> >> +-config=MC3R1.R18.3,reports+={safe, "any_area(any_loc(any_exp(macro(name(is_kernel||is_kernel_text||is_kernel_rodata||is_kernel_inittext)))))"}
> >> +-doc_end
> >> +
> >> +-doc_begin="Allow deviations for pointer comparisons in BUG_ON and ASSERT macros, treating them as safe for debugging and validation."
> >> +-config=MC3R1.R18.3,reports+={safe, "any_area(any_loc(any_exp(macro(name(BUG_ON||ASSERT)))))"}
> >> +-doc_end
> > 
> > Nit: Drop "deviations for" from the verbal description?
> Ok.
> 
> > 
> >> --- a/xen/arch/x86/efi/efi-boot.h
> >> +++ b/xen/arch/x86/efi/efi-boot.h
> >> @@ -461,7 +461,8 @@ static void __init efi_arch_edd(void)
> >>                   params->device_path_info_length =
> >>                       sizeof(struct edd_device_params) -
> >>                       offsetof(struct edd_device_params, key);
> >> -                for ( p = (const u8 *)&params->key; p < &params->checksum; ++p )
> >> +                for ( p = (const u8 *)&params->key;
> >> +                      (uintptr_t)p < (uintptr_t)&params->checksum; ++p )
> > 
> > There mere addition of such casts makes code more fragile imo. What about the
> > alternative of using != instead of < here? I certainly prefer < in such situations,
> > but functionally != ought to be equivalent (and less constrained by C and Misra).
> > 
> > As mentioned several times when discussing these rules, it's also not easy to see
> > how "pointers of different objects" could be involved here: It's all within
> > *params, isn't it?
> Hard to say something. Let's hold this so far.
> 
> > 
> > Finally, when touching such code it would be nice if u<N> was converted to
> > uint<N>_t.
> > 
> >> --- a/xen/common/sched/core.c
> >> +++ b/xen/common/sched/core.c
> >> @@ -360,7 +360,7 @@ static always_inline void sched_spin_lock_double(
> >>       {
> >>           *flags = _spin_lock_irqsave(lock1);
> >>       }
> >> -    else if ( lock1 < lock2 )
> >> +    else if ( (uintptr_t)lock1 < (uintptr_t)lock2 )
> > 
> > Similarly, no matter what C or Misra may have to say here, imo such casts are
> > simply dangerous. Especially when open-coded.
> Well, this function 'sched_spin_lock_double' has the following description:
> "If locks are different, take the one with the lower address first."
> 
> I think it's save to compare the integer representations of 'lock1' and 
> 'lock2' addresses explicitly (casting the pointers values to an integer 
> type). We need to find the 'lower address'.
> Any risks here?
> 
> Dmytro
> > 
> >> --- a/xen/common/virtual_region.c
> >> +++ b/xen/common/virtual_region.c
> >> @@ -83,8 +83,8 @@ const struct virtual_region *find_text_region(unsigned long addr)
> >>       rcu_read_lock(&rcu_virtual_region_lock);
> >>       list_for_each_entry_rcu ( iter, &virtual_region_list, list )
> >>       {
> >> -        if ( (void *)addr >= iter->text_start &&
> >> -             (void *)addr <  iter->text_end )
> >> +        if ( addr >= (unsigned long)iter->text_start &&
> >> +             addr <  (unsigned long)iter->text_end )
> > 
> > Considering further casts to unsigned long of the same struct fields, was it
> > considered to alter the type of the struct fields instead?
> There are present casts of struct fields 'text_start' and 'text_end' in 
> the file 'xen/common/virtual_region.c'.
> 
>          modify_xen_mappings_lite((unsigned long)region->text_start,
>                                   (unsigned long)region->text_end,
>                                   PAGE_HYPERVISOR_RWX);
> 
> Changing fields type to 'unsigned long' will give the opportunity to 
> remove casts from source code (mentioned before),
> and remove '(void*)' casts from here:
> 
>          if ( (void *)addr >= iter->text_start &&
>               (void *)addr <  iter->text_end )
> 
> Unfortunately there are places where these fields are initialized, so 
> cast to the 'unsigned long' should be there.
> Example:
>      .text_start = _sinittext,
>      .text_end = _einittext,
> and
>      .text_start = _sinittext,
>      .text_end = _einittext,
> 
> where
>      extern char _sinittext[], _einittext[];
>      extern char _stext[], _etext[];
> 

Everything related to stext/etext, sinittext/einittext, etc should be
deviated as those are not even pointers: they are linker symbols. Also,
they do refer to the same "object": the Xen text.

