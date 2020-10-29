Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE929F5B7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14640.36178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYE6H-0005DV-5U; Thu, 29 Oct 2020 20:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14640.36178; Thu, 29 Oct 2020 20:00:45 +0000
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
	id 1kYE6H-0005D5-23; Thu, 29 Oct 2020 20:00:45 +0000
Received: by outflank-mailman (input) for mailman id 14640;
 Thu, 29 Oct 2020 20:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYE6F-0005Cs-P6
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:00:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 662eb8df-9a22-4d8b-b072-55dbf1eab504;
 Thu, 29 Oct 2020 20:00:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 649AE20782;
 Thu, 29 Oct 2020 20:00:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYE6F-0005Cs-P6
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:00:43 +0000
X-Inumbo-ID: 662eb8df-9a22-4d8b-b072-55dbf1eab504
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 662eb8df-9a22-4d8b-b072-55dbf1eab504;
	Thu, 29 Oct 2020 20:00:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 649AE20782;
	Thu, 29 Oct 2020 20:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604001640;
	bh=s3H1XCFF5/PhNwE1oJWzALManxl6p2C9gIwOpoLw4FM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VDg1NIwJnqhNBblNgJvyzLzdu9tkOe8Yk3ymjeFq5egKWr66e6pdFSNYqrHreC1Rc
	 OavE6oeqU58PXu22yeKxSMD7OaPFYpu6JHL8+t/vxkfTCH/2FscisuGjEf7Z5ZjCxm
	 sR99zxoLxDgHNA2tCisgVv90SnKPbdmFkl6U/cu0=
Date: Thu, 29 Oct 2020 13:00:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jason Andryuk <jandryuk@gmail.com>
cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, QEMU <qemu-devel@nongnu.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
In-Reply-To: <CAKf6xpsYorMRYpuPcb8B1zVWz3GHgZZwF+NPVA=nFL2Tr13hqQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010291300000.12247@sstabellini-ThinkPad-T480s>
References: <20201028174406.23424-1-alex.bennee@linaro.org> <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s> <87d011mjuw.fsf@linaro.org> <CAKf6xpsYorMRYpuPcb8B1zVWz3GHgZZwF+NPVA=nFL2Tr13hqQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-510861080-1604001640=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-510861080-1604001640=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Oct 2020, Jason Andryuk wrote:
> On Thu, Oct 29, 2020 at 6:01 AM Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> >
> > Stefano Stabellini <sstabellini@kernel.org> writes:
> >
> > > On Wed, 28 Oct 2020, Alex Bennée wrote:
> > >> Xen is supported on aarch64 although weirdly using the i386-softmmu
> > >> model. Checking based on the host CPU meant we never enabled Xen
> > >> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
> > >> make it not seem weird but that will require further build surgery.
> > >>
> > >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > >> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> > >> Cc: Stefano Stabellini <sstabellini@kernel.org>
> > >> Cc: Anthony Perard <anthony.perard@citrix.com>
> > >> Cc: Paul Durrant <paul@xen.org>
> > >> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
> > >> ---
> > >>  meson.build | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/meson.build b/meson.build
> > >> index 835424999d..f1fcbfed4c 100644
> > >> --- a/meson.build
> > >> +++ b/meson.build
> > >> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
> > >>      'CONFIG_HVF': ['x86_64-softmmu'],
> > >>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> > >>    }
> > >> +elif cpu in [ 'arm', 'aarch64' ]
> > >> +  accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'] }
> > >>  endif
> > >
> > > This looks very reasonable -- the patch makes sense.
> 
> A comment would be useful to explain that Arm needs i386-softmmu for
> the xenpv machine.
> 
> > >
> > > However I have two questions, mostly for my own understanding. I tried
> > > to repro the aarch64 build problem but it works at my end, even without
> > > this patch.
> >
> > Building on a x86 host or with cross compiler?
> >
> > > I wonder why. I suspect it works thanks to these lines in
> > > meson.build:
> 
> I think it's a runtime and not a build problem.  In osstest, Xen
> support was detected and configured, but CONFIG_XEN wasn't set for
> Arm.  So at runtime xen_available() returns 0, and QEMU doesn't start
> with "qemu-system-i386: -xen-domid 1: Option not supported for this
> target"
> 
> I posted my investigation here:
> https://lore.kernel.org/xen-devel/CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzUo2q1KEMjhg@mail.gmail.com/

Right, but strangely I cannot reproduce it here. I am natively building
(qemu-user) on aarch64 and for me CONFIG_XEN gets set.
--8323329-510861080-1604001640=:12247--

