Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B75BA62D4
	for <lists+xen-devel@lfdr.de>; Sat, 27 Sep 2025 21:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132129.1470671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2aT9-0000NA-12; Sat, 27 Sep 2025 19:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132129.1470671; Sat, 27 Sep 2025 19:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2aT8-0000K5-Ta; Sat, 27 Sep 2025 19:20:30 +0000
Received: by outflank-mailman (input) for mailman id 1132129;
 Sat, 27 Sep 2025 19:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a9jj=4G=gmail.com=linmag7@srs-se1.protection.inumbo.net>)
 id 1v2aT7-0000Jz-Rw
 for xen-devel@lists.xenproject.org; Sat, 27 Sep 2025 19:20:29 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062737d6-9bd7-11f0-9809-7dc792cee155;
 Sat, 27 Sep 2025 21:20:27 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-634cef434beso1579664a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 27 Sep 2025 12:20:27 -0700 (PDT)
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
X-Inumbo-ID: 062737d6-9bd7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759000827; x=1759605627; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
        b=lP5Np4evc+xa3X8I56npoMQJmd3k2l1VbtJ5oSZ8O9FwBzCzD/l0lwccaKVaW8YGcM
         vvGYukEfO8JflbHB810oVox/tcRCU9RXGxdaYEYvDNs25qr4b5js6pxoeFjrYXAecSIa
         xYFG6sXG6ghn29wCIlGewt6o6EZpKkcr2+YHuVG0S+kX3Q892yOJ9r1fhtqEivTX+ESc
         HJHtCokU7KWb7YdWirxBFzPHCLh4fP/dlvlN4QHHQC0ZGiGPrVBxZfPWFhYpeAPJjnuh
         3nSmkeyyb/duH3A8WGqfA9bY1/gSfSjKeOL45RQ5wHLaSHzT8Zy1/u+GyKc3U05fh4VC
         7pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759000827; x=1759605627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
        b=jA7266L/MSJ6Nv3zvAvNDcMucNwB/FFV27Jzm7r2CwMi8WhwoPhCqg6+qAddmRXjPX
         f1vdK96dm297oIWWVPn6e2BXVjF2nLVbMF9UQU0reCL6VfuBLil8rBzTk/Sg6KlEoQ6M
         sf+2Y9r3qgHltcDBl++KLeNkMfBuvYsolakehNVm4RQxPAYYZC8y0xclRP2AUOLV+Hns
         yHySp4jT2cSt9eIlCrf7nX9gIgq+Sn2QUs48PWgZHwXMtn6D4LLLZ75Dbzdg99vCuTVh
         MwWLKHhw8CHx9VlWJxVLAGo86FG8KFfCp83k4SnIVuW7MFHbZEorUT9beQXMQeTs2sWo
         uiDA==
X-Forwarded-Encrypted: i=1; AJvYcCWX6aTI14t4K6XwG/e/KWaweWVUuqp417dXbt1a6gQiKtkl97mXMEKU1y2fJ+cZjbQbtR+s5+3HZx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywro3rzAT8r6mdUHijO5vmtccOVUdaR1SB+rWeuuMDYAk9K8eNZ
	TGFmMmwIa+1lKSjYHzcDu8bhNZM/xkpkibJ6u1vj3oK6P4/PrgsXKC5O3S6R/U6vEif8MsJyoSx
	ZjunHPW4azKNNaJ+Mfmp0VCqWhPqhR6k=
X-Gm-Gg: ASbGncvrDbTa5OtSh3GS4IntUjnLuOtP8SOGZRD7qab5/4MEHsu/B9LzVSyXNT56Zwq
	5dlS0cfNVJRoWaivITZ154fYn7qM0lTZKzTb8fBeaDh8uRIA4PDn/A4dqsOtkO6KqfG8vFKsGaE
	nZaKjagS8p2N9YMZCRTlB3HWQ7eNi6b53/Teotw1ePr8+sik50bBzn2iyvHEWPENzoiEEEDNtIP
	5VPZ+jXwQNcKn+TBJ4=
X-Google-Smtp-Source: AGHT+IE6MMpG/TRiFXxnrxz1Vvo3fuH5ytNgtdVEgpXL0NxXawEVfUDFtb+tMcdRPN344hi95Su67MTI32H6Ub9xTJM=
X-Received: by 2002:a17:907:7b8b:b0:b3c:5f99:dac7 with SMTP id
 a640c23a62f3a-b3c5fa9674amr74488566b.21.1759000826450; Sat, 27 Sep 2025
 12:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
In-Reply-To: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 27 Sep 2025 21:20:15 +0200
X-Gm-Features: AS18NWCUkmopfgQP7FxvlAuimXjc1tmQlQb-89CTajXeb-5Nlye2dR2BnBQqzEg
Message-ID: <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> > Suggest testing the same branch with the alpha patch reverted just to
> > rule out any issue in the core code. If it reproduces suggest to
> > bisect Leon's branch.

Hi again, I've booted up the ES40 again with the kernel build from Leons
branch, it boots up but message log is full off messages like
"EXT4-fs error (device sda4): ext4_find_extent:939: inode
#16257327: comm init: pblk 65114257 bad header/extent:
invalid magic"

The filesystem is broken after just booting with the kernel.
This time fsck did not fix it, I needed to re-install gentoo stage3.
So it's for sure reproducible as well as destructive.  It's not possible to
revert all the commits individually, since this will leave the source tree
in a state where the kernel doesn't build. I've started off by reverting
the following commits:

e78a9d72517a88faa6f16dab4d1c6f966ed378ae
(dma-mapping: remove unused map_page callback)

d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
(alpha: Convert mapping routine to rely on physical address)

3cd47242d513050d7a81ac6e7020fd3ef5462ad4
(block-dma: properly take MMIO path)

7950995bef32aa7e5f74699c7d0fdac41d2dad14
 (block-dma: migrate to dma_map_phys instead of map_page)


After reverting the above commits, I'm able to build a working kernel,
that is, no filesystem corruption occurs. I'll take a closer look at this
after the weekend.

Regards

Magnus

