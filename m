Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8632589F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 22:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89977.170077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFOA7-0005Fm-RI; Thu, 25 Feb 2021 21:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89977.170077; Thu, 25 Feb 2021 21:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFOA7-0005FN-O2; Thu, 25 Feb 2021 21:27:07 +0000
Received: by outflank-mailman (input) for mailman id 89977;
 Thu, 25 Feb 2021 21:27:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjlP=H3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFOA5-0005FI-VG
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 21:27:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3792366e-7812-4c9a-84f6-3c3c241a99b1;
 Thu, 25 Feb 2021 21:27:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A832364EBA;
 Thu, 25 Feb 2021 21:27:03 +0000 (UTC)
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
X-Inumbo-ID: 3792366e-7812-4c9a-84f6-3c3c241a99b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614288424;
	bh=7xYQZSauNQ3JovgzGPinCB8YPIC6rxZc6dev38y6dsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l3f7FBUXEYRCt8RfD47pxQL8JjGoKUpm7cQH9l8zGY/ZUTSQqnFJjJjMA4Wj+9AjD
	 js5tiNeORX4PbT1vHLaB9hsQjrJWYqIMMjVG5CQzUkvuaccH4arFP4ST2/a3VYrPWH
	 Tkjh2E6bpWPTz1T/92q0tWocPmF9AKdPHY3FnKUmy6eRoD0xdziocvmjdlt7rYMqjK
	 PB3zHFTmuMbsFgzcq9FUUSFgvFCJqpif26kVOjyJx+AwFLX/C6KpAPC2kRYBcvfzVF
	 PKfdTdk9EUWzxKI+xpAagq6t0DRuq4yKHAWu51i33LynHfvtDECqF6nrHkOk0o//xy
	 9j+AzLEvPINsg==
Date: Thu, 25 Feb 2021 13:27:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2,
 3}
In-Reply-To: <0c4e6015-f969-9b6b-91b5-bffa952d47d5@xen.org>
Message-ID: <alpine.DEB.2.21.2102251326050.3234@sstabellini-ThinkPad-T480s>
References: <20210220140412.31610-1-julien@xen.org> <F86904EB-91E9-475C-B60B-E08C5C9E76C3@arm.com> <0c4e6015-f969-9b6b-91b5-bffa952d47d5@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Feb 2021, Julien Grall wrote:
> On 22/02/2021 13:45, Bertrand Marquis wrote:
> > Hi Julien,
> > 
> > > On 20 Feb 2021, at 14:04, Julien Grall <julien@xen.org> wrote:
> > > 
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Currently, Xen will send a data abort to a guest trying to write to the
> > > ISPENDR.
> > > 
> > > Unfortunately, recent version of Linux (at least 5.9+) will start
> > > writing to the register if the interrupt needs to be re-triggered
> > > (see the callback irq_retrigger). This can happen when a driver (such as
> > > the xgbe network driver on AMD Seattle) re-enable an interrupt:
> > > 
> > > (XEN) d0v0: vGICD: unhandled word write 0x00000004000000 to ISPENDR44
> > > [...]
> > > [   25.635837] Unhandled fault at 0xffff80001000522c
> > > [...]
> > > [   25.818716]  gic_retrigger+0x2c/0x38
> > > [   25.822361]  irq_startup+0x78/0x138
> > > [   25.825920]  __enable_irq+0x70/0x80
> > > [   25.829478]  enable_irq+0x50/0xa0
> > > [   25.832864]  xgbe_one_poll+0xc8/0xd8
> > > [   25.836509]  net_rx_action+0x110/0x3a8
> > > [   25.840328]  __do_softirq+0x124/0x288
> > > [   25.844061]  irq_exit+0xe0/0xf0
> > > [   25.847272]  __handle_domain_irq+0x68/0xc0
> > > [   25.851442]  gic_handle_irq+0xa8/0xe0
> > > [   25.855171]  el1_irq+0xb0/0x180
> > > [   25.858383]  arch_cpu_idle+0x18/0x28
> > > [   25.862028]  default_idle_call+0x24/0x5c
> > > [   25.866021]  do_idle+0x204/0x278
> > > [   25.869319]  cpu_startup_entry+0x24/0x68
> > > [   25.873313]  rest_init+0xd4/0xe4
> > > [   25.876611]  arch_call_rest_init+0x10/0x1c
> > > [   25.880777]  start_kernel+0x5b8/0x5ec
> > > 
> > > As a consequence, the OS may become unusable.
> > > 
> > > Implementing the write part of ISPENDR is somewhat easy. For
> > > virtual interrupt, we only need to inject the interrupt again.
> > > 
> > > For physical interrupt, we need to be more careful as the de-activation
> > > of the virtual interrupt will be propagated to the physical distributor.
> > > For simplicity, the physical interrupt will be set pending so the
> > > workflow will not differ from a "real" interrupt.
> > > 
> > > Longer term, we could possible directly activate the physical interrupt
> > > and avoid taking an exception to inject the interrupt to the domain.
> > > (This is the approach taken by the new vGIC based on KVM).
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > This is something which will not be done by a guest very often so I think
> > your
> > implementation actually makes it simpler and reduce possibilities of race
> > conditions
> > so I am not even sure that the XXX comment is needed.
> 
> I think the XXX is useful as if someone notice an issue with the code, then
> they know what they could try.
> 
> I am open to suggestion how we could keep track of potential improvement.

It is worth capturing it somewhere. Maybe the commit message is better
than as an in-code comment?

Either way it is fine by me and feel free to make that kind of change on
commit.

