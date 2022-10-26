Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FC60E480
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 17:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430649.682579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oniMT-00016N-8D; Wed, 26 Oct 2022 15:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430649.682579; Wed, 26 Oct 2022 15:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oniMT-00013w-5U; Wed, 26 Oct 2022 15:30:33 +0000
Received: by outflank-mailman (input) for mailman id 430649;
 Wed, 26 Oct 2022 15:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oniMR-00013q-FJ
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 15:30:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e843d64-5543-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 17:30:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D929AB82316;
 Wed, 26 Oct 2022 15:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABD2C433C1;
 Wed, 26 Oct 2022 15:30:25 +0000 (UTC)
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
X-Inumbo-ID: 1e843d64-5543-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666798226;
	bh=dsp8KP98oVVVHIU6skf5Sad/rXjvqSo5U2iza8mUiIQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EYd9Ls9E39FRajwxxoJDFsYmvSFDqsoFyDDyUyzZsqJvuG8NZ56dLSo87UfzCLtn3
	 zcudhN52rfMOFIeJ9W7girjCTFEmZcsA1WhB5mM5xc5rS72Dn0DfgwTH1Y1X1W84J2
	 m0mjaUoQcw8R+HhRfUlOp5cO1HXtdiGX7GrRRKjNlpDc3U0bJ6Op9dLVAAkK904PCK
	 7rNrYc6IdYfSiYaDQC8Mvqm2UEBcgZTotbNYsesTnN9iegylChbT+LdhPX6FJWPSL9
	 BoessUFPIh4XH0kNRo7J8plyIkkML+bMML/ExXDzMYnPjTk+FGS0gfohQsoAMN1b80
	 3sgZyuDoQTEBw==
