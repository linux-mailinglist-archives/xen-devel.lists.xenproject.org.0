Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC429738D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11193.29685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzsW-0000mV-VC; Fri, 23 Oct 2020 16:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11193.29685; Fri, 23 Oct 2020 16:25:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzsW-0000m5-S4; Fri, 23 Oct 2020 16:25:20 +0000
Received: by outflank-mailman (input) for mailman id 11193;
 Fri, 23 Oct 2020 16:25:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kVzsU-0000lt-Ss
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:25:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79096c1-eee4-47b9-aa28-7bcc11430077;
 Fri, 23 Oct 2020 16:25:18 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E26E42192A;
 Fri, 23 Oct 2020 16:25:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kVzsU-0000lt-Ss
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:25:18 +0000
X-Inumbo-ID: a79096c1-eee4-47b9-aa28-7bcc11430077
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a79096c1-eee4-47b9-aa28-7bcc11430077;
	Fri, 23 Oct 2020 16:25:18 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E26E42192A;
	Fri, 23 Oct 2020 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470317;
	bh=PAR2NkJcyGWUrf2r1igze2t3rx5eT74HdkfAQ2uSaTs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DZt87/4/pJZT/AwsmR3amWr6W0YM+4uZfglT+lyMoe3tU0+gcmPBE15p9anqNawx1
	 dfpsTk0jv0vviF8lg162HUpV0xinaBHSnqeZifPp52zhQmz4tgP4ZQu4HMHZKCb2L0
	 XIFo2uRIAeT1Q2zxbo6kYLKh71iv+amD1KYZO1ek=
Date: Fri, 23 Oct 2020 09:25:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
In-Reply-To: <d4be5451-809b-c793-8b6a-9e9bace0a52e@xen.org>
Message-ID: <alpine.DEB.2.21.2010230920060.12247@sstabellini-ThinkPad-T480s>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com> <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org> <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com> <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s> <d4be5451-809b-c793-8b6a-9e9bace0a52e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1071560962-1603470205=:12247"
Content-ID: <alpine.DEB.2.21.2010230923450.12247@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1071560962-1603470205=:12247
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2010230923451.12247@sstabellini-ThinkPad-T480s>

On Fri, 23 Oct 2020, Julien Grall wrote:
> On 23/10/2020 01:02, Stefano Stabellini wrote:
> > On Thu, 22 Oct 2020, Julien Grall wrote:
> > > > > On 20/10/2020 16:25, Rahul Singh wrote:
> > > > > > Add support for ARM architected SMMUv3 implementations. It is based
> > > > > > on
> > > > > > the Linux SMMUv3 driver.
> > > > > > Major differences between the Linux driver are as follows:
> > > > > > 1. Only Stage-2 translation is supported as compared to the Linux
> > > > > > driver
> > > > > >      that supports both Stage-1 and Stage-2 translations.
> > > > > > 2. Use P2M  page table instead of creating one as SMMUv3 has the
> > > > > >      capability to share the page tables with the CPU.
> > > > > > 3. Tasklets is used in place of threaded IRQ's in Linux for event
> > > > > > queue
> > > > > >      and priority queue IRQ handling.
> > > > > 
> > > > > Tasklets are not a replacement for threaded IRQ. In particular, they
> > > > > will
> > > > > have priority over anything else (IOW nothing will run on the pCPU
> > > > > until
> > > > > they are done).
> > > > > 
> > > > > Do you know why Linux is using thread. Is it because of long running
> > > > > operations?
> > > > 
> > > > Yes you are right because of long running operations Linux is using the
> > > > threaded IRQs.
> > > > 
> > > > SMMUv3 reports fault/events bases on memory-based circular buffer queues
> > > > not
> > > > based on the register. As per my understanding, it is time-consuming to
> > > > process the memory based queues in interrupt context because of that
> > > > Linux
> > > > is using threaded IRQ to process the faults/events from SMMU.
> > > > 
> > > > I didn’t find any other solution in XEN in place of tasklet to defer the
> > > > work, that’s why I used tasklet in XEN in replacement of threaded IRQs.
> > > > If
> > > > we do all work in interrupt context we will make XEN less responsive.
> > > 
> > > So we need to make sure that Xen continue to receives interrupts, but we
> > > also
> > > need to make sure that a vCPU bound to the pCPU is also responsive.
> > > 
> > > > 
> > > > If you know another solution in XEN that will be used to defer the work
> > > > in
> > > > the interrupt please let me know I will try to use that.
> > > 
> > > One of my work colleague encountered a similar problem recently. He had a
> > > long
> > > running tasklet and wanted to be broken down in smaller chunk.
> > > 
> > > We decided to use a timer to reschedule the taslket in the future. This
> > > allows
> > > the scheduler to run other loads (e.g. vCPU) for some time.
> > > 
> > > This is pretty hackish but I couldn't find a better solution as tasklet
> > > have
> > > high priority.
> > > 
> > > Maybe the other will have a better idea.
> > 
> > Julien's suggestion is a good one.
> > 
> > But I think tasklets can be configured to be called from the idle_loop,
> > in which case they are not run in interrupt context?
> 
> Tasklets can either run from the IDLE loop or from a softirq context.
> 
> When running from a softirq context is may happen on return from receiving an
> interrupt. However, interrupts will always be enabled.
> 
> So I am not sure what concern you are trying to raise here.

Not raising any concerns :-)

I thought one of the previous statements in this thread implied that
tasklets are run in interrupt context -- I just wanted to go into
details on that point as it is relevant.
--8323329-1071560962-1603470205=:12247--

