Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E43740008
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 17:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556183.868500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEAvI-0002QL-PG; Tue, 27 Jun 2023 15:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556183.868500; Tue, 27 Jun 2023 15:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEAvI-0002OT-MG; Tue, 27 Jun 2023 15:48:08 +0000
Received: by outflank-mailman (input) for mailman id 556183;
 Tue, 27 Jun 2023 15:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OrRV=CP=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qEAvH-0002ON-OM
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 15:48:07 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e3fda7-1502-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 17:48:06 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 555E667373; Tue, 27 Jun 2023 17:48:02 +0200 (CEST)
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
X-Inumbo-ID: 01e3fda7-1502-11ee-b237-6b7b168915f2
Date: Tue, 27 Jun 2023 17:48:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Tesarik <petrtesarik@huaweicloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kees Cook <keescook@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
	"moderated list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"open list:XEN SWIOTLB SUBSYSTEM" <iommu@lists.linux.dev>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 1/7] swiotlb: make io_tlb_default_mem local to
 swiotlb.c
Message-ID: <20230627154802.GA29567@lst.de>
References: <cover.1687859323.git.petr.tesarik.ext@huawei.com> <a1ef6eeab8b64fac817b9734da4a056f05a68d01.1687859323.git.petr.tesarik.ext@huawei.com> <2023062745-routing-palace-d0b4@gregkh> <73f11258-1562-17c1-969e-b134dcb5f35c@arm.com> <20230627133006.16ee11af@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627133006.16ee11af@meshulam.tesarici.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jun 27, 2023 at 01:30:06PM +0200, Petr Tesařík wrote:
> Xen is the only user of an "is SWIOTLB present" interface. IIUC Xen
> needs bounce buffers for the PCI frontend driver, but if there is no
> other reason to have a SWIOTLB, the system does not set up one at boot.

Please take a look at my "unexport swiotlb_active v2" series that
unfortunately missed the 6.5 merge window waiting for reviews.

