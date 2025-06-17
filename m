Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0DADBDEF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 02:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017591.1394570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJv2-0005Qq-Lm; Tue, 17 Jun 2025 00:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017591.1394570; Tue, 17 Jun 2025 00:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJv2-0005Of-J0; Tue, 17 Jun 2025 00:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1017591;
 Tue, 17 Jun 2025 00:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRJv0-0005OX-Oy
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 00:11:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e4a9f29-4b0f-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 02:11:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89583449B8;
 Tue, 17 Jun 2025 00:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFCCC4CEF5;
 Tue, 17 Jun 2025 00:11:00 +0000 (UTC)
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
X-Inumbo-ID: 8e4a9f29-4b0f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750119062;
	bh=3u74A8COiJSaIMpap2C2Bqi8TnCI7uNJXIIzENszSyE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wf7FJXu4dSz+pNFuYjgUnU4EQY72h3G86S/1nypz5+nbkJqzyPiQDJv/lj18kwm87
	 kflGVIa6+kUrd4RKHhGz/6O1ZaWx35T6LGyISnWan0ZuHWEv26s+wSrj0LIOBeIWLt
	 UIWdwnsFhn0N8329vLscYR9C2zngFc9Wpfp2Q+HrwT5pI+NAgG3QTczPod/Q6WrHT4
	 kT4M7gxMGk+dGo+XlJxi6tsixiLCyj3zBZKdHXu2BCgXgt27qU4NVd/jzGheMhtI9A
	 bq0WqQ95pOkFopoJWXTx33pM7yyxB/wEdovKP1fr9XeAMemujMCSukdsZTkbsm4CW7
	 hvQDHFePXLm+Q==
Date: Mon, 16 Jun 2025 17:10:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
In-Reply-To: <bf6fd680-c608-4d64-ad8f-38eac102991e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506161705370.1384757@ubuntu-linux-20-04-desktop>
References: <20250610225737.469690-1-jason.andryuk@amd.com> <20250610225737.469690-5-jason.andryuk@amd.com> <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com> <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com> <alpine.DEB.2.22.394.2506131547320.8480@ubuntu-linux-20-04-desktop>
 <bf6fd680-c608-4d64-ad8f-38eac102991e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, Jan Beulich wrote:
> On 14.06.2025 00:51, Stefano Stabellini wrote:
> > On Wed, 11 Jun 2025, Jason Andryuk wrote:
> >> On 2025-06-11 09:27, Jan Beulich wrote:
> >>> On 11.06.2025 00:57, Jason Andryuk wrote:
> >>>> Allow the hwdom to access the console, and to access physical
> >>>> information about the system.
> >>>>
> >>>> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
> >>>> permission would be required.
> >>>
> >>> Why would xenconsoled run in the hardware domain? It's purely a software
> >>> construct, isn't it? As a daemon, putting it in the control domain may
> >>> make sense. Otherwise it probably ought to go in a service domain.
> >>
> >> My approach has been to transform dom0 into the hardware domain and add a new
> >> control domain.  xenconsoled was left running in the hardware domain.
> > 
> > I think we should keep xenconsoled in the hardware domain because the
> > control domain should be just optional. (However, one could say that with
> > Denis' recent changes xenconsoled is also optional because one can use
> > console hypercalls or emulators (PL011, NS16550) for all DomUs.)
> > 
> > 
> > 
> >> I suppose it could move.  Maybe that would be fine?  I haven't tried. The
> >> Hyperlaunch code populates the console grants to point at the hardware domain,
> >> and I just followed that.
> >>
> >> One aspect of why I left most things running in the Hardware domain was to not
> >> run things in the Control domain.  If Control is the highest privileged
> >> entity, we'd rather run software in lower privileged places. Especially
> >> something like xenconsoled which is receiving data from the domUs.
> > 
> > Yes, I agree with Jason. It is a bad idea to run xenconsoled in the
> > Control Domain because the Control Domain is meant to be safe from
> > interference. We want to keep the number of potential vehicles for
> > interference down to a minimum and shared memory between Control Domain
> > and DomUs is certainly a vehicle for interference.
> 
> As much as it is when xenconsoled runs in the hardware domain? Especially
> if the hardware domain is also running e.g. PV backends or qemu instances?

It looks like you are thinking of the possible
interference from the Hardware Domain to the Control Domain via
xenconsoled, correct?

If that is the case, good thinking. I can see that you have really
understood the essence of the problem we are trying to solve.

That is not an issue because the Control Domain shouldn't use PV
console. Instead, it should use the console hypercall, or the
PL011/NS16550 emulators in Xen.

