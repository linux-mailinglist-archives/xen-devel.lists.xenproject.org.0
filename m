Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1177A7D2E24
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621149.967290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurBG-0004UJ-Iz; Mon, 23 Oct 2023 09:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621149.967290; Mon, 23 Oct 2023 09:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurBG-0004RX-GF; Mon, 23 Oct 2023 09:25:02 +0000
Received: by outflank-mailman (input) for mailman id 621149;
 Mon, 23 Oct 2023 09:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qurBE-0004Ph-Sd
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:25:00 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 093e4f57-7186-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:24:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so451143666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:25:00 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vl9-20020a170907b60900b00989828a42e8sm6283313ejc.154.2023.10.23.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:24:58 -0700 (PDT)
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
X-Inumbo-ID: 093e4f57-7186-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698053099; x=1698657899; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5cNmQveScnM3+/LyNqB5VGLK1XIS1epQSyeLaJQ+J/o=;
        b=CG2bTLzqAw0xc9/hIDwqucGWF7ikh4h92PLnmfqFGzM6OHEzg0bqZQVYYs4vnd/0tb
         D5US/Jh39BulylCphxspO7RaRxqcto27MHetYKrLhor5Iwpg4STxpt6ssAD3SPCScLyb
         JKd0NekjheKfP/hrIlr0+4opNHtqhWunCLsURQzC0Db8OkBsFaKY4y/KOhXFzl3uuk1E
         t7vFWvLzOzQn7TuB04AvQ2vV3ciIx/rJb5BYrCjfUxCNIlSXpYIz/EEtBGw1JgqJOIjX
         t0E6zK3qIdqHMwzSP5n3YmwUN7yHa1uOEtNixqdfd3b+vkFs4EHmcmvCBB0kERl3MBR4
         2I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698053099; x=1698657899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cNmQveScnM3+/LyNqB5VGLK1XIS1epQSyeLaJQ+J/o=;
        b=VA0Iw3Ul1UKAAjPDnp7fiNeOGSgmOwbWOlkvIiGyPoUNAMD/2HlErAcE/HeiD/rB/a
         mgaPeL7WexKlEtIjgPickJFWVu5bp6NoCh3j83OIbbJ/rD4g7h2Hme5sG0/XkmKd9pwE
         bIbnBR9wBgaGHof9MOdbNnb0VTRHV+lTqbw43eIpSQkLwRHtGRhTv+u30uD9+DHLU36v
         FV/oNdU8ilUzf8fT/ASSymHnlg7ifhm/EwF1AZaw1xRhPSPp5AmjeJlF9VcLDSvKWZiK
         DPbClHc6HAXR2algLm3RGy/HQt2N43l5L2gk5dN9eS7V2TEolq2iASTzNkwbg7214mCn
         oUOQ==
X-Gm-Message-State: AOJu0YwTtQNMeDABXuPdXrPKcZyLLceXLAsPem1h1vJT0Erd0KKBZNyX
	sAKzzzh4OaBXLuCxMfDQUS4=
X-Google-Smtp-Source: AGHT+IHrCTTNwkakWXjnoqyL+TJ/zJf3dEOOrwGacIq8ytSLKtl+KmmKoJyRncRx7RcVDzijJZ4fMQ==
X-Received: by 2002:a17:907:9815:b0:9bf:792:d696 with SMTP id ji21-20020a170907981500b009bf0792d696mr5365821ejc.46.1698053099136;
        Mon, 23 Oct 2023 02:24:59 -0700 (PDT)
Message-ID: <bfce8768c96580bab91101138f2ac325b9e91c6d.camel@gmail.com>
Subject: Re: [PATCH v1 00/57] Enable build of full Xen for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 12:24:55 +0300
In-Reply-To: <19065f09-e278-5471-eff7-1dd3b855a9aa@suse.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
	 <19065f09-e278-5471-eff7-1dd3b855a9aa@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 13:53 +0200, Jan Beulich wrote:
