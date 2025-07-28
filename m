Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13836B138DD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061213.1426721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL09-0006VO-Cg; Mon, 28 Jul 2025 10:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061213.1426721; Mon, 28 Jul 2025 10:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL09-0006SH-9p; Mon, 28 Jul 2025 10:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1061213;
 Mon, 28 Jul 2025 10:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0z=2J=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ugL08-0006SB-42
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:22:36 +0000
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [2607:f8b0:4864:20::a33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70e4f0d-6b9c-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:22:35 +0200 (CEST)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-5376621dfafso1295274e0c.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:22:35 -0700 (PDT)
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
X-Inumbo-ID: c70e4f0d-6b9c-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753698154; x=1754302954; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrHj74Vs5mwVssiFvTjNXcTxY80y/wM7UHeNbZbXCqk=;
        b=dRHIyeLCYaJCRFF8Io1JhekDvrNuxz/vQG6795PhxYml8ejY078nXxB5MN92zqYs6B
         abXmGQ2Cw4I6lgw+RooJ/3XDTeg+rZjETDkIBbkbVr0vlzWGCBZZTID2YSx5hIZ2d5jt
         vfwddBz7KI9Xu83qwImC/DLzLMx9HXK+sliXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698154; x=1754302954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrHj74Vs5mwVssiFvTjNXcTxY80y/wM7UHeNbZbXCqk=;
        b=b1x2G9d3U/AHbav2r97jOgXlmQuYiUd0UWRE7QDk0bRB3WpUGgPehVV7x86YKPp+xZ
         0USUnGinwcmj8ZSSwDOv3vecV+pO/iizKv3RX6CMET6cTEZevugQkE76mCNmnpIdKUVs
         q+H9+6epjP1HuVYQbq8zfOW0t9w3IN56TYbWX7Nj25usSQApNCShzDn/Q24lfZ1zwAqy
         2mbMui6JOEcA3a41eB5D1hDBTvnl5KLBuOAy7c/vJEkcnxfur1nFWoMztAIqtR3VHK5l
         w6Y5Tzog8csysQWJWfTqoVH+KTMbQxqG2fh2i29Pb4hNQKoLeFFuiCAAG4gTAFRH8vtx
         iT4A==
X-Gm-Message-State: AOJu0YxOFNiUjKjHj3tBEs8BKyKp0qLXoSIcXnIclS6KPiHoHuvBmekM
	U/ImnAfCa9zY7qpJzoITk+4tLDvb9KoUs1zPc6rk+euOLMd+SeaiBwrDbpLI/HoqXu8KQoj7dBa
	ZOk1FJyVYubH2nkMhi7vK3na/KtpZXSPeXKVf9ibT9w==
X-Gm-Gg: ASbGncv3Oy5rS0GU8m6H25E4PMTKqhgavGNIcqbTYEoIv6hNzskr/b6MtihqDsa1ki2
	x9qHDHundD0LhEsn85pYYimP0v9A1vATG1lpepelfcZ2FobVDAcJVBE9F2dzUz+g63G3nqwqNa6
	mC6+SajxtlzDlNdFS75i2U0zUX6hdMRo5jqGig/KllVcpZpvlGMw+kZ9QOOsFp+99kp9Jfi/xTL
	biTQUe8hA==
X-Google-Smtp-Source: AGHT+IF5LMf91IVhUo/R1eV7fAzZGeDe2iNP//gydclgQ9Y6L42ekoLd3QnHYwSzFEGDkofR24H7I5idFVmoNkRV7dA=
X-Received: by 2002:a05:6122:178c:b0:531:4708:3d45 with SMTP id
 71dfb90a1353d-538db5e207dmr3394110e0c.10.1753698154014; Mon, 28 Jul 2025
 03:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753372928.git.edwin.torok@cloud.com> <80e7ae8bc1546b004e2b3dcc3f3e57563ff741d2.1753372928.git.edwin.torok@cloud.com>
 <0cd10fcf-d017-4a85-b248-e29e77903349@citrix.com>
In-Reply-To: <0cd10fcf-d017-4a85-b248-e29e77903349@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 28 Jul 2025 11:22:23 +0100
X-Gm-Features: Ac12FXwH-Ci05JqebbI7DsCvdY6qtE-y2r4q7vtjhAGXa1HfzSMuIHrR6Acz9bk
Message-ID: <CAEfZLvk6nr6h3D9bX+r210A3hmrybmrzUXPbE2ApXbY4H_nbCg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/10] pmu.h: add a BUILD_BUG_ON to ensure it fits
 within one page
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, andriy.sultanov@vates.tech, 
	boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 11:21=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 25/07/2025 4:06 pm, Edwin T=C3=B6r=C3=B6k wrote:
> > Linux already has a similar BUILD_BUG_ON.
> > Currently this struct is ~224 bytes on x86-64.
> >
> > No functional change.
> >
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> > ---
> >  xen/arch/x86/cpu/vpmu.c  | 1 +
> >  xen/include/public/pmu.h | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> > index c28192ea26..7be79c2d00 100644
> > --- a/xen/arch/x86/cpu/vpmu.c
> > +++ b/xen/arch/x86/cpu/vpmu.c
> > @@ -401,6 +401,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
> >      uint8_t vendor =3D current_cpu_data.x86_vendor;
> >      int ret;
> >
> > +    BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
> >      BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_S=
Z);
> >      BUILD_BUG_ON(sizeof(struct xen_pmu_amd_ctxt) > XENPMU_CTXT_PAD_SZ)=
;
> >      BUILD_BUG_ON(sizeof(struct xen_pmu_regs) > XENPMU_REGS_PAD_SZ);
>
> This is fine (even if it ought to be elsewhere, but don't worry about tha=
t).
>
> > diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
> > index af8b7babdd..15decc024d 100644
> > --- a/xen/include/public/pmu.h
> > +++ b/xen/include/public/pmu.h
> > @@ -93,6 +93,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_params_t);
> >   * Architecture-independent fields of xen_pmu_data are WO for the hype=
rvisor
> >   * and RO for the guest but some fields in xen_pmu_arch can be writabl=
e
> >   * by both the hypervisor and the guest (see arch-$arch/pmu.h).
> > + *
> > + * PAGE_SIZE bytes of memory are allocated.
> > + * This struct cannot be larger than PAGE_SIZE.
>
> This isn't.  Xen's PAGE_SIZE is not necessarily the same as PAGE_SIZE in
> the guest consuming this header.
>
> This highlights one of the problems that Xen's ABI entrenches.  Being
> x86-only, it's 4k in practice, but there's no easy solution.
>
> I'd just skip this comment.  Anything else is going to get tied up in
> unrelated bigger problems.

Thanks, I'll drop this comment in the next version of the series.

--Edwin

