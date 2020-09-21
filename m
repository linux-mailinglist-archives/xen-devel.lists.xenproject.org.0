Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7B273552
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 23:55:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKTm7-0000RA-Ha; Mon, 21 Sep 2020 21:55:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNBt=C6=amazon.com=prvs=526fbb5c8=anchalag@srs-us1.protection.inumbo.net>)
 id 1kKTm5-0000R4-HP
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 21:55:05 +0000
X-Inumbo-ID: 7ff9ee5d-375c-4bc9-a34a-c9084dc79204
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ff9ee5d-375c-4bc9-a34a-c9084dc79204;
 Mon, 21 Sep 2020 21:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600725305; x=1632261305;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=cy4FgsFQDUy5Y1+aqmy2hGEsenO3XwWNSVG/Dz3WfcQ=;
 b=hSZlFWcMq7aYTD6Op1bibK7vrJfxkbqEHe72jKyk+If6y2Iyb+C+e/gS
 dWJPEn/EVs19xNfbfXhTyMOB2oikdg+TRSGUboYdbE90+u6RnqpIJfDJy
 miPu5f/t6bLl28CTvyeEJzdLUgXvhgLwCJ/rnYUaHq6wuaczZlsnU6M0C k=;
X-IronPort-AV: E=Sophos;i="5.77,288,1596499200"; d="scan'208";a="56836143"
Subject: Re: [PATCH v3 01/11] xen/manage: keep track of the on-going suspend
 mode
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Sep 2020 21:54:56 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5656EA17D9; Mon, 21 Sep 2020 21:54:54 +0000 (UTC)
Received: from EX13D10UWB001.ant.amazon.com (10.43.161.111) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 21 Sep 2020 21:54:47 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D10UWB001.ant.amazon.com (10.43.161.111) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 21 Sep 2020 21:54:47 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Mon, 21 Sep 2020 21:54:47 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 637B64026B; Mon, 21 Sep 2020 21:54:47 +0000 (UTC)
Date: Mon, 21 Sep 2020 21:54:47 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <boris.ostrovsky@oracle.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <jgross@suse.com>, <linux-pm@vger.kernel.org>,
 <linux-mm@kvack.org>, <kamatam@amazon.com>, <sstabellini@kernel.org>,
 <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>,
 <davem@davemloft.net>, <rjw@rjwysocki.net>, <len.brown@intel.com>,
 <pavel@ucw.cz>, <peterz@infradead.org>, <eduval@amazon.com>,
 <sblbir@amazon.com>, <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>, 
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Message-ID: <20200921215447.GA28503@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1598042152.git.anchalag@amazon.com>
 <9b970e12491107afda0c1d4a6f154b52d90346ac.1598042152.git.anchalag@amazon.com>
 <4b2bbc8b-7817-271a-4ff0-5ee5df956049@oracle.com>
 <20200914214754.GA19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <e9b94104-d20a-b6b2-cbe0-f79b1ed09c98@oracle.com>
 <20200915180055.GB19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5f1e4772-7bd9-e6c0-3fe6-eef98bb72bd8@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5f1e4772-7bd9-e6c0-3fe6-eef98bb72bd8@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 15, 2020 at 03:58:45PM -0400, boris.ostrovsky@oracle.com wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> >>
