Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FED78208A5
	for <lists+xen-devel@lfdr.de>; Sat, 30 Dec 2023 23:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660297.1029885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJhrP-0008Sj-Ag; Sat, 30 Dec 2023 22:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660297.1029885; Sat, 30 Dec 2023 22:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJhrP-0008PV-7B; Sat, 30 Dec 2023 22:31:15 +0000
Received: by outflank-mailman (input) for mailman id 660297;
 Sat, 30 Dec 2023 22:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceJ3=IJ=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rJhrN-0008PP-0e
 for xen-devel@lists.xenproject.org; Sat, 30 Dec 2023 22:31:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fef583a-a763-11ee-98ee-6d05b1d4d9a1;
 Sat, 30 Dec 2023 23:31:07 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2340c803c6so880059766b.0
 for <xen-devel@lists.xenproject.org>; Sat, 30 Dec 2023 14:31:07 -0800 (PST)
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
X-Inumbo-ID: 1fef583a-a763-11ee-98ee-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703975467; x=1704580267; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2ktSYm0KRPErPafZHnIw8ztX/mRGyfKyOA6id5DzHs=;
        b=TLTYTODSWIcJAUxjb35w1iCDJT71KySxj3+8BEV6SATVDpFQTVyK2EwofIBT/DbPoN
         GSWs1MEw0PiFav2RJWW6f52bNO5603JFlZS1RdT7FJHwCfJhFaKZUjboPeDSljLTKgZW
         MtLXbkYMahsazYuXTzNJWAywITgJc+mdsOc8XYYE5jPO5HN7Mc4UjWGsik53rkI1O+za
         uvbyVcxOsJgyUSZ5d7h4BOfuqflZr3Xyb4yffA385MazG8FuXBskuWr4RNVyZtGGfd2q
         /GAJ/1/Mfl0aq93lRTFayB/RCxVGzrRwL08lkkAtelQTnrBjTUQkljJUzjm8tTg1Yy8t
         O9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703975467; x=1704580267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2ktSYm0KRPErPafZHnIw8ztX/mRGyfKyOA6id5DzHs=;
        b=pCH+t4jTWxKrQ7hR4qEwggmPclkFmNgCRnO+aQYZ7ZblW5lT+tAQuOte9alwAAG1D3
         6t7MankGPb/OwEu83YdgyiP0RTBSW4yjon3R5jgBmOhvPSDIbRVoL8LplMP52/dvy9mw
         bfpadA3eHlsoK2jmBy/AiGkfFteTJ+fBJaSskzL4LQ6t/O3MYWBqAOciHh7eGAXDzXa1
         AXCcZsdrQFRRM/XGDBg0J8bzN9rfAIBBJwUgHVOV0hd3dyuRCRw56LZiv+Qn5HRV/GHS
         PyB8oNBCyHgnNbPan/mcDvKjuXtzhGWZpk2ej37JQnbfNN6E3qlsVXYJYGqal1TYx6bG
         SgqQ==
X-Gm-Message-State: AOJu0Yx4xGBgkLX0hAGiZzEmYAJaKDiF0fGcXjGpjt/6boR1ijKZTnCB
	OWox9l0jOs7vMxdYbjIpQODqi5LqCuh1zBkWGVqaaTJmlNM=
