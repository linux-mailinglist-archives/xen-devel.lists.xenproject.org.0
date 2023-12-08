Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EBA80B093
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 00:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650828.1016643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBkFl-0000lt-Hv; Fri, 08 Dec 2023 23:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650828.1016643; Fri, 08 Dec 2023 23:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBkFl-0000jN-FA; Fri, 08 Dec 2023 23:27:29 +0000
Received: by outflank-mailman (input) for mailman id 650828;
 Fri, 08 Dec 2023 23:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBkFk-0000jH-Ii
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 23:27:28 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5937ab4a-9621-11ee-98e8-6d05b1d4d9a1;
 Sat, 09 Dec 2023 00:27:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7BE7DB82E88;
 Fri,  8 Dec 2023 23:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83066C433C7;
 Fri,  8 Dec 2023 23:27:24 +0000 (UTC)
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
X-Inumbo-ID: 5937ab4a-9621-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702078045;
	bh=6PSsSUwrJ/hllsufO/nLRoJU3QH4o0ds9o3EgSwTyd0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XdeirTpad7pchDbZlfbrsEQCJp6UtEuVAdfXKoAhdCB7Yb+Hrkxxk7KORndjju8iP
	 mf85q0jIRiCYMDb+JgKvtBvaSq5h6xaiA8h1S2Kn1KjQWUEGSjh2ZKdJcqBaDbRlwl
	 7p5O60f6Ds6izzxKwv07yAPyMEgIrzVN0zYePvnNQujs98ZEVRra/1yaXwkLl9NMZt
	 mXl5pSD8UW7o8iq1gCnRr67vRSpoWNAprgMM0T2kiRhD/QRH8pxhzeqIxPsrm55r1E
	 Niv9oB5H/oNksIX1i9BGc5ZJPboi7KwgsMTBuC7VIQoeqI22zthlQuhGq8MGUg1zrX
	 x6vID4exMTZhQ==
Date: Fri, 8 Dec 2023 15:27:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel <michal.orzel@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers\
In-Reply-To: <C0ADC33B-1966-4D3E-B081-A3AA0C3AE76D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312081514450.1703076@ubuntu-linux-20-04-desktop>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com> <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org> <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com> <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org> <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org> <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com> <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org> <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com> <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
 <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org> <alpine.DEB.2.22.394.2312051503060.110490@ubuntu-linux-20-04-desktop> <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org> <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
 <C0ADC33B-1966-4D3E-B081-A3AA0C3AE76D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Dec 2023, Bertrand Marquis wrote:
> Hi All,
> 
> Sorry for coming back late on this thread.
> 
> > On 7 Dec 2023, at 22:41, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 7 Dec 2023, Julien Grall wrote:
> >> Hi Stefano,
> >> 
> >> On 05/12/2023 23:21, Stefano Stabellini wrote:
> >>> On Tue, 5 Dec 2023, Julien Grall wrote:
> >>>> I agree that crashing a guest is bad, but is lying to the domain really
> >>>> better? The consequence here is not that bad and hopefully it would be
> >>>> fairly
> >>>> easy to find. But this is not always the case. So I definitely would place
> >>>> a
> >>>> half-backed emulation more severe than a guest crash.
> >>> 
> >>> 
> >>> I see where Julien is coming from, but I would go with option two:
> >>> "emulate DCC the same way as KVM". That's because I don't think we can
> >>> get away with crashing the guest in all cases. Although the issue came
> >>> up with a Linux guest, it could have been triggered by a proprietary
> >>> operating system that we cannot change, and I think Xen should support
> >>> running unmodified operating systems.
> >>> 
> >>> If we go with a "half-backed emulation" solution, as Julien wrote, then
> >>> it is better to be more similar to other hypervisors, that's why I chose
> >>> option two instead of option three.
> >>> 
> >>> But at the same time I recognize the validity of Julien's words and it
> >>> makes me wonder if we should have a KCONFIG option or command line
> >>> option to switch the Xen behavior. We could use it to gate all the
> >>> "half-backed emulation" we do for compatibility.  Something like:
> >>> 
> >>> config PARTIAL_EMULATION
> >>>     bool "Partial Emulation"
> >>>     ---help---
> >>>           Enables partial, not spec compliant, emulation of certain
> >>> register
> >>>     interfaces (e.g DCC UART) for guest compatibility. If you disable
> >>>     this option, Xen will crash the guest if the guest tries to access
> >>>     interfaces not fully emulated or virtualized.
> >>> 
> >>>     If you enable this option, the guest might misbehave due to non-spec
> >>>     compliant emulation done by Xen.
> >> 
> >> As I wrote to Ayan on Matrix today, I am not in favor of the emulation. Yet, I
> >> am not going to oppose (as in Nack it) if the other maintainers agree with it.
> > 
> > Thanks for being flexible
> > 
> > 
> >> The KConfig would be nice, the question is whether we want to (security)
> >> support such configuration? E.g. could this potentially introduce a security
> >> issue in the guest?
> > 
> > The important question is whether it could introduce a security issue in
> > Xen. If we think it wouldn't increase the attack surface significantly
> > then I would security support it otherwise not.
> > 
> > 
> >> Regarding the  emulation itself, I actually prefer 3 because at least the
> >> Linux drivers will be able to bail out rather than trying to use them.
> > 
> > I don't have a strong opinion between 2 and 3
> 
> Here is my view on it:
> - providing a wrong emulation to please guests is not wrong as it might end
> up hidding something that will be hard to debug so on that point I agree with
> Julien.
> - choosing a solution which might just crash a guest without any other solution
> than recompiling or modifying xen is not something acceptable if we want Xen
> to thrive.
> 
> So i would suggest the following solution:
> - have a Kconfig to surround this code so that "correct" guests can disable it.
> - have a command line option to activate this behavior and turn it off by default.
> One encountering the problem will have to explicitly set a command line parameter
> so cannot do this without knowing.
> - activate the Kconfig option by default and security support it as it is only active if
> a command line parameter is passed.
> 
> The Kconfig parameter should be more generic so that this could apply to a bunch of
> registers we would emulate with RAZ/WI so I am happy with that proposal if we say
> that this must be activated through a command line option passed to Xen at boot.

You are suggesting both a Kconfig and a command line option.

The Kconfig would be useful so that in a strict configuration we can
disable the code even from the build (useful for instance in
configurations for safety certifications.)

The Kconfig option would be enabled by default (which is important for
the out of the box experience otherwise users would have to manually
rebuild Xen to run their guests.)

However, the actual partial emulation is only enabled if a command line
option is passed. The command line option would be off by default. So
the code is there, but wouldn't be used unless the user enables the
command line option explicitly. This way, tools aimed at making the out
of the box experience better (like ImageBuilder) might pass the command
line option by default but production build systems (like Yocto)
wouldn't.

Yes I think this is the best compromise. If it was just for this patch I
would say it is a bit too much but we have seen a few of these cases so
I think this is a general framework that will be useful in multiple
instances. I am fine with this.

