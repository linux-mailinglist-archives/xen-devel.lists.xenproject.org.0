Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C707DD939
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 00:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626036.975937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxy38-0005kF-UH; Tue, 31 Oct 2023 23:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626036.975937; Tue, 31 Oct 2023 23:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxy38-0005iF-RX; Tue, 31 Oct 2023 23:21:30 +0000
Received: by outflank-mailman (input) for mailman id 626036;
 Tue, 31 Oct 2023 23:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pIiO=GN=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1qxy37-0005i9-N8
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 23:21:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36fdee61-7844-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 00:21:27 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso10019875a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 16:21:27 -0700 (PDT)
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
X-Inumbo-ID: 36fdee61-7844-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698794486; x=1699399286; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iuW/r6fepViRIYihXjozwaw+9fn+fvC/esjJU4/SD4=;
        b=Zd13mhQTuWh5M+s92ZfZX4YIKn6ri7XywGVMGENMaioswDOxDpFPYb6rnH3GPJv9Hl
         diJ5O94/dY/x7osrqGimkvPsiOH4Q5gCgpAOI0aeQyUCWRG33nk4+jwkdCXNqPBh8IGT
         0vWxGCnoEUdVoTEy7zc0YO10xM+IKY/FZAlnIZK2lfcOY69fMAIdDZBLvbukrkO7mhWE
         e6BXlkVJNO4tU7MvU1odS4Q07Nh31LL4J5G00RzQxieOW9lWsuanoz8RoFRwt8qD6ueL
         fHo/qg/fHG8hGG/6kmNzWC7/gTj5ALNyi9s7heUfkoeVzTRBWoZA5/ZAxVcxfFGCojhG
         muTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698794486; x=1699399286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iuW/r6fepViRIYihXjozwaw+9fn+fvC/esjJU4/SD4=;
        b=WBfv+fj7TmhTIKFo6SSdCJWzgWqcTFUKDqALh+fi5fAVuWrpjfjZJSNBkiPfN3xd6d
         3+y5IFMFsjKG0vCSpjdpvVMOw0TQP7F67zjqjGk0XUntWG52VtzR5Oz63y3hRL/W8U5s
         GjZcizT3yjX/mTXLArMbnxhH/vhrYafiiN0Pl+d2XMRQ28H/CG/EXHpWyYH/uQMjI52v
         SStGwvwZTfLp2IR9HO+fV4NVEtI4+1XcTmG95ebKppSdKTKHO2Im5JdKQDIOQ9qb4GLG
         tiPhfJXGgibwF3CUB3z4il6g77hshVHCFmW2FFlYGVIFuqiTg5bKQberrXYZ0CnVcC+U
         wImA==
X-Gm-Message-State: AOJu0YxJdbNnpv8DzLGfmnQCRxRiRZX1GCPl52QVGFnBT+Kxjs8q6Uy4
	M8MtwkNj/1RwznG2cxisyi+zD0VUIIGgnXBSrQI=
X-Google-Smtp-Source: AGHT+IGC/7hMWPEfkg0gdSM/hF0VL18Fu0OC6ctDNhskZxn9vAv30p+v6fvRhjQGFbWA5tj5jASch8BXjfcOR/bPzyU=
X-Received: by 2002:a17:907:2cc3:b0:9bd:7f40:caa5 with SMTP id
 hg3-20020a1709072cc300b009bd7f40caa5mr403948ejc.77.1698794486324; Tue, 31 Oct
 2023 16:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 1 Nov 2023 00:20:49 +0100
Message-ID: <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, brchuckz@netscape.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm aware of the presence of that post. I'm working on the same
project with the guy who explained the problem. Unfortunately,the
solution proposed does not work well. Xen is working,but the screen is
still black.