Date: Wed, 26 Oct 2022 08:30:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Deadcode discussion based on Arm NS phys timer
In-Reply-To: <54F41F27-8753-4BA5-98D5-23E649EBE339@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210260830170.1397955@ubuntu-linux-20-04-desktop>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com> <8691e100-4548-9752-8e7e-b292643cae83@xen.org> <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com> <aff58db0-646c-6699-48af-033e28c5626f@xen.org> <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com> <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com> <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com> <7C838BB9-E8FA-4239-B851-B179CB6B7A02@arm.com> <a3306efe-16bb-feb0-91aa-d6a9b0e30691@amd.com>
 <54F41F27-8753-4BA5-98D5-23E649EBE339@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1449371642-1666798226=:1397955"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1449371642-1666798226=:1397955
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Oct 2022, Bertrand Marquis wrote:
> > On 26 Oct 2022, at 12:29, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Hi all,
> > 
> > On 25/10/2022 10:20, Bertrand Marquis wrote:
> >> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> >> 
> >> 
> >> Hi Michal,
> >> 
> >>> On 25 Oct 2022, at 09:07, Michal Orzel <michal.orzel@amd.com> wrote:
> >>> 
> >>> Hi Bertrand,
> >>> 
> >>> On 25/10/2022 09:45, Bertrand Marquis wrote:
> >>>> 
> >>>> 
> >>>> Hi Michal,
> >>>> 
> >>>>> On 25 Oct 2022, at 08:11, Michal Orzel <michal.orzel@amd.com> wrote:
> >>>>> 
> >>>>> Hi,
> >>>>> 
> >>>>> On 25/10/2022 03:29, Stefano Stabellini wrote:
> >>>>>> 
> >>>>>> 
> >>>>>> On Mon, 24 Oct 2022, Julien Grall wrote:
> >>>>>>>> On 24/10/2022 12:51, Julien Grall wrote:
> >>>>>>>>> Caution: This message originated from an External Source. Use proper
> >>>>>>>>> caution when opening attachments, clicking links, or responding.
> >>>>>>>>> 
> >>>>>>>>> 
> >>>>>>>>> On 24/10/2022 10:07, Michal Orzel wrote:
> >>>>>>>>>> Hello,
> >>>>>>>>> 
> >>>>>>>>> Hi Michal,
> >>>>>>>>> 
> >>>>>>>>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly
> >>>>>>>>>> speaking, we are routing
> >>>>>>>>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use
> >>>>>>>>>> of it (as it uses the hypervisor timer CNTHP).
> >>>>>>>>>> This timer is fully emulated, which means that there is nothing that can
> >>>>>>>>>> trigger such IRQ. This code is
> >>>>>>>>>> a left over from early days, where the CNTHP was buggy on some models
> >>>>>>>>>> and we had to use the CNTP instead.
> >>>>>>>>>> 
> >>>>>>>>>> As far as the problem itself is not really interesting, it raises a
> >>>>>>>>>> question of what to do with a deadcode,
> >>>>>>>>>> as there might be/are other deadcode places in Xen.
> >>>>>>>>> 
> >>>>>>>>> There are multiple definition of deadcode. Depending on which one you
> >>>>>>>>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
> >>>>>>>>> would result to a lot of places impacted with the decision.
> >>>>>>>>> 
> >>>>>>>>> So can you clarify what you mean by deadcode?
> >>>>>>>> In the timer example, I think we have both a deadcode and unreachable code.
> >>>>>>>> For the purpose of this discussion, let's take the MISRA definition of a
> >>>>>>>> deadcode which is a "code that can be executed
> >>>>>>>> but has no effect on the functional behavior of the program". This differs
> >>>>>>>> from the unreachable code definition that is
> >>>>>>>> a "code that cannot be executed". Setting up the IRQ for Xen is an example
> >>>>>>>> of a deadcode. Code within IRQ handler is an unreachable code
> >>>>>>>> (there is nothing that can trigger this IRQ).
> >>>>>>>> 
> >>>>>>>> What I mean by deadcode happens to be the sum of the two cases above i.e.
> >>>>>>>> the code that cannot be executed as well as the code that
> >>>>>>>> does not impact the functionality of the program.
> >>>>>>>> 
> >>>>>>>>> 
> >>>>>>>>>> One may say that it is useful to keep it, because one day,
> >>>>>>>>>> someone might need it when dealing with yet another broken HW. Such
> >>>>>>>>>> person would still need to modify the other
> >>>>>>>>>> part of the code (e.g. reprogram_timer), but there would be less work
> >>>>>>>>>> required overall. Personally, I'm not in favor of
> >>>>>>>>>> such approach, because we should not really support possible scenarios
> >>>>>>>>>> with broken HW (except for erratas listing known issues).
> >>>>>>>>> 
> >>>>>>>>> The difference between "broken HW" and "HW with known errata" is a bit
> >>>>>>>>> unclear to me. Can you clarify how you would make the difference here?
> >>>>>>>>> 
> >>>>>>>>> In particular, at which point do you consider that the HW should not be
> >>>>>>>>> supported by Xen?
> >>>>>>>> I'm not saying that HW should not be supported. The difference for me
> >>>>>>>> between broken HW and
> >>>>>>>> HW with known errata is that for the former, the incorrect behavior is often
> >>>>>>>> due to the early support stage,
> >>>>>>>> using emulators/models instead of real HW, whereas for the latter, the HW is
> >>>>>>>> already released and it happens to be that it is buggy
> >>>>>>>> (the HW vendor is aware of the issue and released erratas).
> >>>>>>> 
> >>>>>>> Thanks for the clarification. What I would call broken is anything that can't
> >>>>>>> be fixed in software. For a not too fictional example, an HW where PCI devices
> >>>>>>> are using the same stream ID. So effectively, passthrough can't be safely
> >>>>>>> supported.
> >>>>>>> 
> >>>>>>> Regarding, not yet released HW, I don't think Xen should have workaround for
> >>>>>>> them. I wouldn't even call it "broken" because they are not yet released and
> >>>>>>> it is common to have bug in early revision.
> >>>>>>> 
> >>>>>>>> Do we have any example in Xen for supporting broken HW,
> >>>>>>>> whose vendor is not aware of the issue or did not release any errata?
> >>>>>>> I will not cite any HW on the ML. But from my experience, the vendors are not
> >>>>>>> very vocal about issues in public (some don't even seem to have public doc).
> >>>>>>> The best way to find the issues is to look at Linux commit.
> >>>>>>> 
> >>>>>>>> 
> >>>>>>>>> 
> >>>>>>>>>> Also, as part of the certification/FUSA process, there should be no
> >>>>>>>>>> deadcode and we should have explanation for every block of code.
> >>>>>>>>> 
> >>>>>>>>> See above. What are you trying to cover by deadcode? Would protecting
> >>>>>>>>> code with IS_ENABLED() (or #ifdef) ok?
> >>>>>>>> I think this would be ok from the certification point of view (this would at
> >>>>>>>> least means, that we are aware of the issue
> >>>>>>>> and we took some steps). Otherwise, such code is just an example of a
> >>>>>>>> deadcode/unreachable code.
> >>>>>>> 
> >>>>>>> Thanks for the clarification. So the exact approach will depend on the
> >>>>>>> context....
> >>>>>>> 
> >>>>>>>>>> There are different ways to deal with a deadcode: > 1. Get rid of it
> >>>>>>>>>> completely
> >>>>>>>>>> 2. Leave it as it is
> >>>>>>> 
> >>>>>>> ... this is my preference in the context of the timer.
> >>>>>> 
> >>>>>> From a certification point of view, the fewer lines of code the better,
> >>>>>> and ideally all the lines of code used for the certified build should be
> >>>>>> testable and used.
> >>>>>> 
> >>>>>> So I think 2. is the lest useful option from a certification
> >>>>>> perspective. For this reason, I'd prefer another alternative.
> >>>>>> 
> >>>>>> 
> >>>>>>> If the other don't like it, then 1 would be my preference.
> >>>>>>> 
> >>>>>>> In general, my preference would be either 3.3 or 3.2 (see below).
> >>>>>> 
> >>>>>> I also think that 3.2 and 3.3 are good options for the general case. For
> >>>>>> the timer, I can see why 1 is your (second) preference and I am fine
> >>>>>> with 1 as well.
> >>>>> Ok, sounds good to me. Let's still give Bertrand the chance to share his opinion.
> >>>> 
> >>>> We need to get rid of dead code and removing it is not always the best solution.
> >>>> 
> >>>> If the code is or could be useful for someone some day, protecting it with ifdef is ok.
> >>>> 
> >>>> In the mid term we will have to introduce a lot more ifdef or IS_ENABLED in the
> >>>> code so that we can compile out what we do not need and code not applying to
> >>>> some hardware is a case where we will do that (does not mean that by default
> >>>> we will not compile it in but we will make it easier to reduce the code size for a
> >>>> specific use case).
> >>>> 
> >>>> So 3.2 and 3.3 are ok for me.
> >>> 
> >>> So we all agree that the code in the current form is a no go from certification purposes.
> >>> That is good :)
> >>> 
> >>> The reason why I opt for solution 1 and not the others is that in the latter case it would
> >>> mean introducing the Kconfig option to allow user to select the timer to be used by Xen.
> >>> This is not really correct. Also in the current form, it would also require adding more
> >>> code to time.c code because at the moment using CNTP for Xen would not work out of the box.
> >>> The architecture defines the hypervisor timer for a purpose. If it does not work, it means
> >>> that the HW is problematic. I agree that we would want to support such use case but I'm not
> >>> really aware of any issue like that. Adding more code and Kconfig options just because
> >>> one day someone may face issues with a new HW is something I am not a fan of.
> >> 
> >> I see 2 solutions here:
> >> - somehow push the code to a different file (not quite sure this is feasible here)
> >> - remove completely the code with a clean commit. Doing this it will be easy for someone needing this to later revert the patch
> >> 
> >> It is definitely true here that adding more code to keep some unused code does not really make sense.
> >> And let’s be realistic here, if we need that one day, it will not take ages to support it somehow.
> >> 
> >> As said, from a pure certification point of view:
> >> - we must not have deadcode
> >> - proper ifdef is acceptable
> >> - if 0 is not acceptable
> >> - commented code is not acceptable
> > 
> > Given that we agree on that (+ IS_ENABLED option if possible), and the option 1 seems
> > to be the best choice for the timer, I will create a patch removing the IRQ path to get rid
> > of the deadcode/unreachable code.
> > 
> > Do you think this is something we want for 4.17?
> > The risk is low as the code is already dead and the benefit is that we have no deadcode.
> > What do you think?
> > 
> 
> We are very near from the release so from my point of view as it is not solving a bug, this should not go into 4.17.

I agree
--8323329-1449371642-1666798226=:1397955--

