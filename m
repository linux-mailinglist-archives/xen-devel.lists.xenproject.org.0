Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCC86AFA43
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 00:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507927.782122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZgfB-0006uW-Ts; Tue, 07 Mar 2023 23:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507927.782122; Tue, 07 Mar 2023 23:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZgfB-0006sn-Qd; Tue, 07 Mar 2023 23:24:09 +0000
Received: by outflank-mailman (input) for mailman id 507927;
 Tue, 07 Mar 2023 23:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLjA=67=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZgfA-0006sh-Sp
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 23:24:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272fd646-bd3f-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 00:24:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4251BB81A7C;
 Tue,  7 Mar 2023 23:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DF9C4339B;
 Tue,  7 Mar 2023 23:24:02 +0000 (UTC)
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
X-Inumbo-ID: 272fd646-bd3f-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678231443;
	bh=FSFr5VIZcI31kRklRgJmOQb9r0OM+R+5thsode0cCFY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LCQmq99+o3joMcGPS9J8/+wf5vDjG2PAiY9U+1f3AwbbC3Askm90kvd5XVu40v21k
	 tOvY3v5LZ6SD80lDIa78NQC+5v4AXATlDHdi4Ee4rQBpzN4je+hZcpsc05bYBZbf6q
	 tfQARF/u3mTAQhhweoWvCe6P3Zg1NakP0o5IAbXhcLFTYByIRcPorrQZdYL8TDH5E9
	 NSh63qkADZ8BMTAJub1XaVOS4WwRhm4+/Ou8lOt/672I58g5UOyqb6a6gw5mg5B36J
	 98DRIADRYosaAcaTmOAUMgegKqa5IsIOiM1Zw6gYOjcy+Sgpu/tKFlP40GKD/J4Y3V
	 9gcYYh286NQhA==
Date: Tue, 7 Mar 2023 15:24:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
In-Reply-To: <874a28ac-3ae4-a6c6-c230-570be3672441@suse.com>
Message-ID: <alpine.DEB.2.22.394.2303071523310.863724@ubuntu-linux-20-04-desktop>
References: <20230227095315.6483-1-michal.orzel@amd.com> <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com> <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com> <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com> <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
 <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com> <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com> <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com> <5d2890c9-d78b-69af-fec3-dace8723ea24@amd.com> <874a28ac-3ae4-a6c6-c230-570be3672441@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Feb 2023, Jan Beulich wrote:
