Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31A503463
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 08:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306123.521303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfbaK-0002Nf-SL; Sat, 16 Apr 2022 06:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306123.521303; Sat, 16 Apr 2022 06:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfbaK-0002KZ-Ob; Sat, 16 Apr 2022 06:07:04 +0000
Received: by outflank-mailman (input) for mailman id 306123;
 Sat, 16 Apr 2022 06:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x34X=U2=bombadil.srs.infradead.org=BATV+8011bb1914c3be3034d5+6810+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfbaJ-0002KJ-Hw
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 06:07:03 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e9b0c86-bd4b-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 08:07:02 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nfbaG-00CK5x-5f; Sat, 16 Apr 2022 06:07:00 +0000
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
X-Inumbo-ID: 6e9b0c86-bd4b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7q55fBD/If1zhZdmpRrkJ8LAPojnNiIN0sEvE05Ctwk=; b=cMcvUoLF9t8i+WPX8nbPrHKTpU
	B06E6ECDKRBlaNNA7/4Q6dRDnLjRFGOUX8wd8Q2KKhjuHBLFPV9+Zue4ho9wVEB6RS30D1zBioXtt
	V+Lp1o4dTv5oHaBbZVlDVRCWQUwOi4y++6lq9CNFsRHkBUsaMwrJ7yHeIh4axcp/jLCE81Q+dkQXH
	6UwiBQxst4/dOqKM6Sf62txqv0VdU6kGjqWXmReVZcuCiaXZJC0kVaZ6qvGpFR5T8y5tPNfSVSm4b
	OXEoHMu6B0oPLJmJynm2f59ZyjZEkOocBrfRZD/q2Q/YyYMduY3sFwU4R8BNOZYm074q3ByEG86ZA
	ROsKlu+w==;
Date: Fri, 15 Apr 2022 23:07:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
Message-ID: <YlpdBHKT1bYzZe2e@infradead.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Apr 15, 2022 at 03:02:45PM -0700, Stefano Stabellini wrote:
> This makes sense overall. Considering that the swiotlb-xen case and the
> virtio case are mutually exclusive, I would write it like this:

Curious question:  Why can't the same grant scheme also be used for
non-virtio devices?  I really hate having virtio hooks in the arch
dma code.  Why can't Xen just say in DT/ACPI that grants can be used
for a given device?

