Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F93249C2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 05:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89588.168854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF8Il-0004L2-5S; Thu, 25 Feb 2021 04:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89588.168854; Thu, 25 Feb 2021 04:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF8Il-0004Kd-2H; Thu, 25 Feb 2021 04:30:59 +0000
Received: by outflank-mailman (input) for mailman id 89588;
 Thu, 25 Feb 2021 04:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSAw=H3=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lF8Ik-0004KY-3k
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 04:30:58 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0172af6-da65-4b8f-b10b-9e7878abc6f5;
 Thu, 25 Feb 2021 04:30:57 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id r24so3240687qtt.8
 for <xen-devel@lists.xenproject.org>; Wed, 24 Feb 2021 20:30:57 -0800 (PST)
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
X-Inumbo-ID: f0172af6-da65-4b8f-b10b-9e7878abc6f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0T3uLeLBGXJgEJu/REl6vggmqakFoedkqICiEkaRKKs=;
        b=KLyn6JoEnv7bHpi7AR1d95rtwWCZykuYY6zA8Ivc6BF0EKP1G9jtiVRwj8EIkubcf4
         mLfkF+jPNXJWcDpnZPJxKsrp5ndmzMmp725Q3f3DeOS+19ecKy7rgaIelF1ueYlE8X+m
         /bvkgUVKsJK4QZQmjGUqj5ES0ev+2OX/uDHktZjThTb6EdTS7Jv8dPqKL1xxgYcjxOkk
         nlkACDvj0nEQA7FI5dPHZxfXv14D8K5BfdF/wZdzK4MdU54UusW88tVxpy1n82eiVr8T
         8aD05891/u/aaD/+2YEaKI8Q5te2X5Mmsyju1gotJIUGAjMGRfG59MvEPtAS7PXHM6Mm
         10AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0T3uLeLBGXJgEJu/REl6vggmqakFoedkqICiEkaRKKs=;
        b=eVZyiSpeyaRG0DD5KwS6XSPa9Ina/Ro9IwoUug8otSDUOiYOrw8LExsGrp+FqyQ2tr
         aAAl9bDN25Cd+EdV4SnCQrytIduislbo6nXkrKZJNOpBsGNliEyPCCwb4y0VWFIfSwZ6
         2aYSzQvWqGPU8zcQBVKCnQJQD3tqNuR16MjqycBvMek0lvdZGxNKnBNjg0eosRTKyBuH
         XGdbIQJg63qVTrWAy2EuWW6c4Fq/MS3YVPyzkktfHL0KogSV1FE+j9HhOcmPT+iESLO+
         TxiVuZwK1lV3taTdvwBQSXH7bu3HGu9SFm3589yNwewMMN06ZY5dWdgCHEHbwRxgZQwI
         QV0w==
X-Gm-Message-State: AOAM533a2t6VXGQjav+lrXoTSV+y286M55yBIuVrqs0c7vF1cycYj5sZ
	TQIKXF+kbYIRjtPkPOFi/4haPyAPkMfxga21jSkdjg==
X-Google-Smtp-Source: ABdhPJyJ/e31rV2RbhMb59nEfb+fxaEdYPWb6EVKePAyCZo+6V+oU92vbv0X3hDnkHPFH4XaTs+zBiQI62t8etKkqNs=
X-Received: by 2002:a05:622a:81:: with SMTP id o1mr915447qtw.63.1614227456700;
 Wed, 24 Feb 2021 20:30:56 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com> <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com> <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
 <b6b694f6-61ed-c0b7-5980-88ddb5e1616c@suse.com> <CAMmSBy8pSZROdPo+gee8oxrU9EL=k+QTJj0UxZTi3Bh+S_g2_w@mail.gmail.com>
 <YDcdHcpN+GywAUKv@mattapan.m5p.com>
In-Reply-To: <YDcdHcpN+GywAUKv@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 24 Feb 2021 20:30:45 -0800
Message-ID: <CAMmSBy91csJ3MGrV8CPYX-fNdkFu6P12zEr2LjCbchvAeEsTKA@mail.gmail.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: "J??rgen Gro??" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "Roger Pau Monn??" <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 24, 2021 at 7:44 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Wed, Feb 24, 2021 at 07:06:25PM -0800, Roman Shaposhnik wrote:
> > I'm slightly confused about this patch -- it seems to me that it needs
> > to be applied to the guest kernel, correct?
> >
> > If that's the case -- the challenge I have is that I need to re-build
> > the Canonical (Ubuntu) distro kernel with this patch -- this seems
> > a bit daunting at first (I mean -- I'm pretty good at rebuilding kernels
> > I just never do it with the vendor ones ;-)).
> >
> > So... if there's anyone here who has any suggestions on how to do that
> > -- I'd appreciate pointers.
>
> Generally Debian-derivatives ship the kernel source they use as packages
> named "linux-source-<major>.<minor>" (guessing you need
> linux-source-5.4?).  They ship their configurations as packages
> "linux-config-<major>.<minor>", but they also ship their configuration
> with their kernels as /boot/config-<version>.
>
> If you're trying to create a proper packaged kernel, the Linux kernel
> Make target "bindeb-pkg" will create an appropriate .deb file.

Right -- but that's not what distro builders use, right? I mean they do
the whole sdeb -> deb business.

In fact, to stay as faithful as possible -- I'd love to:
   1. unpack SDEB
   2. add a single patch to the set of sources
   3. repack SDEB back
   4. do whatever it is they do to go SDEB -> DEB

Thanks,
Roman.

