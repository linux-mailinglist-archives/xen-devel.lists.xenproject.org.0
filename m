Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D7678C12
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 00:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483361.749488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK6MQ-0001xr-NR; Mon, 23 Jan 2023 23:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483361.749488; Mon, 23 Jan 2023 23:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK6MQ-0001ur-KB; Mon, 23 Jan 2023 23:36:22 +0000
Received: by outflank-mailman (input) for mailman id 483361;
 Mon, 23 Jan 2023 23:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4SGE=5U=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pK6MO-0001ul-DV
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 23:36:20 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc61ce0e-9b76-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 00:36:19 +0100 (CET)
Received: by mail-vs1-xe2d.google.com with SMTP id j185so14754704vsc.13
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 15:36:19 -0800 (PST)
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
X-Inumbo-ID: bc61ce0e-9b76-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FOIXWMjA1OKXKH+4ug2Z84+dNixIPvYJggXC+9ot1Uc=;
        b=gaY3CdBeOrCJ4qnmbVHLkdXcUAmqxaoK3uZBgPASGGQkeh3iNjKmjkLtESBaKllme4
         XpzUbT8Q5Ean6KLtWZQCUXJrCwVQn12c7aqebzGB9LPiwxJzFAdLB66pulArCaONnNrz
         1oSVJa7igMsEzaPSIlc3ulKFDsagL2O8szpDclp1hQ1mhUkHrAhjKSqQWUb1GrIQ38Bf
         iiuRPVvV3FhXGaIp892hPajZBpaPMerzhLRPDqTY3NyyBN1se/Php56CuedShnRtppk2
         0mh0WGbx6ZaV5BZ/3n3Rw5dL3/9L9L3vOHUlebforbkQaVih3bC9F60fBD1YxtJ7bEpB
         Z6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOIXWMjA1OKXKH+4ug2Z84+dNixIPvYJggXC+9ot1Uc=;
        b=4s3IyF86MdBDyB4LfanpTYJoOTkk8nKNtkyqMCftQIUx/zpUio4WElIvdqBYY/tepL
         Whidi8qkIDXLO4GwBV7hquY95Pqe3X/pUDbJk4TiwW9MUvYkJwpbL2G3M4rmd8sDjRqO
         tUm9LRV8tqXgR84w91wpJFA+fKP8Lrukcbj8Bn7zzlSdQgFcY8XLrUJpgsR28TTg2UwS
         6C7iBkgzxd+E3okX+Rx7/OkliyY+fD3CRFrkbcUXaZO8VL9lKsDUECOcLlf7osfzy8z9
         sMlHVt7u2vj5r848M41NWfwBgDp/HOA60QRfjIPKKTenbZh5TFSVAdDoWaP0CY/vx/wC
         Knjg==
X-Gm-Message-State: AFqh2kpmQ7p/i4k2lfZTrfVz77/372T9JjzCeBfENF5Gd04Db0/LhZJg
	nRmBc7OgZHFmu8YwtO0vyALyZR1OLBFxC2gAawChQkeYwpc=
X-Google-Smtp-Source: AMrXdXuniWJFV1aRIBePsnoExkHbqdfyms8YeQxUmJpUH+2Ys3a7Ba2ZL7/0XujDLFCEOw1lEmX+fGaclNinI5+AaDI=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr3379230vst.54.1674516978218; Mon, 23
 Jan 2023 15:36:18 -0800 (PST)
MIME-Version: 1.0
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
 <Y8lABYJoQ5Qt4DAt@bullseye> <d5be3bcd-8835-5a2f-12b0-2b2aaa98b9b4@citrix.com>
In-Reply-To: <d5be3bcd-8835-5a2f-12b0-2b2aaa98b9b4@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:35:52 +1000
Message-ID: <CAKmqyKMSj5BsGs7RtsB2TV6eL=LaAMHc=3nF0+c0kY8_m_RYxg@mail.gmail.com>
Subject: Re: [RISC-V] Switch to H-mode
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Oleksii <oleksii.kurochko@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 9:09 AM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 19/01/2023 1:05 pm, Bobby Eshleman wrote:
> > On Mon, Jan 23, 2023 at 06:56:19PM +0200, Oleksii wrote:
> >> Hi Alistair and community,
> >>
> >> I am working on RISC-V support upstream for Xen based on your and Bobby
> >> patches.
> >>
> >> Adding the RISC-V support I realized that Xen is ran in S-mode. Output
> >> of OpenSBI:
> >>     ...
> >>     Domain0 Next Mode         : S-mode
> >>     ...
> >> So the first my question is shouldn't it be in H-mode?
> >>
> >> If I am right than it looks like we have to do a patch to OpenSBI to
> >> add support of H-mode as it is not supported now:
> >> [1]
> >> https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_domain.c#L380
> >> [2]
> >> https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/riscv_encoding.h#L110
> >> Please correct me if I am wrong.
> >>
> >> The other option I see is to switch to H-mode in U-boot as I understand
> >> the classical boot flow is:
> >>     OpenSBI -> U-boot -> Xen -> Domain{0,...}
> >> If it is at all possible since U-boot will be in S mode after OpenSBI.
> >>
> >> Thanks in advance.
> >>
> >> ~ Oleksii
> >>
> > Ah, what you are seeing there is that the openSBI's Next Mode excludes
> > the virtualization mode (it treats HS and S synonymously) and it is only
> > used for setting the mstatus MPP. The code also has next_virt for
> > setting the MPV but I don't think that is exposed via the device tree
> > yet. For Xen, you'd want next_mode = PRIV_S and next_virt = 0 (HS mode,
> > not VS mode). The relevant setup prior to mret is here for interested
> > readers:
> > https://github.com/riscv-software-src/opensbi/blob/001106d19b21cd6443ae7f7f6d4d048d80e9ecac/lib/sbi/sbi_hart.c#L759
> >
> > As long as the next_mode and next_virt are set correctly, then Xen
> > should be launching in HS mode. I do believe this should be default for
> > the stock build too for Domain0, unless something has changed.
>
> Ok, so everything ought to be doing the right thing, even if it doesn't
> show up clearly in the logging.
>
> At some point, Xen is going to need a `if ( !hs-mode ) panic();`,
> because we can't operate dom0 properly if Xen is in plan S-mode.

There are going to be two cases where Xen won't be able to continue.
If it's booting on hardware that doesn't have the Hypervisor extension
or if it's booting in VS-mode (inside a guest).

In theory Xen could run as a nested Hypervisor in VS-mode, but let's
worry about that later.

>
> I suggested that we try and make csr_read_safe() work, then try and read
> `hstatus` to probe if the H extension is active.

I think that makes sense. We don't need to probe for hstatus until
late in the boot though. We should get the console up first so we can
print a useful message. Xen won't need to touch the h* CSRs until it's
about to start a guest.

Alistair

>
> Does this sound reasonable, or is there a better option?
>
> ~Andrew

