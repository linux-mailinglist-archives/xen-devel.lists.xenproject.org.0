Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1964EDB94
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 16:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297000.505761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZve4-0004yY-6v; Thu, 31 Mar 2022 14:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297000.505761; Thu, 31 Mar 2022 14:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZve4-0004wj-3n; Thu, 31 Mar 2022 14:19:28 +0000
Received: by outflank-mailman (input) for mailman id 297000;
 Thu, 31 Mar 2022 14:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR9h=UK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZve2-0004wd-IO
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 14:19:26 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 915ef5af-b0fd-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 16:19:25 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id m3so41771483lfj.11
 for <xen-devel@lists.xenproject.org>; Thu, 31 Mar 2022 07:19:25 -0700 (PDT)
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
X-Inumbo-ID: 915ef5af-b0fd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMSPM73FMTrJK/ya9lqUErQGcfG51bxLwARlbNHr9fY=;
        b=I6rBTWQ73cN/0cKPwHkFnGK3Eo0RUPTwjSRxsTWb0GHMDceN/jUdhRBrE77p6mLERO
         r7nObjDYU5V1P4Ij7i1AieIe9lDbLjk8EIgfpgl0kpbpiVMcVKR1QmV1v4rGnLTO8AV/
         aqEtvjLcfHG7xVWfqXBKFXHXz1uS3rAG0nFgReJCgkCpAARvZEgpZbyJNA2aXAz1XunC
         2ZvfEVfoFAV0UkB57jj4gfiCJg4ykAOSdbJjl8XNv/4Vg/HssCMJeBf7ZhCyHkapeblc
         HTOkMIP9K/9CgIGxPSrq8VsWMJ76YxyV+b5Iuj/ATASeIDiQVB7kjixXQzSOcpycdOji
         FtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMSPM73FMTrJK/ya9lqUErQGcfG51bxLwARlbNHr9fY=;
        b=EFi4sY67MgjlJRYArYnQJ7gRWz+Secbe7NKtIVHc490eVlfYRWYPbWBeNOxwVM3mW8
         WmdndEHzIILDrXv2U7kKYYzDM6LSMuBpcl0M14DHG8uk52I8EKLBmMRanq5phbLWny//
         xPAMQmmAADMrxqeR0lwtd9h+RDFtQ1Xw+t6yjPNc6gJjaN+4m8LMkD6BLdHBRbQQkpAi
         e/JUcfYzkqZdMCxGoVcnUJf77LCeElGI7kpcht7zviHXViqQ/19ho4/LzH+OSKDyx2pH
         JaY9UqYjqrH8FIFZsm1DlhYnnLHoCVs8mF6DO0ReCuLuwePHWLnu/3d0gR3bRJ/S/ozL
         /G7g==
X-Gm-Message-State: AOAM532vRVoz4BWHlf3zi5FvE42prSh3hTL1piMvJnlDDezZkeguO+eE
	jjQp14DjVdGT8hXrB6WcyQHHNTxU/cWc4/ILefI=
X-Google-Smtp-Source: ABdhPJzwIgYRIgaXFtongyXSQnAUh/nAeowNgQPw+EeiwSdTjKjHSTKz/UmXswsrs8aFy2xQ86iKJzWVnYStYn41Wx0=
X-Received: by 2002:a19:d61a:0:b0:43f:1a03:21ee with SMTP id
 n26-20020a19d61a000000b0043f1a0321eemr11110801lfg.152.1648736364380; Thu, 31
 Mar 2022 07:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com> <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
 <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net> <CAKf6xpths4SX4wq-j4VhnXZnx0DW=468z3=9FYHso=Wy1i_Rsg@mail.gmail.com>
 <da62d06d-fd18-a313-9e69-2a4581e97c1a@netscape.net>
In-Reply-To: <da62d06d-fd18-a313-9e69-2a4581e97c1a@netscape.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 31 Mar 2022 10:19:12 -0400
Message-ID: <CAKf6xptZ9g79MphwYPAGq6ATBtCrW+pCd5+NYJPdFniW+tFzPg@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Andrew Cooper <amc96@srcf.net>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 10:05 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>
> On 3/31/2022 8:29 AM, Jason Andryuk wrote:
> > On Wed, Mar 30, 2022 at 11:54 PM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> >> On 3/30/22 1:27 PM, Andrew Cooper wrote:
> >>>
> >>> This has been discussed before, but noone's done anything about it.
> >>> It's a massive layering violation for QEMU to issue
> >>> xc_domain_iomem_permission()/etc hypercalls.
> >>>
> >>> It should be the toolstack, and only the toolstack, which makes
> >>> permissions hypercalls, which in turn will fix a slew of "QEMU doesn't
> >>> work when it doesn't have dom0 superpowers" bugs with stubdomains.
> >> How much say does the Xen project have over the code
> >> in Qemu under hw/xen? I would not be against having libxl
> >> do the permissions hypercalls in this case instead of Qemu
> >> doing it. My test with Qemu traditional and this patch proves
> >> the permission can be granted by libxl instead of the device
> >> model.
> > Qubes patches libxl and QEMU, and they move the hypercalls to the
> > toolstack.  They are using linux stubdoms, and I think it works for
> > them.
>
> That still doesn't answer my question - will the Qemu upstream
> accept the patches that move the hypercalls to the toolstack? If
> not, we have to live with what we have now, which is that the
> hypercalls are done in Qemu.

Xen-associated people maintain hw/xen code in QEMU, so yes it could be accepted.

Maybe it would need to be backwards compatible to have libxl check the
QEMU version to decide who makes the hypercall?  Unless it is broken
today, in which case just make it work.

Regards,
Jason

