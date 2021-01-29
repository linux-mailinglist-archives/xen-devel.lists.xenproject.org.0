Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7450C3089BB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 16:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78223.142212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VN7-0006UU-2r; Fri, 29 Jan 2021 15:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78223.142212; Fri, 29 Jan 2021 15:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VN6-0006U5-W0; Fri, 29 Jan 2021 15:07:40 +0000
Received: by outflank-mailman (input) for mailman id 78223;
 Fri, 29 Jan 2021 15:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkmP=HA=todobom.com=claudemir@srs-us1.protection.inumbo.net>)
 id 1l5VN5-0006U0-25
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 15:07:39 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85dcd590-957e-47a0-9ccd-be36ff2d7da0;
 Fri, 29 Jan 2021 15:07:37 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id a19so8981250qka.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 07:07:36 -0800 (PST)
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
X-Inumbo-ID: 85dcd590-957e-47a0-9ccd-be36ff2d7da0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=todobom-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hO6Dsshp2feVr9z/XbdaCKpOcjNnh55hvWpygP4EYqI=;
        b=rwW246jLq8HwykJcSwSz4yUNIcA+kDZDSfc0BNykldveTYEzfAwG6KeWpW9p+Ipeix
         zWX4OnKDlxx/RpS4Eg2hoRLLFHDA78o5F+NRoO21nJO3FkMusmRAT2jp2w78hzlpOonY
         jHiikPUaLyT3CJ6d/3ftW1nFORHFdFeCfe/sW8NNvfOjwUzGRjQYxLpVepRdfFvEfqL3
         lDjieE5X3mCMVpZv+d6eyMDfwfYf2cKbjOm+FC9wkRqI2jbyDc6mUbZ41JA8j1VO3BtD
         CC3S5mBcD6uVQHRIKT+tYxuNJBk0U6hIPoBvCQg9rATvJV5jz5rJ27qZs0Fz2IehwOGF
         KVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hO6Dsshp2feVr9z/XbdaCKpOcjNnh55hvWpygP4EYqI=;
        b=GMvbpe2C+focL9/vGZ/hwJ6vNx3HdKvf56knWvs/hXEHHbyiosAyP8QFTkHnGWO4pX
         l/v1NyDPCZvJqHYwuKBdvEPCSevGdT6f26huclkcY7npM1WxBgaRTLGexwTwnBivdAtm
         39VJjghUdLUpTmWy9IsjERwgDZq98xnemt5sYMQ0TklglksvNkjCknVKGD02cp7YLjL6
         v95IYmsEHUP7flTWad6t5SaoyNNGV6cOwePpc93VS5ZoueiMLSdPo5Qg1GYXu8GG5D15
         wJQgVZJ7hG3OYTS5D33VgosochE4U9uNjXW/s7H38QQbKGJ5fvyt4asqXvioRrkbQHea
         3rAg==
X-Gm-Message-State: AOAM53256yDJX1epE3t84gibMNJRtmBn+vEgK3wAMKjBLzAO7rCfaY0p
	RYvA7B7df/Ez1+y3yQbf+n7WHZhXxJcc826CWyLZ0A==
X-Google-Smtp-Source: ABdhPJwEcBfUC3djWn+/cIFk928c31Lt9SXgMOmhd2ikMz/5d+Lb2Mmv7PWHzzzkBvH9VjDHon0qum/pKmJEZ4IfSAg=
X-Received: by 2002:a37:350:: with SMTP id 77mr1885275qkd.357.1611932856536;
 Fri, 29 Jan 2021 07:07:36 -0800 (PST)
MIME-Version: 1.0
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com> <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com> <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com> <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com> <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
 <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com> <8cf69fb3-5b8c-60ea-bd1c-39a0cbd5cb5c@suse.com>
 <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com> <ae48d027-535d-b076-e232-abcb128a4185@suse.com>