X-Google-Smtp-Source: AGHT+IFOiKojpb8egL3YYiFRhk4Egwl5ueKE1JO2kliK9kwmWKcov5NloQcSGpainLECj6XiBJyK9va3hzQ82n/cm8Q=
X-Received: by 2002:a17:906:251:b0:a27:5ff2:121c with SMTP id
 17-20020a170906025100b00a275ff2121cmr1857161ejl.139.1703975466727; Sat, 30
 Dec 2023 14:31:06 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiit5NJ_W7f5mssivkGGLevXh_XmSB7ZxZbQe1dgev0_Pg@mail.gmail.com>
 <97aa980b9b44.6eb7f9d5c54e7@mailgate.us> <CA+1FSiheSwrO7Tz3F3Nmu4vcC2E=ONRX8nF3bhQGV0UDOFTrww@mail.gmail.com>
 <da024d1687f3a.2f0c601bba502@mailgate.us> <CA+1FSih7C0HEun99LHEwvyYRiH0PaLwwgnoQLHB69TWz2ykDZg@mail.gmail.com>
 <CA+1FSijoPkRZRaU6tujaMJZeFd3CSyUN+h4y0_NrrB5VWLgwpA@mail.gmail.com>
 <CA+1FSiib3uu9Ky8N5rSSt+H1nfzUnChKhGs2ERWmsbp2T4=2uA@mail.gmail.com>
 <CA+1FSihtb3+bm-pSqa7JGBjy3JUXYD6i0c6J2KHy+EO8rmZ5PA@mail.gmail.com>
 <alpine.DEB.2.22.394.2312191131290.3175268@ubuntu-linux-20-04-desktop>
 <CA+1FSigh=fc07o-RSMZ+hf9-YBUudAwnGcN9k8bP1RnPBP7tRA@mail.gmail.com>
 <CANCZdfpRJxJw2_ma0cCcoGGmAat4KVj5sOfdnGMR9w+OQCYxaQ@mail.gmail.com>
 <CA+1FSigREr=aSHOBMbEK9CaoKzNnKC-6sE=Ui8ovVwnMaZgZhQ@mail.gmail.com>
 <CA+1FSigVW+kS37ZuGeBsr58BfPS10fjptfOnvTbaUOZ7VrUBgg@mail.gmail.com>
 <5ce9eea4-500c-4f06-a7f5-363a0e0d5178@xen.org> <CA+1FSig+UziZ9BsqJp3U5eAR1Qj+PFufgEd7KwoDNo1wspHUYg@mail.gmail.com>
 <46b0d8be-0e08-4737-9bf4-7db3b9b213a7@xen.org>
In-Reply-To: <46b0d8be-0e08-4737-9bf4-7db3b9b213a7@xen.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Sat, 30 Dec 2023 23:30:29 +0100
Message-ID: <CA+1FSiiNn4ROifYg=+yAtWH7Eg6DSz=19T_UmKcZ=thGs7y=1g@mail.gmail.com>
Subject: Re: How to boot FreeBSD for arm 32 bit as DomU with u-boot on my ARM Chromebook
To: Julien Grall <julien@xen.org>
Cc: Warner Losh <imp@bsdimp.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Stanislav Silnicki <stanislav.silnicki@mailgate.us>, freebsd-arm@freebsd.org, 
	Michal.Orzel@amd.com, xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---> That said, I don't understand why it would matter that binaries
are built with Armv5. U-boot should only care about the filesystem
type (e.g. ZFS). So you should be able to build your own filesystem.

I also don't understand why. I'm trying to do is exactly what has been
suggested to do in the site below :

https://forum.doozan.com/read.php?3,49039

scroll down and search these words :

Whether you use "go" or "bootelf", you will need to have some
knowledge about what files are the kernel files in your ARMV5
rootfs.The BSD rootfs must be built for this architecture. And how to
pass parameters to the kernel. Bootelf with API is more powerful, "go"
is primitive.

---> It is it not clear to me whether the last sentence is from you or Elli=
ott

It is from Elliott. I wanted you to know what has been done and what's
missing from the FreeBSD code for arm 32 patched by Elliott. I don't
understand what's the easiest thing to do to fix the problem. I can
barely understand from Elliott's words that fixing the missing low
level hypercalls for arm32 seems to be easy.

What I don't understand is if it requires modifying some code that's
inside the Elliott's github :

https://gitlab.com/ehem/freebsd-src.git

It seems that he patched everything inside his github,but since
something is changed on the FreeBSD side,he won't fix the problem
within his github because he thinks that it is a waste of time. Can
you clone his repo and can you fix what's broken there ? thanks.

---> If you plan to use U-boot, then I recommend you first focus on
U-boot. Then you could look at FreeBSD.

That's the point. I don't know what's the easiest way to go. To use
the off the tree u-boot code (that unfortunately requires to install a
a lot of old packages on FreeBSD 11 because the rootfs require to be
compiled using armv5) or the code that needs to be fixed to allow
FreeBSD to boot as an zImage kernel file. If for you it does not take
a lot of time,I think that would be a nice idea to take the bull by
the horns,allowing FreeBSD to boot as Domu without u-boot,but booting
it as if it was an zImage file.

