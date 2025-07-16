Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42FB06C7B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 05:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044799.1414842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubtC1-00033b-Gh; Wed, 16 Jul 2025 03:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044799.1414842; Wed, 16 Jul 2025 03:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubtC1-00031I-DF; Wed, 16 Jul 2025 03:52:29 +0000
Received: by outflank-mailman (input) for mailman id 1044799;
 Wed, 16 Jul 2025 03:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzu4=Z5=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ubtBz-00031C-L5
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 03:52:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48503d5a-61f8-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 05:52:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2A4BA572B9
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 03:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2EDC4CEF9
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 03:52:23 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-558f7fda97eso3973392e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 20:52:23 -0700 (PDT)
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
X-Inumbo-ID: 48503d5a-61f8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752637943;
	bh=kbKYP37k7zLxmRSGbkuGEEJMcz1AsBvMEBjt1v4DxZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fnbyNZ/uofGXdgO7Yr2YWSNB67zbnOFOQ+pTadx543mwEWroEHJc4Ic64pAA3Z/11
	 UGhzH/VIGx0r+EL5bHdyNhfO5qenQAGqdqQXc4sMTG4jO0oHJB6QDFPWPfsXbCmZlH
	 WLBqi80urwpHRK2uEhCd3hCdgh6UPIlGy7x1ES23qXjUPSoX9k+ltIj0Bj+U9ncrzV
	 77QMIdVHowgEY/FSjC0zrhqNhEDFdeSB2r9kmK+gvSIfE4jKLfBHdQ6Ootdl1piht0
	 uqH/qfLzgFHH1RUJtKWlIjdcG5PtZLDK0INZv9ODqbHmZUtQvuXb2pJVrnQ+w0d2FI
	 XTSf8/KvR6vrg==
X-Forwarded-Encrypted: i=1; AJvYcCXkxwOJNMWjJbKqHOKiJsERcHWZsKn9bJnOQgDPgfzxtaSgJmq+bbs0gZIxA/NfUFh1k++oGC6sBPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRExWOv1NP7KwY3YI2JZmqUMs6IQALMr0ePhWXQAdJiUv4/+xy
	T6syeI/GBTAao0S+M4gSfklky5+3PHAfjtclJ7xDFAypjGLHYjdOkMBgtM95STICVBgvn+Hhcwu
	aiFzqBvK4F/KQUVYf2TYMRu+ZMLdN6to=
X-Google-Smtp-Source: AGHT+IGsx+1eBRK7VlvwwK4lrn2tedS/8CBhSaETgUda6ZBIDw8ZzbYDB45sUI1HO8Bko2rjpL9ZJH4DB6I0F9C6dzg=
X-Received: by 2002:a05:6512:3416:b0:553:ae05:9c48 with SMTP id
 2adb3069b0e04-55a23fa8c7amr357898e87.45.1752637941719; Tue, 15 Jul 2025
 20:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
 <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com> <aHZsohPoxLYML___@sunil-laptop>
In-Reply-To: <aHZsohPoxLYML___@sunil-laptop>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 16 Jul 2025 13:52:09 +1000
X-Gmail-Original-Message-ID: <CAMj1kXF+AP-3hKb8vJQ3oCoPxmEG=udexNCxMLvGE_KHCKcZxw@mail.gmail.com>
X-Gm-Features: Ac12FXyJHyI8FNCWondq-usX0O9Wq8IR0GvzToxJvHq2L_BDfrGw4oT1HSN0fVw
Message-ID: <CAMj1kXF+AP-3hKb8vJQ3oCoPxmEG=udexNCxMLvGE_KHCKcZxw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-arm-kernel@lists.infradead.org, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bibo Mao <maobibo@loongson.cn>, 
	linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 00:58, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Tue, Jul 15, 2025 at 01:29:15PM +1000, Ard Biesheuvel wrote:
> > On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > >
> > > On 7/14/25 08:08, Ard Biesheuvel wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Using EFI runtime services to program the RTC to wake up the system is
> > > > supported in theory, but rarely works in practice. Fortunately, this
> > > > functionality is rarely [if ever] used to begin with so we can just drop
> > > > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > > > CMOS rtc directly)
> > >
> > > The main problem I see with firmware offering access to the RTC via UEFI
> > > services is that two different drivers, the firmware one and the Linux
> > > one might be trying to access the same busses or registers which might
> > > lead to unexpected results.
> > >
> > > Recently there was a discussion in the RISC-V technical group for the
> > > server platform specification where the same issue was discussed
> > > concerning SetTime().
> > >
> > > As a UEFI firmware should not care which operating system is booted, it
> > > should be up to the OS to disable EFI access to the RTC if it has native
> > > access.
> > >
> > > Could we disable all the EFI services for the RTC in Linux dynamically
> > > when an RTC driver is successfully probed?
> > >
> >
> > I don't think this would be the right way to do it.
> >
> > It also depends on whether ACPI or DT is being used to describe the
> > platform to the OS.
> >
> > ACPI does not support describing the RTC device, so it should provide
> > the EFI services.
> >
> Hi Ard,
> IIUC, TAD is defined for this purpose, right?
> https://uefi.org/specs/ACPI/6.6/09_ACPI_Defined_Devices_and_Device_Specific_Objects.html#time-and-alarm-device
>
> > DT can describe the RTC device directly, so I think it is acceptable
> > for such firmware to mark all RTC routines unsupported in the RT_PROP
> > table, and just expose the RTC device directly.
> >
> > The OS shouldn't have to reason about these things: it is up to the
> > platform to describe itself unambiguously.
>
> I agree. But I think even with ACPI, EFI GetTime/SetTime can return
> unsupported if there is a TAD exposed with proper _GRT/_SRT and _GCP.
>

Thanks for the pointer. This device did not exist yet when I last
looked at this stuff.

So it seems like TAD is a suitable way for exposing a RTC to the OS
without the need for a hardware specific driver. However, the existing
Linux driver does not appear to support get/set time, and is not
hooked up to the RTC subsystem [yet].

