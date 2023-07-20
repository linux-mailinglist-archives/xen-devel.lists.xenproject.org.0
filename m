Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEA75A856
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566426.885214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOWI-0001VD-8r; Thu, 20 Jul 2023 07:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566426.885214; Thu, 20 Jul 2023 07:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOWI-0001TT-63; Thu, 20 Jul 2023 07:56:18 +0000
Received: by outflank-mailman (input) for mailman id 566426;
 Thu, 20 Jul 2023 07:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tOt0=DG=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qMOWG-0001TJ-3p
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:56:16 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c499b7-26d2-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 09:56:13 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 8ACD4167A3C;
 Thu, 20 Jul 2023 09:56:10 +0200 (CEST)
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
X-Inumbo-ID: e5c499b7-26d2-11ee-8611-37d641c3527e
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1689839771; bh=8Ywv2iMig4RBperXu5U4nAxs9mWRsMz4nTNC2ZA5BeQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TvTwq7eiLdhXI4GdxjFTYKWrEmyfm37mmR+3HPaAOtwgyoeZTjH/TJU7xP2Mb60SZ
	 07lZHe/lwWgIWKi2G934H68+S1gfxjf82UnXU1T7wzSp3fk55Y8Tyl31ai+AeRuIVb
	 GQhIYRILN1SAI3n8fsJscb9nc+Nr+NQAfyOtmpt0eNfoJDPVmsKA89GxtVR3678nhg
	 WLz4cmystZ68U5HQCCMXXzdUxWnYDcRP2dfv+Ms6KdK+WaIuasC7LQ2dRlZIEGBZII
	 tLUhJIyp4cGIs1iyscAU/6Ioest8+nUs+prvqzBKGx5LOFxVY/LtS0fl1Sqj5A2v/v
	 RlPFbhitLSR8g==
Date: Thu, 20 Jul 2023 09:56:09 +0200
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
Subject: Re: [PATCH v4 2/8] swiotlb: add documentation and rename
 swiotlb_do_find_slots()
Message-ID: <20230720095609.55b3a642@meshulam.tesarici.cz>
In-Reply-To: <20230720063819.GB3842@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
	<11826bfbc148771ab36d0b485558aa52cbdd204f.1689261692.git.petr.tesarik.ext@huawei.com>
	<20230720063819.GB3842@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jul 2023 08:38:19 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Thu, Jul 13, 2023 at 05:23:13PM +0200, Petr Tesarik wrote:
> > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > 
> > Add some kernel-doc comments and move the existing documentation of struct
> > io_tlb_slot to its correct location. The latter was forgotten in commit
> > 942a8186eb445 ("swiotlb: move struct io_tlb_slot to swiotlb.c").
> > 
> > Use the opportunity to give swiotlb_do_find_slots() a more descriptive
> > name, which makes it clear how it differs from swiotlb_find_slots().  
> 
> Please keep the swiotlb_ prefix.  Otherwise this looks good to me.

Will do. Out of curiosity, why does it matter for a static (file-local)
function?

Petr T

