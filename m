Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDC820851
	for <lists+xen-devel@lfdr.de>; Sat, 30 Dec 2023 21:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660293.1029875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJfVT-0008J3-Ao; Sat, 30 Dec 2023 20:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660293.1029875; Sat, 30 Dec 2023 20:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJfVT-0008Fs-7T; Sat, 30 Dec 2023 20:00:27 +0000
Received: by outflank-mailman (input) for mailman id 660293;
 Sat, 30 Dec 2023 20:00:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rJfVR-0008Fm-MR
 for xen-devel@lists.xenproject.org; Sat, 30 Dec 2023 20:00:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rJfVL-0005nK-70; Sat, 30 Dec 2023 20:00:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rJfVK-0004NJ-Q1; Sat, 30 Dec 2023 20:00:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=UoNGTP0Yj9JaZxGKQPyOuFeX8/09y97gRLdmRg/vD0I=; b=CjOdg6dW4FNmaYWH/jf2sYFM7m
	LskkUAiwZbI1iBFbGJdBzLYhvuGxjPIgfbCpuk3O8an6M+UHQAqO4/26oH97TYewcUzqsGhme6MKA
	D15MvYZPQoOsNyyQM76R1W+jEbHtcHlLTBiBmCjpHtQgo6kxUJhRsplwRRlZI03vIM9M=;
Message-ID: <46b0d8be-0e08-4737-9bf4-7db3b9b213a7@xen.org>
Date: Sat, 30 Dec 2023 20:00:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to boot FreeBSD for arm 32 bit as DomU with u-boot on my ARM
 Chromebook
Content-Language: en-GB
To: Mario Marietto <marietto2008@gmail.com>
Cc: Warner Losh <imp@bsdimp.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Stanislav Silnicki
 <stanislav.silnicki@mailgate.us>, freebsd-arm@freebsd.org,
 Michal.Orzel@amd.com, xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
References: <CA+1FSiit5NJ_W7f5mssivkGGLevXh_XmSB7ZxZbQe1dgev0_Pg@mail.gmail.com>
 <97aa980b9b44.6eb7f9d5c54e7@mailgate.us>
 <CA+1FSiheSwrO7Tz3F3Nmu4vcC2E=ONRX8nF3bhQGV0UDOFTrww@mail.gmail.com>
 <da024d1687f3a.2f0c601bba502@mailgate.us>
 <CA+1FSih7C0HEun99LHEwvyYRiH0PaLwwgnoQLHB69TWz2ykDZg@mail.gmail.com>
 <CA+1FSijoPkRZRaU6tujaMJZeFd3CSyUN+h4y0_NrrB5VWLgwpA@mail.gmail.com>
 <CA+1FSiib3uu9Ky8N5rSSt+H1nfzUnChKhGs2ERWmsbp2T4=2uA@mail.gmail.com>
 <CA+1FSihtb3+bm-pSqa7JGBjy3JUXYD6i0c6J2KHy+EO8rmZ5PA@mail.gmail.com>
 <alpine.DEB.2.22.394.2312191131290.3175268@ubuntu-linux-20-04-desktop>
 <CA+1FSigh=fc07o-RSMZ+hf9-YBUudAwnGcN9k8bP1RnPBP7tRA@mail.gmail.com>
 <CANCZdfpRJxJw2_ma0cCcoGGmAat4KVj5sOfdnGMR9w+OQCYxaQ@mail.gmail.com>
 <CA+1FSigREr=aSHOBMbEK9CaoKzNnKC-6sE=Ui8ovVwnMaZgZhQ@mail.gmail.com>
 <CA+1FSigVW+kS37ZuGeBsr58BfPS10fjptfOnvTbaUOZ7VrUBgg@mail.gmail.com>
 <5ce9eea4-500c-4f06-a7f5-363a0e0d5178@xen.org>
 <CA+1FSig+UziZ9BsqJp3U5eAR1Qj+PFufgEd7KwoDNo1wspHUYg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+1FSig+UziZ9BsqJp3U5eAR1Qj+PFufgEd7KwoDNo1wspHUYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2023 12:44, Mario Marietto wrote:
>> https://src.fedoraproject.org/repo/pkgs/uboot-tools/u-boot-2017.05.tar.bz2/sha512/be270f9242a72b05463092a022bbabd54996762de1ff23bf7575124ac02e62f49572a4e2f6f571a5019047d40027e56e35593b5cc373c4a5a39b100c3377ba93/
> 
>> This source code has no support for Xen guests. This was only added in 2020. Can you clarify why you can't use the latest upstream U-boot?
> 
> It's true. I've got the source code of that custom u-boot
> implementation in the wrong place. This is the right place :
> 
> https://forum.doozan.com/read.php?3,49039
> 
> an u-boot / xen developer suggested to me to explore that site because
> there is the one and only u-boot customized and off the tree version
> that can chainload the freebsd bootloader "ubldr". Unfortunately to
> work the FreeBSD rootfs should be compiled with armV5,but my ARM
> Chromebook works with armV7. I don't know if armV7 is retrocompatible
> with armV5.
> In addition,armV5 has been removed from FreeBSD starting from version
> 12. Infact Balanga used FreeBSD 11.2. FreeBSD 11 has gone EOL for
> several years and it's very hard to make it in a usable state today.

I am not entirely sure. The Arm Arm implies that there are some sort of 
compatibility between Armv5 and Armv7, but they also removed some features.

That said, I don't understand why it would matter that binaries are 
built with Armv5. U-boot should only care about the filesystem type 
(e.g. ZFS). So you should be able to build your own filesystem.

> 
> ---> In fact, there are some missing low-level layers (e.g.
> hypercalls) in order to properly use it for 32-bit domU. I don't know
> if there is support out-of-tree.
> 
> @Elliott Mitchell some time ago concerning that point,said :
> 
> I've only ever tried arm64, but since arm32 didn't appear to need much
> to be operational I tried to make it possible.  In theory it
> /should/work on arm32, but I've never tried it.  What was missing was
> I had never added it to the configuration and one link was needed.
> Updated "submit" branch has a tiny adjustment. (the only difference is
> the hypercall wrappers, register naming and where the op code goes,
> very simple compatibility)
> 
> I'm not experienced,but it seems to me that only a few patches are
> needed to make the job done.

It is it not clear to me whether the last sentence is from you or 
Elliott. Regardless that, I think we are talking about two different 
things. Elliott seems to refer to FreeBSD whereas I was referring to U-boot.

If you plan to use U-boot, then I recommend to first focus on U-boot. 
Then you could look at FreeBSD.

> ---> Do you have a tree with FreeBSD + your patches? I would like to
> check the zImage code.
> 
> my patches ? Are you talking about the patches that should have been
> used on the @Elliott Mitchell github ?

I am referring to what ever you are trying.

> 
> https://gitlab.com/ehem/freebsd-src.git
> 
> yes,I tried to use his code but I've got the same error "invalid kernel"

[...]

> He said that it should work,but I get the error "invalid kernel".

[...]

> It appears FreeBSD-CURRENT removed the last step converting the kernel
> file to kernel.bin.The patch can be readily rebased, but without
> kernel.bin that doesn't do too much. So,without a rebase of that patch
> the first option is not applicable.

This is likely the culprit. I haven't used FreeBSD for a while, so I 
can't advise on how to fix it. If it were me, I would try to revert the 
commiting removing the step to create kernel.bin.

Cheers,

-- 
Julien Grall