> >>
> >>>>> +
> >>>>> +static int xen_setup_pm_notifier(void)
> >>>>> +{
> >>>>> +     if (!xen_hvm_domain() || xen_initial_domain())
> >>>>> +             return -ENODEV;
> >>>>
> >>>> I don't think this works anymore.
> >>> What do you mean?
> >>> The first check is for xen domain types and other is for architecture support.
> >>> The reason I put this check here is because I wanted to segregate the two.
> >>> I do not want to register this notifier at all for !hmv guest and also if its
> >>> an initial control domain.
> >>> The arm check only lands in notifier because once hibernate() api is called ->
> >>> calls pm_notifier_call_chain for PM_HIBERNATION_PREPARE this will fail for
> >>> aarch64.
> >>> Once we have support for aarch64 this notifier can go away altogether.
> >>>
> >>> Is there any other reason I may be missing why we should move this check to
> >>> notifier?
> >>
> >>
> >> Not registering this notifier is equivalent to having it return NOTIFY_OK.
> >>
> > How is that different from current behavior?
> >>
> >> In your earlier versions just returning NOTIFY_OK was not sufficient for
> >> hibernation to proceed since the notifier would also need to set
> >> suspend_mode appropriately. But now your notifier essentially filters
> >> out unsupported configurations. And so if it is not called your
> >> configuration (e.g. PV domain) will be considered supported.
> >>
> > I am sorry if I am having a bit of hard time understanding this.
> > How will it be considered supported when its not even registered? My
> > understanding is if its not registered, it will not land in notifier call chain
> > which is invoked in pm_notifier_call_chain().
> 
> 
> Returning an error from xen_setup_pm_notifier() doesn't have any effect
> on whether hibernation will start. It's the notifier that can stop it.
>
I actually got that point where we have to return an error for certain scenarios
to fail. 
What I was trying to understand a scenario is if there is no notifier involved and
xen_initial_domain() is true what should happen when hibernation is triggered on such domain?

After my changes yes, it should not be able to proceed as you suggested below
when hibernation is triggered from within Xen guest. 
> >
> > As Roger, mentioned in last series none of this should be a part of PVH dom0
> > hibernation as its not tested but this series should also not break anything.
> > If I register this notifier for PVH dom0 and return error later that will alter
> > the current behavior right?
> >
> > If a pm_notifier for pvh dom0 is not registered then it will not land in the
> > notifier call chain and system will work as before this series.
> > If I look for unsupported configurations, then !hvm domain is also one but we
> > filter that out at the beginning and don't even bother about it.
> >
> > Unless you mean guest running VMs itself? [Trying to read between the lines may
> > not be the case though]
> 
> 
> 
> In hibernate():
> 
>         error = __pm_notifier_call_chain(PM_HIBERNATION_PREPARE, -1,
> &nr_calls);
>         if (error) {
>                 nr_calls--;
>                 goto Exit;
>         }
> 
> 
> Is you don't have notifier registered (as will be the case with PV
> domains and dom0) you won't get an error and proceed with hibernation.
> (And now I actually suspect it didn't work even with your previous patches)
> 
> 
> But something like this I think will do what you want:
> 
> 
> static int xen_pm_notifier(struct notifier_block *notifier,
>         unsigned long pm_event, void *unused)
> 
> {
> 
>        if (IS_ENABLED(CONFIG_ARM64) ||
>            !xen_hvm_domain() || xen_initial_domain() ||
>            (pm_event == PM_SUSPEND_PREPARE)) {
>                 if ((pm_event == PM_SUSPEND_PREPARE) || (pm_event ==
> PM_HIBERNATION_PREPARE))
>                         pr_warn("%s is not supported for this guest",
>                                 (pm_event == PM_SUSPEND_PREPARE) ?
>                                 "Suspend" : "Hibernation");
>                 return NOTIFY_BAD;
> 
>         return NOTIFY_OK;
> 
> }
> 
> static int xen_setup_pm_notifier(void)
> {
>         return register_pm_notifier(&xen_pm_notifier_block);
> }
> 
> 
Thanks for the above suggestion. You are right I didn't find a way to declare
a global state either. I just broke the above check in 2 so that once we have
support for ARM we should be able to remove aarch64 condition easily. Let me
know if I am missing nay corner cases with this one.

static int xen_pm_notifier(struct notifier_block *notifier,
	unsigned long pm_event, void *unused)
{
    int ret = NOTIFY_OK;
    if (!xen_hvm_domain() || xen_initial_domain())
	ret = NOTIFY_BAD;
    if(IS_ENABLED(CONFIG_ARM64) && (pm_event == PM_SUSPEND_PREPARE || pm_event == HIBERNATION_PREPARE))
	ret = NOTIFY_BAD;

    return ret;
}

> I tried to see if there is a way to prevent hibernation without using
> notifiers (like having a global flag or something) but didn't find
> anything obvious. Perhaps others can point to a simpler way of doing this.
> 
> 
> -boris
> 
>
-Anchal

