Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87BB04EE8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 05:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043335.1413459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubWMI-0003na-65; Tue, 15 Jul 2025 03:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043335.1413459; Tue, 15 Jul 2025 03:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubWMI-0003lv-3R; Tue, 15 Jul 2025 03:29:34 +0000
Received: by outflank-mailman (input) for mailman id 1043335;
 Tue, 15 Jul 2025 03:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qpRk=Z4=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ubWMG-0003lp-Vy
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 03:29:32 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea7c2278-612b-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 05:29:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C8192467F1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD501C4CEF5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 03:29:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-555024588b1so5616351e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 20:29:28 -0700 (PDT)
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
X-Inumbo-ID: ea7c2278-612b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550168;
	bh=ieqd6xCHgI1ZHPQbWmrk7Nb+/qzuOEd8qzdDp3KdSmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b1H6MnsWja4+R/HGgp9tU9geJmQM3bS+T64RZtg6NFD+ynaIvQfKgLfZf9wFIQMFw
	 IEpBUdkrm3FNoiP0THEolt5J0qPGPi+XaiYUIKpViM0PEydXydu69aXClbW1kC0xKD
	 7JUh792Zp8v8r6oGDOmlPdLygPejN/QbXadKp3Cbs1EmM7s5hknoWmpnwwmetGDygw
	 T6eNIrkIRciU2Utnv1UBAZfPOojItTM8l0pnhPXGWHQIvXh4uX/WDMl8i8a/k/dKSg
	 yyRO3jqQ4zi0F9Ugl6CU4fuIXbAGo/rYgZLFmgVhaPTku1dFREHd6pT5oKhurk/jP+
	 JytHwh6zZkQAg==
X-Forwarded-Encrypted: i=1; AJvYcCWu2M0rg7g83KGoaEyjEL70eIoLUbnWjJJoEus8p+GGhSxWZKqPcIL+xUs3gWvKw8rmo8AZ6YAP9/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/Q1ESdgYV4MvsvkYlWYLjtwemSzznXuohHPS1RLcvLtTNSrpr
	emnoEas3lFY8xSWfNGgeWjs6eSPVL5vw+c0rcQSWiCJlNuy1HtjHtSWDgcgBMsam1iTS7OyJqm9
	ltaovx+W3FSmwp5khp/CT/IuWQorKfNA=
X-Google-Smtp-Source: AGHT+IFIz1rDkWifGEuRDAIW8VnNdmTc2Z0VIxz+qevBW3febeLf9zJqzx1t6qVV2NjD4iuG6fjmMDCJiXdzlUbsY78=
X-Received: by 2002:a05:6512:39c3:b0:553:2fec:b139 with SMTP id
 2adb3069b0e04-55a044ec444mr5090549e87.24.1752550166947; Mon, 14 Jul 2025
 20:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
In-Reply-To: <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Jul 2025 13:29:15 +1000
X-Gmail-Original-Message-ID: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
X-Gm-Features: Ac12FXyPeU_gWXO9-8if9ZFnLW7qkSAVnhXpIQ13tyFhKHPmacdG9H_jV_FpMvQ
Message-ID: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 7/14/25 08:08, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Using EFI runtime services to program the RTC to wake up the system is
> > supported in theory, but rarely works in practice. Fortunately, this
> > functionality is rarely [if ever] used to begin with so we can just drop
> > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > CMOS rtc directly)
>
> The main problem I see with firmware offering access to the RTC via UEFI
> services is that two different drivers, the firmware one and the Linux
> one might be trying to access the same busses or registers which might
> lead to unexpected results.
>
> Recently there was a discussion in the RISC-V technical group for the
> server platform specification where the same issue was discussed
> concerning SetTime().
>
> As a UEFI firmware should not care which operating system is booted, it
> should be up to the OS to disable EFI access to the RTC if it has native
> access.
>
> Could we disable all the EFI services for the RTC in Linux dynamically
> when an RTC driver is successfully probed?
>

I don't think this would be the right way to do it.

It also depends on whether ACPI or DT is being used to describe the
platform to the OS.

ACPI does not support describing the RTC device, so it should provide
the EFI services.

DT can describe the RTC device directly, so I think it is acceptable
for such firmware to mark all RTC routines unsupported in the RT_PROP
table, and just expose the RTC device directly.

The OS shouldn't have to reason about these things: it is up to the
platform to describe itself unambiguously.

