Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61684FF7B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 23:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678863.1056446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYZ7e-0002xF-Ok; Fri, 09 Feb 2024 22:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678863.1056446; Fri, 09 Feb 2024 22:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYZ7e-0002v7-M6; Fri, 09 Feb 2024 22:13:26 +0000
Received: by outflank-mailman (input) for mailman id 678863;
 Fri, 09 Feb 2024 22:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1sd=JS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rYZ7d-0002uG-KK
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 22:13:25 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fd96c7e-c798-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 23:13:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8C921CE1C09;
 Fri,  9 Feb 2024 22:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6226C433C7;
 Fri,  9 Feb 2024 22:13:16 +0000 (UTC)
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
X-Inumbo-ID: 6fd96c7e-c798-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707516798;
	bh=V0oWTTBFMbD4rVZopw9sOpBhmE7SuVVs5CGtzmZopm8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dSuWLsbJneDujD+n65e6/pdQqipGuJmdMDxJP0yGOsYxbLqn3ugaXyTsD1SmNy2Bu
	 tyhrrQSiHSv+s2KROR8DyCSRdZr5zB9qDSsEETPYZgY1O+xxD8lZ7cPZV8ugK3CjdV
	 xTcf/PogdG7LOh6WXaei2/XPOrERc6GLWnx0MRcjtK/Ed4bsOlZk18q76Iv+t6Kqx6
	 /+7Wa53/ih5qS6lnofWppj31MhXk0xWRxWbW8Bp6zllUgtqsqkkMWO9/Y1vUeFOzrk
	 WNFWAtfEWyhVBXglTMwvoXSR5AgJyrEQHtJ1Zcr+5nCbL7lRLXGYYpp15lKxB4K+yv
	 ttd5YA87KfP4Q==
Date: Fri, 9 Feb 2024 14:13:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v4 1/4] xen: add SAF deviation for debugging and
 logging effects
In-Reply-To: <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402091410490.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1706886631.git.simone.ballarin@bugseng.com> <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com> <09869431-ed00-4102-93fd-84c697a5c950@suse.com> <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
 <41474fe7-c65f-4244-a455-0aaa0e4315e3@suse.com> <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Feb 2024, Simone Ballarin wrote:
