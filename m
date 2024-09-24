Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64573984F03
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 01:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803377.1213913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stF30-0004ig-VG; Tue, 24 Sep 2024 23:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803377.1213913; Tue, 24 Sep 2024 23:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stF30-0004fv-SK; Tue, 24 Sep 2024 23:34:22 +0000
Received: by outflank-mailman (input) for mailman id 803377;
 Tue, 24 Sep 2024 23:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=325E=QW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stF2z-0004fp-9Q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 23:34:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85320381-7acd-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 01:34:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BAE82A436CB;
 Tue, 24 Sep 2024 23:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ECEC4CEC4;
 Tue, 24 Sep 2024 23:34:17 +0000 (UTC)
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
X-Inumbo-ID: 85320381-7acd-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727220858;
	bh=Vx5EQ6rhS3Fv6bxgBXX/Np6Kh1A0CYJmEkT48S3P11M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=moZ8owXs0U/AM5Q+y9J6xCY7v/QO3q+kNFKo2DwazCbyp1Yi9I+3OAA894p+cAsUx
	 noe7WOh0GpaWOZJKPN4HXCHZwWdXFx+9CXzxrznvNHwbI+fRpZArbKY1se1MGEdvdf
	 62bESD9XIBf2GcSIpFB/dtlOu54uT0SJN/WFOHJQp5yklLiMgKxI2S3kkM1Du+zbMu
	 cdqRyV6QUxcsL7sji4+aNYxPRpSv92i0zrFhYLrMWVxFiuRTE3tHhiOdxMkkIZktqJ
	 PSu2xIrp8dvdNJiccqH2B9DNy+cnGAEACbzwprxt6yq8V17+Gf8w4dArc3Jsyyldno
	 nYlf2rLHBBk5Q==
Date: Tue, 24 Sep 2024 16:34:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v1 1/6] xen/arm: Decrease size of the 2nd ram bank
In-Reply-To: <f20c2ddb-162b-4e62-93b6-882e19e17852@xen.org>
Message-ID: <alpine.DEB.2.22.394.2409241622320.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-2-edgar.iglesias@gmail.com> <f20c2ddb-162b-4e62-93b6-882e19e17852@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, Julien Grall wrote:
> Hi Edgar,
> 
> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > The address range between 4G (32bit) and 1TB (40bit) is fully
> > allocated. There's no more room for devices on ARM systems with
> > 40-bit physicall address width.
> > > This decreases the size of the second RAM bank to free up space
> > in preparation for virtio-pci and for future use-cases.
> 
> I don't think we should reduce the amount of RAM supported in the default
> case. Instead, I think it is time to support a more dynamic layout so we still
> allow 1TB guest when QEMU is not emulated a virtual PCI hostbridge.

Edgar, do you think it would be possible for QEMU to take the virtio-pci
address ranges and SPIs on the command line? If yes, I think that would
solve the problem on the QEMU side.

On the Xen side, you have already added "virtio-pci-ranges" as dom0less
property and that's all we need as far as I can tell.

Then you can remove patch #1 and patch #2 from this series?

