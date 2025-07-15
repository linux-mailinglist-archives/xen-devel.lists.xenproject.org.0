Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E465B06237
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 17:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044479.1414570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubh9r-0007We-6u; Tue, 15 Jul 2025 15:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044479.1414570; Tue, 15 Jul 2025 15:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubh9r-0007V9-4D; Tue, 15 Jul 2025 15:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1044479;
 Tue, 15 Jul 2025 14:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8f6G=Z4=ventanamicro.com=sunilvl@srs-se1.protection.inumbo.net>)
 id 1ubh7V-00067C-00
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 14:59:01 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1fa38b-618c-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 16:58:55 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-747fba9f962so4581677b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 07:58:55 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1b6fbsm12327709b3a.84.2025.07.15.07.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
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
X-Inumbo-ID: 3a1fa38b-618c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752591534; x=1753196334; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=EulwwaAoIYQjny1BMDPPonUWa/G2Vvt3gtOVazSaE1kSR0aW/ZtQyxZTTKazqMdnT4
         0XYexjxS43sw9aHY0HaDWaPDngtGVIg+cIHiCJKMYcCGR6njQ1XOn1Sjnm/VKwwne4fR
         p3O7dindK+FUB+bsrL/NAFxqnuMf5cdzf768n1NNeDFjQtR5MMfpaOpIf4FtlwdU8sb2
         e3WBfXtxOkhhZbi7ZeM1KZmCzjJHegKLoNceUVXN/Th4i6k8uBqSVSsxHmic7dqQNdcr
         vUMJ8Ae82QUrPWMqNWx8ERhyVeW3aYiQi23WA9ucDL5ZsCgpa+cgaqBDTRJQCgM8JGIO
         y+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752591534; x=1753196334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=T3op/Xb2cW7MuSm4ASuhgwPD5F1jq2DwaNT4sQ1FP03C+1apL4tU1iGF/D2MEQabSd
         3E6GTDhpWRyDcDHIKRsNLJCeqwFol5HjAjBbxJ/qt1M/s3Yf26hTf+KJStylBdF9yo1W
         F6XNiOysAX1b9xZETnJxfLhDIB1wRttrUDUcA+yCgynfwdT7KzYnS7O8eYAJ6CIXT7Gd
         Soqqd222P/7v1YxdusEVwRILHpP6jfl5P177Cl9R4D9VCaIkawRqgCmgGZBZsjNYJRs9
         Pwee35Yj00/bkDfliYVh5gxZVuJJ1E3MgoxJY2OpQBRmitdy6rw3OzrpMBI0Fc8HbTdA
         9v7A==
X-Forwarded-Encrypted: i=1; AJvYcCX9qdC3xl7H3W6fcM3FGYP8Qc/hwsDmkA9yLmMSJgzU51okHqzlC/yApNNvM0fYkpBK2Aitk2hzFEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD5gzl9A3cD0EPkoA4lBingYeCLUho5TOESmXQLn/0sc/0pHVX
	h14sODsQwm2QtU5MU+h+tEuQCq8/OYhIGurZRcAoNCqU3j6Rb5EanTzLNGPsXwla6hc=
X-Gm-Gg: ASbGncsTR9uwsfP+qNPpfapSC6mBQZkhsPQKpXW7qSAmxJb7iKCApgCpjj29HIod7Va
	MnBOTUOsl2N4X6FCfG5A0iYFxm2ffKuFDteebCoEurOLlfiy/g04ZipF1UqI6QomQJdVdUSUgFq
	kb9sU6jX2aw45YYZBRPIsOHb6bTM9/zjbflwNmxblyJWkWutB5TPzSQ5KPcj+y8UQcy/u6ZzUTS
	ob+yZ66JgxZrxvlm6EFONj+5uPpgxxF7N+wrCYhljuGOAX8khaT5Rib0pUh3XW2jGDqGf0lY130
	J1BGafSOp615cWAB8bD7W7C1ebErgI43S1XgvjHAWZ38o1R21wRvfVTSiKGUF13buEsSuVa9vVv
	yU9/1TxZ5s06AHqY0TONR7h4V1AVaKQ==
X-Google-Smtp-Source: AGHT+IGWqmTNcmPppTn41XmZxoBqwnqg0u0bN/W4bU7UhI4lYpV4O4cn1UsFVwKVvFBue7Ekoyiq4A==
X-Received: by 2002:a05:6a00:ad0:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-75584eb932emr5340905b3a.10.1752591533903;
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:28:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
Message-ID: <aHZsohPoxLYML___@sunil-laptop>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
 <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>

On Tue, Jul 15, 2025 at 01:29:15PM +1000, Ard Biesheuvel wrote:
> On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > On 7/14/25 08:08, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Using EFI runtime services to program the RTC to wake up the system is
> > > supported in theory, but rarely works in practice. Fortunately, this
> > > functionality is rarely [if ever] used to begin with so we can just drop
> > > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > > CMOS rtc directly)
> >
> > The main problem I see with firmware offering access to the RTC via UEFI
> > services is that two different drivers, the firmware one and the Linux
> > one might be trying to access the same busses or registers which might
> > lead to unexpected results.
> >
> > Recently there was a discussion in the RISC-V technical group for the
> > server platform specification where the same issue was discussed
> > concerning SetTime().
> >
> > As a UEFI firmware should not care which operating system is booted, it
> > should be up to the OS to disable EFI access to the RTC if it has native
> > access.
> >
> > Could we disable all the EFI services for the RTC in Linux dynamically
> > when an RTC driver is successfully probed?
> >
> 
> I don't think this would be the right way to do it.
> 
> It also depends on whether ACPI or DT is being used to describe the
> platform to the OS.
> 
> ACPI does not support describing the RTC device, so it should provide
> the EFI services.
> 
Hi Ard,
IIUC, TAD is defined for this purpose, right? 
https://uefi.org/specs/ACPI/6.6/09_ACPI_Defined_Devices_and_Device_Specific_Objects.html#time-and-alarm-device

> DT can describe the RTC device directly, so I think it is acceptable
> for such firmware to mark all RTC routines unsupported in the RT_PROP
> table, and just expose the RTC device directly.
> 
> The OS shouldn't have to reason about these things: it is up to the
> platform to describe itself unambiguously.

I agree. But I think even with ACPI, EFI GetTime/SetTime can return
unsupported if there is a TAD exposed with proper _GRT/_SRT and _GCP.

Thanks,
Sunil

