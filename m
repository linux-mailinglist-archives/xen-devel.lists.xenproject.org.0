Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD85F7EB0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 22:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418283.663064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtu6-00011I-A8; Fri, 07 Oct 2022 20:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418283.663064; Fri, 07 Oct 2022 20:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogtu6-0000z9-6P; Fri, 07 Oct 2022 20:25:06 +0000
Received: by outflank-mailman (input) for mailman id 418283;
 Fri, 07 Oct 2022 20:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ogtu4-0000z3-Ux
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 20:25:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20150a9b-467e-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 22:25:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D540B818F6;
 Fri,  7 Oct 2022 20:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E240FC433C1;
 Fri,  7 Oct 2022 20:25:00 +0000 (UTC)
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
X-Inumbo-ID: 20150a9b-467e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665174301;
	bh=+DBDu+TIZ0+ezgXh+xEGUEbnY9odLaY1vmGFN84T6wA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sHRX6GBnNB4GS4TxSGIU21ok/25B+7t7xqremaM++vDU6ZmYINhMkDQKNAwe61Q/P
	 LcZNUlRWKJAxvcRm0fGNjXfmo5ldnudDe3YIl01/8p6iz/zj5S54/b2mC/9KUGhxVN
	 kKgKV4hsz2tcU+uUttS76wS8sOEZvyC1iNVD7sqv2ODvuJHg2wJEkFo5rOK7L/YrEo
	 qkdE0vangyGFPiVRCblU4R19pa/CtrIh+QMVx7hFMZfprXYKlimHZ+G14vn6xNjJOL
	 zud5HjJUIL+DHPZFi53N6maMnCWmDO4fdxKmL8VuBto4XJAtptK2w2Hr1yq1aiV1zu
	 dhl3vxW2hPGDw==
Date: Fri, 7 Oct 2022 13:24:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/virtio: Handle PCI devices which Host controller is
 described in DT
In-Reply-To: <014e7036-5daf-6465-663c-b690d6f719ee@suse.com>
Message-ID: <alpine.DEB.2.22.394.2210071324010.3690179@ubuntu-linux-20-04-desktop>
References: <20221006174804.2003029-1-olekstysh@gmail.com> <014e7036-5daf-6465-663c-b690d6f719ee@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Oct 2022, Juergen Gross wrote:
> On 06.10.22 19:48, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > Use the same "xen-grant-dma" device concept (based on generic IOMMU
> > device-tree bindings) for the PCI devices behind device-tree based
> > PCI Host controller.
> > 
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > ---
> > Slightly RFC. This is needed to support Xen grant mappings for virtio-pci
> > devices
> > on Arm at some point in the future. The Xen toolstack side is not published
> > yet.
> > Here, for PCI devices we use the same way to pass backend domid to the guest
> > as for
> > platform devices.
> 
> I should mention we decided at the Xen Summit, that I will start a try to
> modify the virtio spec to include the backend id (domid in the Xen case)
> in the device independent config part.

Good idea


> As this will take some time to be accepted (if ever), other means to
> specify the backend domid are needed until then. DT is one possibility
> (at least on Arm), while Xenstore is the way to go for setups with a
> Xen toolstack.

What do you think of my idea of using PCI config registers on the *root
complex* (not the device) to retrieve the information?

