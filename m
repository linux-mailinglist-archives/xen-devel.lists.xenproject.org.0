Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE762DCAEE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 03:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55690.97020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpitS-0005XM-Ap; Thu, 17 Dec 2020 02:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55690.97020; Thu, 17 Dec 2020 02:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpitS-0005Wx-7a; Thu, 17 Dec 2020 02:19:50 +0000
Received: by outflank-mailman (input) for mailman id 55690;
 Thu, 17 Dec 2020 02:19:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kpitR-0005WZ-1q
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 02:19:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dc8571a-e6eb-4f18-a8fa-e8e6417b8968;
 Thu, 17 Dec 2020 02:19:48 +0000 (UTC)
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
X-Inumbo-ID: 1dc8571a-e6eb-4f18-a8fa-e8e6417b8968
Date: Wed, 16 Dec 2020 18:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608171587;
	bh=G+cExh6jJq3EcNHX86SHv7LNuHfpcsIJ/6vBCBU7z40=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=FaCbO5GBXCcK2AB0ATojyjDhoT/RImLkOaaUx0741josrlAQneTT0CHVKVwlpg9V2
	 DQdfaPaOzwmyWHOZDQHEE4TX0ZTRC0F/g1s2TLgw+htuInE4Dci5f4H0YoymdJt/Ff
	 A12l03g1bq74lZj2vFU9srOVQSjMp1E6hcROdIjg/YEe4aSB8Y7X32blBtrkTf9gXF
	 S7TnNuYXI+4M7cj5C2UMnCtrf+BE7zwf2DhdBskxz9JRXrlrs2qM0fxdlsDwIrYnFn
	 Qnc27aHZcqEoLNfPbZqFDiyU7VB7emxMDYWwuD9D3A8EEfqenZswH9eBRIu7JIois6
	 52RwvYBoWqXyQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Jason Andryuk <jandryuk@gmail.com>, Chris Rogers <crogers122@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Rich Persaud <persaur@gmail.com>, openxt <openxt@googlegroups.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Olivier Lambert <olivier.lambert@vates.fr>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [openxt-dev] Re: Follow up on libxl-fix-reboot.patch
In-Reply-To: <c7b345aa-604a-b2f3-0800-1ed445ebc213@citrix.com>
Message-ID: <alpine.DEB.2.21.2012161815380.4040@sstabellini-ThinkPad-T480s>
References: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com> <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com> <alpine.DEB.2.21.2012141632020.4040@sstabellini-ThinkPad-T480s> <CAC4Yorgk89vaDsbygvebiBOan-3OWE=D9xKiri_JwQAVWZ19GQ@mail.gmail.com>
 <CAKf6xpvpyA6E6gC6cmZ-Ewayyue-C5WcnGtatsxf_Cefg1CxaA@mail.gmail.com> <c7b345aa-604a-b2f3-0800-1ed445ebc213@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-766529692-1608171587=:4040"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-766529692-1608171587=:4040
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Dec 2020, Andrew Cooper wrote:
> On 16/12/2020 14:14, Jason Andryuk wrote:
> > On Tue, Dec 15, 2020 at 5:22 PM Chris Rogers <crogers122@gmail.com> wrote:
> >> Hopefully I can provide a little more context.  Here is a link to the patch:
> >>
> >> https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/files/libxl-fix-reboot.patch
> >>
> >> The patch is a bit mis-named.  It does not implement XEN_DOMCTL_SENDTRIGGER_RESET.  It's just a workaround to handle the missing RESET implementation.
> >>
> >> Its purpose is to make an HVM guest "reboot" regardless of whether PV tools have been installed and the xenstore interface is listening or not.  From the client perspective that OpenXT is concerned with, this is for ease-of-use for working with HVM guests before PV tools are installed.  To summarize the flow of the patch:
> >>
> >> - User input causes high level toolstack, xenmgr, to do xl reboot <domid>
> >> - libxl hits "PV interface not available", so it tries the fallback ACPI reset trigger (but that's not implemented in domctl)
> >> - therefore, the patch changes the RESET trigger to POWER trigger, and sets a 'reboot' flag
> >> - when the xl create process handles the domain_death event for LIBXL_SHUTDOWN_REASON_POWEROFF, we check for our 'reboot' flag.
> >> - It's set, so we set "action" as if we came from a real restart, which makes the xl create process take the 'goto start' codepath to rebuild the domain.
> >>
> >> I think we'd like to get rid of this patch, but at the moment I don't have any code or a design to propose that would implement the XEN_DOMCTL_SENDTRIGGER_RESET.
> > I'm not sure it's possible to implement one.  Does an ACPI
> > reset/reboot button exist?  And then you'd have the problem that the
> > guest needs to be configured to react to the button.

Looking at the patch, it is difficult to suggest anything better. The
only thing I could think of would be to force shutdown_reason to be
"reboot" from xl_vmcontrol.c:reboot_domain. To do that, we would have to
be careful not to overwrite it in domain_death_xswatch_callback.

I am not sure if it would be actually a lot better.


> The ACPI spec has two signals as far as this goes. "the user pressed the
> power button" and "the user {pressed the suspend button, closed the
> laptop lid}".  Neither are useful for VMs typically, because default OS
> settings do the wrong thing.
> 
> The mystery to unravel here is why xl is issuing an erroneous hypercall.
> 
> It is very unlikely that we will have dropped
> XEN_DOMCTL_SENDTRIGGER_RESET from Xen, but I suppose its possible.  It's
> definitely weird that we have it in the interface and unimplemented.
> 
> It's also possible it was a copy&paste mistake when trying to implement
> an interface consistent with `xm trigger`.
> 
> It is definitely concerning that we've got a piece of functionality like
> this which clearly hasn't seen any testing upstream.

Indeed. I think we should fix this in 4.15, one way or another.
--8323329-766529692-1608171587=:4040--

