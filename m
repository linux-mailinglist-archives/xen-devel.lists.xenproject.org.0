Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F067DB0373C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 08:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042553.1412602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubCld-0003zr-UD; Mon, 14 Jul 2025 06:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042553.1412602; Mon, 14 Jul 2025 06:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubCld-0003yQ-RV; Mon, 14 Jul 2025 06:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1042553;
 Mon, 14 Jul 2025 06:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dG/o=Z3=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ubClc-0003yK-SS
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 06:34:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93bf8bcf-607c-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 08:34:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 79FA160053
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 06:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3118BC4CEED
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 06:34:21 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-32b595891d2so31303691fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Jul 2025 23:34:21 -0700 (PDT)
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
X-Inumbo-ID: 93bf8bcf-607c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752474861;
	bh=ynfzJ9dsAps2aTd6f/tPXnxcet4bhZr25ybz3JfD7/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kEJvLVQkjY7hRn/K87feYU0o9wfLcoFoQapbEzji/H3oVgosLIR+n/zpshU8j5xPx
	 cnTymersGd/N+1mHqJ3BKGWRQrcT85aRPAwcP/faI8e5poEh4ZkWHMwaVBKocHO+rc
	 dLlEMs5vxTbWhanxYLW+okfeFmBQsBMdx563LZdcvTyj2iv+aiVsVXtnqPaTwDI3J5
	 Ad4wSY0s6HRoT9uqxSgF5lXh8e2IN8+z1k96CRC4nfbcNwzS/6YDJxQqc+sBU8hMEi
	 vOLX3wP8hDRXfWv7ELSL3IU03zRlrE1pWJntsOZb60EXxyqcIuI5/EbVfSlwDO+8oX
	 OGL6/yKjUUb0A==
X-Forwarded-Encrypted: i=1; AJvYcCUjOLKaZm1U9mKpnMns/nvbR1KxT+3fwmvKQ8rFH70zwQllYextr1xWj5qeFwc00uf+8PA5kdmSm8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGnYzr2KLwR18Bcl6AwkkxULcqh+y4L54ZveSzFCLXjCab7dr0
	SR7NdxHXKNe/ZIsccZ2P3Ig4xENx9n/iGu45CiunMSptCBcQg1U4YaCCK7s94phHPtEXzfDeFZr
	qX4NLHuP4KF0G2Gslc4KAdiDDosUTzVA=
X-Google-Smtp-Source: AGHT+IEy4x7iRPRFME+dpdQyQI1jtmLIqNYRLMk1ojNaRg715rzBCM8Q86llYRAXa+twgNvvkR8qSO1icXiwfjuZzv0=
X-Received: by 2002:a2e:a7ca:0:b0:32b:80e1:300d with SMTP id
 38308e7fff4ca-33053186d88mr35999851fa.0.1752474859585; Sun, 13 Jul 2025
 23:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-6-ardb+git@google.com>
 <dade7d17-d45d-455e-a43c-01e9ea95c3b4@gmail.com> <CAMj1kXETDd+19i+awMx1v1sE4RXhF-r2a-mTa3rWfus5s4HMmw@mail.gmail.com>
 <f538a1b9-6a7c-474f-af2a-d87c35b82fc5@gmail.com>
In-Reply-To: <f538a1b9-6a7c-474f-af2a-d87c35b82fc5@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 16:34:08 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGG0Mi+AT7ZeoHLTDhVbbahP-PLRgY1=aSZMVQEgWz5sQ@mail.gmail.com>
X-Gm-Features: Ac12FXzYFywZb16ZKDUVBGm4_KFbnsnrDO10Xk4vWwqGRcRLn5B3XWIM87WiCT4
Message-ID: <CAMj1kXGG0Mi+AT7ZeoHLTDhVbbahP-PLRgY1=aSZMVQEgWz5sQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 16:22, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>
> On 7/14/25 02:19, Ard Biesheuvel wrote:
> > On Mon, 14 Jul 2025 at 16:13, Demi Marie Obenour <demiobenour@gmail.com> wrote:
> >>
> >> On 7/14/25 02:08, Ard Biesheuvel wrote:
> >>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>
> >>> The EFI rtc driver is used by non-x86 architectures only, and exposes
> >>> the get/set wakeup time functionality provided by the underlying
> >>> platform. This is usually broken on most platforms, and not widely used
> >>> to begin with [if at all], so let's just remove it.
> >> systemd uses the underlying functionality: a timer can wake the system up.
> >> I have no idea if that is implemented in terms of this function, though.
> >
> > To be clear, you are referring to wake from poweroff at some date/time
> > in the future, right?
>
> Yes.
>
> > This change does not remove this functionality from the RTC subsystem,
> > it just ceases to expose it on non-x86 EFI platforms that claim to
> > support it.
>
> Do these platforms generally expose the functionality in a different way?

On x86, the CMOS rtc is manipulated directly (and this is officially
condoned by the EFI spec).

On non-x86, this functionality rarely works, which is really the point
of this series.

> If not, systemd should probably document that the functionality is
> non-portable if it doesn't do that already.

Not sure what you mean by non-portable. This functionality should be
exposed in a generic manner (using the RTC subsystem interfaces), but
only if it can be relied upon. On x86, the RTC subsystem will use the
rtc-cmos driver, which implements the wakeup routines in terms of port
I/O.

If removing this functionality altogether from the EFI rtc driver is a
problem, perhaps it would be better to implement an allowlist based
solution that does not attempt to access the runtime services by
default.

