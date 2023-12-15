Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59945815182
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655366.1023128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFK0-0003QG-MC; Fri, 15 Dec 2023 21:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655366.1023128; Fri, 15 Dec 2023 21:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFK0-0003OM-J3; Fri, 15 Dec 2023 21:02:12 +0000
Received: by outflank-mailman (input) for mailman id 655366;
 Fri, 15 Dec 2023 21:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFJz-0002dN-AJ
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:02:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 361fbe4f-9b8d-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 22:02:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 482EF62799;
 Fri, 15 Dec 2023 21:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F571C433C7;
 Fri, 15 Dec 2023 21:02:07 +0000 (UTC)
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
X-Inumbo-ID: 361fbe4f-9b8d-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674128;
	bh=7wtrVTI/cW8Ic7U1Zkh5SC8wcl/JQhroBiig5pdm/5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p0InLU7OvgQNITHWUUBh0DovXQjPDVsunjEuTJYO40h4KZSxrATmqRQF8PoXXvPcc
	 Vu67ejcVOq4IGJHceNz/8K8heIpTgx7iqdL/gm2SKUHUu9GhyLKE2Ofuf2v5Vvx/kF
	 xt8euoOflOu6ESM20BIHHUPoVl8/pMUaDU8qBeV2luOhnEfm1hiqmrc6zmKR7f2ETd
	 k5PIuKO3hLV+epAcU6H+vdOfcYA4iO5TLb4e2DQCG81hSba0UUdmFxw+ZJTQPFu4M7
	 vbxHGPY4KyJO7iH4lbls62zFHupCKTlCztwtTenG98TDxteICBXM9rqQq8/pnSD2bK
	 QFLd0ZYUH5H/A==
Date: Fri, 15 Dec 2023 13:02:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 9/9] xen: add SAF deviation for safe cast removal.
In-Reply-To: <698cb944-3e91-498c-99ba-ff0849723285@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312151127450.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com> <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com> <alpine.DEB.2.22.394.2312141355391.3175268@ubuntu-linux-20-04-desktop>
 <698cb944-3e91-498c-99ba-ff0849723285@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Jan Beulich wrote:
> On 14.12.2023 23:04, Stefano Stabellini wrote:
> > On Thu, 14 Dec 2023, Jan Beulich wrote:
> >> On 14.12.2023 13:07, Simone Ballarin wrote:
> >>> --- a/docs/misra/safe.json
> >>> +++ b/docs/misra/safe.json
> >>> @@ -28,6 +28,14 @@
> >>>          },
> >>>          {
> >>>              "id": "SAF-3-safe",
> >>> +            "analyser": {
> >>> +                "eclair": "MC3R1.R11.8"
> >>> +            },
> >>> +            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
> >>> +            "text": "It is safe to cast away const qualifiers to comply with function signature if the function does not modify the pointee."
> >>
> >> I'm not happy with this description, as it invites for all sorts of abuse.
> >> Yet I'm also puzzled that ...
> > 
> > We can improve the language but the concept would still be the same. For
> > instance:
> > 
> > A single function might or might not modify the pointee depending on
> > other function parameters (for instance a single function that could
> > either read or write depending on how it is called). It is safe to cast
> > away const qualifiers when passing a parameter to a function of this
> > type when the other parameters are triggering a read-only operation.
> 
> Right, but I think the next here needs to be setting as tight boundaries
> as possible: It should cover only this one specific pattern. Anything
> else would better get its own deviation, imo.

OK. What about:

A single function might or might not modify the pointee depending on
other function parameters, for instance a common pattern is to implement
one function that could either read or write depending on how it is
called. It is safe to cast away const qualifiers when passing a
parameter to a function following this pattern when the other parameters
are triggering a read-only operation.

Feel free to suggest a better wording.


> >>> --- a/xen/arch/x86/hvm/hvm.c
> >>> +++ b/xen/arch/x86/hvm/hvm.c
> >>> @@ -3413,6 +3413,7 @@ static enum hvm_translation_result __hvm_copy(
> >>>  enum hvm_translation_result hvm_copy_to_guest_phys(
> >>>      paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
> >>>  {
> >>> +    /* SAF-3-safe */
> >>>      return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
> >>>                        paddr, size, v,
> >>>                        HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
> >>
> >> ... this is the only place you then use it. Afaict some of Arm's copy_guest()
> >> callers ought to have a similar issue. If so, an enlarged patch should be
> >> discussed with a larger audience, to see how we collectively think we want to
> >> put this specific kind of deviation.
> > 
> > We have a similar problem, see xen/arch/arm/guestcopy.c
> > raw_copy_to_guest and raw_copy_from_guest.
> > 
> > I would use the SAF deviation there too.
> > 
> > In the case here, I think the comment "HVMCOPY_to_guest doesn't modify"
> > could be removed as it becomes redundant with SAF-3-safe, but I'll leave
> > it to you.
> 
> No, the comment cannot be removed: The SAF comment says exactly nothing
> until you go and look up its description. The two comments could be
> folded, though. Which is something I was trying to advocate for in
> general: Unless entirely obvious, what exactly it is that is "safe"
> would better be (briefly) stated in these SAF comments.

I agree with you

