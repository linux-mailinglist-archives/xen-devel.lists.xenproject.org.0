Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC322D208
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jul 2020 01:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz6gy-0003p7-PG; Fri, 24 Jul 2020 23:01:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOER=BD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jz6gx-0003p2-B5
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 23:01:27 +0000
X-Inumbo-ID: 99e139da-ce01-11ea-a4a3-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99e139da-ce01-11ea-a4a3-12813bfff9fa;
 Fri, 24 Jul 2020 23:01:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B32A206E3;
 Fri, 24 Jul 2020 23:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595631685;
 bh=FAvAZJOwoTWDLLRTfCmqnQivo1eUmvdJOjqG0xIYkaM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=q/5pcZuF7IsG8rh1UHvYGrrH7Jh+Tf57d7iYydxrwUMTz8Zl35U7do9b5eZ1wJ//Y
 9AcUlMxUVfMZCPhcXgJektUGvELUibNW/RAqxAXBIwKKz2kte1isEsuZKrxadLYKYN
 M3t/zzv8LGYzH0r9KPMIp+PfCTNjRwBmKz8pS9Us=
Date: Fri, 24 Jul 2020 16:01:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anchal Agarwal <anchalag@amazon.com>
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
In-Reply-To: <20200723225745.GB32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Message-ID: <alpine.DEB.2.21.2007241431280.17562@sstabellini-ThinkPad-T480s>
References: <50298859-0d0e-6eb0-029b-30df2a4ecd63@oracle.com>
 <20200715204943.GB17938@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <0ca3c501-e69a-d2c9-a24c-f83afd4bdb8c@oracle.com>
 <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
 <20200721000348.GA19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <408d3ce9-2510-2950-d28d-fdfe8ee41a54@oracle.com>
 <alpine.DEB.2.21.2007211640500.17562@sstabellini-ThinkPad-T480s>
 <20200722180229.GA32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007221645430.17562@sstabellini-ThinkPad-T480s>
 <20200723225745.GB32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-129397483-1595626299=:17562"
Content-ID: <alpine.DEB.2.21.2007241432130.17562@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: x86@kernel.org, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 pavel@ucw.cz, hpa@zytor.com, tglx@linutronix.de,
 Stefano Stabellini <sstabellini@kernel.org>, eduval@amazon.com,
 mingo@redhat.com, xen-devel@lists.xenproject.org, sblbir@amazon.com,
 axboe@kernel.dk, konrad.wilk@oracle.com, bp@alien8.de,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 kamatam@amazon.com, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-129397483-1595626299=:17562
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007241432131.17562@sstabellini-ThinkPad-T480s>

