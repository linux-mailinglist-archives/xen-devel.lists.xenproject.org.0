Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93368344965
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 16:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100283.191011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOMc4-0005pQ-1i; Mon, 22 Mar 2021 15:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100283.191011; Mon, 22 Mar 2021 15:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOMc3-0005p1-Ud; Mon, 22 Mar 2021 15:37:03 +0000
Received: by outflank-mailman (input) for mailman id 100283;
 Mon, 22 Mar 2021 15:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lOMc2-0005ow-Ii
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:37:02 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a71d934-5a16-45c2-b3d8-f8951cf58ee8;
 Mon, 22 Mar 2021 15:37:01 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z8so21562602ljm.12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Mar 2021 08:37:01 -0700 (PDT)
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
X-Inumbo-ID: 8a71d934-5a16-45c2-b3d8-f8951cf58ee8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tex42UKk0K+rcZYZjkKMwzBk0Yr4t+pr+Afe9kjbTqU=;
        b=MA0rN0PWT4EaFk3ko8leqNmKMr1wm5Cjpk5WPLfrZvlbviUR473lY8jB+GsIn9Ly5m
         mU4q+/Wytp1mQxYIAB7pReMds8go9VnJa1YfMj6gzxgrZIkdg8qf3ZhOz3nlz+RO7RAQ
         NBi3hRAj/Ww2jhCE2jE6D8IrxfWCNe8wduC0aXiyPMRtUkOsB+khZTwy8QY/uUVSPSka
         +r+joGiJ/ravz+BtCq6L7BtUfsqFpBfiZlpmEiUAoFYqbyTWk+N7wgDRbEjDp1h8s8GC
         lhVjTpsF2sHGp7JYxzpv593LYVOu8TvmRoCCngwadwWr5IynJmXf9cMGZ8gq0wDR+qxQ
         wXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tex42UKk0K+rcZYZjkKMwzBk0Yr4t+pr+Afe9kjbTqU=;
        b=A2zSmEGl1yHymvSpBAUxs13oiU67MW2ZcrP8Z0wgrpU7K6VKrNdF1h1Sv8TheFii2B
         8D5UevixbPT6DEn9ISelCooNtbsxUbZgChf7sql/MwKZvAePD74ypV5oHEYC9tMJudaw
         NsER2nMa0aKdGhqGKjmSvWWKrYLdan40l8hcHv+UgNxPqgaw3qWgpADQydIqh51AWKeZ
         3GCGosGMxeHkS6ulC+AE/+xxPQJblaAmOQXdyreDDuScIhnr21KDJ7HKQo5w4De550lV
         2fQWRNpPFFQ2vPWVJN7XfGm5fneDHpYJBnKeZa8Carss8B858bX7Zr08tO+OjMV9RFBK
         LIJA==
X-Gm-Message-State: AOAM533ajYZXhtySv3B2cUL3yx75WJlPxOS6vKdye/vm/oIVY9s9sMPB
	49HhVgV4aU8qX4WQs2fHYbY0BQi2Y/dVeV6l96M=
X-Google-Smtp-Source: ABdhPJyiyD7DLTei0gjr0Azw2mhflht4Qr/F4Yanpt2kG/0qc2ulHZFmrW6n7psdQgwt0Wu1foQLxdbz6fpzXd8PmwM=
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr110380ljk.285.1616427420600;
 Mon, 22 Mar 2021 08:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210322133301.11308-1-jandryuk@gmail.com> <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com> <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
In-Reply-To: <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 Mar 2021 11:36:48 -0400
Message-ID: <CAKf6xpuVrLmsptxkMfZfb_ekeLHQpS6S8AzOZ0i5MDL9YWf1aA@mail.gmail.com>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 11:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 22.03.2021 15:59, Andrew Cooper wrote:
> > On 22/03/2021 14:52, Jan Beulich wrote:
> >> On 22.03.2021 14:33, Jason Andryuk wrote:
> >>> make install-xen fails when EFI_VENDOR is set (=fedora) with:
> >>> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
> >>>
> >>> Create the EFI_VENDOR directory so xen.efi can be installed within.
> >>>
> >>> This removes the need for Fedora and Qubes xen.spec files to manually
> >>> create the directory in advance.
> >> While I'm not strictly against, I'd like to point out that it was
> >> deliberate to not create this directory here. I also didn't expect
> >> anyone's xen.spec to do so. Instead I'd expect the distro to create
> >> it during OS installation. If this was a bad assumption, I'd prefer
> >> if the commit message here could point out why such an expectation
> >> won't hold in general.

I didn't write this for an rpm xen.spec - I just cross referenced out
of curiosity.

> > This reasoning is broken for anything other `make install DESTDIR=/` on
> > a live system.
> >
> > It is incompatible with how RPM, deb, etc packages work.
>
> I'm afraid I don't understand, for both of your statements. If distro
> installation put in place the designated directory, there wouldn't be
> any live system lacking it, and there wouldn't be any concern in the
> packaging of any software.
>
> To take a perhaps too extreme example - packages typically expect e.g.
> /usr to exist as well, don't they?

But you have to install -d ${D}/usr before install ${D}/usr/file, right?

It's a surprising sequence to:
1) see 'EFI installation only partially done (EFI_VENDOR not set)'
2) set EFI_VENDOR
3) see xen.efi installation fail

I was working on a fedora system, and I was using `make && sh
install.sh` to install (but be sure to `rm -r dist/install/var/run`
since otherwise that'll break booting).  I wanted xen.efi to end up in
/boot/efi/EFI/fedora after running `sh install.sh`, and EFI_VENDOR
appeared to be the way to do it.  Again, it was surprising to enable
an option and then have it break.

Regards,
Jason

