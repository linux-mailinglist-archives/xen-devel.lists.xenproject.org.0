Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F270425D29
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203974.359159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYZvD-0007Yh-4K; Thu, 07 Oct 2021 20:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203974.359159; Thu, 07 Oct 2021 20:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYZvD-0007Wu-0o; Thu, 07 Oct 2021 20:23:19 +0000
Received: by outflank-mailman (input) for mailman id 203974;
 Thu, 07 Oct 2021 20:23:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYZvB-0007Wo-Ev
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:23:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 261f79be-5a4f-4d0e-b4c4-f5e8bf412e03;
 Thu, 07 Oct 2021 20:23:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7291B61139;
 Thu,  7 Oct 2021 20:23:15 +0000 (UTC)
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
X-Inumbo-ID: 261f79be-5a4f-4d0e-b4c4-f5e8bf412e03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633638195;
	bh=yEbglYJfK296Rd8sT2VsV+ykYKTi1uTQM5GSQU3qe4M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cVb/5nro2W8qtK79H6TKK1Dr3609r5XKlvd87yZiC2TV3LMIs+y6rmsqClyXmMb7q
	 hk5F3DShm7IxRDzRcbHDjUTlMKqlEc4HFfhmO9ozw32UbLAfzJiREDAKfxBkhQOnOg
	 k5s6mwem1eLGgy+1n4q8Bvy9mVlTogN87DtX3M9g5tjOjcmomchiFzA/sIgdg803ZQ
	 gTPY+l0O7UqWks+Yecq3CcOq4orDbl2Y+XsJ4Hrpfnndu7XMI2MFcqa+zcXPIK9zZv
	 7Hfrqip66BixB2k/QbEqj6E/szDc+FL9gstVMwgFBeQJcv081zgsNo6zp9qPJIVltb
	 tHc0JrJhrinpg==
Date: Thu, 7 Oct 2021 13:23:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksandr <olekstysh@gmail.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
In-Reply-To: <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
Message-ID: <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-2-git-send-email-olekstysh@gmail.com> <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com> <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com> <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com> <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Oct 2021, Jan Beulich wrote:
> On 07.10.2021 15:12, Oleksandr wrote:
> > 
> > On 07.10.21 15:43, Jan Beulich wrote:
> > 
> > Hi Jan.
> > 
> >> On 07.10.2021 14:30, Oleksandr wrote:
> >>> On 07.10.21 10:42, Jan Beulich wrote:
> >>>> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
> >>>>> Changes V4 -> V5:
> >>>>>      - update patch subject and description
> >>>>>      - drop Michal's R-b
> >>>>>      - pass gpaddr_bits via createdomain domctl
> >>>>>        (struct xen_arch_domainconfig)
> >>>> I'm afraid I can't bring this in line with ...
> >>>>
> >>>>> --- a/xen/include/public/arch-arm.h
> >>>>> +++ b/xen/include/public/arch-arm.h
> >>>>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
> >>>>>         *
> >>>>>         */
> >>>>>        uint32_t clock_frequency;
> >>>>> +    /*
> >>>>> +     * OUT
> >>>>> +     * Guest physical address space size
> >>>>> +     */
> >>>>> +    uint8_t gpaddr_bits;
> >>>> ... this being an OUT field. Is this really what Andrew had asked for?
> >>>> I would have expected the entire struct to be IN (and the comment at
> >>>> the top of the containing struct in public/domctl.h also suggests so,
> >>>> i.e. your new field renders that comment stale). gic_version being
> >>>> IN/OUT is already somewhat in conflict ...
> >>> I am sorry but I'm totally confused now, we want the Xen to provide
> >>> gpaddr_bits to the toolstack, but not the other way around.
> >>> As I understand the main ask was to switch to domctl for which I wanted
> >>> to get some clarification on how it would look like... Well, this patch
> >>> switches to use
> >>> domctl, and I think exactly as it was suggested at [1] in case if a
> >>> common one is a difficult to achieve. I have to admit, I felt it was
> >>> indeed difficult to achieve.
> >> Sadly the mail you reference isn't the one I was referring to. It's not
> >> even from Andrew. Unfortunately I also can't seem to be able to locate
> >> this, i.e. I'm now wondering whether this was under a different subject.
> >> Julien, in any event, confirmed in a recent reply on this thread that
> >> there was such a mail (otherwise I would have started wondering whether
> >> the request was made on irc). In any case it is _that_ mail that would
> >> need going through again.
> > 
> > I think, this is the email [1] you are referring to.
> 
> Well, that's still a mail you sent, not Andrew's. And while I have yours
> in my mailbox, I don't have Andrew's for whatever reason.
> 
> Nevertheless there's enough context to be halfway certain that this
> wasn't meant as an extension to the create domctl, but rather a separate
> new one (merely replacing what you had originally as a sysctl to become
> per-domain, to allow returning varying [between domains] values down the
> road). I continue to think that if such a field was added to "create",
> it would be an input (only).

During the Xen Community Call on Tuesday, we briefly spoke about this.
Andrew confirmed that what he meant with his original email is to use a
domctl. We didn't discuss which domctl specifically.

This patch now follows the same pattern of clock_frequency and
gic_version (see xen/include/public/arch-arm.h:struct xen_arch_domainconfig).
Note that gic_version is an IN/OUT parameter, showing that if in the
future we want the ability to set gpaddr_bits (in addition to get
gpaddr_bits), it will be possible.

Also it is good to keep in mind that although nobody likes to change
hypercall interfaces, especially for minor reasons, domctl are not
stable so we can be a little bit more relaxed compared to something like
grant_table_op.

