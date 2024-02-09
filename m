Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17284FF6E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 23:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678859.1056436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYZ30-0001Tn-45; Fri, 09 Feb 2024 22:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678859.1056436; Fri, 09 Feb 2024 22:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYZ30-0001RW-1R; Fri, 09 Feb 2024 22:08:38 +0000
Received: by outflank-mailman (input) for mailman id 678859;
 Fri, 09 Feb 2024 22:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1sd=JS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rYZ2y-0001RQ-It
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 22:08:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c36321f0-c797-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 23:08:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C168CCE2119;
 Fri,  9 Feb 2024 22:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D0FC433F1;
 Fri,  9 Feb 2024 22:08:29 +0000 (UTC)
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
X-Inumbo-ID: c36321f0-c797-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707516511;
	bh=JR84V5h2foy3AGZ/3LhZFm2YpXNh/5hUeY0cRzKZta4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=flNHGLlWv9stvSwhs1uJE5oIQvu/le9uLrOgG7xA8rntiikk5g6zg2+CYNccMwuJH
	 xyJJ/UyV+uTTyRvuZuGtxOjj+1rRJ7Jg0i5my9qXInqCu91qAjr8UmZd5Zq0/oUk8H
	 cOAPpSaD6zf4ix3Gs56LTURjSjVx4CsFNZlY740j1oCskyKRhpK6lGc7S5QNCt330J
	 6nTkX6laGQFvAleVdfWpyfP27UIgAZ3Lhs9GqzCynt41n9bEiG0aBvN7dnDTqQd7LB
	 st3p6Jmj1bKBeKrZxo4q6DSFxGz0ogLTzSKpBvEwLpvX4pzsHVKaV7TAad5b9rNTgE
	 HbzP0F7XqRkZg==
Date: Fri, 9 Feb 2024 14:08:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, sstabellini@kernel.org, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
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
In-Reply-To: <c341164a-0bd9-41f1-a984-718ccb986053@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402091406470.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1706886631.git.simone.ballarin@bugseng.com> <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com> <09869431-ed00-4102-93fd-84c697a5c950@suse.com> <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
 <41474fe7-c65f-4244-a455-0aaa0e4315e3@suse.com> <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com> <c6199a60-ecd2-4f8a-b742-199b90e62bac@suse.com> <a3586ea2-5ad7-4c64-8e05-00ea0f83518f@bugseng.com> <c341164a-0bd9-41f1-a984-718ccb986053@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Feb 2024, Jan Beulich wrote:
> On 09.02.2024 10:25, Simone Ballarin wrote:
> > On 07/02/24 13:40, Jan Beulich wrote:
> >> On 07.02.2024 13:21, Simone Ballarin wrote:
> >>> On 07/02/24 11:24, Jan Beulich wrote:
> >>>> On 07.02.2024 11:03, Simone Ballarin wrote:
> >>>>> On 06/02/24 13:04, Jan Beulich wrote:
> >>>>>> On 02.02.2024 16:16, Simone Ballarin wrote:
> >>>>>>> --- a/xen/arch/arm/guestcopy.c
> >>>>>>> +++ b/xen/arch/arm/guestcopy.c
> >>>>>>> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
> >>>>>>>     unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
> >>>>>>>     {
> >>>>>>>         return copy_guest((void *)from, (vaddr_t)to, len,
> >>>>>>> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
> >>>>>>> +                      /* SAF-4-safe No persistent side effects */
> >>>>>>> +                      GVA_INFO(current),
> >>>>>>
> >>>>>> I _still_ think this leaves ambiguity. The more that you need to look
> >>>>>> up GVA_INFO() to recognize what this is about.
> >>>>>
> >>>>>
> >>>>> Just to recap: here the point is that current reads a register with a volatile asm, so the
> >>>>> violation is in the expansion of GVA_INFO(current). Both GVA_INFO and current taken alone
> >>>>> are completely fine, so this is the only place where a SAF comment can be placed.
> >>>>>
> >>>>> The exapansion is:
> >>>>> ((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&
> >>>>>      per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({ uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
> >>>>>      (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));
> >>>>>
> >>>>> My proposals are:
> >>>>> 1) address the violation moving the current expansion outside (extra variable);
> >>>>> 2) put a more detailed comment to avoid the ambiguity;
> >>>>> 3) use an ECL deviation for GVA_INFO(current).
> >>>>>
> >>>>> Do you have any preference or proposal?
> >>>>
> >>>> Imo 3 is not an option at all. Probably 1 wouldn't be too bad here, but
> >>>> I still wouldn't like it (as matching a general pattern I try to avoid:
> >>>> introducing local variables that are used just once and don't meaningfully
> >>>> improve e.g. readability). Therefore out of what you list, 2 would remain.
> >>>> But I'm not happy with a comment here either - as per above, there's
> >>>> nothing that can go wrong here as long as there's only a single construct
> >>>> with side effect(s).
> >>>>
> >>> So, would be changing the SAF in:
> >>> /* SAF-<new_id>-safe single item initializer */
> >>>
> >>> OK for you?
> >>
> >> A comment, as said, is only the least bad of what you did enumerate. But
> >> for this code in particular I'm not a maintainer anyway, so it's not me
> >> you need to convince. I'm taking this only as an example for discussing
> >> underlying aspects.
> > 
> > I was generally thinking about the comments of this series, and I've
> > just realised that many of them can be summarized by the following sentence:
> > 
> > "We do not want changes to address violations of R13.1 that are not also violations
> > of R13.2"
> > 
> > MC3R1.R13.2	rule	The value of an expression and its persistent side effects shall be the same under all permitted evaluation orders
> > MC3R1.R13.1	rule	Initializer lists shall not contain persistent side effects
> > 
> > At this point, my proposal is to remove R13.1 from the coding standard and add
> > R13.2 (eventually limiting its scope to initializer lists).
> 
> I'm afraid I don't understand the "eventually limiting" part.
> 
> > Maybe it is better to re-discuss the rule adoption during the next meeting?
> 
> Perhaps best. Stefano, could you take note of this?

Yes. I think Simone might be right: it looks like the cases we care
about the most are the ones covered by 13.2, which appear to be a subset
of the ones covered by 13.1.

Assuming we accept 13.2, the question is whether there is anything left
in 13.1 that is of interest. We can discuss during the next MISRA call.

