Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F61BAEFC55
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 16:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029789.1403531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWc1H-000797-1o; Tue, 01 Jul 2025 14:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029789.1403531; Tue, 01 Jul 2025 14:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWc1G-000760-Ur; Tue, 01 Jul 2025 14:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1029789;
 Tue, 01 Jul 2025 14:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ZnO=ZO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uWc1F-00075u-Ba
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 14:31:33 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b0ad3a-5688-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 16:31:31 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-60d5c665fceso1534250eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 07:31:31 -0700 (PDT)
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
X-Inumbo-ID: 14b0ad3a-5688-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751380290; x=1751985090; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoBnIEBDMSGi0c+1FCSJ/8oCmui8seyHQsbD+P6Gjwg=;
        b=gctIGz8Rc9kRP/PilFq0TI/KVsVoVl0pw0LuZwQueLHdStOHjEyjQlX5aTLURUcfQI
         0IB7lNff2p0xcxGKXrGc1jnAiEOdokP3EcF+ZqFeG8r9rwQv3Ccd39hMwbypMqCD2MOP
         cWfhs2CNvpuA91qrH2FaHzihjAtU3c0yitTg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380290; x=1751985090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoBnIEBDMSGi0c+1FCSJ/8oCmui8seyHQsbD+P6Gjwg=;
        b=b3N+XM4BCep3DGk01eWIGrvwehbBYpKucMxnVmn38TCkQRC0yYVl650slmYFBUE3fH
         7sM43766DcZbgJBJHu4M+3sLYHXa/ieQNRylZtbjRpztB0LDJ7qVo26N9U8qkaFOfz/G
         u/of6JqngV7HufjT3IUskJhHUtc7y4C62Z0fWlr4yrqvENlu8EbNRV77o3FQpCdoLWYo
         FSIAmOt0x5HiYncfKf0/69HShIuSoRYnqNZuBW3vya78y89YfK9T+E5lQfS7soEMBLKu
         kjV6uUEtxW4srJYLNtZZ2kBB0wEFa7lCkNqC44NatPkdfiueuNBw8KqpEUWHzASB2YGa
         GGPg==
X-Gm-Message-State: AOJu0YzVRKDdFbr/nvWtxS5WzlbtEwn53NF0vXn5zCLBEypQpEI1+V5N
	AtFnvUcldyD67pclXXMprlHxja1hKcJ3UVQmktGGk8jweFHx8Y5yVp2uIPPHTuGXBPkBz64ydvM
	mSi2jNC8N4pe+RDQ6/lIaqQfgtmx9r57wxbtxSCb5H8SEaJHHLFKZ
X-Gm-Gg: ASbGncuo3rCJusfLCiFlr5QowoHKabJxALK2KyHp7tn79kstLmeCNBQOct16pqOonzH
	E3yDN3MFjIAXOb96QvpiJqXknqs4Hb2R1Uv7VlwJmWhRRwvFZT+DN8xIWD895LrdX4QmsGasyuw
	easVuCYEDjWOTK4AEDc9ca7/McxrCf0iO3nnLyXqUK02t9
X-Google-Smtp-Source: AGHT+IEe+tJtODhdtJhtRDkjq8wHLZ+cERhzH6tTgNoidV7APFc5ZpgRNTJWNtUK6h+Hrpx3EnqnGJo+GtlH7a2EjJM=
X-Received: by 2002:a05:6820:4b95:b0:611:b1c7:23f with SMTP id
 006d021491bc7-611b912ea1bmr9905928eaf.0.1751380290432; Tue, 01 Jul 2025
 07:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl> <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl> <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
 <aF6onqQMlms2svXT@mail-itl> <CACHz=Zi3THWcucw6ioZhKaeeDxM+e+E1rb-NvczG=mkVjD5qzg@mail.gmail.com>
 <aF7EsHeJ1GAwvrDz@mail-itl>
In-Reply-To: <aF7EsHeJ1GAwvrDz@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 1 Jul 2025 15:31:19 +0100
X-Gm-Features: Ac12FXyV4nQHGkCFn0RLTYYpb12Suh06xiAnwbcGbQVysGqznN-ma9kn_23E5PI
Message-ID: <CACHz=Zhqj2q2hqj4cees22OWmiNrXiGSkJPFJT96WWFpLY31Xw@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Jun 27, 2025 at 04:58:43PM +0100, Frediano Ziglio wrote:
> > On Fri, Jun 27, 2025 at 3:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > > So, it looks like major distributions use a patched grub version that
> > > changes behavior of "linux" command. IIUC many of those patches are
> > > about hardening SecureBoot, and shim-review kinda suggest using patch=
ed
> > > version (many of the submissions explicitly mention the at least patc=
h
> > > grub for NX). So, I think this needs figuring out how to make your
> > > approach working with grub flavor that is actually used by SB-enabled
> > > distributions...
> > >
> >
> > We (xenserver) would like to provide booting using separate
> > hypervisor, kernel and initrd.
> > Using "linux" was an old discussed option which had a nice usage.
> > The merged patches allow to have a fully UKI file bundling kernel and
> > initrd loaded from no-ESP partition which is nice to have.
> > For the final solution I was thinking about using "xen_hypervisor" and
> > "xen_module" already present for ARM. From the user perspective is
> > surely less confusing than using "linux" to pass something which is
> > not Linux.
>
> In which case, loading initrd using Linux-specific grub part doesn't
> make sense, no? Or is that xen_module going to use similar mechanism?
>

Yes, the idea is to reuse this mechanism instead of reinventing the wheel.

You can see the problem from 2 perspectives:
- User usage;
- Boot protocol.

From the user usage the user (possibly human, but at least the
configuration should be user understandable) the usage of "linux" to
load something which is not Linux is confusing although in the past
the "kernel" command was abused to load lot of things, and a lot of
things presented themselves as Linux kernels to be loaded by different
boot loaders (even Syslinux had this habits).

From the boot protocol perspective. A boot loader loads some binaries
and uses some boot protocol to pass the control and different
information to the "next" binary. Information can include
- command line
- modules
- memory information
- video information
- ...
EFI supports by itself memory and video information, can carry a
string (so the command line) but lacks module information. Here came
all a set of way to pass modules, specifically:
- multiboot 1 and 2
- GRUB LoadFile2
- device tree (ARM)
Multiboot does not work very well with PE (the protocol is designed
for ELF or binary/raw loading) so we are trying to move away from it.
Device tree (used by xen_hypervisor and xen_module GRUB commands) is
ARM specific.
What is left (without adding a new method) is LoadFile2. So we are
using this way to pass additional modules. Just added a new media GUID
to pass also the kernel, not only initrd (at the moment the GRUB
changes are very hacky but the protocol is the same).

Frediano

