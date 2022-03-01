Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75B4C8B0B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 12:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281279.479544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0ur-00041y-TZ; Tue, 01 Mar 2022 11:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281279.479544; Tue, 01 Mar 2022 11:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP0ur-0003yV-Po; Tue, 01 Mar 2022 11:43:41 +0000
Received: by outflank-mailman (input) for mailman id 281279;
 Tue, 01 Mar 2022 11:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tCvV=TM=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nP0uq-0003yP-9S
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 11:43:40 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6063504-9954-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 12:43:39 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5C51F68AFE; Tue,  1 Mar 2022 12:43:35 +0100 (CET)
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
X-Inumbo-ID: d6063504-9954-11ec-8539-5f4723681683
Date: Tue, 1 Mar 2022 12:43:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 08/12] x86: centralize setting SWIOTLB_FORCE when guest
 memory encryption is enabled
Message-ID: <20220301114335.GA2881@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-9-hch@lst.de> <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 01, 2022 at 11:39:29AM +0000, Andrew Cooper wrote:
> This isn't really "must".  The guest is perfectly capable of sharing
> memory with the hypervisor.
> 
> It's just that for now, bounce buffering is allegedly faster, and the
> simple way of getting it working.

Yeah, I guess you щould just share/unshare on demand.  But given that
this isn't implemented it is a must in the current kernel.  But if
you want a different wording suggest one and I'll put it in.

