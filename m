Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6727F43E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 23:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933.3178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNjg0-0000r6-5j; Wed, 30 Sep 2020 21:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933.3178; Wed, 30 Sep 2020 21:30:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNjg0-0000qk-2b; Wed, 30 Sep 2020 21:30:16 +0000
Received: by outflank-mailman (input) for mailman id 933;
 Wed, 30 Sep 2020 21:30:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKcH=DH=amazon.com=prvs=5350d769c=anchalag@srs-us1.protection.inumbo.net>)
 id 1kNjfy-0000qf-5a
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 21:30:14 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3e373f3-43c1-41cd-8cc1-d344d1cad338;
 Wed, 30 Sep 2020 21:30:12 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2020 21:30:11 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 764D6100F36; Wed, 30 Sep 2020 21:30:05 +0000 (UTC)
Received: from EX13D05UWC003.ant.amazon.com (10.43.162.226) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 30 Sep 2020 21:29:45 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC003.ant.amazon.com (10.43.162.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 30 Sep 2020 21:29:45 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Wed, 30 Sep 2020 21:29:44 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id E3F2F40A16; Wed, 30 Sep 2020 21:29:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QKcH=DH=amazon.com=prvs=5350d769c=anchalag@srs-us1.protection.inumbo.net>)
	id 1kNjfy-0000qf-5a
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 21:30:14 +0000
X-Inumbo-ID: e3e373f3-43c1-41cd-8cc1-d344d1cad338
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e3e373f3-43c1-41cd-8cc1-d344d1cad338;
	Wed, 30 Sep 2020 21:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601501412; x=1633037412;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=PzproGxQQPVApvJjIQ8ERr8X0N8MusoN+Qds32pYVAw=;
  b=lLRl9zAtVofUfisnLLrR4LJmafT+OBlYDTeszQ8yOb8GTlx9adYT6Dc2
   qbXQllHCbIQM7eOTg6BOKu67I0hxHd1FJEC4Pu5TmsNhNZK+/MsXiUBjU
   pheC/7nP+7XV6i0SfL8+j4WjVrWJdbW/C9KIsGuDnmkezhGOmTHqrXoY8
   M=;
X-IronPort-AV: E=Sophos;i="5.77,322,1596499200"; 
   d="scan'208";a="57055348"
Subject: Re: [PATCH v3 01/11] xen/manage: keep track of the on-going suspend mode
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 30 Sep 2020 21:30:11 +0000
Received: from EX13MTAUWC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS id 764D6100F36;
	Wed, 30 Sep 2020 21:30:05 +0000 (UTC)
Received: from EX13D05UWC003.ant.amazon.com (10.43.162.226) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 30 Sep 2020 21:29:45 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC003.ant.amazon.com (10.43.162.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 30 Sep 2020 21:29:45 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Wed, 30 Sep 2020 21:29:44 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix, from userid 4335130)
	id E3F2F40A16; Wed, 30 Sep 2020 21:29:44 +0000 (UTC)
Date: Wed, 30 Sep 2020 21:29:44 +0000
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
Message-ID: <20200930212944.GA3138@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <e9b94104-d20a-b6b2-cbe0-f79b1ed09c98@oracle.com>
 <20200915180055.GB19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5f1e4772-7bd9-e6c0-3fe6-eef98bb72bd8@oracle.com>
 <20200921215447.GA28503@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <e3e447e5-2f7a-82a2-31c8-10c2ffcbfb2c@oracle.com>
 <20200922231736.GA24215@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200925190423.GA31885@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <274ddc57-5c98-5003-c850-411eed1aea4c@oracle.com>
 <20200925222826.GA11755@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <cc738014-6a79-a5ae-cb2a-a02ff15b4582@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cc738014-6a79-a5ae-cb2a-a02ff15b4582@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk

On Mon, Sep 28, 2020 at 02:49:56PM -0400, boris.ostrovsky@oracle.com wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 9/25/20 6:28 PM, Anchal Agarwal wrote:
> > On Fri, Sep 25, 2020 at 04:02:58PM -0400, boris.ostrovsky@oracle.com wrote:
> >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>
> >>
> >>
> >> On 9/25/20 3:04 PM, Anchal Agarwal wrote:
> >>> On Tue, Sep 22, 2020 at 11:17:36PM +0000, Anchal Agarwal wrote:
> >>>> On Tue, Sep 22, 2020 at 12:18:05PM -0400, boris.ostrovsky@oracle.com wrote:
> >>>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 9/21/20 5:54 PM, Anchal Agarwal wrote:
> 
> >>>>> Also, wrt KASLR stuff, that issue is still seen sometimes but I haven't had
> >>>>> bandwidth to dive deep into the issue and fix it.
> >>
> >> So what's the plan there? You first mentioned this issue early this year and judged by your response it is not clear whether you will ever spend time looking at it.
> >>
> > I do want to fix it and did do some debugging earlier this year just haven't
> > gotten back to it. Also, wanted to understand if the issue is a blocker to this
> > series?
> 
> 
> Integrating code with known bugs is less than ideal.
> 
So for this series to be accepted, KASLR needs to be fixed along with other
comments of course? 
> 
> 3% failure for this feature seems to be a manageable number from the reproducability perspective --- you should be able to script this and each iteration should take way under a minute, no?
> 
>
Yes it should be doable. The % is not constant here that's the max I have seen.
Also, if at worse it takes a min per run and I have to run 2000-3000 runs to
produce failure that will still be slower. I have to dig in to see if I can find
a better way. 

> > I had some theories when debugging around this like if the random base address picked by kaslr for the
> > resuming kernel mismatches the suspended kernel and just jogging my memory, I didn't find that as the case.
> > Another hunch was if physical address of registered vcpu info at boot is different from what suspended kernel
> > has and that can cause CPU's to get stuck when coming online.
> 
> 
> I'd think if this were the case you'd have 100% failure rate. And we are also re-registering vcpu info on xen restore and I am not aware of any failures due to KASLR.
> 
What I meant there wrt VCPU info was that VCPU info is not unregistered during hibernation,
so Xen still remembers the old physical addresses for the VCPU information, created by the
booting kernel. But since the hibernation kernel may have different physical
addresses for VCPU info and if mismatch happens, it may cause issues with resume. 
During hibernation, the VCPU info register hypercall is not invoked again.
> 
> > The issue was only
> > reproducible 3% of the time out of 3000 runs hence its hard to just reproduce this.
> >
> > Moreover, I also wanted to get an insight on if hibernation works correctly with KASLR
> > generally and its only Xen causing the issue?
> 
> 
> With KASLR being on by default I'd be surprised if it didn't.
>
Thant makes it xen specific then. Also, I have not seen the issue on KVM based
instances.
> 
> -boris
> 
- Anchal