In-Reply-To: <ae48d027-535d-b076-e232-abcb128a4185@suse.com>
From: Claudemir Todo Bom <claudemir@todobom.com>
Date: Fri, 29 Jan 2021 12:07:24 -0300
Message-ID: <CANyqHYcdbZwd9FfuUUUyRZ0Ma7H9YVZVZT8WrQbh_kieCRrU9Q@mail.gmail.com>
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 29 de jan. de 2021 =C3=A0s 11:21, Jan Beulich <jbeulich@suse.com> =
escreveu:
>
> On 28.01.2021 14:08, Claudemir Todo Bom wrote:
> > Em qui., 28 de jan. de 2021 =C3=A0s 06:49, Jan Beulich <jbeulich@suse.c=
om> escreveu:
> >>
> >> On 28.01.2021 10:47, Jan Beulich wrote:
> >>> On 26.01.2021 14:03, Claudemir Todo Bom wrote:
> >>>> If this information is good for more tests, please send the patch an=
d
> >>>> I will test it!
> >>>
> >>> Here you go. For simplifying analysis it may be helpful if you
> >>> could limit the number of CPUs in use, e.g. by "maxcpus=3D4" or
> >>> at least "smt=3D0". Provided the problem still reproduces with
> >>> such options, of course.
> >>
> >> Speaking of command line options - it doesn't look like you have
> >> told us what else you have on the Xen command line, and without
> >> a serial log this isn't visible (e.g. in your video).
> >
> > All tests are done with xen command line:
> >
> > dom0_mem=3D1024M,max:2048M dom0_max_vcpus=3D4 dom0_vcpus_pin=3Dtrue
> > smt=3Dfalse vga=3Dtext-80x50,keep
> >
> > and kernel command line:
> >
> > loglevel=3D0 earlyprintk=3Dxen nomodeset
> >
> > this way I can get all xen messages on console.
> >
> > Attached are the frames I captured from a video, I manually selected
> > them starting from the first readable frame.
>
> Okay, so we seem to be hitting two previously noticed issues, neither
> of which so far was necessary to address directly (because there was
> always something else to be tweaked such that the problems went away).
>
> For one, the boot CPU has a TSC value that lags by more than a
> second compared to all secondary CPUs. The way
> time_calibration_tsc_rendezvous() works, together with the way we
> calculate system time from the TSC (get_s_time_fixed() - this is
> where the known issue here is: the function breaks when trying to
> scale a negative delta, hence the absurdly high s=3D values in the
> screenshots you've provided), allows for small negative deltas
> between CPUs, but expects to bring all CPUs' TSCs forward (i.e. over
> the 1s interval between rendezvous' the lagging CPUs are assumed to
> have made enough progress to be ahead of the more towards the future
> timestamps on the previous run). Secondary lagging behind the boot
> CPU more than this could also be dealt with, but on your system the
> situation is the other way around.
>
> Btw - what kind of BIOS do you have on this system? This way of the
> TSCs being set is pretty odd, and must be - unless you run other
> pre-boot software or an unusual boot loader - caused by the BIOS.

It is a generic mainboard acquired from china... it is very lame! I
was already thinking the big issue is the BIOS.  Unfortunately I don't
know how to upgrade it.

> And then this points out (again, afaic at least) that the way we
> kickstart the rendezvous handling is likely inappropriate.
> Especially when TSCs are skewed like they are here, it is unhelpful
> to launch Dom0 before having brought the TSC in sync. (Related to
> this, I also don't think we should arm the respective timer before
> AP bringup was done, or else we risk the first rendezvous instance
> to not hit all CPUs.)
>
> I'll work on addressing both, hoping that in particular for the
> first one you'll be ready to help with testing (through perhaps
> multiple iterations).

I can help you a little more until end of next week. After that I will
move the host to another address and I will not have a quick "hands
on" access to it.

> > As a sidenote, I managed to get the system working with the parameter
> > "tsc=3Dunstable", performance looks satisfactory but I do not know what
> > problems I may end with this parameter.
>
> I _think_ you'd be running into trouble if you removed dom0_vcpus_pin
> (which imo really no-one should use without reporting a bug, despite
> all the hits to the contrary that one gets when searching the web),
> and if you ran any guests (PV at least) without pinning their vCPU-s
> to pCPU-s.

just tested it without the cpu pin, it worked.

I stress-tested both dom0 and a pv guest with the "yes method"
described here:
https://linuxconfig.org/how-to-stress-test-your-cpu-on-linux.

Best regards,
Claudemir

