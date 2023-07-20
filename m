Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7B75A888
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566433.885223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOb6-0003r7-86; Thu, 20 Jul 2023 08:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566433.885223; Thu, 20 Jul 2023 08:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOb6-0003ow-5I; Thu, 20 Jul 2023 08:01:16 +0000
Received: by outflank-mailman (input) for mailman id 566433;
 Thu, 20 Jul 2023 08:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8fF=DG=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qMOb5-0003oq-3T
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:01:15 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98910869-26d3-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:01:13 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3931F6732D; Thu, 20 Jul 2023 10:01:11 +0200 (CEST)
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
X-Inumbo-ID: 98910869-26d3-11ee-b23a-6b7b168915f2
Date: Thu, 20 Jul 2023 10:01:10 +0200
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
Subject: Re: [PATCH v4 2/8] swiotlb: add documentation and rename
 swiotlb_do_find_slots()
Message-ID: <20230720080110.GA6358@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com> <11826bfbc148771ab36d0b485558aa52cbdd204f.1689261692.git.petr.tesarik.ext@huawei.com> <20230720063819.GB3842@lst.de> <20230720095609.55b3a642@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230720095609.55b3a642@meshulam.tesarici.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 20, 2023 at 09:56:09AM +0200, Petr Tesařík wrote:
> On Thu, 20 Jul 2023 08:38:19 +0200
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > On Thu, Jul 13, 2023 at 05:23:13PM +0200, Petr Tesarik wrote:
> > > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > > 
> > > Add some kernel-doc comments and move the existing documentation of struct
> > > io_tlb_slot to its correct location. The latter was forgotten in commit
> > > 942a8186eb445 ("swiotlb: move struct io_tlb_slot to swiotlb.c").
> > > 
> > > Use the opportunity to give swiotlb_do_find_slots() a more descriptive
> > > name, which makes it clear how it differs from swiotlb_find_slots().  
> > 
> > Please keep the swiotlb_ prefix.  Otherwise this looks good to me.
> 
> Will do. Out of curiosity, why does it matter for a static (file-local)
> function?

Because it makes looking at stack traces much easier.

