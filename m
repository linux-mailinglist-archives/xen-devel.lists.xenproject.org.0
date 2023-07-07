Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2A74B8D9
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 23:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560624.876686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHtOm-0000e8-GT; Fri, 07 Jul 2023 21:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560624.876686; Fri, 07 Jul 2023 21:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHtOm-0000bn-Dl; Fri, 07 Jul 2023 21:53:56 +0000
Received: by outflank-mailman (input) for mailman id 560624;
 Fri, 07 Jul 2023 21:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RURV=CZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHtOk-0000bg-Bh
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 21:53:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c12b0ab5-1d10-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 23:53:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D963861A8A;
 Fri,  7 Jul 2023 21:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3BEC433C7;
 Fri,  7 Jul 2023 21:53:46 +0000 (UTC)
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
X-Inumbo-ID: c12b0ab5-1d10-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688766828;
	bh=k/+e0BWi3gX9F1S1IBS6aojJc9k/vUACTYADyTfduqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s4Iy39WozA7wUOM/DuLT0e3iwDaTq10X1yw8ocBvgDZwrUu84RvVZ80TAHe8tSPF/
	 uW1KkLkupBGFNtU8lnsrMG6ZdEFAxhFo1XYJR9+WIaRxKuOtAfDNjDb9etYfrk/2RR
	 2Du5gyQyb0F8ALTqmAKqgiG2vQFu+lBlVNRdPY8Ftj5yoORyMc5JZhjAK0mQDQf2SQ
	 WDlZuzZHpKaaOMvqkTIfezXMhmM8rJ8BRq/AHfquAu+huBZ71/7WwpHARjN3Et3Ali
	 DtmQuWgrilnycxpK8cIRk0DF/JqRei0sw4NZS2WV354JntB9XetCWXLHiBeiVWV6T5
	 xFFfVIxYlqxbg==
Date: Fri, 7 Jul 2023 14:53:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <f6c16d46-5804-a838-cf61-71fc671e394b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307071432200.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com> <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com> <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
 <f93f0561-abea-bdae-223e-d69932e435c4@suse.com> <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com> <fb29cca6-454c-82ed-b6a8-ac9814f81cfa@suse.com> <CAFHJcJuCddmwMAB=26tVBfgThQWLZb5kZU3GBdC0aTTcvJ4O1w@mail.gmail.com>
 <f6c16d46-5804-a838-cf61-71fc671e394b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jul 2023, Jan Beulich wrote:
> On 07.07.2023 10:04, Simone Ballarin wrote:
> > Il giorno ven 7 lug 2023 alle ore 09:04 Jan Beulich <jbeulich@suse.com> ha
> > scritto:
> > 
> >> On 07.07.2023 08:50, Simone Ballarin wrote:
> >>> Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich <jbeulich@suse.com>
> >> ha
> >>> scritto:
> >>>
> >>>> On 06.07.2023 18:08, Simone Ballarin wrote:
> >>>>> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com
> >>>
> >>>> ha
> >>>>> scritto:
> >>>>>
> >>>>>> On 05.07.2023 17:26, Simone Ballarin wrote:
> >>>>>>> --- a/xen/arch/x86/apic.c
> >>>>>>> +++ b/xen/arch/x86/apic.c
> >>>>>>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
> >>>>>>>       * Setup the APIC counter to maximum. There is no way the lapic
> >>>>>>>       * can underflow in the 100ms detection time frame.
> >>>>>>>       */
> >>>>>>> -    __setup_APIC_LVTT(0xffffffff);
> >>>>>>> +    __setup_APIC_LVTT(0xffffffffU);
> >>>>>>
> >>>>>> While making the change less mechanical, we want to consider to switch
> >>>>>> to ~0 in this and similar cases.
> >>>>>>
> >>>>>
> >>>>> Changing ~0U is more than not mechanical: it is possibly dangerous.
> >>>>> The resulting value could be different depending on the architecture,
> >>>>> I prefer to not make such kind of changes in a MISRA-related patch.
> >>>>
> >>>> What do you mean by "depending on the architecture", when this is
> >>>> x86-only code _and_ you can check what type parameter the called
> >>>> function has?
> >>>
> >>> Ok, I will change these literals in ~0U in the next submission.
> >>
> >> Except that I specifically meant ~0, not ~0U. We mean "maximum value"
> >> here, and at the call site it doesn't matter how wide the function
> >> parameter's type is. If it was 64-bit, ~0U would not do what is wanted.
> > 
> > ~0 is not a MISRA-compliant solution since bitwise operations on signed
> > integers have implementation-defined behavior. This solution definitively
> > violates Rule 10.1.
> 
> So if we adopted that rule (we didn't so far), we'd have to e.g. change
> all literal number shift counts to have U suffixes, no matter that
> without the suffix it is still entirely obvious that the numbers are
> unsigned? I'm afraid that'll face my opposition ...

Indeed we have not adopted Rule 10.1. However, may I suggest that we
don't make things potentially worse, just in case we end up deciding in
favor of 10.1? We might not adopt 10.1 at all, but still... The code is
already 0xffffffff, let's make things easier for all of us and just do
0xffffffffU ?

Let's put Rule 10.1 and the whole of MISRA C aside for a second.


Jan, let's say that you prefer ~0 or a different function parameter name
or something else on any of these patches. You do realize that you don't
need Simone or Federico or anyone else to make that change for you? You
can make the change, submit a patch, and in your case anyone can ack
it. Roger, Andrew, me, Bertrand, Julien, and almost anyone else could
ack it and it would go in. As I wrote yesterday, feel free to CC me and
I'll help you get in all the changes that you want.

If you submitted that patch to switch to ~0 it might already be
committed by now.

I am trying to highlight that suggesting changes on these mechanical
patches end up with more work for both the contributor and also the
maintainer compared to do the change yourself.

I think we should try to accept these patches as
mechanical-changes-only. This is the only way to scale up this effort.
If you spot something that you'd rather be done differently, do one of
the following:

a) Accept the patch as-is and submit a patch afterwards. Yes the line
   gets changed twice but it is the easiest solution.

b) Ask the contribitor to drop the single change you would rather do
   differently, or even better drop it yourself on commit. Then submit a
   patch with the change that you prefer.

c) For trivial things, like code style changes, do the change directly
   on commit.


I know emails encourage English replies, but to make this work we need
to do more code changes together and less English.