On Wed, Nov 1, 2023 at 12:04=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Hi Mario,
>
> I am adding xen-devel and a couple of other Xen maintainers that might
> know how to help make progress on this issues.
>
> Replies inline below.
>
>
> On Tue, 31 Oct 2023, Mario Marietto wrote:
> > Hello,
> >
> > We are a team of linux enthusiasts who are trying to boot Xen on a
> > Samsung XE303C12 Chromebook aka "snow"
> > following the suggestions in the slide show presentation here:
> >
> > https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-n=
ew-soc-julien-grall-arm
> >
> > This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it =
is
> > a Samsung armv7 chip with virtualization extensions.
> >
> > In particular, we have it working fairly well both on the bare metal wi=
th
> > a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
> > kernel with KVM, the older LTS kernel version is used to test KVM becau=
se
> > support for KVM on arm v7 was removed from Linux around kernel version
> > 5.7. So we know we have the hypervisor mode enabled because we were abl=
e
> > to use it with KVM.
> >
> > For Xen, we are using the latest Debian build of Xen 4.17 for the Debia=
n
> > armhf architecture:
> >
> > (XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)
> > (pkg-xen-devel@xxxxxxxxxxxxxxx
> > xxxxxxxx) (arm-linux-gnueabihf-gcc (Debian
> > 12.2.0-14) 12.2.0) debug=3Dn Thu May 18 19:26:30 UTC 2023
> >
> > The Linux kernel is a custom build that adds the Xen config kernel
> > options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on th=
e
> > same Chromebook model on the bare metal. I can provide the config optio=
ns
> > of the kernel that was used if that is helpful.
> >
> > Our method of booting is to have u-boot boot the Xen hypervisor and loa=
d
> > the device tree after adding the dom0 to the otherwise unaltered device
> > tree from the Linux kernel using u-boot fdt commands to add a /chosen
> > node, as described on the Xen wiki and in the pages linked from there. =
We
> > have also tried adding and loading an initrd.img using the device tree
> > /chosen node but that made no difference in our tests.
> >
> > We actually have the Linux LTS kernel version 6.1.59 working as dom0 wi=
th
> > Xen using the same version of u-boot that we used for KVM, but with a b=
ig
> > problem.
> >
> > The problem we see is that when booting the 6.1.59 kernel version as do=
m0
> > with Xen, the screen is totally dark and the only way to access the
> > system is remotely through ssh. Logs indicate most everything else is
> > working, such as the wifi card so we can access it remotely via ssh and=
 a
> > USB optical mouse lights up when connected so USB is also working.
> > Obviously, the disk is also working. The Chromebook is configured to bo=
ot
> > from the device's SD card slot by turning on Chrome OS developer mode
> > options to enable booting from the SD card slot.
> >
> > The mystery is that when booting the exact same 6.1.59 kernel on the ba=
re
> > metal instead of booting it as dom0 on Xen, it boots up with full acces=
s
> > to the screen and we can interact with the system using the X.org windo=
ws
> > system. But booting as dom0 with Xen, the screen is totally dark and th=
e
> > only access we have to the system is through the network via ssh. Also,
> > when booting the 5.4.257 kernel with KVM in hypervisor mode, the screen
> > works and we can interact with the system through the X.org windows
> > system.
> >
> > Exploring the log file,we have seen the errors below :
> >
> >
> > With Xen (or in bare metal):
> >
> > devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> > DMA mapping operations
> > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> > 0xc0d96354)
> > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops
> > 0xc0d97554)
> > devuan-bunsen kernel: exynos-drm exynos-drm: bound
> > 145b0000.dp-controller (ops 0xc0d97278)
> > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops
> > 0xc0d97bd0)
> > ...
> > devuan-bunsen kernel: Console: switching to colour frame buffer device =
170x48
> > devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb
> > frame buffer device
> > devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for
> > exynos-drm on minor 0
> >
> > In this case,the kernel is able to use the exynos-drm kernel to start
> > the fb0 device. But with Xen we get this error with exynos-drm:
> >
> > devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> > DMA mapping operations
> > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> > 0xc0d96354)
> > devuan-bunsen kernel: exynos-mixer 14450000.mixer:
> > [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks
> > support for IOMMU
> > devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind
> > 14450000.mixer (ops 0xc0d97554): -22
> > devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
> > devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller
> > failed with error -22
> >
> >
> > Any ideas why booting the same Linux kernel that results in a working
> > X.org display on the bare metal instead as dom0 on Xen would cause the
> > display to remain dark, but most other basic functions would work, such
> > as network, disk, and USB ? thanks.
>
> I think the issue is that Linux 6.1.59 is using the IOMMU to get the GPU
> to work. When running on top of Xen, the IOMMU is not available to
> Linux. That's because the IOMMU is used by Xen to enforce protection
> between VMs.
>
> It might help to rebuild Linux without IOMMU support (remove the driver
> from the kconfig) so that Linux cannot attempt to use the IOMMU.
>
> Also see
> https://marc.info/?l=3Dxen-users&m=3D169844593525492



--
Mario.

