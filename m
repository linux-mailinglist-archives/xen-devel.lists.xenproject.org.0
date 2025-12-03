Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF7C9EB8A
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176639.1501094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQkAB-0003sD-CO; Wed, 03 Dec 2025 10:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176639.1501094; Wed, 03 Dec 2025 10:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQkAB-0003qp-9W; Wed, 03 Dec 2025 10:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1176639;
 Wed, 03 Dec 2025 10:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQkA9-0003pO-ID
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:32:45 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e09030-d033-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 11:32:42 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6597046fc87so334737eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:32:42 -0800 (PST)
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
X-Inumbo-ID: 65e09030-d033-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764757961; x=1765362761; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZlZC9Cq6WLvNRYs88B2wOuAje4OZjKj+koZj74J1Cw=;
        b=eoWTp4+BauhsOOMBX1/zqJ5G0UDEhp5k3TFcG1xbALCCKttsHs0yAaipeTegZZM+Lc
         m++Kb2NKQ75NV7BQwjWOdJwxKZ6nzfDc0nb3f/O4xDr/f7PNWzLEdsAvpMqKpy/QLkbm
         VwzzA1lZzCY7kkM0RTfbH/ME7AJOkXhbfj3q5r9OGuIHQ+iuRoC65RW8uoDsILf3lc0j
         B6SQuHYZ07XwoeLtoC58DfEnq4apJl2Z3BiiXz8ipGbiadPVeSsn4vmt9WEwfvFxEMJp
         uoOTWpHr9r0KB3xeV1ROii8XcWtCFDwGIsok2mJa3MEthN7Q3dcPne4X8/VByK/W7PKg
         4d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764757961; x=1765362761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZlZC9Cq6WLvNRYs88B2wOuAje4OZjKj+koZj74J1Cw=;
        b=C8FZrdxBL0UE32KOg2HU8Gu0GAlsfYFJ/xjcFbdduTAGkTrMJ47kda4Mhac+aeR4cO
         CFnXRkfn/QTXqFNJvILqkDTSYol4/IHunoF+hfLpTXExin+RskY/MniuEK1aTWjJ5Ten
         pOw/X9hsEA4bg3QwJhr/4qxtvRenFifYRwLKGOyq6cpRfkAzz2/d+C8FNgJgQwnRSJnh
         NHFTjIEJJEk6t2aTEc08THLHWYeMafQbAUsnaJqJnaU4QCFZu0KM8KoLVY2aqOEgjOKT
         eYYcBmOehyeVS6ZGLjaUBT96qZNQqtCZCjk2sCSFaj8zfEhmp49P1e/Ifgc8YZAYrOAl
         WVzQ==
X-Gm-Message-State: AOJu0Yy23ix2GzCWK21Bg8/9G+wBXSmW+ocl3cyJQuHJiRuF7dBKA8kG
	sSBAfAw6YrpGPt306LichFQNcD+r4mgXUANAlKp2JLg/gosf8SEGQEThIe5ziRQbV80VUcAxe1S
	dlGZoZmUiNhP+fzL4tijRKEzq/FysKlHxYf0GbKF6V12yxDCgvhdpErqw/w==
X-Gm-Gg: ASbGncueRjF3J0QWWU1eMpVCYALwJTgu3SqaEUMvHcL57G1WkDGIzgOw4OoBGnvl5I2
	dQ/aSRuT9VfZr+lerwiC+UZZ265FkSSDae/VMtwtQWsDGu/V3HiqM9nk85BHTD2j/yiPHof1kQh
	NW0GfEnxibKmFP95sfwxcic/W0/IEBPjEetWZVs++1M33SKzQ0uG+lQSXWgz7tbFuNMXrWBd4HW
	eDClZIQeLGH9X+DMThMwZKA3gYsUmL0LdYjsDayHaxUQNnFNTcfDdgDd+LU/4sZG3rJv12kgcpc
	0BBgQ2eNZrnvKYvmEbqD4IFkN7sGnLJb8I+u
X-Google-Smtp-Source: AGHT+IGa9rfUtgwfdKE/1E0wYHC/UTFHGn4ElfXlgBVB92MEzO1ZuU6vEkYB+Yt1G/f5qSZvdv8Ej23nszqZC4bHuwg=
X-Received: by 2002:a05:6820:4c0b:b0:657:64ce:b40f with SMTP id
 006d021491bc7-65972739a69mr771558eaf.4.1764757961293; Wed, 03 Dec 2025
 02:32:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44Gq4L95i3wTMEVRoFNFt2PzPCKGAuF4KT3YL9mfmT2FRA@mail.gmail.com>
 <33EF4249-1F82-4DF5-BCCE-0BCBB0F3D157@arm.com> <CAHUa44FQ8bCo5cuVR-JW9om+jEqUA8uZAPAmic9GkwnG-OeE7A@mail.gmail.com>
 <4E39091E-8EFB-4C80-8A1C-FB37B07B8AA3@arm.com>