> On 07/02/24 11:24, Jan Beulich wrote:
> > On 07.02.2024 11:03, Simone Ballarin wrote:
> > > On 06/02/24 13:04, Jan Beulich wrote:
> > > > On 02.02.2024 16:16, Simone Ballarin wrote:
> > > > > Rule 13.1: Initializer lists shall not contain persistent side effects
> > > > > 
> > > > > Effects caused by debug/logging macros and functions (like ASSERT,
> > > > > __bad_atomic_size,
> > > > > LOG, etc ...) that crash execution or produce logs are not dangerous
> > > > > in initializer
> > > > > lists. The evaluation order in abnormal conditions is not relevant.
> > > > > Evaluation order
> > > > > of logging effects is always safe.
> > > > 
> > > > I thought I said so before: When talking of just logging, evaluation
> > > > order
> > > > may very well have a impact on correctness. Therefore we shouldn't mix
> > > > debugging and logging.
> > > 
> > > My general feeling was that changes like the following one are not
> > > supported by
> > > the community:
> > > 
> > > - x = { .field1 = function_with_logs_effects() /*other eventual code*/ };
> > > + int field1 = function_with_logs_effects();
> > > + x = { .field1 = field1 /*other eventual code*/};
> > > 
> > > so I tried to deviate as much as possible.
> > > 
> > > If having log effects is a good reason to do changes like the above, I can
> > > propose a patch in that sense.
> > 
> > Just to avoid misunderstandings: I'm not advocating for changes like the
> > one you outline above. I simply consider the rule too strict: There's
> > nothing at risk when there's just a single operation with side effects
> > in an initializer.
> 
> I agree for the safe cases such as single item list initializers
> (independently
> by the number of effect contained in io_apic_read).
> In fact, I was about to propose in another patch to deviate cases like:
> 
> union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
> union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
> 
> > Even when there are multiple such operations, whether
> > there's anything at risk depends on whether any of the side effects
> > actually collide. In a number of cases the compiler would actually warn
> > (and thus, due to -Werror, the build would fail).
> > 
> 
> I don't completely agree on that, this requires an in-depth comprehension
> of the code especially when complex call chains are involved. Moreover
> these deviations need to be maintained when one of the function involved
> changes.
> 
> > The primary purpose of my comment here was that we need to please
> > separate debugging from logging side effects.
> > 
> 
> Ok, I will work in that sense.
> 
> > > > > --- a/xen/arch/arm/guestcopy.c
> > > > > +++ b/xen/arch/arm/guestcopy.c
> > > > > @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf,
> > > > > uint64_t addr, unsigned int len,
> > > > >    unsigned long raw_copy_to_guest(void *to, const void *from,
> > > > > unsigned int len)
> > > > >    {
> > > > >        return copy_guest((void *)from, (vaddr_t)to, len,
> > > > > -                      GVA_INFO(current), COPY_to_guest |
> > > > > COPY_linear);
> > > > > +                      /* SAF-4-safe No persistent side effects */
> > > > > +                      GVA_INFO(current),
> > > > 
> > > > I _still_ think this leaves ambiguity. The more that you need to look
> > > > up GVA_INFO() to recognize what this is about.
> > > 
> > > 
> > > Just to recap: here the point is that current reads a register with a
> > > volatile asm, so the
> > > violation is in the expansion of GVA_INFO(current). Both GVA_INFO and
> > > current taken alone
> > > are completely fine, so this is the only place where a SAF comment can be
> > > placed.
> > > 
> > > The exapansion is:
> > > ((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" :
> > > "=r"(__ptr) : "0"(&
> > >     per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({
> > > uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
> > >     (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));
> > > 
> > > My proposals are:
> > > 1) address the violation moving the current expansion outside (extra
> > > variable);
> > > 2) put a more detailed comment to avoid the ambiguity;
> > > 3) use an ECL deviation for GVA_INFO(current).
> > > 
> > > Do you have any preference or proposal?
> > 
> > Imo 3 is not an option at all. Probably 1 wouldn't be too bad here, but
> > I still wouldn't like it (as matching a general pattern I try to avoid:
> > introducing local variables that are used just once and don't meaningfully
> > improve e.g. readability). Therefore out of what you list, 2 would remain.
> > But I'm not happy with a comment here either - as per above, there's
> > nothing that can go wrong here as long as there's only a single construct
> > with side effect(s).
> > 
> So, would be changing the SAF in:
> /* SAF-<new_id>-safe single item initializer */
> 
> OK for you?
> 
> > > > > --- a/xen/arch/x86/hvm/hvm.c
> > > > > +++ b/xen/arch/x86/hvm/hvm.c
> > > > > @@ -800,6 +800,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu
> > > > > *v, hvm_domain_context_t *h)
> > > > >    {
> > > > >        struct segment_register seg;
> > > > >        struct hvm_hw_cpu ctxt = {
> > > > > +        /* SAF-3-safe effects for debugging/logging reasons are safe
> > > > > */
> > > > >            .tsc = hvm_get_guest_tsc_fixed(v,
> > > > > v->domain->arch.hvm.sync_tsc),
> > > > 
> > > > A prereq for this imo is that the function take const struct vcpu *.
> > > > But I'm not sure that'll suffice. The function can change at any time,
> > > > rendering the comment here stale perhaps without anyone noticing.
> > > > 
> > > 
> > > IMO It isn't a strict prereq, but it would make everything more clear.
> > > 
> > > In any case, apart adding the const, I do not see other easy solutions.
> > > Would you give me your ack if I change the function signature?
> > 
> > Well, as said: I'm not sure that'll suffice.
> > 
> > > Another possible solutions would be documenting the function in the new
> > > JSON file with a special attribute like only_debug_effect. Of course,
> > > this still requires keeping the JSON up to date in case of changes.
> > 
> > Exactly. So wouldn't really help.
> > 
> > In any event I'd like to ask that you consider splitting up this patch,
> > such that you won't need multiple acks for any of the parts. That'll
> > also allow focusing on one aspect at a time in reviews.
> > 
> 
> Ok, but please consider that the JSON file has been precisely added to deal
> with these cases (avoiding __attribute__). If we are scared to use it, it
> becomes
> meaningless.
> 
> @Stefano maybe your opinion could help.

I do think the JSON file is a useful tool in our toolbox. It is also
fair to say that it is one that we should be careful about using as it
requires manual updates from time to time.

So, I certainly consider it an option, but I prefer your other
suggestion of dropping 13.1 in favor of 13.2. With that change, would
the need for a deviation in this function go away?

