Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459D44CB20
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 22:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224469.387754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkutS-0006pF-MH; Wed, 10 Nov 2021 21:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224469.387754; Wed, 10 Nov 2021 21:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkutS-0006mD-Hk; Wed, 10 Nov 2021 21:12:30 +0000
Received: by outflank-mailman (input) for mailman id 224469;
 Wed, 10 Nov 2021 21:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3iD=P5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkutR-0006lr-Fq
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 21:12:29 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7a5abe0-426a-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 22:12:27 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87C8B6124C;
 Wed, 10 Nov 2021 21:12:25 +0000 (UTC)
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
X-Inumbo-ID: e7a5abe0-426a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636578745;
	bh=XwYpF5Z/eS1NQ694M/y+STxz4kT2S2HKw+hfRGltSz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kJZXFKvkv0gFs8ItrSJsqK2lu7KE35hzyB87B8gHp3XBTnCzUOuNg1dD87kf9VB2B
	 Qj1UMR/oMxFPbdyrpWHNNN5i9+FbCS2+tEWB8SvDS/jsjEFRA9SDpfXMc7mJRw1rhr
	 CFLzPnXGTikqrWKspz8xxDgUXW0aO5SfyEJFzd03KaFgcRT0Zf6fSos+FXD9DhM7ew
	 3wd9jORsB6j6AoWg9ynJoEyTJXmHCFGNEgbKFezXWyfltyII4dzOZdgb3neFpRKxZq
	 qmxeZI8O4Lty6827pzo8nVD5lJw+D+nTbak8yhIYYuWWNuEyaa/GBzeM/d2P7gtVRY
	 X+5ScLw7DARgg==
Date: Wed, 10 Nov 2021 13:12:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Roman Skakun <rm.skakun@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Roman Skakun <roman_skakun@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected
 devices
In-Reply-To: <17547d29-8e15-96f6-2418-5f7ca1c3237d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111101306180.440530@ubuntu-linux-20-04-desktop>
References: <cover.1633106362.git.roman_skakun@epam.com> <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com> <17547d29-8e15-96f6-2418-5f7ca1c3237d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Nov 2021, Julien Grall wrote:
> Hi Roman,
> 
> On 04/10/2021 10:54, Roman Skakun wrote:
> > From: Roman Skakun <roman_skakun@epam.com>
> > 
> > Xen is not exposing any IOMMU properties to Dom0.
> > So Dom0 assumes that all it's devices are not protected by IOMMU.
> > 
> > To make Dom0 aware of IOMMU-protected devices, we need to mark
> > them somehow. With this approach Dom0 Linux kernel will be able
> > to selectively disable swiotlb-xen fops for them which will remove
> > unnecessary buffer bounces.
> > 
> > This patch adds mechanism to describe IOMMU-protected devices by
> > adding `xen,behind-iommu` property to relevant device nodes in
> > Dom0 device tree.
> 
> A few years ago, I attempted to disable the swiotlb when Xen configured the
> IOMMU for the device (see [1]). Did you have a chance to go through the
> thread? In particular, I think Ian Campbell suggestion about creating an IOMMU
> binding is quite interesting.
> 
> Stefano, what do you think?

Yes I think it is a good idea. In fact, thinking more about it, it is
really the best option. Regardless of the implementation (swiotlb or
whatever) the device tree description is likely to look similar to the
description of an IOMMU because it is the common pattern shared by all
controllers (reset, power, clocks, etc.) so it makes sense to re-use it.

- there is one controller node (the "IOMMU")
- there is one property under each device node that is protected,
  pointing to the controller with a phandle and optional parameters (in
  the case of IOMMUs it is called "iommus")

