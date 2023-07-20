Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BE75A911
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566456.885274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOwT-0000ky-1j; Thu, 20 Jul 2023 08:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566456.885274; Thu, 20 Jul 2023 08:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOwS-0000iD-Uh; Thu, 20 Jul 2023 08:23:20 +0000
Received: by outflank-mailman (input) for mailman id 566456;
 Thu, 20 Jul 2023 08:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8fF=DG=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qMOwR-0000ZF-BV
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:23:19 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae688f9c-26d6-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:23:18 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C7E1C6732D; Thu, 20 Jul 2023 10:23:16 +0200 (CEST)
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
X-Inumbo-ID: ae688f9c-26d6-11ee-b23a-6b7b168915f2
Date: Thu, 20 Jul 2023 10:23:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Christoph Hellwig <hch@lst.de>,
	Petr Tesarik <petrtesarik@huaweicloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
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
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v4 0/8] Allow dynamic allocation of software IO TLB
 bounce buffers
Message-ID: <20230720082316.GB6932@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com> <20230720065216.GB4395@lst.de> <20230720101320.72bbd2fc@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230720101320.72bbd2fc@meshulam.tesarici.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 20, 2023 at 10:13:20AM +0200, Petr Tesařík wrote:
> Fine with me. I removed it after all my testing showed no performance
> impact as long as the size of the initial SWIOTLB is kept at the
> default value (and sufficient for the workload), but it's OK for me if
> dynamic SWIOTLB allocations are off by default.
> 
> OTOH I'd like to make it a boot-time option rather than build-time
> option. Would that be OK for you?

I'd really like the config option to not even build the code.  But
a boot time option sounds very useful in addition to that.

