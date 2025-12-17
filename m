Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71430CC78AA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 13:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188784.1509864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVqTS-0007Yx-44; Wed, 17 Dec 2025 12:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188784.1509864; Wed, 17 Dec 2025 12:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVqTS-0007Vq-0q; Wed, 17 Dec 2025 12:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1188784;
 Wed, 17 Dec 2025 12:17:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RHBr=6X=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1vVqTQ-0007UT-BP
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 12:17:44 +0000
Received: from mail-dl1-x1236.google.com (mail-dl1-x1236.google.com
 [2607:f8b0:4864:20::1236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626ad0e3-db42-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 13:17:42 +0100 (CET)
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so746741c88.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 04:17:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e30b799sm60713771c88.17.2025.12.17.04.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 04:17:39 -0800 (PST)
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
X-Inumbo-ID: 626ad0e3-db42-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765973861; x=1766578661; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=lpVaBD/n4pV1W3OTaFDxaCw6aK1rMQfd4QptFw8DQDmKHC/d/qeHaC6kDic8gPYT0j
         Sy+SYbzPKJgkBqsBDoNczvKIRBi0nFtuib+h9eqhOpeXDlvjxwAaq0KAbuL3AtTkg/G+
         CPoUlYrN8cl0QwAi9M6GrtNxdz5+lKqmWlj7KpZGJLBjBlgXqg8vJC5VWSzeNH4MoySK
         IEHnC1ZI5YTZXdhiBp7o++uRUynypxKdLKdd+5vRdC5hHvRBxMCiYtRDp65Zd2Gxwv+D
         0APgfY2sb+G1khrA/TBadQXeRqyeHY7L7fH4qEcFoTMZDgUoLIdbGqtKdlo/M6X6lUxn
         za9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973861; x=1766578661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=QMMAcag/tjgsavb+dfKWqRmVM3lWUQLZkRj+0LlfuqnqSgTCKG+qGNgCDuRKFuu3V0
         uppVrgkd6+UwIIEUOemtVPzUPx8ugRYRCAJBDFt8Boy78xbVrHo/XQ37YM0IkJ+cyudE
         kku2zX7xb/q8xvdTPPpMZtaEC/uC7KgtjaHnIo9N5vHZL3uYAJAv33v+BpAio3A5clks
         Z8t9hrSvru2NtcPGpQGHYQ2CIb1AZV6KBOpaCcYwV3mWQBEWDBi1AYE+II/I6MzkfzqJ
         +cS0gMY7HSU980vQ++nVYWy7Rueef4ZOwtjWQ7gWnkwwkduljLwlI5k6PmhHb3oR2rkH
         RQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJuhp5YvwEBjriOjELMdCwkEfxC+UIJKxMBBxtXXlGpwthVv79KpYJpBrorrY6MkfaV5bA2pTanaM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjOgAtIIFOSr8dtgg3Fgqu+xxa1lYxkeVCC6y72ftdBTTaD3+W
	jzeYGhVUhTR1gj9yjTdCR7PikGcq+PiiLfieo5/Q4K/N5COJoAbii0mN
X-Gm-Gg: AY/fxX62FLKOGPo741X8G7bo0f2EfD1fPmYhOwPwN5d6F+df0H7cNGfoihLGNYVfY30
	LlH4Fa2vEEwpwl+V6CzutMCiyeiglw/jWYQwNChwB2OFLUJXw4c0PYUjVPGVlopBr4iRHDT8Ns7
	Rf3xdGh7GlLdHk5b/tTthN+9AtE+H36rKByl1vLN+aL7KI5SJ8YzJcOe7crMS+FnikLeGY/rFcd
	wYRB9HLpl16DGUUxP0UtRoweA37LzC5bfrAWYNKITXGA3c/ur+Vz49H5LcPt/HtQV925IkzwETx
	NpiF7w07cBbApoYooK0HQwZO6MMuDx4Hbmx9bh6GbUvq4dmDY92V6COq0Lr29nlvAwNlkSZJTq8
	HncMKlePoeyhcFK8ggQvCJ/aXS3WKnFr9b+/mvvrglUR8BT10KN8moiwNAtfpI4UOavR4Dnc1FO
	nGV+OBzvPYU5e4MMdtJ5bfU3rx
X-Google-Smtp-Source: AGHT+IHtTckxV0BrLKUtwEMMlG/KT0X6JCzQ/eEGNn1nvrPgi11fSB7RRA3IhgmdXndE9lBsM2aS9w==
X-Received: by 2002:a05:7022:e806:b0:119:e569:f86a with SMTP id a92af1059eb24-11f34c29cefmr11289687c88.7.1765973860378;
        Wed, 17 Dec 2025 04:17:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Dec 2025 04:17:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys
 interface [qemu test failure]
Message-ID: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>

Hi,

On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Perform mechanical conversion from .map_page to .map_phys callback.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

This patch causes all my 32-bit parisc qemu tests with C3700 machine
to fail. Network interface tests fail, and all boot attempts from
any kind of hard drive (scsi, usb) fail with this patch in the tree.

Guenter

---
# bad: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
git bisect good 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
# good: [09cab48db950b6fb8c114314a20c0fd5a80cf990] Merge tag 'soc-arm-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 09cab48db950b6fb8c114314a20c0fd5a80cf990
# bad: [701d7d782d98242a64cdeed90750f88ff733bc39] Merge tag 'spdx-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx
git bisect bad 701d7d782d98242a64cdeed90750f88ff733bc39
# good: [66a1025f7f0bc00404ec6357af68815c70dadae2] Merge tag 'soc-newsoc-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 66a1025f7f0bc00404ec6357af68815c70dadae2
# good: [c84d574698bad2c02aad506dfe712f83cbe3b771] Merge tag 'modules-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux
git bisect good c84d574698bad2c02aad506dfe712f83cbe3b771
# bad: [b0319c4642638bad4b36974055b1c0894b2c7aa9] Merge tag 'nfsd-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
git bisect bad b0319c4642638bad4b36974055b1c0894b2c7aa9
# bad: [e637b37a520513a04d00f4add07ec25f357e6c6d] Merge tag 'rproc-v6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
git bisect bad e637b37a520513a04d00f4add07ec25f357e6c6d
# bad: [56a1a04dc9bf252641c622aad525894dadc61a07] Merge tag 'libnvdimm-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
git bisect bad 56a1a04dc9bf252641c622aad525894dadc61a07
# good: [d0cf6512bbcf77afb6102f886fcd7fd48b7ae043] rust: bitmap: add BitmapVec::new_inline()
git bisect good d0cf6512bbcf77afb6102f886fcd7fd48b7ae043
# bad: [936a9f0cb16b0646143f8e05afab458adc51d0a0] xen: swiotlb: Convert mapping routine to rely on physical address
git bisect bad 936a9f0cb16b0646143f8e05afab458adc51d0a0
# good: [14cb413af00c5d3950d1a339dd2b6f01ce313fce] dma-mapping: remove unused mapping resource callbacks
git bisect good 14cb413af00c5d3950d1a339dd2b6f01ce313fce
# bad: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface
git bisect bad 96ddf2ef58ec070afa8275f371b619462cd8fb2c
# good: [e4e3fff66a57a7aee048e0737a16874aeaffe9f4] MIPS/jazzdma: Provide physical address directly
git bisect good e4e3fff66a57a7aee048e0737a16874aeaffe9f4
# first bad commit: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface

