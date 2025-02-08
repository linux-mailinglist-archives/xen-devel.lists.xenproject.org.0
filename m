Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5AA2D71A
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 16:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884323.1294060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgnBn-0003wf-Ab; Sat, 08 Feb 2025 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884323.1294060; Sat, 08 Feb 2025 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgnBn-0003uM-6J; Sat, 08 Feb 2025 15:56:15 +0000
Received: by outflank-mailman (input) for mailman id 884323;
 Sat, 08 Feb 2025 15:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5nI=U7=gmail.com=salvatore.bonaccorso@srs-se1.protection.inumbo.net>)
 id 1tgnBl-0003uG-E4
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 15:56:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f4d84d-e635-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 16:56:10 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso29565275e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 08 Feb 2025 07:56:10 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch.
 [82.192.244.13]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae129sm88297535e9.17.2025.02.08.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 07:56:08 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 18929BE2EE7; Sat, 08 Feb 2025 16:56:07 +0100 (CET)
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
X-Inumbo-ID: 36f4d84d-e635-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739030170; x=1739634970; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gghYPUNRCdyG2yLo4ZGDDboCtEVr9fYIBuiGTMEQtB8=;
        b=R2+jfZNH43kNMtLL08AtiaeQK7HbmZucj9HEySIxXAB9USgBQIdmmW4ISBMurIGqz1
         JrhI5dZSXIHkhyljEPjO9e0tZZDer7lvJf2RNI8TQpcmI11Slvb/XZvd+Q5o3SJhIz9z
         bxWrEWbHsog5SWviCzzdJfr9/FSzdsrUFnB6YpOj8lW9ewBS1j9Ezky0OWljYUSR6RNk
         gstMtm8INTyEZL43Z6QLRp14faOr5j6AEOPRTzWxDuH2SNkdfppcovOug3dWpX3TAtHB
         UF2zSGS7mHnJIrEKUOY1xJutuUTlwLSHeTRZdNdr1kWP156XL+H8uZbhOvxFlfGM5/Ih
         XawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739030170; x=1739634970;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gghYPUNRCdyG2yLo4ZGDDboCtEVr9fYIBuiGTMEQtB8=;
        b=PDor9hBU87lF3kbP0J4EUjBbCH5nWoSDQU9YGut/tdlJpXFPzS4N/3BbjYKs4ao0Am
         hPyTKXf6ExvdqfDKOk9CnVXAPK3pNSW5N5IrhuB6XJBEvWZc5GfRfx1BOdsWWe0H/k+f
         4U+CIIggGjqbfFCPftMreb75dtVIdxpCSXuKY1Wj2E0JPtuvKS67oviG+5Lgq1pvUSJt
         BfHo3KxYQEpTPygTpsIAhDKu4VN6kKikWptV/SQ8ENNCbeMNc5dMMcOGZIfCJkJLjgwR
         RFEoBGGY5/C7wAuN0C64KVX0Cc+BZfBzRTaYLyFoq07mkJvB/pcBjG3iZgVfvPwAVFkN
         VsVg==
X-Forwarded-Encrypted: i=1; AJvYcCVyWMiEMyBzuzih3RpIib326nkOpdPdc0QGhCaATKJvZ7P7jDOGZm+l0zzacI5SOYGyll8juKC1ngU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySt0Z6VT9UyU+/gW2xdgmJOwNgElce6PXNwPQF4AKKQeb6vifr
	xTkg//2U+SyLjIR2912khDpxY+fUGgY4cw1aYZAFx16KpNVtBmDQ
X-Gm-Gg: ASbGncsMp3S8nZUQXQH79jJVWy+aqCxNLGkXues2Zt1p0Bu8CVY+ru8sRHEjg9dQ/6F
	t1rRMh0VHvL8dFcgKTAdZa1pBHsqgMRHANI/n/itwmIPcJKm3sojGJm/1RURg8MvfHMptfA9JGN
	wfjbjIRRlsNYk3lfFLabTFCAiHiCSoIVio9FOMMjpdKckjTQhLrxw8aX6GMbrU1oFHRGaoFqtA4
	jcy06+fANxE0YdQIK77gmCBj+7fADfT/cETjN0PEHnsHbS+7NIDbdvwh0zLeZCa7xTvwEXa5Nu3
	/5DIpQhCjwdLcAgSWeJ40E/p+5DjGkWIoKDQ+jkEfR87CyYV
X-Google-Smtp-Source: AGHT+IEXT4VHtoN7BWCb9b46QkhkIIkudo6GwKbhv3dYWDQ39vj5aKhwilizZwe5JyZGlUhGnb2oMA==
X-Received: by 2002:a7b:c001:0:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-439250df455mr58897315e9.29.1739030169469;
        Sat, 08 Feb 2025 07:56:09 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Sat, 8 Feb 2025 16:56:07 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Radoslav =?iso-8859-1?Q?Bod=F3?= <radoslav.bodo@igalileo.cz>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add alignment
 check for dma buffers") when booting with Xen and mpt3sas_cm0 _scsih_probe
 failures
Message-ID: <Z6d-l2nCO1mB4_wx@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Juergen, hi all,

Radoslav Bodó reported in Debian an issue after updating our kernel
from 6.1.112 to 6.1.115. His report in full is at:

https://bugs.debian.org/1088159

He reports that after switching to 6.1.115 (and present in any of the
later 6.1.y series) booting under xen, the mptsas devices are not
anymore accessible, the boot shows:

mpt3sas version 43.100.00.00 loaded
mpt3sas_cm0: 63 BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (8086116 kB)
mpt3sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
mpt3sas_cm0: MSI-X vectors supported: 96
mpt3sas_cm0:  0 40 40
mpt3sas_cm0: High IOPs queues : disabled
mpt3sas0-msix0: PCI-MSI-X enabled: IRQ 447
mpt3sas0-msix1: PCI-MSI-X enabled: IRQ 448
mpt3sas0-msix2: PCI-MSI-X enabled: IRQ 449
mpt3sas0-msix3: PCI-MSI-X enabled: IRQ 450
mpt3sas0-msix4: PCI-MSI-X enabled: IRQ 451
mpt3sas0-msix5: PCI-MSI-X enabled: IRQ 452
mpt3sas0-msix6: PCI-MSI-X enabled: IRQ 453
mpt3sas0-msix7: PCI-MSI-X enabled: IRQ 454
mpt3sas0-msix8: PCI-MSI-X enabled: IRQ 455
mpt3sas0-msix9: PCI-MSI-X enabled: IRQ 456
mpt3sas0-msix10: PCI-MSI-X enabled: IRQ 457
mpt3sas0-msix11: PCI-MSI-X enabled: IRQ 458
mpt3sas0-msix12: PCI-MSI-X enabled: IRQ 459
mpt3sas0-msix13: PCI-MSI-X enabled: IRQ 460
mpt3sas0-msix14: PCI-MSI-X enabled: IRQ 461
mpt3sas0-msix15: PCI-MSI-X enabled: IRQ 462
mpt3sas0-msix16: PCI-MSI-X enabled: IRQ 463
mpt3sas0-msix17: PCI-MSI-X enabled: IRQ 464
mpt3sas0-msix18: PCI-MSI-X enabled: IRQ 465
mpt3sas0-msix19: PCI-MSI-X enabled: IRQ 466
mpt3sas0-msix20: PCI-MSI-X enabled: IRQ 467
mpt3sas0-msix21: PCI-MSI-X enabled: IRQ 468
mpt3sas0-msix22: PCI-MSI-X enabled: IRQ 469
mpt3sas0-msix23: PCI-MSI-X enabled: IRQ 470
mpt3sas0-msix24: PCI-MSI-X enabled: IRQ 471
mpt3sas0-msix25: PCI-MSI-X enabled: IRQ 472
mpt3sas0-msix26: PCI-MSI-X enabled: IRQ 473
mpt3sas0-msix27: PCI-MSI-X enabled: IRQ 474
mpt3sas0-msix28: PCI-MSI-X enabled: IRQ 475
mpt3sas0-msix29: PCI-MSI-X enabled: IRQ 476
mpt3sas0-msix30: PCI-MSI-X enabled: IRQ 477
mpt3sas0-msix31: PCI-MSI-X enabled: IRQ 478
mpt3sas0-msix32: PCI-MSI-X enabled: IRQ 479
mpt3sas0-msix33: PCI-MSI-X enabled: IRQ 480
mpt3sas0-msix34: PCI-MSI-X enabled: IRQ 481
mpt3sas0-msix35: PCI-MSI-X enabled: IRQ 482
mpt3sas0-msix36: PCI-MSI-X enabled: IRQ 483
mpt3sas0-msix37: PCI-MSI-X enabled: IRQ 484
mpt3sas0-msix38: PCI-MSI-X enabled: IRQ 485
mpt3sas0-msix39: PCI-MSI-X enabled: IRQ 486
mpt3sas_cm0: iomem(0x00000000ac400000), mapped(0x00000000d9f45f61), size(65536)
mpt3sas_cm0: ioport(0x0000000000006000), size(256)
mpt3sas_cm0: CurrentHostPageSize is 0: Setting default host page size to 4k
mpt3sas_cm0: scatter gather: sge_in_main_msg(1), sge_per_chain(7), sge_per_io(128), chains_per_io(19)
mpt3sas_cm0: failure at drivers/scsi/mpt3sas/mpt3sas_scsih.c:12348/_scsih_probe()!

We were able to bissect the changes (see https://bugs.debian.org/1088159#64) down to

b1e6e80a1b42 ("xen/swiotlb: add alignment check for dma buffers")

#regzbot introduced: b1e6e80a1b42
#regzbot link: https://bugs.debian.org/1088159

reverting the commit resolves the issue.

Does that ring some bells?

In fact we have two more bugs reported with similar symptoms but not
yet confirmed they are the same, but I'm referencing them here as well
in case we are able to cross-match to root cause:

https://bugs.debian.org/1093371 (megaraid_sas didn't work anymore with
Xen)

and

https://bugs.debian.org/1087807 (Unable to boot: i40e swiotlb buffer
is full)

(but again the these are yet not confirmed to have the same root
cause).

Thanks in advance,

Regards,
Salvatore

