Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A1B036E9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 08:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042534.1412581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubCXq-0000uY-H9; Mon, 14 Jul 2025 06:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042534.1412581; Mon, 14 Jul 2025 06:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubCXq-0000sp-E8; Mon, 14 Jul 2025 06:20:10 +0000
Received: by outflank-mailman (input) for mailman id 1042534;
 Mon, 14 Jul 2025 06:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dG/o=Z3=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ubCXp-0000sj-HM
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 06:20:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95c19fd8-607a-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 08:20:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8471960EDF
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 06:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D432C4CEF6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 06:20:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-553b5165cf5so4840895e87.0
 for <xen-devel@lists.xenproject.org>; Sun, 13 Jul 2025 23:20:05 -0700 (PDT)
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
X-Inumbo-ID: 95c19fd8-607a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752474005;
	bh=606fsEOf3GOJX8AxMnc5SbWlI62YxfGkSD/kQ0qCCvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uli+yctbio2KJL40Z0sJCpobKSwWMS/q9w1hC7hZxQO+Y+Yg03V3qCxrNzGbmBH/k
	 xDHWt/WbWnRin3S1wBbDlOUnsd1qGPShPPfsRnU8gPpt5m+va+KWqTlPxVHkID+bA5
	 MPc/KMYSYYLOnAEyZp5ltOLX3deIij8UmOcLkDBpSom6eSqy6g9GV93wcRbjUuKmvN
	 Cisa9PX+i5dXi81XjVqFnQr/GkDJjE0ePHxWYAS/Jb3ioh613e2GxXXC45UvWqxRRI
	 24MWxqdO6M6ayoJpoGGkhfi+RvhPDuunG/Mj3Dv4sHw+1DTDFTfKpJ6xsFQllw8/N6
	 e/WJNUS9XoO8w==
X-Forwarded-Encrypted: i=1; AJvYcCVRps/DAlGlKRQ5Tr3Fvcs6905sbYjrkvHor/h2RxtcRjv6DiKojMxnzlZ6uPScG+0Dc0MiBGsF2e4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbpGKUR011DLZPSSKErLaVuM5+5+8AoAlY40KB4NDd/d6zRLWC
	oxqL5I5UC5cyxjjgtqHG//QC3wCwxEmtAbBtFw/pFaP/vtZeKryOyC3HadE4MjlqJET4gmFTcWi
	+F7qN1wT2Fs8CzOLuNjqqYodm6iodjrc=
X-Google-Smtp-Source: AGHT+IE2y+mnn6gRDYyvRcFjRA9M/TcvC+Yv7itcf8PEq8SUCnfludPIC0L+2CId0IaAy39lcVu+VQplF3E0k6RCiek=
X-Received: by 2002:a05:6512:3048:b0:553:5135:6a0e with SMTP id
 2adb3069b0e04-55a057c3971mr3597796e87.4.1752474003585; Sun, 13 Jul 2025
 23:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-6-ardb+git@google.com>
 <dade7d17-d45d-455e-a43c-01e9ea95c3b4@gmail.com>
In-Reply-To: <dade7d17-d45d-455e-a43c-01e9ea95c3b4@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 16:19:52 +1000
X-Gmail-Original-Message-ID: <CAMj1kXETDd+19i+awMx1v1sE4RXhF-r2a-mTa3rWfus5s4HMmw@mail.gmail.com>
X-Gm-Features: Ac12FXyqdPXKdPkXKcrHisnGj_9A8qao-_Ean6Zn-muhfOH0lpX7Li9QylqqJXw
Message-ID: <CAMj1kXETDd+19i+awMx1v1sE4RXhF-r2a-mTa3rWfus5s4HMmw@mail.gmail.com>
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

On Mon, 14 Jul 2025 at 16:13, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>
> On 7/14/25 02:08, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The EFI rtc driver is used by non-x86 architectures only, and exposes
> > the get/set wakeup time functionality provided by the underlying
> > platform. This is usually broken on most platforms, and not widely used
> > to begin with [if at all], so let's just remove it.
> systemd uses the underlying functionality: a timer can wake the system up.
> I have no idea if that is implemented in terms of this function, though.

To be clear, you are referring to wake from poweroff at some date/time
in the future, right?

This change does not remove this functionality from the RTC subsystem,
it just ceases to expose it on non-x86 EFI platforms that claim to
support it.

For reference (which I should have included in the cover letter) [0],
there are arm64 server systems which always return an error when
calling this API, and most non-server arm64 systems do not implement
it to begin with.

The patch in question implements one of the workarounds that was
considered, which is to invoke GetWakeupTime() when registering the
RTC, and disable the wakeup functionality if that fails. However, that
call by itself could easily regress other platforms, where
GetWakeupTime() was simply never called before, and where calling it
may tickle other bugs.

Hence this RFC: if nobody uses this API on non-x86 EFI platforms, then
I'd rather not support it to begin with.



[0] https://lore.kernel.org/all/20250710084151.55003-1-feng.tang@linux.alibaba.com/T/#u

