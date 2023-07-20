Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706075A6A1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566349.885071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNIu-0000Uh-FP; Thu, 20 Jul 2023 06:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566349.885071; Thu, 20 Jul 2023 06:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNIu-0000SO-CZ; Thu, 20 Jul 2023 06:38:24 +0000
Received: by outflank-mailman (input) for mailman id 566349;
 Thu, 20 Jul 2023 06:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8fF=DG=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qMNIt-0000Ks-1J
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 06:38:23 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0524f0c6-26c8-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 08:38:22 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B78E368AFE; Thu, 20 Jul 2023 08:38:19 +0200 (CEST)
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
X-Inumbo-ID: 0524f0c6-26c8-11ee-b23a-6b7b168915f2
Date: Thu, 20 Jul 2023 08:38:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Petr Tesarik <petr.tesarik.ext@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	"moderated list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"open list:XEN SWIOTLB SUBSYSTEM" <iommu@lists.linux.dev>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>, petr@tesarici.cz
Subject: Re: [PATCH v4 2/8] swiotlb: add documentation and rename
 swiotlb_do_find_slots()
Message-ID: <20230720063819.GB3842@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com> <11826bfbc148771ab36d0b485558aa52cbdd204f.1689261692.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11826bfbc148771ab36d0b485558aa52cbdd204f.1689261692.git.petr.tesarik.ext@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 13, 2023 at 05:23:13PM +0200, Petr Tesarik wrote:
> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> 
> Add some kernel-doc comments and move the existing documentation of struct
> io_tlb_slot to its correct location. The latter was forgotten in commit
> 942a8186eb445 ("swiotlb: move struct io_tlb_slot to swiotlb.c").
> 
> Use the opportunity to give swiotlb_do_find_slots() a more descriptive
> name, which makes it clear how it differs from swiotlb_find_slots().

Please keep the swiotlb_ prefix.  Otherwise this looks good to me.


