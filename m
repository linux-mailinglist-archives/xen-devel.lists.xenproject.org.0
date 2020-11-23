Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B162C1894
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 23:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35231.66658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKX5-0002LR-4A; Mon, 23 Nov 2020 22:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35231.66658; Mon, 23 Nov 2020 22:42:03 +0000
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
	id 1khKX5-0002L2-0c; Mon, 23 Nov 2020 22:42:03 +0000
Received: by outflank-mailman (input) for mailman id 35231;
 Mon, 23 Nov 2020 22:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khKX3-0002Kw-6c
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:42:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 541bf3ed-facc-44ee-93b0-9dd8b1ceea74;
 Mon, 23 Nov 2020 22:42:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09397206B7;
 Mon, 23 Nov 2020 22:41:58 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VxlT=E5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khKX3-0002Kw-6c
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:42:01 +0000
X-Inumbo-ID: 541bf3ed-facc-44ee-93b0-9dd8b1ceea74
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 541bf3ed-facc-44ee-93b0-9dd8b1ceea74;
	Mon, 23 Nov 2020 22:42:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 09397206B7;
	Mon, 23 Nov 2020 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606171319;
	bh=+5QGZAfUOAQQd7G+TYaZK2GT2F5H4rT/WGvl5K7sRf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GzWITx+r+VYQXS0PC/SD4W5yyE6it/YhflEkM076Zumy+9zAqw1ZX5Biia/3MXQwZ
	 xTExKMKzq9gVhLF9XjKZNf51JUbVCCW5+85HrSz89oXWnJImLthmcTIY9mi0hbEAiz
	 pwF5dpu4QBj66QD3qsLEVQG1l6OpeEsxnh6URQgI=
Date: Mon, 23 Nov 2020 14:41:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <8ff723d7-00e2-be35-48b0-dc4b932d35cc@suse.com>
Message-ID: <alpine.DEB.2.21.2011231440070.7979@sstabellini-ThinkPad-T480s>
References: <20201118005051.26115-1-sstabellini@kernel.org> <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com> <alpine.DEB.2.21.2011181241310.11739@sstabellini-ThinkPad-T480s> <3e8c03eb-ee3f-4439-90c2-acf340c7d8e7@suse.com> <alpine.DEB.2.21.2011191310210.11739@sstabellini-ThinkPad-T480s>
 <8ff723d7-00e2-be35-48b0-dc4b932d35cc@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Nov 2020, Jan Beulich wrote:
> On 19.11.2020 22:40, Stefano Stabellini wrote:
> > On Thu, 19 Nov 2020, Jan Beulich wrote:
> >> On 18.11.2020 22:00, Stefano Stabellini wrote:
> >>> On Wed, 18 Nov 2020, Jan Beulich wrote:
> >>>> On 18.11.2020 01:50, Stefano Stabellini wrote:
> >>>>> 1) It is not obvious that "Configure standard Xen features (expert
> >>>>> users)" is actually the famous EXPERT we keep talking about on xen-devel
> >>>>
> >>>> Which can be addressed by simply changing the one prompt line.
> >>>>
> >>>>> 2) It is not obvious when we need to enable EXPERT to get a specific
> >>>>> feature
> >>>>>
> >>>>> In particular if you want to enable ACPI support so that you can boot
> >>>>> Xen on an ACPI platform, you have to enable EXPERT first. But searching
> >>>>> through the kconfig menu it is really not clear (type '/' and "ACPI"):
> >>>>> nothing in the description tells you that you need to enable EXPERT to
> >>>>> get the option.
> >>>>
> >>>> And what causes this to be different once you switch to UNSUPPORTED?
> >>>
> >>> Two things: firstly, it doesn't and shouldn't take an expert to enable
> >>> ACPI support, even if ACPI support is experimental. So calling it
> >>> UNSUPPORTED helps a lot. This is particularly relevant to the ARM Kconfig
> >>> options changed by this patch. Secondly, this patch is adding
> >>> "(UNSUPPORTED)" in the oneline prompt so that it becomes easy to match
> >>> it with the option you need to enable.
> >>
> >> There's redundancy here then, which I think is in almost all cases
> >> better to avoid. That's first and foremost because the two places
> >> can go out of sync. Therefore, if the primary thing is to help
> >> "make menuconfig" (which I admit I don't normally use, as it's
> >> nothing that gets invoked implicitly by the build process afaict,
> >> i.e. one has to actively invoke it), perhaps we should enhance
> >> kconfig to attach at least a pre-determined subset of labels to
> >> the prompts automatically?
> >>
> >> And second, also in reply to what you've been saying further down,
> >> perhaps we would better go with a hierarchy of controls here, e.g.
> >> EXPERT -> EXPERIMENTAL -> UNSUPPORTED?
> > 
> > Both these are good ideas worth discussing; somebody else made a similar
> > suggestion some time back. I was already thinking this could be a great
> > candidate for one of the first "working groups" as defined by George
> > during the last community call because the topic is not purely
> > technical: a working group could help getting alignment and make
> > progress faster. We can propose it to George when he is back.
> > 
> > However, I don't think we need the working group to make progress on
> > this limited patch that only addresses the lowest hanging fruit.
> > 
> > I'd like to suggest to make progress on this patch in its current form,
> > and in parallel start a longer term discussion on how to do something
> > like you suggested above.
> 
> Okay, I guess I can accept this. So FAOD I'm not objecting to the
> change (with some suitable adjustments, as discussed), but I'm
> then also not going to be the one to ack it. Nevertheless I'd like
> to point out that doing such a partial solution may end up adding
> confusion rather than reducing it. Much depends on how exactly
> consumers interpret what we hand to them.

Thank you Jan. I'll clarify the patch and address your comments. I'll
also try to get the attention of one of the other maintainers for the
ack.

