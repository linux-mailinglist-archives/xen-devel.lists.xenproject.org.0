Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC20ADFA49
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 02:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019534.1396183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS3Gk-0004sz-6D; Thu, 19 Jun 2025 00:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019534.1396183; Thu, 19 Jun 2025 00:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS3Gj-0004ps-WE; Thu, 19 Jun 2025 00:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1019534;
 Thu, 19 Jun 2025 00:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uS3Gi-0004pm-Tm
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 00:36:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 753e74b0-4ca5-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 02:36:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 152BF5C41E8;
 Thu, 19 Jun 2025 00:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047C2C4CEE7;
 Thu, 19 Jun 2025 00:36:34 +0000 (UTC)
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
X-Inumbo-ID: 753e74b0-4ca5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750293396;
	bh=GRL6IyxbYn+drq4PaScVLwwlEPxmyfAbax+6VjUnLvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GbwHEi0YywFcFr1NEbsLiKwj+BewRVizlC9W2K9sio3QrhIL778pSrIL8r2ryWzJO
	 hcNHNWyqvhfX4qbAekoSy8yjwbOcWEw+hURnpIfvEyYR2RCHqv+5Z+hQIpDVl0jLBv
	 xi2t2Zd6K0D0sac/kY2AxE1uf/e9x5em4jyPeSkXjDHlT/uOagFGwkmJkoerp6dgRO
	 BOXdt7BdzsgULkPOwLAEB8iopISkNdU3iL8vfEewx+Hql5226mf6+3Mf/u1Eas06fj
	 U7EJ9sqPbBllV3z6oiSRUTwOGG41RqiNf87cWkTjmPkD2A9to9CFxcE0uhUrf4Qvg4
	 Qe2B+g9evPeCA==
Date: Wed, 18 Jun 2025 17:36:33 -0700 (PDT)
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
In-Reply-To: <5645e4dc-7598-414d-a2b5-39066401e9b3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506181736280.1780597@ubuntu-linux-20-04-desktop>
References: <20250610225737.469690-1-jason.andryuk@amd.com> <20250610225737.469690-5-jason.andryuk@amd.com> <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com> <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com> <alpine.DEB.2.22.394.2506131547320.8480@ubuntu-linux-20-04-desktop>
 <bf6fd680-c608-4d64-ad8f-38eac102991e@suse.com> <alpine.DEB.2.22.394.2506161705370.1384757@ubuntu-linux-20-04-desktop> <5645e4dc-7598-414d-a2b5-39066401e9b3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Jan Beulich wrote:
> On 17.06.2025 02:10, Stefano Stabellini wrote:
> > On Mon, 16 Jun 2025, Jan Beulich wrote:
> >> On 14.06.2025 00:51, Stefano Stabellini wrote:
> >>> On Wed, 11 Jun 2025, Jason Andryuk wrote:
> >>>> On 2025-06-11 09:27, Jan Beulich wrote:
> >>>>> On 11.06.2025 00:57, Jason Andryuk wrote:
> >>>>>> Allow the hwdom to access the console, and to access physical
> >>>>>> information about the system.
> >>>>>>
> >>>>>> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
> >>>>>> permission would be required.
> >>>>>
> >>>>> Why would xenconsoled run in the hardware domain? It's purely a software
> >>>>> construct, isn't it? As a daemon, putting it in the control domain may
> >>>>> make sense. Otherwise it probably ought to go in a service domain.
> >>>>
> >>>> My approach has been to transform dom0 into the hardware domain and add a new
> >>>> control domain.  xenconsoled was left running in the hardware domain.
> >>>
> >>> I think we should keep xenconsoled in the hardware domain because the
> >>> control domain should be just optional. (However, one could say that with
> >>> Denis' recent changes xenconsoled is also optional because one can use
> >>> console hypercalls or emulators (PL011, NS16550) for all DomUs.)
> >>>
> >>>
> >>>
> >>>> I suppose it could move.  Maybe that would be fine?  I haven't tried. The
> >>>> Hyperlaunch code populates the console grants to point at the hardware domain,
> >>>> and I just followed that.
> >>>>
> >>>> One aspect of why I left most things running in the Hardware domain was to not
> >>>> run things in the Control domain.  If Control is the highest privileged
> >>>> entity, we'd rather run software in lower privileged places. Especially
> >>>> something like xenconsoled which is receiving data from the domUs.
> >>>
> >>> Yes, I agree with Jason. It is a bad idea to run xenconsoled in the
> >>> Control Domain because the Control Domain is meant to be safe from
> >>> interference. We want to keep the number of potential vehicles for
> >>> interference down to a minimum and shared memory between Control Domain
> >>> and DomUs is certainly a vehicle for interference.
> >>
> >> As much as it is when xenconsoled runs in the hardware domain? Especially
> >> if the hardware domain is also running e.g. PV backends or qemu instances?
> > 
> > It looks like you are thinking of the possible
> > interference from the Hardware Domain to the Control Domain via
> > xenconsoled, correct?
> 
> More like interference with the system as a whole, which simply includes
> Control.
> 
> > If that is the case, good thinking. I can see that you have really
> > understood the essence of the problem we are trying to solve.
> > 
> > That is not an issue because the Control Domain shouldn't use PV
> > console. Instead, it should use the console hypercall, or the
> > PL011/NS16550 emulators in Xen.
> 
> Well. I think the underlying concept of Control Domain being highly
> privileged needs more general discussion. As indicated elsewhere, I
> didn't think disaggregation (whichever way done) would leave any
> domain with effectively full privilege. I wonder what others think.

Keep in mind that the threat model here is different from the
datacenter. 

But the Control Domain is optional. If the user doesn't want it, the
user can avoid it.

Even on a fully static system (no VM creation), it is convenient to have
a domain that can monitor the others and trigger domain reset (we are
reimplementing domain reboot to be more like a soft reset so that the VM
doesn't need to be destroyed and recreated). As an example, the Control
Domain could be used to monitor a non-safe domain such as Android,
detect an Android crash, and trigger an Android reboot.