In-Reply-To: <4E39091E-8EFB-4C80-8A1C-FB37B07B8AA3@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 11:32:27 +0100
X-Gm-Features: AWmQ_bnTF_l2QTx_zpGRibuBTF3WwBGDNyRa_01EoawPy3vHvouUa_jKS4n_4t8
Message-ID: <CAHUa44H_nD2ep+q1b2sZy-hJXAtbSmoHCNtaR0ASs1=JoRY2jg@mail.gmail.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 3, 2025 at 10:36=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 3 Dec 2025, at 09:50, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Tue, Dec 2, 2025 at 5:50=E2=80=AFPM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 2 Dec 2025, at 15:08, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
> >>>
> >>> Hi Bertrand,
> >>>
> >>> On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
> >>> <bertrand.marquis@arm.com> wrote:
> >>>>
> >>>> Rework how Xen accesses the RX/TX buffers shared with the SPMC so th=
at
> >>>> ownership and locking are handled centrally.
> >>>>
> >>>> Move the SPMC RX/TX buffer bases into ffa_rxtx.c as ffa_spmc_rx/ffa_=
spmc_tx,
> >>>> protect them with dedicated ffa_spmc_{rx,tx}_lock spinlocks and expo=
se
> >>>> ffa_rxtx_spmc_{rx,tx}_{acquire,release}() helpers instead of the glo=
bal
> >>>> ffa_rx/ffa_tx pointers and ffa_{rx,tx}_buffer_lock.
> >>>>
> >>>> The RX helpers now always issue FFA_RX_RELEASE when we are done
> >>>> consuming data from the SPMC, so partition-info enumeration and shar=
ed
> >>>> memory paths release the RX buffer on all exit paths. The RX/TX mapp=
ing
> >>>> code is updated to use the descriptor offsets (rx_region_offs and
> >>>> tx_region_offs) rather than hard-coded structure layout, and to use =
the
> >>>> TX acquire/release helpers instead of touching the TX buffer directl=
y.
> >>>>
> >>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> xen/arch/arm/tee/ffa.c          |  22 +-----
> >>>> xen/arch/arm/tee/ffa_partinfo.c |  40 +++++-----
> >>>> xen/arch/arm/tee/ffa_private.h  |  18 ++---
> >>>> xen/arch/arm/tee/ffa_rxtx.c     | 132 +++++++++++++++++++++++++-----=
--
> >>>> xen/arch/arm/tee/ffa_shm.c      |  26 ++++---
> >
> > [snip]
> >
> >>>>
> >>>> -void ffa_rxtx_destroy(void)
> >>>> +void *ffa_rxtx_spmc_rx_acquire(void)
> >>>> +{
> >>>> +    ASSERT(!spin_is_locked(&ffa_spmc_rx_lock));
> >>>
> >>> Is it invalid for two CPUs to concurrently try to acquire the RX buff=
er?
> >>
> >> No the RX buffer or the TX buffer with the SPMC should only be used by
> >> one CPU at a time as there cannot be any concurrent operations using i=
t.
> >
> > What if two guests call FFA_PARTITION_INFO_GET concurrently? Both can
> > succeed in acquiring their RX buffer so they can call
> > ffa_get_sp_partinfo() concurrently, and the assert might be triggered.
> > We have a similar problem with FFA_RXTX_MAP_64 and
> > ffa_rxtx_spmc_tx_acquire(). Contention on the spinlocks for the rx and
> > tx buffers should be valid. If we can't allow a guest to block here,
> > we should return an error and let the guest retry.
>
> i am not sure i am following anymore.
> The assert is just there to ensure that the lock is not already taken.

But it could already be taken by another CPU.

> The function is then taking the lock and not releasing it until release
> is called which is ensuring that only one vcpu at a time is using the
> rx buffer. Did i miss something here ?

Only one CPU at a time should use the spmc rx buffer, but others might
try and should be blocked in spin_lock() rather than ASSERT.

>
> for rxtx map we do call tx_acquire so we lock the buffer.
>
> Now we might have a race condition between in rxtx_map and unmap
> where i should take the rx_lock and the tx_lock of the guest to prevent
> concurrent usage of the vm rxtx buffer. I will fix that one.

Yes, you're right, good catch.

>
> Please tell me for the spmc rxtx buffers as i am not sure i am following
> what you mean there :-)

Each guest has its own rxtx buffer, so the spinlock here is just in
case the guest didn't synchronize its CPUs before calling. But the
SPMC rxtx buffers are for Xen, so a guest can't be sure that no other
guest is holding the spinlock.

Two guests can independently call FFA_RXTX_MAP_64 and then call
ffa_rxtx_spmc_tx_acquire() more or less at the same time.

I you remove the "ASSERT(!spin_is_locked(...));" from
ffa_rxtx_spmc_tx_acquire() and ffa_rxtx_spmc_rx_acquire() it should be
OK.

Cheers,
Jens

