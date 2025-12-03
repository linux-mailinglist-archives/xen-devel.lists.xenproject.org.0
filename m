Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41DC9E4DF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 09:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176491.1500964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQiZ8-0001Ua-Sv; Wed, 03 Dec 2025 08:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176491.1500964; Wed, 03 Dec 2025 08:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQiZ8-0001SD-QH; Wed, 03 Dec 2025 08:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1176491;
 Wed, 03 Dec 2025 08:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQiZ7-0001S4-QC
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 08:50:25 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b33e49d-d025-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 09:50:24 +0100 (CET)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7c78d30649aso5074880a34.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 00:50:24 -0800 (PST)
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
X-Inumbo-ID: 1b33e49d-d025-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764751823; x=1765356623; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y14wmZu+6Hl0hy8F4Amx9+E4Gb1nA1Es5CfmvZ8UCzw=;
        b=pRe7YVDKgYFyC6g/d8YvUe8cODsqwjhfDbJhsI+CivQ55nqzwFrg/zfG0Wu8pKvcgp
         F5RAY8jBF14ml40/VNGTShISYrHS/J5Co+vXBMRQpS2+FZ5ByMnEMXfQD2CFNeXhTBSI
         8kz9rS0/D6AdTQItUUq1dK0KL6amwEgBQ5I3DOpiERhJy5Vu7VwCBrqP34mRTJw4Au7r
         y/sRHyPZWFxSgKT26hsoWr81OrRxRM+Y3RcLS8Wzibp3wRvc05IrQh5z1Yf3H0UhJMzF
         UMeeqJ9HD+rAMGqVcGGg9bBKtW5ESOTiBLJN0lI7tZZNsR7AWM3PgEBaAiYoLkzWdcTM
         i+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751823; x=1765356623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y14wmZu+6Hl0hy8F4Amx9+E4Gb1nA1Es5CfmvZ8UCzw=;
        b=ZF4q1jFI/BllBB6GeYfBvRc00dGc2jnZAom+Xg5czqepdt5nWHgYuLVQYJgdR7OjJL
         zkMsQZFPW1ZUAu0zj7RenPSsx0I7EjWotlB1tDX3kIv0ndkzXNfQfcDC2IpvIRPH1stp
         UwXnJhzARg9RoUnd/u1tnhP/TBsbPaAFbSDaTpD/gxhdXCHtRE94LUilqUebjuF2KvYz
         jAADGYuhFIQ0zpJMET8cmBaWE+MQ89uMNMVMDuOR1wiBKtqQzuUnECiRzuHHjSHPTUbk
         cy77lXzOK/BvNWXnA5niJPy8USpIYZQFnEqeRYyyNKbb34E2QXdPYi0Ey9wgglE2jlg5
         Bf1Q==
X-Gm-Message-State: AOJu0YxRQsxVHqjVcDvjD/187KUsihDIzmRXs5OOxDYnWDkodUDhJFDW
	kK/UOnj//R2SiCc/XxOpSkTuupjtzL8pcuvq94cAiUsVMqni3YkpsxG2rmkwHJ00nSQxhHHAMlT
	Ek9obCgzcIiTDjCBBQJYr16P+6VUPMKfjf38FujXxeA==
X-Gm-Gg: ASbGncuYHMDziOp+JLMGjPt42ZZklpjyNUR7e3TnzS89+wNMXWP0pdf7/6QR43c3tzz
	JC1qzHGQKZnGWDmFhvAbIfmGFCFIwqY5Jd/rxU4xMa61gctT2kGxIueuC7VDCxI9rIYzaNDhsrT
	7MB2ZViq1KEtLsWdpsstsPgrxb8smx02slvLALoOo10Bx4AuFImeLt8TtiWLhRP06TqzRvvVweu
	k2ESPh1sVgm+wWSHJjwEv+4alX/Ov9QfzIB1mvI5ko5hlfhxFutnuUWyOpyTY/8s9u2BjllTSAz
	944fPR9/LwKrrM1Rmv9kRxCB5g==
X-Google-Smtp-Source: AGHT+IGXQ7+R0N/6sbIzu6bXmf4uiuvI2uykiFWseqV/In2woWAVAWShZjdPiVViASBKURZ2+Lknks/uspXKB7zTA14=
X-Received: by 2002:a05:6830:2644:b0:7c1:12c5:334e with SMTP id
 46e09a7af769-7c94dae71bemr1287346a34.17.1764751823125; Wed, 03 Dec 2025
 00:50:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44Gq4L95i3wTMEVRoFNFt2PzPCKGAuF4KT3YL9mfmT2FRA@mail.gmail.com> <33EF4249-1F82-4DF5-BCCE-0BCBB0F3D157@arm.com>
In-Reply-To: <33EF4249-1F82-4DF5-BCCE-0BCBB0F3D157@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 09:50:11 +0100
X-Gm-Features: AWmQ_bkGgh16alJhvbLQ1dW2IMhOC3iO-PmouHfOvmdgtqaQPT-j-acTbK0wnag
Message-ID: <CAHUa44FQ8bCo5cuVR-JW9om+jEqUA8uZAPAmic9GkwnG-OeE7A@mail.gmail.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Tue, Dec 2, 2025 at 5:50=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 2 Dec 2025, at 15:08, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Rework how Xen accesses the RX/TX buffers shared with the SPMC so that
> >> ownership and locking are handled centrally.
> >>
> >> Move the SPMC RX/TX buffer bases into ffa_rxtx.c as ffa_spmc_rx/ffa_sp=
mc_tx,
> >> protect them with dedicated ffa_spmc_{rx,tx}_lock spinlocks and expose
> >> ffa_rxtx_spmc_{rx,tx}_{acquire,release}() helpers instead of the globa=
l
> >> ffa_rx/ffa_tx pointers and ffa_{rx,tx}_buffer_lock.
> >>
> >> The RX helpers now always issue FFA_RX_RELEASE when we are done
> >> consuming data from the SPMC, so partition-info enumeration and shared
> >> memory paths release the RX buffer on all exit paths. The RX/TX mappin=
g
> >> code is updated to use the descriptor offsets (rx_region_offs and
> >> tx_region_offs) rather than hard-coded structure layout, and to use th=
e
> >> TX acquire/release helpers instead of touching the TX buffer directly.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa.c          |  22 +-----
> >> xen/arch/arm/tee/ffa_partinfo.c |  40 +++++-----
> >> xen/arch/arm/tee/ffa_private.h  |  18 ++---
> >> xen/arch/arm/tee/ffa_rxtx.c     | 132 +++++++++++++++++++++++++-------
> >> xen/arch/arm/tee/ffa_shm.c      |  26 ++++---

[snip]

> >>
> >> -void ffa_rxtx_destroy(void)
> >> +void *ffa_rxtx_spmc_rx_acquire(void)
> >> +{
> >> +    ASSERT(!spin_is_locked(&ffa_spmc_rx_lock));
> >
> > Is it invalid for two CPUs to concurrently try to acquire the RX buffer=
?
>
> No the RX buffer or the TX buffer with the SPMC should only be used by
> one CPU at a time as there cannot be any concurrent operations using it.

What if two guests call FFA_PARTITION_INFO_GET concurrently? Both can
succeed in acquiring their RX buffer so they can call
ffa_get_sp_partinfo() concurrently, and the assert might be triggered.
We have a similar problem with FFA_RXTX_MAP_64 and
ffa_rxtx_spmc_tx_acquire(). Contention on the spinlocks for the rx and
tx buffers should be valid. If we can't allow a guest to block here,
we should return an error and let the guest retry.

Cheers,
Jens

