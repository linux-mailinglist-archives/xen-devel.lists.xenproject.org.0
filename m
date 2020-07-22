Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2525228D0A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 02:19:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy2T1-0006hn-UD; Wed, 22 Jul 2020 00:18:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0kdp=BB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jy2Sz-0006hi-Nv
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 00:18:37 +0000
X-Inumbo-ID: e296814c-cbb0-11ea-85f8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e296814c-cbb0-11ea-85f8-bc764e2007e4;
 Wed, 22 Jul 2020 00:18:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04D5F206F2;
 Wed, 22 Jul 2020 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595377116;
 bh=VJtScx2bVukP/mlcrClwkoR4ksqhOSgVTh+yFH7IWqM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=q/rbNlzMTu2d7h5yLJQ8MI4vWYi2LX7ozhDoYhAUPEoDZ8904PyP/6DGkZPlaa7h+
 o8Fhe9tLoc59rwBt81rS8ZNb2x+kajIYiSDt6wqdK85Qfy3Jg1VyVaAQUbxbsTZyIp
 xLurlKmXOP87yAI9egGiQP25yNvM/MDfjaezUFq0=
Date: Tue, 21 Jul 2020 17:18:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
In-Reply-To: <408d3ce9-2510-2950-d28d-fdfe8ee41a54@oracle.com>
Message-ID: <alpine.DEB.2.21.2007211640500.17562@sstabellini-ThinkPad-T480s>
References: <cover.1593665947.git.anchalag@amazon.com>
 <20200702182136.GA3511@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <50298859-0d0e-6eb0-029b-30df2a4ecd63@oracle.com>
 <20200715204943.GB17938@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <0ca3c501-e69a-d2c9-a24c-f83afd4bdb8c@oracle.com>
 <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
 <20200721000348.GA19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <408d3ce9-2510-2950-d28d-fdfe8ee41a54@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-219213542-1595374972=:17562"
Content-ID: <alpine.DEB.2.21.2007211643430.17562@sstabellini-ThinkPad-T480s>
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
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, axboe@kernel.dk,
 konrad.wilk@oracle.com, Anchal Agarwal <anchalag@amazon.com>, bp@alien8.de,
 tglx@linutronix.de, jgross@suse.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-219213542-1595374972=:17562
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007211643431.17562@sstabellini-ThinkPad-T480s>

On Tue, 21 Jul 2020, Boris Ostrovsky wrote:
> >>>>>> +static int xen_setup_pm_notifier(void)
> >>>>>> +{
> >>>>>> +     if (!xen_hvm_domain())
> >>>>>> +             return -ENODEV;
> >>>>>>
> >>>>>> I forgot --- what did we decide about non-x86 (i.e. ARM)?
> >>>>> It would be great to support that however, its  out of
> >>>>> scope for this patch set.
> >>>>> I’ll be happy to discuss it separately.
> >>>>
> >>>> I wasn't implying that this *should* work on ARM but rather whether this
> >>>> will break ARM somehow (because xen_hvm_domain() is true there).
> >>>>
> >>>>
> >>> Ok makes sense. TBH, I haven't tested this part of code on ARM and the series
> >>> was only support x86 guests hibernation.
> >>> Moreover, this notifier is there to distinguish between 2 PM
> >>> events PM SUSPEND and PM hibernation. Now since we only care about PM
> >>> HIBERNATION I may just remove this code and rely on "SHUTDOWN_SUSPEND" state.
> >>> However, I may have to fix other patches in the series where this check may
> >>> appear and cater it only for x86 right?
> >>
> >>
> >> I don't know what would happen if ARM guest tries to handle hibernation
> >> callbacks. The only ones that you are introducing are in block and net
> >> fronts and that's arch-independent.
> >>
> >>
> >> You do add a bunch of x86-specific code though (syscore ops), would
> >> something similar be needed for ARM?
> >>
> >>
> > I don't expect this to work out of the box on ARM. To start with something
> > similar will be needed for ARM too.
> > We may still want to keep the driver code as-is.
> > 
> > I understand the concern here wrt ARM, however, currently the support is only
> > proposed for x86 guests here and similar work could be carried out for ARM.
> > Also, if regular hibernation works correctly on arm, then all is needed is to
> > fix Xen side of things.
> > 
> > I am not sure what could be done to achieve any assurances on arm side as far as
> > this series is concerned.

Just to clarify: new features don't need to work on ARM or cause any
addition efforts to you to make them work on ARM. The patch series only
needs not to break existing code paths (on ARM and any other platforms).
It should also not make it overly difficult to implement the ARM side of
things (if there is one) at some point in the future.

FYI drivers/xen/manage.c is compiled and working on ARM today, however
Xen suspend/resume is not supported. I don't know for sure if
guest-initiated hibernation works because I have not tested it.


 
> If you are not sure what the effects are (or sure that it won't work) on
> ARM then I'd add IS_ENABLED(CONFIG_X86) check, i.e.
> 
> 
> if (!IS_ENABLED(CONFIG_X86) || !xen_hvm_domain())
> 	return -ENODEV;

That is a good principle to have and thanks for suggesting it. However,
in this specific case there is nothing in this patch that doesn't work
on ARM. From an ARM perspective I think we should enable it and
&xen_pm_notifier_block should be registered.

Given that all guests are HVM guests on ARM, it should work fine as is.


I gave a quick look at the rest of the series and everything looks fine
to me from an ARM perspective. I cannot imaging that the new freeze,
thaw, and restore callbacks for net and block are going to cause any
trouble on ARM. The two main x86-specific functions are
xen_syscore_suspend/resume and they look trivial to implement on ARM (in
the sense that they are likely going to look exactly the same.)


One question for Anchal: what's going to happen if you trigger a
hibernation, you have the new callbacks, but you are missing
xen_syscore_suspend/resume?

Is it any worse than not having the new freeze, thaw and restore
callbacks at all and try to do a hibernation?
--8323329-219213542-1595374972=:17562--