On Thu, 23 Jul 2020, Anchal Agarwal wrote:
> On Wed, Jul 22, 2020 at 04:49:16PM -0700, Stefano Stabellini wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Wed, 22 Jul 2020, Anchal Agarwal wrote:
> > > On Tue, Jul 21, 2020 at 05:18:34PM -0700, Stefano Stabellini wrote:
> > > > On Tue, 21 Jul 2020, Boris Ostrovsky wrote:
> > > > > >>>>>> +static int xen_setup_pm_notifier(void)
> > > > > >>>>>> +{
> > > > > >>>>>> +     if (!xen_hvm_domain())
> > > > > >>>>>> +             return -ENODEV;
> > > > > >>>>>>
> > > > > >>>>>> I forgot --- what did we decide about non-x86 (i.e. ARM)?
> > > > > >>>>> It would be great to support that however, its  out of
> > > > > >>>>> scope for this patch set.
> > > > > >>>>> I’ll be happy to discuss it separately.
> > > > > >>>>
> > > > > >>>> I wasn't implying that this *should* work on ARM but rather whether this
> > > > > >>>> will break ARM somehow (because xen_hvm_domain() is true there).
> > > > > >>>>
> > > > > >>>>
> > > > > >>> Ok makes sense. TBH, I haven't tested this part of code on ARM and the series
> > > > > >>> was only support x86 guests hibernation.
> > > > > >>> Moreover, this notifier is there to distinguish between 2 PM
> > > > > >>> events PM SUSPEND and PM hibernation. Now since we only care about PM
> > > > > >>> HIBERNATION I may just remove this code and rely on "SHUTDOWN_SUSPEND" state.
> > > > > >>> However, I may have to fix other patches in the series where this check may
> > > > > >>> appear and cater it only for x86 right?
> > > > > >>
> > > > > >>
> > > > > >> I don't know what would happen if ARM guest tries to handle hibernation
> > > > > >> callbacks. The only ones that you are introducing are in block and net
> > > > > >> fronts and that's arch-independent.
> > > > > >>
> > > > > >>
> > > > > >> You do add a bunch of x86-specific code though (syscore ops), would
> > > > > >> something similar be needed for ARM?
> > > > > >>
> > > > > >>
> > > > > > I don't expect this to work out of the box on ARM. To start with something
> > > > > > similar will be needed for ARM too.
> > > > > > We may still want to keep the driver code as-is.
> > > > > >
> > > > > > I understand the concern here wrt ARM, however, currently the support is only
> > > > > > proposed for x86 guests here and similar work could be carried out for ARM.
> > > > > > Also, if regular hibernation works correctly on arm, then all is needed is to
> > > > > > fix Xen side of things.
> > > > > >
> > > > > > I am not sure what could be done to achieve any assurances on arm side as far as
> > > > > > this series is concerned.
> > > >
> > > > Just to clarify: new features don't need to work on ARM or cause any
> > > > addition efforts to you to make them work on ARM. The patch series only
> > > > needs not to break existing code paths (on ARM and any other platforms).
> > > > It should also not make it overly difficult to implement the ARM side of
> > > > things (if there is one) at some point in the future.
> > > >
> > > > FYI drivers/xen/manage.c is compiled and working on ARM today, however
> > > > Xen suspend/resume is not supported. I don't know for sure if
> > > > guest-initiated hibernation works because I have not tested it.
> > > >
> > > >
> > > >
> > > > > If you are not sure what the effects are (or sure that it won't work) on
> > > > > ARM then I'd add IS_ENABLED(CONFIG_X86) check, i.e.
> > > > >
> > > > >
> > > > > if (!IS_ENABLED(CONFIG_X86) || !xen_hvm_domain())
> > > > >       return -ENODEV;
> > > >
> > > > That is a good principle to have and thanks for suggesting it. However,
> > > > in this specific case there is nothing in this patch that doesn't work
> > > > on ARM. From an ARM perspective I think we should enable it and
> > > > &xen_pm_notifier_block should be registered.
> > > >
> > > This question is for Boris, I think you we decided to get rid of the notifier
> > > in V3 as all we need  to check is SHUTDOWN_SUSPEND state which sounds plausible
> > > to me. So this check may go away. It may still be needed for sycore_ops
> > > callbacks registration.
> > > > Given that all guests are HVM guests on ARM, it should work fine as is.
> > > >
> > > >
> > > > I gave a quick look at the rest of the series and everything looks fine
> > > > to me from an ARM perspective. I cannot imaging that the new freeze,
> > > > thaw, and restore callbacks for net and block are going to cause any
> > > > trouble on ARM. The two main x86-specific functions are
> > > > xen_syscore_suspend/resume and they look trivial to implement on ARM (in
> > > > the sense that they are likely going to look exactly the same.)
> > > >
> > > Yes but for now since things are not tested I will put this
> > > !IS_ENABLED(CONFIG_X86) on syscore_ops calls registration part just to be safe
> > > and not break anything.
> > > >
> > > > One question for Anchal: what's going to happen if you trigger a
> > > > hibernation, you have the new callbacks, but you are missing
> > > > xen_syscore_suspend/resume?
> > > >
> > > > Is it any worse than not having the new freeze, thaw and restore
> > > > callbacks at all and try to do a hibernation?
> > > If callbacks are not there, I don't expect hibernation to work correctly.
> > > These callbacks takes care of xen primitives like shared_info_page,
> > > grant table, sched clock, runstate time which are important to save the correct
> > > state of the guest and bring it back up. Other patches in the series, adds all
> > > the logic to these syscore callbacks. Freeze/thaw/restore are just there for at driver
> > > level.
> > 
> > I meant the other way around :-)  Let me rephrase the question.
> > 
> > Do you think that implementing freeze/thaw/restore at the driver level
> > without having xen_syscore_suspend/resume can potentially make things
> > worse compared to not having freeze/thaw/restore at the driver level at
> > all?
> I think in both the cases I don't expect it to work. System may end up in
> different state if you register vs not. Hibernation does not work properly
> at least for domU instances without these changes on x86 and I am assuming the
> same for ARM.
> 
> If you do not register freeze/thaw/restore callbacks for arm, then on
> invocation of xenbus_dev_suspend, default suspend/resume callbacks
> will be called for each driver and since you do not have any code to save domU's
> xen primitives state (syscore_ops), hibernation will either fail or will demand a reboot.
> I do no have setup to test the current state of ARM's hibernation
> 
> If you only register freeze/thaw/restore and no syscore_ops, it will again fail.
> Since, I do not have an ARM setup running, I quickly ran a similar test on x86,
> may not be an apple to apple comparison but instance failed to resume or I
> should say stuck showing huge jump in time and required a reboot.
> 
> Now if this doesn't happen currently when you trigger hibernation on arm domU
> instances or if system is still alive when you trigger hibernation in xen guest
> then not registering the callbacks may be a better idea. In that case  may be 
> I need to put arch specific check when registering freeze/thaw/restore handlers.
> 
> Hope that answers your question.

Yes, it does, thank you. I'd rather not introduce unknown regressions so
I would recommend to add an arch-specific check on registering
freeze/thaw/restore handlers. Maybe something like the following:

#ifdef CONFIG_X86
    .freeze = blkfront_freeze,
    .thaw = blkfront_restore,
    .restore = blkfront_restore
#endif


maybe Boris has a better suggestion on how to do it
--8323329-129397483-1595626299=:17562--