> On 28.02.2023 09:14, Michal Orzel wrote:
> > On 27/02/2023 16:57, Jan Beulich wrote:
> >> On 27.02.2023 16:46, Michal Orzel wrote:
> >>> On 27/02/2023 16:00, Jan Beulich wrote:
> >>>> On 27.02.2023 15:46, Michal Orzel wrote:
> >>>>> On 27/02/2023 14:54, Jan Beulich wrote:
> >>>>>> On 27.02.2023 14:41, Michal Orzel wrote:
> >>>>>>> On 27/02/2023 11:10, Jan Beulich wrote:
> >>>>>>>> On 27.02.2023 10:53, Michal Orzel wrote:
> >>>>>>>>> --- a/xen/Makefile
> >>>>>>>>> +++ b/xen/Makefile
> >>>>>>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
> >>>>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
> >>>>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
> >>>>>>>>>
> >>>>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
> >>>>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
> >>>>>>>>>  define all_sources
> >>>>>>>>>      ( find include -type f -name '*.h' -print; \
> >>>>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
> >>>>>>>>
> >>>>>>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
> >>>>>>>> also only be included when selected (or at the very least only when an
> >>>>>>>> arch might select it, which afaics is possible on x86 only right now).
> >>>>>>>>
> >>>>>>>> It would also help if in the description you made explicit that SUBDIRS
> >>>>>>>> isn't used for anything else (the name, after all, is pretty generic).
> >>>>>>>> Which actually points at an issue: I suppose the variable would actually
> >>>>>>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
> >>>>>>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
> >>>>>>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
> >>>>>>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
> >>>>>>>> has caused crypto to be missing from SUBDIRS.
> >>>>>>>>
> >>>>>>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
> >>>>>>> and the cleanup/improvements that would be beneficial but not related to this patch.
> >>>>>>> The second part involves more code and there are parts to be discussed:
> >>>>>>>
> >>>>>>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
> >>>>>>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
> >>>>>>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
> >>>>>>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
> >>>>>>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
> >>>>>>> top of the Makefile (thus harder to make sure the linking order is correct).
> >>>>>>>
> >>>>>>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
> >>>>>>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
> >>>>>>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
> >>>>>>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
> >>>>>>> but for all the existing architectures.
> >>>>>>
> >>>>>> I understand that the changes would be more involved, but I disagree with
> >>>>>> your "two parts" statement: If what I've outlined was already the case,
> >>>>>> your patch would not even exist (because crypto/ would already be taken
> >>>>>> care of wherever needed).
> >>>>>>
> >>>>>>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
> >>>>>>> into account for the tags/csope generation. Would the following change be ok for that purpose?
> >>>>>>>
> >>>>>>> diff --git a/xen/Makefile b/xen/Makefile
> >>>>>>> index 2d55bb9401f4..05bf301bd7ab 100644
> >>>>>>> --- a/xen/Makefile
> >>>>>>> +++ b/xen/Makefile
> >>>>>>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
> >>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
> >>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
> >>>>>>>
> >>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
> >>>>>>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
> >>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
> >>>>>>> +
> >>>>>>>  define all_sources
> >>>>>>>      ( find include -type f -name '*.h' -print; \
> >>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
> >>>>>>
> >>>>>> The fact that, afaict, this won't do is related to the outline I gave.
> >>>>>> You've referred yourself to need-config. Most if not all of the goals
> >>>>>> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
> >>>>>> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
> >>>>>> will simply be unset in the common case. Therefore if an easy change is
> >>>>>> wanted, the original version of it would be it. An intermediate
> >>>>>> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
> >>>>>> But neither would preclude the same issue from being introduced again,
> >>>>>> when a new subdir appears.
> >>>>> I understand your concerns. However, I cannot see how your suggested changes
> >>>>> e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
> >>>>> They would reduce the repetitions (hence I called them cleanup/improvements)
> >>>>> but as we want to keep tags,cscope,clean as no-dot-config targets,
> >>>>
> >>>> I, for one, didn't take this is a goal (perhaps for clean, but there ...
> >>> So you would suggest to make these targets (except clean) .config dependent?
> >>>
> >>>
> >>>>
> >>>>> we would still not be able to use:
> >>>>> SUBDIRS-$(CONFIG_CRYPTO) += crypto
> >>>>> and use it in all_sources (because as you pointed out, it will be a no-op).
> >>>>
> >>>> ... the problem is obvious to solve, as outlined before).
> >>>>
> >>>>> Also, why do we care so much about guarding crypto/ if we take into account
> >>>>> so many architecture/config dependent files for tags/cscope (e.g. in drivers,
> >>>>> lib/x86, etc.)?
> >>>>
> >>>> Good question, which I'm afraid I have to answer with asking back:
> >>>>
> >>>>> If these are no-dot-config targets, then we should take everything, apart
> >>>>> from really big directories like arch/ ones.
> >>>>
> >>>> Why is arch/ other than arch/$(TARGET_ARCH) to be ignored? And if it is,
> >>>> why would crypto, used by only x86, not be ignored? As always I'd prefer
> >>>> firm rules, not arbitrary and/or fuzzy boundaries.
> >>>>
> >>>> Furthermore, considering e.g. cscope: Personally I view it as actively
> >>>> wrong to constrain it to just one arch. That'll lead to mistakes as
> >>>> soon as you want to make any cross-arch or even tree-wide change. Hence
> >>>> it would probably want treating just like clean. I can't comment on the
> >>>> various tags (case-insensitive) goals, as I don't know what they're
> >>>> about.
> >>> The useful thing about generating tags/cscope per-arch is that you can limit
> >>> the number of findings. Each symbol leads to one definition and not to multiple
> >>> ones. But this is still not ideal solution because doing this per-arch
> >>> and not per-config leads to inconsistency. Also, as you wrote, sometimes it is useful
> >>> to have all the symbols loaded when doing tree-wide changes. So in ideal world we should
> >>> have an option to use approach or another. I reckon this is why Linux
> >>> has a separate script for that which allows to set all-arch/per-arch, config-dependent/config-independent.
> >>>
> >>> Anyway, I do not have any ready-made solution for this problem.
> >>> The only benefit of this patch would be that the symbols for crypto/ would be visible
> >>> in cscope/tags (TBOOT uses the crypto functions but there are no definitions present
> >>> which may be suprising for people using ctags).
> >>> But I can understand if you do not want to take this patch in, due to all the observations above.
> >>
> >> Well, I'm not outright opposed. But I definitely want to hear another
> >> maintainer's view before deciding.
> > 
> > While waiting for other maintainers vote, I would like to propose an intermediate approach
> > that would at least result in unified approach (related to what you wrote about constraints):
> > 
> > In general, there are 2 *main* approaches when dealing with code indexing.
> > The first is a "tree-wide" approach, where we do not take Kconfig into account.
> > The second is a "config-aware" approach, where we take into account Kconfig options.
> > 
> > At the moment, in Xen, the approach taken is not uniform because we take all the directories
> > into account except arch/ where we take only $(TARGET_ARCH) into indexing. This makes it difficult
> > to reason about. What is the rule then - how big is the directory?
> > 
> > The intermediate solution is to switch for now to "tree-wide" approach by modifying the SUBDIRS
> > from:
> > SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
> > to:
> > SUBDIRS = xsm arch common drivers lib test crypto
> > 
> > This way, the approach is clear for everyone and we do not make any exceptions. Also the name of
> > SUBDIRS and all_sources makes sense as they are read as "global" by default as oppose to e.g. "all_compiled_sources".
> > In the future, we can then add support for "config-aware" approach by taking into account Kconfig which involes
> > more code.
> > 
> > Benefits:
> >  - clear approach, no fuzzy boundaries - all in
> >  - crypto can be included right away as well as any new subdir without requiring to fix the infrastructure first
> 
> I'm okay with that proposal (albeit if you make a patch, please have "crypto"
> at least ahead of "test"), but it'll need agreement by people actually using
> any of the affected make goals.

I am OK with this too