> On 16.08.2023 12:19, Oleksii Kurochko wrote:
> > This patch series performs all of the additions necessary to drop
> > the
> > build overrides for RISCV and enable the full Xen build. Except in
> > cases
> > where compatibile implementations already exist (e.g. atomic.h and
> > bitops.h), the newly added definitions are simple.
> >=20
> > Also the patch series has open question described in the patch 57
> >=20
> > Patch 56 is only needed for test purposes and will be removed.
> >=20
> > Oleksii Kurochko (57):
> > =C2=A0 xen/riscv:introduce asm/byteorder.h
> > =C2=A0 xen/riscv: add public arch-riscv.h
> > =C2=A0 xen/riscv: introduce spinlock.h
> > =C2=A0 xen/riscv: introduce fence.h
> > =C2=A0 xen/riscv: introduce arch-riscv/hvm/save.h
> > =C2=A0 xen/riscv: introduce paging.h
> > =C2=A0 xen/riscv: introduce asm/cpufeature.h
> > =C2=A0 xen/riscv: introduce asm/device.h
> > =C2=A0 xen/riscv: introduce asm/event.h
> > =C2=A0 xen/riscv: introduce asm/grant_table.h
> > =C2=A0 xen/riscv: introduce asm/guest_atomics.h
> > =C2=A0 xen/riscv: introduce asm/hypercall.h
> > =C2=A0 xen/riscv: introduce asm/iocap.h
> > =C2=A0 xen/riscv: introduce asm/iommu.h
> > =C2=A0 xen/riscv: introduce asm/mem_access.h
> > =C2=A0 xen/riscv: introduce asm/nospec.h
> > =C2=A0 xen/riscv: introduce asm/pci.h
> > =C2=A0 xen/riscv: introduce asm/random.h
> > =C2=A0 xen/riscv: introduce asm/setup.h
> > =C2=A0 xen/riscv: introduce asm/system.h
> > =C2=A0 xen/riscv: introduce asm/xenoprof.h
> > =C2=A0 xen/riscv: introduce bitops.h
> > =C2=A0 xen/riscv: introduce flushtlb.h
> > =C2=A0 xen/riscv: introduce asm/percpu.h
> > =C2=A0 xen/riscv: introduce asm/smp.h
> > =C2=A0 xen/riscv: introduce asm/atomic.h
> > =C2=A0 xen/riscv: introduce cmpxchg.h
> > =C2=A0 xen/riscv: introduce asm/io.h
> > =C2=A0 xen/riscv: introduce asm/hardirq.h
> > =C2=A0 xen/riscv: introduce div64.h
> > =C2=A0 xen/riscv: define bug frame tables in xen.lds.S
> > =C2=A0 xen/riscv: introduce bit operations
> > =C2=A0 xen/riscv: introduce asm/altp2m.h
> > =C2=A0 xen/riscv: introduce asm/delay.h
> > =C2=A0 xen/riscv: introduce asm/domain.h
> > =C2=A0 xen/riscv: introduce asm/guest_access.h
> > =C2=A0 xen/riscv: introduce asm/irq.h
> > =C2=A0 xen/riscv: introduce asm/monitor.h
> > =C2=A0 xen/riscv: introduce asm/numa.h
> > =C2=A0 xen/riscv: introduce asm/p2m.h
> > =C2=A0 xen/riscv: introduce asm/regs.h
> > =C2=A0 xen/riscv: introduce asm/softirq.h
> > =C2=A0 xen/riscv: introduce asm/time.h
> > =C2=A0 xen/riscv: introduce asm/vm_event.h
> > =C2=A0 xen/riscv: add definition of __read_mostly
> > =C2=A0 xen/riscv: define an address of frame table
> > =C2=A0 xen/riscv: add required things to asm/current.h
> > =C2=A0 xen/riscv: add minimal stuff to asm/page.h to build full Xen
> > =C2=A0 xen/riscv: add minimal stuff to asm/processor.h to build full Xe=
n
> > =C2=A0 xen/riscv: add minimal stuff to asm/smp.h to build full Xen
> > =C2=A0 xen: add RISCV support for pmu.h
> > =C2=A0 xen: add necessary headers to common to build full Xen for RISC-=
V
> > =C2=A0 xen/riscv: add minimal stuff to asm/mm.h to build full Xen
> > =C2=A0 xen/rirscv: add minimal amount of stubs to build full Xen
> > =C2=A0 xen/riscv: enable full Xen build
> > =C2=A0 test only riscv
> > =C2=A0 xxxen/riscv: WIP ( need advise )
>=20
> Just to clarify: With the later 29-patch series superseding fair
> parts of this,
> is there still any need to look at this (version of this) series in
> any detail?
>=20
It depends on if headers mentioned in 29-patch series should be in asm-
generic folder or in arch specific folder.

I think we can start look at 29-patch series and after it will be
merged ( or finished in some way ) I'll resend this one patch series.

~ Oleksii

