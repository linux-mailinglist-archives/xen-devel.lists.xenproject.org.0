Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFED76A17C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 21:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573453.898165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYqY-0005d5-9L; Mon, 31 Jul 2023 19:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573453.898165; Mon, 31 Jul 2023 19:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYqY-0005ax-6Z; Mon, 31 Jul 2023 19:46:26 +0000
Received: by outflank-mailman (input) for mailman id 573453;
 Mon, 31 Jul 2023 19:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B7w7=DR=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qQYqW-0005ar-2p
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 19:46:24 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed102b59-2fda-11ee-b256-6b7b168915f2;
 Mon, 31 Jul 2023 21:46:22 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-b985-910f-39e1-703f.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:b985:910f:39e1:703f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id EAA8B178227;
 Mon, 31 Jul 2023 21:46:18 +0200 (CEST)
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
X-Inumbo-ID: ed102b59-2fda-11ee-b256-6b7b168915f2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1690832779; bh=KWGiVMKtI706Wwo+DM5RpfJ8QcAflbLeZoJQleXTj7w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DCbut2Q1V/o96bevVJ5VH0tsE8RBOG34SkaIN2hyTrDSOvmqWteKWg9WSSEmkSDR/
	 7zEcP3LPJCP0C30n9bKPAcmiiYpu7Srh/GV83YQ3KdTEhs0WmTtBNg9apNXr3D4vM9
	 l+cuuubqpoexTeGXas2IjL8jUpRGjQ4lIgZ7qtkkxPLv/dtnfOM4sW9s/NJ/VXCJbW
	 bPmzFIP6+7hKJ/ThN/ccfBtqYIIyBpGyv67t5YdZ3SQFvyi67polQGKVblNs06g0Hr
	 I86Dg302FpL39M5+5q5pMGvrRpcg2f/33XsKuUuAZUtFISY1nQ6bvC7px1r0e4AGzy
	 6AOiYmUbWlVNw==
Date: Mon, 31 Jul 2023 21:46:18 +0200
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
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph
 Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes
 <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton
 <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Roman
 Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans
 de Goede <hdegoede@redhat.com>, James Seo <james@equiv.tech>, James Clark
 <james.clark@arm.com>, Kees Cook <keescook@chromium.org>, "moderated
 list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>, "moderated
 list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, "open list:XEN SWIOTLB SUBSYSTEM"
 <iommu@lists.linux.dev>, "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v6 0/9] Allow dynamic allocation of software IO TLB
 bounce buffers
Message-ID: <20230731214618.6e7cde05@meshulam.tesarici.cz>
In-Reply-To: <20230731160409.GA8991@lst.de>
References: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
	<20230731160409.GA8991@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

V Mon, 31 Jul 2023 18:04:09 +0200
Christoph Hellwig <hch@lst.de> naps=C3=A1no:

> I was just going to apply this, but patch 1 seems to have a non-trivial
> conflict with the is_swiotlb_active removal in pci-dma.c.  Can you resend
> against the current dma-mapping for-next tree?

Sure thing, will re-send tomorrow morning.

Petr T

