Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05329ED0F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 14:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14164.35162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY87e-0004RM-JX; Thu, 29 Oct 2020 13:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14164.35162; Thu, 29 Oct 2020 13:37:46 +0000
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
	id 1kY87e-0004Qx-GV; Thu, 29 Oct 2020 13:37:46 +0000
Received: by outflank-mailman (input) for mailman id 14164;
 Thu, 29 Oct 2020 13:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/pEi=EE=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kY87c-0004Qs-Gy
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:37:44 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eee399a0-b9f9-4d71-a471-c91918496340;
 Thu, 29 Oct 2020 13:37:42 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a9so3331724lfc.7
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 06:37:42 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/pEi=EE=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kY87c-0004Qs-Gy
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:37:44 +0000
X-Inumbo-ID: eee399a0-b9f9-4d71-a471-c91918496340
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eee399a0-b9f9-4d71-a471-c91918496340;
	Thu, 29 Oct 2020 13:37:42 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a9so3331724lfc.7
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YfRB8FQmwaiiY6xcRF4WpyWAS6wFDwuQyJf55DguVeI=;
        b=Fn544HyQ56FmED4VrrCTbRHrewY2uEkVSqzaOy/OKq87AbdPUFNUyYuUf/nm08B18F
         iio61xHYwW+0NlEBF+CzvBvhgYlXgOWybJHVIZoxTGgPyVXLGTrW9laQpieRFWS1efHN
         98NTlo3NyEXCCSY2B2kvZHKdjFr1y+vIRntqxydoyBb4SFvm+DZgT+SDoHafT9QMrEGd
         +330fhVygOyqlkdKj+YZ9sWNUgIICw5gLXA4G9I1yhnE8kRphXrZ9CgJHUH7AKeN9WW2
         QOXuca2P4poUhCZ/oNkEDcMIaO3ERXDygL++4LhCSvNvwcF+Fff7OeRQdXA5+MQIVC/9
         yr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YfRB8FQmwaiiY6xcRF4WpyWAS6wFDwuQyJf55DguVeI=;
        b=SxkMltpS5JPPpXm/TlfMaRhhYzFyHpC8LK+Eivlco2BpYqJifnj+VQOWhtdVQosL0N
         r69zQJRdLAwhWlLPzgc2wkKI31IwdHl1g9tMaoeUVBF3GjaXNK/D6IQYj4U0dKcXAMll
         YjeO/KgOOxZkiU/7/B5mMiMwXkoePwMOX2Ed6jmUORKvTKf21Qm6lv4a7qPEt6GVw8C+
         E00X5FXbmNeYAnp71L9hkCC0ZEZYvqUKEfmbrgO7jt15PN3+Ea5JKSdnxQCTEdlWCaLv
         MByZ9w7I/z73xqxwiA1sBLRQJZT7ZfSuKEfDPkLEVYR4JIHLRaAb1apUqWLiROhaiQuX
         0hSw==
X-Gm-Message-State: AOAM530rIY6gPoWHiQ/lbMymYcMGGsEpJ1K1ZmDI+jlT2Au9lWwx5z+z
	Xv8hZpvcEmJrq8vlzbEEl3yHNhvXcYjcyYbqO0c=
X-Google-Smtp-Source: ABdhPJx8m++592/7jOeOjKwbpWqCnQXCFYegDVTkjfLC3umw/45ChrDJ7JUU2KiPV7DSMa6Ey9rVMi+ytX8h8FVXoMk=
X-Received: by 2002:ac2:455c:: with SMTP id j28mr1530509lfm.320.1603978661669;
 Thu, 29 Oct 2020 06:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201028174406.23424-1-alex.bennee@linaro.org>
 <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s> <87d011mjuw.fsf@linaro.org>
In-Reply-To: <87d011mjuw.fsf@linaro.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 29 Oct 2020 09:37:29 -0400
Message-ID: <CAKf6xpsYorMRYpuPcb8B1zVWz3GHgZZwF+NPVA=nFL2Tr13hqQ@mail.gmail.com>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, QEMU <qemu-devel@nongnu.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Masami Hiramatsu <masami.hiramatsu@linaro.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 6:01 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Stefano Stabellini <sstabellini@kernel.org> writes:
>
> > On Wed, 28 Oct 2020, Alex Benn=C3=A9e wrote:
> >> Xen is supported on aarch64 although weirdly using the i386-softmmu
> >> model. Checking based on the host CPU meant we never enabled Xen
> >> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
> >> make it not seem weird but that will require further build surgery.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> >> Cc: Stefano Stabellini <sstabellini@kernel.org>
> >> Cc: Anthony Perard <anthony.perard@citrix.com>
> >> Cc: Paul Durrant <paul@xen.org>
> >> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
> >> ---
> >>  meson.build | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 835424999d..f1fcbfed4c 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
> >>      'CONFIG_HVF': ['x86_64-softmmu'],
> >>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> >>    }
> >> +elif cpu in [ 'arm', 'aarch64' ]
> >> +  accelerator_targets +=3D { 'CONFIG_XEN': ['i386-softmmu'] }
> >>  endif
> >
> > This looks very reasonable -- the patch makes sense.

A comment would be useful to explain that Arm needs i386-softmmu for
the xenpv machine.

> >
> > However I have two questions, mostly for my own understanding. I tried
> > to repro the aarch64 build problem but it works at my end, even without
> > this patch.
>
> Building on a x86 host or with cross compiler?
>
> > I wonder why. I suspect it works thanks to these lines in
> > meson.build:

I think it's a runtime and not a build problem.  In osstest, Xen
support was detected and configured, but CONFIG_XEN wasn't set for
Arm.  So at runtime xen_available() returns 0, and QEMU doesn't start
with "qemu-system-i386: -xen-domid 1: Option not supported for this
target"

I posted my investigation here:
https://lore.kernel.org/xen-devel/CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzU=
o2q1KEMjhg@mail.gmail.com/

Regards,
Jason

