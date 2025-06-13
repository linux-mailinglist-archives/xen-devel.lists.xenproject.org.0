Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B39AD9860
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 00:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015019.1392998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQDFf-0004o4-0a; Fri, 13 Jun 2025 22:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015019.1392998; Fri, 13 Jun 2025 22:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQDFe-0004ls-TA; Fri, 13 Jun 2025 22:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1015019;
 Fri, 13 Jun 2025 22:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQDFd-0004lm-Sn
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 22:51:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00bddc53-48a9-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 00:51:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 193EC5C5DBA;
 Fri, 13 Jun 2025 22:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0FCC4CEE3;
 Fri, 13 Jun 2025 22:51:51 +0000 (UTC)
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
X-Inumbo-ID: 00bddc53-48a9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749855113;
	bh=kJxIN50HwZ1kSekdF12jWd03NviJbPOIP0orbuA3eps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lX04w34Vu3TMZP4jAl2wDHl2HcYCeuBTh63RDBlgQihcqETLHEwb6mM4bHAruPPC2
	 YTAXKCrInpIwI1AD24yPRbTMh3C0ex3oDt0nq2QadeYGvfvT0hZbPJ8hIz4UEiaXbB
	 b7d9G1zXVLHFJp6Cj0W+due6iDn07s9wP0r6jVSg6q7G+miZ9QwR0fKhmwZdTs2Dhg
	 I7JPLPkjuRw641QsJDZIDnGvqQQNS9jnqWJlKvVuvNJuqVsUMZL2ojL02VPgg3rLWx
	 0s1kpIc6sP9FwLhCGR7qKYMXUBdB2Pu3CVWvQmRn5yGs8gAxXLIQbcNMu18FObV1Cy
	 MwK2FQFmlODzg==
Date: Fri, 13 Jun 2025 15:51:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
In-Reply-To: <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131547320.8480@ubuntu-linux-20-04-desktop>
References: <20250610225737.469690-1-jason.andryuk@amd.com> <20250610225737.469690-5-jason.andryuk@amd.com> <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com> <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Jun 2025, Jason Andryuk wrote:
> On 2025-06-11 09:27, Jan Beulich wrote:
> > On 11.06.2025 00:57, Jason Andryuk wrote:
> > > Allow the hwdom to access the console, and to access physical
> > > information about the system.
> > > 
> > > xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
> > > permission would be required.
> > 
> > Why would xenconsoled run in the hardware domain? It's purely a software
> > construct, isn't it? As a daemon, putting it in the control domain may
> > make sense. Otherwise it probably ought to go in a service domain.
> 
> My approach has been to transform dom0 into the hardware domain and add a new
> control domain.  xenconsoled was left running in the hardware domain.

I think we should keep xenconsoled in the hardware domain because the
control domain should be just optional. (However, one could say that with
Denis' recent changes xenconsoled is also optional because one can use
console hypercalls or emulators (PL011, NS16550) for all DomUs.)



> I suppose it could move.  Maybe that would be fine?  I haven't tried. The
> Hyperlaunch code populates the console grants to point at the hardware domain,
> and I just followed that.
> 
> One aspect of why I left most things running in the Hardware domain was to not
> run things in the Control domain.  If Control is the highest privileged
> entity, we'd rather run software in lower privileged places. Especially
> something like xenconsoled which is receiving data from the domUs.

Yes, I agree with Jason. It is a bad idea to run xenconsoled in the
Control Domain because the Control Domain is meant to be safe from
interference. We want to keep the number of potential vehicles for
interference down to a minimum and shared memory between Control Domain
and DomUs is certainly a vehicle for interference.

