Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1A75A8E0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566444.885244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOmu-0006FX-N6; Thu, 20 Jul 2023 08:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566444.885244; Thu, 20 Jul 2023 08:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOmu-0006DN-JV; Thu, 20 Jul 2023 08:13:28 +0000
Received: by outflank-mailman (input) for mailman id 566444;
 Thu, 20 Jul 2023 08:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tOt0=DG=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qMOms-0006DH-OS
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:13:26 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c3d2a0b-26d5-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 10:13:24 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 6B344166DED;
 Thu, 20 Jul 2023 10:13:21 +0200 (CEST)
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
X-Inumbo-ID: 4c3d2a0b-26d5-11ee-8611-37d641c3527e
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1689840801; bh=TdK9jcZL8v/p/laoEmi/zALu74q142SxfjUGyouwpT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ep2iGtb9XwwVXdW8lVyOJuD+PoVmPwq3KvBPAUvyUMDZA5m9uc+OP56Pme9dHmPf9
	 LHSbVYWT2DwuGrfqg10tpCg+WHOsEUxLlBHB4rejKgW1xDrQmwKxTdgmNua/ZkIyCH
	 xxGsUJzTMkwUtfhkUvu+WUcF93Rn0u2BhomMyok4HopTRqI6aPHQIsiOePlRk5yWQs
	 0rokk+4IQ42uMfAuxqVoxMGN1xbcL2Wy/NC1Kaac/sy0+W5qWYGX9kVu6KE8SRnLaq
	 uU+Ds0EbmORD13mcMi4lyS/k6NmlLzUQvS2oeGXNiOQkSfvv6GsyoshWbeWeP6p6QB
	 9UMlHjGDhJ+XA==
Date: Thu, 20 Jul 2023 10:13:20 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Petr Tesarik <petrtesarik@huaweicloud.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Petr
 Tesarik <petr.tesarik.ext@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>, James Seo <james@equiv.tech>, James Clark
 <james.clark@arm.com>, Kees Cook <keescook@chromium.org>, "moderated
 list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>, "moderated
 list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, "open list:XEN SWIOTLB SUBSYSTEM"
 <iommu@lists.linux.dev>, Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v4 0/8] Allow dynamic allocation of software IO TLB
 bounce buffers
Message-ID: <20230720101320.72bbd2fc@meshulam.tesarici.cz>
In-Reply-To: <20230720065216.GB4395@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
	<20230720065216.GB4395@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jul 2023 08:52:16 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Just to add a highlevel comment here after I feel like I need a little
> more time to review the guts.
> 
> I'm still pretty concerned about the extra list that needs to be
> consulted in is_swiotlb_buffer, but I can't really think of
> anything better.  Maybe an xarray has better cache characteristics,
> but that one requires even more allocations in the low-level dma map
> path.
> 
> One thing I'd like to see for the next version is to make the
> new growing code a config option at least for now.  It is a pretty
> big change of the existing swiotlb behavior, and I want people to opt
> into it conciously.  Maybe we can drop the option again after a few
> years once everything has settled.

Fine with me. I removed it after all my testing showed no performance
impact as long as the size of the initial SWIOTLB is kept at the
default value (and sufficient for the workload), but it's OK for me if
dynamic SWIOTLB allocations are off by default.

OTOH I'd like to make it a boot-time option rather than build-time
option. Would that be OK for you?

Petr T

