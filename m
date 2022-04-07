Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE14F8250
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300853.513283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTb7-00070g-0e; Thu, 07 Apr 2022 14:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300853.513283; Thu, 07 Apr 2022 14:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTb6-0006yV-Tf; Thu, 07 Apr 2022 14:58:56 +0000
Received: by outflank-mailman (input) for mailman id 300853;
 Thu, 07 Apr 2022 14:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv5T=UR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ncTb5-0006yP-Nj
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:58:55 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e26e683-b683-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 16:58:54 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id h11so7820506ljb.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 07:58:54 -0700 (PDT)
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
X-Inumbo-ID: 3e26e683-b683-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOslDdcSTDQ4USGpyEHsz9DDfYodPnQ6mATljnaVBRA=;
        b=mbO6YZhESGkYqOtxsbMf15WO0FJjSCYikuigxOqZJ5RAUQMAegfRSMfI4YaJPbr0VT
         Ai31lV6WOgObqGN5oNXRBIJrQ48c14+un+440Qq43qUM3fXQ8u2+rJ1SACEU4p4d/efX
         uOnOpP08EmKfrknNMDpKHrtLH/tlCAp4+zR/wmUIZpf1LEsQp0pTdTtLVN1gKd5cNqGB
         OTW80yMrl5t5aGaJc6NiDCPMHZy1NrSXY4LptABTtkJva16E9b3JfAdL9aNmFyHDXGbw
         7sJ6EcfYb9A2RFSEXWPPMEpO9Ca4STL3x6rOuH0B/W/FIWc20Qwe0qx6qjBMGzyybrJK
         0Jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOslDdcSTDQ4USGpyEHsz9DDfYodPnQ6mATljnaVBRA=;
        b=7l7xHDimGiEtGXCQdfBQ0cbxy4eixDgkInx148qmGD9D5ZI+YFyY/a3cgsQ9UBwaB4
         j8/d4IxRTEuOdyhUtCwsVsqLzMyZ0ni+hzbjD9cw5YbDaUAhxFIHfxLRiwuRkXKzc44d
         BVlaPy1h18FE/8l/ylEEsrS0Xr9vCYE6dl7oA9IW9hqLDv+N6X7WTGaaBzeiaZ95g1dL
         FORbDXnq7yNrlcigpV7H2meUjRJOOQCYnFlfuB4Sm+JYEZZiGTu4Xl+bgpUyw212YmV1
         8UZ8LZKNzJt2O6IKVdFRWTRCaN7FJJJz0Zw+JinrVaD91Qyz+tPoKU23nWaUHNWfLXUf
         f4pA==
X-Gm-Message-State: AOAM533qGuLkB8cIgLNaKDvUF/EeCfJXpGzL7OA7IjN2p+cdTJpGZvgi
	MRsrQRDZO+67rlJrtfzSveRBunlk5MxdNZdKBwYLErg7
X-Google-Smtp-Source: ABdhPJzsDEKuTTgvFGKZSoEGVaeHYgzY75p096mUnR7SRAxrmExfJ0oHagvBmwFJsj//fn+1oCjRm8WgF79/df/vZEI=
X-Received: by 2002:a2e:b054:0:b0:248:5819:b946 with SMTP id
 d20-20020a2eb054000000b002485819b946mr9008586ljl.389.1649343534077; Thu, 07
 Apr 2022 07:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <l3LThLG8tkJBvD-3WTxzw6TRrj7GPAN9uWh-AWqzelw75qpdP1ZLXzBV7599MWrjrHH-lRKof3b0jm1DEGrUXLJszgh5hjW25oNtHoTI9Ts=@protonmail.ch>
 <6bd17005-b662-125b-76c9-ac971c8ac2e5@suse.com> <VL9_sTXEiw8YngLJ-_sfNtIrw4Ofj1iVlw_jTKSCAwEW_DSJukiTpsl1GLCMKWY_9jhCZh3MwN8WF4v1dd_OgrDHoyFs27CrXLVMNckLzdQ=@protonmail.ch>
In-Reply-To: <VL9_sTXEiw8YngLJ-_sfNtIrw4Ofj1iVlw_jTKSCAwEW_DSJukiTpsl1GLCMKWY_9jhCZh3MwN8WF4v1dd_OgrDHoyFs27CrXLVMNckLzdQ=@protonmail.ch>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 7 Apr 2022 10:58:42 -0400
Message-ID: <CAKf6xpueKcyFMR-H8RegDZkgNdSPLxQKZ9pVkYSa6VEtiHytbA@mail.gmail.com>
Subject: Re: PCI passthrough: possible bug in memory relocation
To: Mateusz <mati7337@protonmail.ch>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 4, 2022 at 7:37 PM Mateusz <mati7337@protonmail.ch> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> > I'm afraid answering this requires debugging the issue. Yet you don't
> > share any technical details (as to how things don't work, logs, and
> > alike), and the provided link also doesn't look to point to any such
> > information (and as an aside I consider it somewhat unfriendly to
> > point at such a bug as an information source, not just for reference).
> > I'm pretty sure this code in hvmloader did work at some point, but
> > since it may be used quite rarely I could see that it might have got
> > broken.
>
> Thanks for responding!
> I only wanted to ask to see if maybe it's a known issue, but I guess not.
> I'll try to debug and fix it myself so that's why I haven't posted more
> technical details yet.

OpenXT manually configures the xl.cfg mmio_hole setting by reading the
PCI BAR sizes.  The (haskell) code is here:
https://github.com/OpenXT/manager/commit/33fef12b242e3cc9b46a32d07c84bc593ee537c9
.  It runs in dom0 and can access the PCI sysfs entries.

Trying to do this in QEMU in the stubdom is tricky.  Vanilla Xen
hotplugs the PV PCI devices to the stubdom and then hotplugs those
into QEMU with QMP devce_add.  (Qubes changed (or has a change
pending) to cold plugging the PV PCI devices to the stubdom, but they
are still hotplugged into QEMU via QMP device_add calls.)  You won't
know which PCI devices are applicable, but I guess in the stubdom you
can just assume all of the PV ones should be passed through.

It would be better for QEMU to do this itself, but hotplugging PCI
devices means it doesn't have the needed information during startup.

Looking at https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/44
You look at /proc/iomem - I guess that works with the cold plugging of
PV PCI devices into the stubdom.  You only grab the first PCI device
and return after that - not the sum of all PCI devices detected.

libxl knows the devices that will be assigned at domU boot time.  So
it could do the calculation and adjust the mmio_hole size itself.
That doesn't help hotplugging, but it will be better than the
situation today.  libxl already does some PCI sysfs stuff, so it might
be a good place to solve this.

Regards,
Jason

