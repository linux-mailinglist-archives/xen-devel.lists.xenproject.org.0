Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6027943C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 00:29:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLwCz-0005z0-7c; Fri, 25 Sep 2020 22:28:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kj7V=DC=amazon.com=prvs=53038a08f=anchalag@srs-us1.protection.inumbo.net>)
 id 1kLwCy-0005yv-Ih
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 22:28:52 +0000
X-Inumbo-ID: 753ea7f7-a53d-43cc-9394-d188ea18dd27
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 753ea7f7-a53d-43cc-9394-d188ea18dd27;
 Fri, 25 Sep 2020 22:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1601072931; x=1632608931;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=H/ByxnyqVs12wa6YXcMkkIXYTiIPz40wHkOjYuHpCoE=;
 b=iyTyVx+2fZ7FGRTQJNIUAyV0SW4T11/sunc3RlhuYrSLfBB6gvSLCl50
 J4fCf4XzBuMHBzcr/TD22dtldJl5vgfYbdWKGgGcB7n4Ga4jJ2foNV0rK
 r87fMU10X5XMqyHeFLpysAWC5lI7uwJ3BrZUdLDiHh4AouLp3cx6IGLQv 8=;
X-IronPort-AV: E=Sophos;i="5.77,303,1596499200"; d="scan'208";a="56168877"
Subject: Re: [PATCH v3 01/11] xen/manage: keep track of the on-going suspend
 mode
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 25 Sep 2020 22:28:51 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8D1EC281EA5; Fri, 25 Sep 2020 22:28:44 +0000 (UTC)
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 25 Sep 2020 22:28:27 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 25 Sep 2020 22:28:26 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 25 Sep 2020 22:28:26 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id B1F8B40269; Fri, 25 Sep 2020 22:28:26 +0000 (UTC)
Date: Fri, 25 Sep 2020 22:28:26 +0000
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
Message-ID: <20200925222826.GA11755@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <4b2bbc8b-7817-271a-4ff0-5ee5df956049@oracle.com>
 <20200914214754.GA19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <e9b94104-d20a-b6b2-cbe0-f79b1ed09c98@oracle.com>
 <20200915180055.GB19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5f1e4772-7bd9-e6c0-3fe6-eef98bb72bd8@oracle.com>
 <20200921215447.GA28503@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <e3e447e5-2f7a-82a2-31c8-10c2ffcbfb2c@oracle.com>
 <20200922231736.GA24215@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200925190423.GA31885@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <274ddc57-5c98-5003-c850-411eed1aea4c@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <274ddc57-5c98-5003-c850-411eed1aea4c@oracle.com>
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

On Fri, Sep 25, 2020 at 04:02:58PM -0400, boris.ostrovsky@oracle.com wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 9/25/20 3:04 PM, Anchal Agarwal wrote:
> > On Tue, Sep 22, 2020 at 11:17:36PM +0000, Anchal Agarwal wrote:
> >> On Tue, Sep 22, 2020 at 12:18:05PM -0400, boris.ostrovsky@oracle.com wrote:
> >>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>>
> >>>
> >>>
> >>> On 9/21/20 5:54 PM, Anchal Agarwal wrote:
> >>>> Thanks for the above suggestion. You are right I didn't find a way to declare
> >>>> a global state either. I just broke the above check in 2 so that once we have
> >>>> support for ARM we should be able to remove aarch64 condition easily. Let me
> >>>> know if I am missing nay corner cases with this one.
> >>>>
> >>>> static int xen_pm_notifier(struct notifier_block *notifier,
> >>>>       unsigned long pm_event, void *unused)
> >>>> {
> >>>>     int ret = NOTIFY_OK;
> >>>>     if (!xen_hvm_domain() || xen_initial_domain())
> >>>>       ret = NOTIFY_BAD;
> >>>>     if(IS_ENABLED(CONFIG_ARM64) && (pm_event == PM_SUSPEND_PREPARE || pm_event == HIBERNATION_PREPARE))
> >>>>       ret = NOTIFY_BAD;
> >>>>
> >>>>     return ret;
> >>>> }
> >>>
> >>>
> >>> This will allow PM suspend to proceed on x86.
> >> Right!! Missed it.
> >> Also, wrt KASLR stuff, that issue is still seen sometimes but I haven't had
> >> bandwidth to dive deep into the issue and fix it.
> 
> 
> So what's the plan there? You first mentioned this issue early this year and judged by your response it is not clear whether you will ever spend time looking at it.
> 
I do want to fix it and did do some debugging earlier this year just haven't
gotten back to it. Also, wanted to understand if the issue is a blocker to this
series?
I had some theories when debugging around this like if the random base address picked by kaslr for the
resuming kernel mismatches the suspended kernel and just jogging my memory, I didn't find that as the case.
Another hunch was if physical address of registered vcpu info at boot is different from what suspended kernel
has and that can cause CPU's to get stuck when coming online. The issue was only
reproducible 3% of the time out of 3000 runs hence its hard to just reproduce this.

Moreover, I also wanted to get an insight on if hibernation works correctly with KASLR
generally and its only Xen causing the issue?
> 
> >>  I seem to have lost your email
> >> in my inbox hence covering the question here.
> >>>
> > Can I add your Reviewed-by or Signed-off-by to it?
> 
> 
> Are you asking me to add my R-b to the broken code above?
> 
Of course not!! After its fixed.
Well can forget it for now then!
> 
> -boris
> 
Thanks,
Anchal

