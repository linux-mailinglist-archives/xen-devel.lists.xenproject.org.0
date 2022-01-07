Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E528486E47
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 01:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254220.435836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5chz-0001Hj-7p; Fri, 07 Jan 2022 00:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254220.435836; Fri, 07 Jan 2022 00:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5chz-0001En-47; Fri, 07 Jan 2022 00:02:15 +0000
Received: by outflank-mailman (input) for mailman id 254220;
 Fri, 07 Jan 2022 00:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMuU=RX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5chx-0001Eh-60
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 00:02:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e18a517-6f4d-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 01:02:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAFA461E77;
 Fri,  7 Jan 2022 00:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A34C36AE3;
 Fri,  7 Jan 2022 00:02:06 +0000 (UTC)
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
X-Inumbo-ID: 0e18a517-6f4d-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641513727;
	bh=3AaSomMTHlrRAUD0UkQp8s/NSWSsuywf3hzFfZMxXQ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AlVFPoMvEVLQxLkL2ibZqupe7QfuYehgzX5ob5EAxBVTN9HijyRLFvMrycpzfwS5E
	 aTSVl0A4hXuJeZyR0udKK6PjuVMRr7IgOxWrVq2fdrfZEFrtcjzFcv0LeNYf62nWWE
	 cZnNHatS4uzAHQjwM/sVtQwyFLGkJ0cwzS3yAsDDGS9uM1kkztiyXTfOq8vL4q95pw
	 Ha1Pxvkoa6YgIoLlV04Co58ZUPJ0aLBeX1xfAKxTZcbHaYYwLbcAOysWg/3Hmzfbt0
	 ZEvJr3/pCQgJG3A/hmIzqGw8EA+pfs4S80gb89jp4LCWKb8Bnr4YPmBbGG4QPVJoaO
	 jfLn5Ec0L5JeA==
Date: Thu, 6 Jan 2022 16:02:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Subject: Re: request for feedback on a Xen/Linux compatibility issue
In-Reply-To: <539a657a-dd79-b05b-1f4b-6d9a5a869d12@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201061544100.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop> <4ea34f61-e72e-76c3-5c20-879fefe4c7f7@suse.com> <09333371-92c0-5c90-4b4c-59b2ed9ac60d@suse.com> <539a657a-dd79-b05b-1f4b-6d9a5a869d12@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Jan 2022, Julien Grall wrote:
> On 06/01/2022 14:03, Jan Beulich wrote:
> > On 06.01.2022 08:13, Juergen Gross wrote:
> > > On 06.01.22 01:40, Stefano Stabellini wrote:
> > > > Hi all,
> > > > 
> > > > Today Xen dom0less guests are not "Xen aware": the hypervisor node
> > > > (compatible = "xen,xen") is missing from dom0less domUs device trees and
> > > > as a consequence Linux initializes as if Xen is not present. The reason
> > > > is that interfaces like grant table and xenstore (xenbus in Linux) don't
> > > > work correctly in a dom0less environment at the moment.
> > > > 
> > > > The good news is that I have patches for Xen to implement PV drivers
> > > > support for dom0less guests. They also add the hypervisor node to device
> > > > tree for dom0less guests so that Linux can discover the presence of Xen
> > > > and related interfaces.
> > > > 
> > > > When the Linux kernel is booting as dom0less kernel, it needs to delay
> > > > the xenbus initialization until the interface becomes ready. Attempts to
> > > > initialize xenbus straight away lead to failure, which is fine because
> > > > xenbus has never worked in Linux when running as dom0less guest up until
> > > > now. It is reasonable that a user needs a newer Linux to take advantage
> > > > of dom0less with PV drivers. So:
> > > > 
> > > > - old Xen + old/new Linux -> Xen not detected in Linux
> > > > - new Xen + old Linux     -> xenbus fails to initialize in Linux
> > > > - new Xen + new Linux     -> dom0less PV drivers working in Linux
> > > > 
> > > > 
> > > > The problem is that Linux until recently couldn't deal with any errors
> > > > in xenbus initialization. Instead of returning error and continuing
> > > > without xenbus, Linux would crash at boot.
> > > > 
> > > > I upstreamed two patches for Linux xenbus_probe to be able to deal with
> > > > initialization errors. With those two fixes, Linux can boot as a
> > > > dom0less kernel with the hypervisor node in device tree. The two fixes
> > > > got applied to master and were already backported to all the supported
> > > > Linux stable trees, so as of today:
> > > > 
> > > > - dom0less with hypervisor node + Linux 5.16+           -> works
> > > > - dom0less with hypervisor node + stable Linux 5.10     -> works
> > > > - dom0less with hypervisor node + unpatched Linux 5.10  -> crashes
> > > > 
> > > > 
> > > > Is this good enough? Or for Xen/Linux compatibility we want to also be
> > > > able to boot vanilla unpatched Linux 5.10 as dom0less kernel? If so,
> > > > the simplest solution is to change compatible string for the hypervisor
> > > > node, so that old Linux wouldn't recognize Xen presence and wouldn't try
> > > > to initialize xenbus (so it wouldn't crash on failure). New Linux can of
> > > > course learn to recognize both the old and the new compatible strings.
> > > > (For instance it could be compatible = "xen,xen-v2".) I have prototyped
> > > > and tested this solution successfully but I am not convinced it is the
> > > > right way to go.
> > > > 
> > > > Do you have any suggestion or feedback?
> > > > 
> > > > The Linux crash on xenbus initialization failure is a Linux bug, not a
> > > > Xen issue. For this reason, I am tempted to say that we shouldn't change
> > > > compatible string to work-around a Linux bug, especially given that the
> > > > Linux stable trees are already all fixed.
> > > 
> > > What about adding an option to your Xen patches to omit the hypervisor
> > > node in the device tree? This would enable the user to have a mode
> > > compatible to today's behavior.
> > 
> > While this sounds nice at the first glance, this would need to be a per-
> > domain setting. Which wouldn't be straightforward to express via command
> > line option (don't know how feasible it would be to express such via other
> > means).
> 
> For dom0less, domains are described in the Device-Tree. We have one node per
> domain, so we could add a property to indicate whether the domain should be
> started in compat mode (or not).
> 
> That said, I am not sure every users will want Linux to use
> grant-table/xenstore (possibly, some users may want one but not the other).
> 
> So how about a more generic property "xen,enhanced" with an opional value
> indicating whether this is disabled, enabled or the list of interface (e.g.
> xenbus, grant-table) exposed?

Yeah, I like this idea. It would allow for maximum flexibility while not
requiring any changes to the existing Xen/Linux interface; even the
compatible string would remain unmodified.

I also find the ability to select individual features interesting,
although I don't have a concrete use-case for it yet. I should say that
I do have a concrete use-case for enabling only event-channels but they
are actually already enabled for dom0less guests because they are just
hypercalls. (Nothing disables them at present for dom0less guests so
they get them "by default".)

Let's say we go down this path, which seems nice. The remaining question
is what do we want as default when the new "xen,enhanced" option is
missing. I think it makes sense for the default to be "enabled" because
I expect most people to want the enhacements and they are generally
harmless if you don't use them (except for old unpatched Linux kernels,
which is the main reason why we need the option).

In any case thanks for the suggestions, I like this!