---> This is likely the culprit. I haven't used FreeBSD for a while,so
I can't advise on how to fix it. If it were me, I would try to
revert the commiting removing the step to create kernel.bin.

No idea about how to do this. I don't even know if I can do that.


On Sat, Dec 30, 2023 at 9:00=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 30/12/2023 12:44, Mario Marietto wrote:
> >> https://src.fedoraproject.org/repo/pkgs/uboot-tools/u-boot-2017.05.tar=
.bz2/sha512/be270f9242a72b05463092a022bbabd54996762de1ff23bf7575124ac02e62f=
49572a4e2f6f571a5019047d40027e56e35593b5cc373c4a5a39b100c3377ba93/
> >
> >> This source code has no support for Xen guests. This was only added in=
 2020. Can you clarify why you can't use the latest upstream U-boot?
> >
> > It's true. I've got the source code of that custom u-boot
> > implementation in the wrong place. This is the right place :
> >
> > https://forum.doozan.com/read.php?3,49039
> >
> > an u-boot / xen developer suggested to me to explore that site because
> > there is the one and only u-boot customized and off the tree version
> > that can chainload the freebsd bootloader "ubldr". Unfortunately to
> > work the FreeBSD rootfs should be compiled with armV5,but my ARM
> > Chromebook works with armV7. I don't know if armV7 is retrocompatible
> > with armV5.
> > In addition,armV5 has been removed from FreeBSD starting from version
> > 12. Infact Balanga used FreeBSD 11.2. FreeBSD 11 has gone EOL for
> > several years and it's very hard to make it in a usable state today.
>
> I am not entirely sure. The Arm Arm implies that there are some sort of
> compatibility between Armv5 and Armv7, but they also removed some feature=
s.
>
> That said, I don't understand why it would matter that binaries are
> built with Armv5. U-boot should only care about the filesystem type
> (e.g. ZFS). So you should be able to build your own filesystem.
>
> >
> > ---> In fact, there are some missing low-level layers (e.g.
> > hypercalls) in order to properly use it for 32-bit domU. I don't know
> > if there is support out-of-tree.
> >
> > @Elliott Mitchell some time ago concerning that point,said :
> >
> > I've only ever tried arm64, but since arm32 didn't appear to need much
> > to be operational I tried to make it possible.  In theory it
> > /should/work on arm32, but I've never tried it.  What was missing was
> > I had never added it to the configuration and one link was needed.
> > Updated "submit" branch has a tiny adjustment. (the only difference is
> > the hypercall wrappers, register naming and where the op code goes,
> > very simple compatibility)
> >
> > I'm not experienced,but it seems to me that only a few patches are
> > needed to make the job done.
>
> It is it not clear to me whether the last sentence is from you or
> Elliott. Regardless that, I think we are talking about two different
> things. Elliott seems to refer to FreeBSD whereas I was referring to U-bo=
ot.
>
> If you plan to use U-boot, then I recommend to first focus on U-boot.
> Then you could look at FreeBSD.
>
> > ---> Do you have a tree with FreeBSD + your patches? I would like to
> > check the zImage code.
> >
> > my patches ? Are you talking about the patches that should have been
> > used on the @Elliott Mitchell github ?
>
> I am referring to what ever you are trying.
>
> >
> > https://gitlab.com/ehem/freebsd-src.git
> >
> > yes,I tried to use his code but I've got the same error "invalid kernel=
"
>
> [...]
>
> > He said that it should work,but I get the error "invalid kernel".
>
> [...]
>
> > It appears FreeBSD-CURRENT removed the last step converting the kernel
> > file to kernel.bin.The patch can be readily rebased, but without
> > kernel.bin that doesn't do too much. So,without a rebase of that patch
> > the first option is not applicable.
>
> This is likely the culprit. I haven't used FreeBSD for a while, so I
> can't advise on how to fix it. If it were me, I would try to revert the
> commiting removing the step to create kernel.bin.
>
> Cheers,
>
> --
> Julien Grall



--
Mario.

