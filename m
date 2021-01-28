Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E3307BE2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77290.139904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Arp-0001SG-Fk; Thu, 28 Jan 2021 17:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77290.139904; Thu, 28 Jan 2021 17:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Arp-0001Rq-Bz; Thu, 28 Jan 2021 17:14:01 +0000
Received: by outflank-mailman (input) for mailman id 77290;
 Thu, 28 Jan 2021 17:14:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l5Aro-0001Rj-3J
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:14:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 882ed516-7f10-4cf6-ab65-97ef0d46b27a;
 Thu, 28 Jan 2021 17:13:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CB8664E21;
 Thu, 28 Jan 2021 17:13:57 +0000 (UTC)
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
X-Inumbo-ID: 882ed516-7f10-4cf6-ab65-97ef0d46b27a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611854038;
	bh=J3hC5Chiv1hO4uAwSJ+X1mfIKbQWk+GfB+EETNgggDQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Eq0FV48P5lHzKa7PbVwfuOt0nes/i2FzhLnj/tLqKJWqgf18OriZDDldPD7c/7IY4
	 WouudFRmiqmMfnMPbxx0y/lDQazzPGn1DMbd4vkrVtQz8CGPHtMK6QSlRwIPpZRiXb
	 CO8qQA+b3FHQ3fOLfUfHO2yLtdXLT1EwcV7Bbg0U1HvtVZ+WglKJsvdqMty36q0u2W
	 OlIQ91/6e3325hr+gWCMh+4N8SmTVduNZ3nmDjaW6Kt2KXJrZ8+sRQHXpJQEOVMuxA
	 INzmmkg1aUj3QWilOPWFjuppQCqjoh3UxzLpqtVK4VZBerGQ7Upg9jSRFXOe28ax+n
	 0Fn595zDz+FNg==
Date: Thu, 28 Jan 2021 09:13:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
In-Reply-To: <f6983b35-ea63-b48c-e122-ee9c294034ab@gmail.com>
Message-ID: <alpine.DEB.2.21.2101280913190.9684@sstabellini-ThinkPad-T480s>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com> <1611601709-28361-5-git-send-email-olekstysh@gmail.com> <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com> <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
 <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org> <1156e356-5762-a196-ec16-bb6614912394@gmail.com> <alpine.DEB.2.21.2101271235410.9684@sstabellini-ThinkPad-T480s> <dd9a1bf6-5afb-158a-6456-a5ded15580bf@gmail.com> <0785367a-9349-ae0c-2622-9412297773fc@suse.com>
 <f6983b35-ea63-b48c-e122-ee9c294034ab@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1293718514-1611854038=:9684"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1293718514-1611854038=:9684
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 28 Jan 2021, Oleksandr wrote:
> On 28.01.21 13:21, Jan Beulich wrote:
> > On 28.01.2021 12:01, Oleksandr wrote:
> > > On 27.01.21 22:46, Stefano Stabellini wrote:
> > > > On Wed, 27 Jan 2021, Oleksandr wrote:
> > > > > Thank you. I got a request to make a possibility for user to select
> > > > > IOREQ via
> > > > > the menuconfig on Arm. Saying tech preview do you mean that I also
> > > > > need to put
> > > > > it under CONFIG_EXPERT on Arm?
> > > > Normally I would say that unless it actually takes an expert to enable
> > > > the feature, it is better to make it depend on CONFIG_UNSUPPORTED [1].
> > > > 
> > > > However, in this case, it might actually take an expert :-)
> > > > Additional patches are still required to enable the feature at the
> > > > toolstack level, and also the user needs to build a userspace ioreq
> > > > server. So in this case I am fine either way. I'll leave it up to you
> > > > and Julien to pick the best one.
> > > > 
> > > > Either way, please add "(EXPERT)" or "(UNSUPPORTED)" in the one-line
> > > > kconfig description for ARM if possible.
> > > > 
> > > > 
> > > > [1] https://marc.info/?l=xen-devel&m=161168780401884
> > > Thank you for the explanation, personally I would prefer EXPERT, but...
> > > 
> > > It would be really nice if we could agreed regarding that *common*
> > > Kconfig option before I submit V6 (which would probably avoid me to send
> > > V7 I hope).
> > > 
> > > Now I see it as following (please note, it is a subject for new patch in
> > > this series, which should come last):
> > > 
> > > +++ b/xen/common/Kconfig
> > > @@ -137,7 +137,13 @@ config HYPFS_CONFIG
> > >             want to hide the .config contents from dom0.
> > > 
> > >    config IOREQ_SERVER
> > > -       bool
> > > +       bool "IOREQ support" if EXPERT || X86
> > This would make the prompt visible for x86, which we don't
> > want.
> 
> Hmm, I missed that point.
> 
> 
> > But I guess Stefano was anyway after ...
> > 
> > > +       default X86
> > > +       depends on HVM
> > > +       ---help---
> > > +         Enables generic mechanism for providing emulated devices to
> > > the guests.
> > > +
> > > +         If unsure, say Y.
> >   config IOREQ_SERVER
> >         bool "IOREQ support (EXPERT)" if EXPERT && !X86
> >         default X86
> >         depends on HVM
> > 
> > As the prompt should be invisible this way on x86, the (EXPERT)
> > doesn't need further qualifying, except maybe in the help text
> > (just to avoid this being taken as a possible mistake).
> 
> Yes, this works as my initial version *but* is invisible on x86,
> 
> what is more that indeed the *EXPERT* tag for IOREQ on x86 will look quite
> odd...
> 
> Perfect, thank you.

Yep, perfect
--8323329-1293718514-1611854038=:9684--

