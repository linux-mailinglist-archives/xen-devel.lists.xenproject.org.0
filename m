Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B7683A4C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 00:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487962.755802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzt5-0000oU-4K; Tue, 31 Jan 2023 23:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487962.755802; Tue, 31 Jan 2023 23:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzt5-0000m0-1I; Tue, 31 Jan 2023 23:18:03 +0000
Received: by outflank-mailman (input) for mailman id 487962;
 Tue, 31 Jan 2023 23:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMzt3-0000lu-Vc
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 23:18:02 +0000
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [2607:f8b0:4864:20::e34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fe851a4-a1bd-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 00:17:59 +0100 (CET)
Received: by mail-vs1-xe34.google.com with SMTP id e9so9957464vsj.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 15:17:59 -0800 (PST)
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
X-Inumbo-ID: 7fe851a4-a1bd-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P0iE2DlsNiDStuhq9/ES+SGds5yLPft49VIpL5Q7YLI=;
        b=aJvov2mf8O7uSbdVLCCosLS7V4Bh4HvdHoRGs1YeL0cQP5i5GFdI3wrgT0fbYiTDsf
         h00K9Fs/QidwsfPZKD5sxB/RXkTodfjD+tMWCoeyvmYnsqs92K/JPAMOp5gEMRlA/HDM
         wwZ5YK7muSTFONYjWFtZuMRKXCyFmu8PwyP82U7WXoP1VBGYvyvoU2jmPrkvhipEkJKX
         K3+JVvOk2/Oo7nAmE28eJuvpKxdHPcLQrqpfqD2ryoH+W5qeNpz7sY924BFGiFrIUaRG
         Qq9z3HpfNYepu6VYFD971DL35gLxHroOOO72BVHqMuBiFi2gs6n46kKrUdk2cidX/gcG
         EQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0iE2DlsNiDStuhq9/ES+SGds5yLPft49VIpL5Q7YLI=;
        b=epjF+ocBANTeE6BKqyh6UdyDnoel2g5afdHuARQLmpLdMk7x/Nv+hObrNTgTcuypSB
         +CYrbM0D0OWfj/nMbX32fccuCkB9MZqyvNzJqy8mMhEy6m9EO01XhYz9mnsYAfPfXrwu
         G7s/fpKxarfqQ4Xdb3jrdejTomCWlzAZHtV5+N1NVERw/BtAPs9vfxx53HxkpCWnnaC+
         rcDkRZd8NIxIsD32Z77cdifVe5vWjDNTxenR/PhGsjv2Dsg/XlCSVbt4UyHDt6EF3ifj
         DdwEpowxlhORRLIOx+FkccSNnu2YvXGoK2KIBZsdmt521q2dGq/gBlBNwjHSsRwI78ek
         Llxg==
X-Gm-Message-State: AO0yUKVoXd3OIHWN6a3rYzA/hUnqYyITKWF3V6TUosOVhcDyQZ5HVDq2
	mm5hexlzeK8+sHwIEPcnFcuqWY7fZxfEeB7R1d4=
X-Google-Smtp-Source: AK7set8mhZH/fSgw8XBtc1iKOJiuySVOmjpRbeFSs0//kp9XO5jf0uBNlbT8742grdP4gZ5ve2UWL+js0W0SxO2qEy0=
X-Received: by 2002:a05:6102:52e:b0:3fe:5a64:f8ea with SMTP id
 m14-20020a056102052e00b003fe5a64f8eamr114115vsa.54.1675207077239; Tue, 31 Jan
 2023 15:17:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com> <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
In-Reply-To: <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Feb 2023 09:17:31 +1000
Message-ID: <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
To: Julien Grall <julien@xen.org>
Cc: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Connor Davis <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 31, 2023 at 10:03 PM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 31/01/2023 11:44, Alistair Francis wrote:
> > On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
> >>
> >> Hi Alistair, Bobby and community,
> >>
> >> I would like to ask your help with the following check:
> >> +/*
> >> + * early_*() can be called from head.S with MMU-off.
> >> + *
> >> + * The following requiremets should be honoured for early_*() to
> >> + * work correctly:
> >> + *    It should use PC-relative addressing for accessing symbols.
> >> + *    To achieve that GCC cmodel=medany should be used.
> >> + */
> >> +#ifndef __riscv_cmodel_medany
> >> +#error "early_*() can be called from head.S with MMU-off"
> >> +#endif
> >
> > I have never seen a check like this before.
>
> The check is in the Linux code, see [3].
>
> > I don't really understand
> > what it's looking for, if the linker is unable to call early_*() I
> > would expect it to throw an error. I'm not sure what this is adding.
>
> When the MMU is off during early boot, you want any C function called to
> use PC-relative address rather than absolute address. This is because
> the physical address may not match the virtual address.

Ah!

I forgot that Xen would be compiled for virtual addresses, I have
spent too much time running on systems without an MMU recently.

>
>  From my understanding, on RISC-V, the use of PC-relative address is
> only guaranteed with medany. So if you were going to change the cmodel
> (Andrew suggested you would), then early_*() may end up to be broken.
>
> This check serve as a documentation of the assumption and also help the
> developer any change in the model and take the appropriate action to
> remediate it.
>
> >
> > I think this is safe to remove.
> Based on what I wrote above, do you still think this is safe?

With that in mind it's probably worth leaving in then. Maybe the
comment should be updated to make it explicit why we want this check
(I find the current comment not very helpful).

Alistair

>
> Cheers,
>
> >> Please take a look at the following messages and help me to decide if
> >> the check mentioned above should be in early_printk.c or not:
> >> [1]
> >> https://lore.kernel.org/xen-devel/599792fa-b08c-0b1e-10c1-0451519d9e4a@xen.org/
> >> [2]
> >> https://lore.kernel.org/xen-devel/0ec33871-96fa-bd9f-eb1b-eb37d3d7c982@xen.org/
>
> [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/mm/init.c
>
>
> --
> Julien Grall

