Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0F93B7E1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 22:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764488.1174944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWiNP-0001JM-KL; Wed, 24 Jul 2024 20:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764488.1174944; Wed, 24 Jul 2024 20:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWiNP-0001GZ-H5; Wed, 24 Jul 2024 20:14:19 +0000
Received: by outflank-mailman (input) for mailman id 764488;
 Wed, 24 Jul 2024 20:14:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik8X=OY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWiNN-0001GT-Qo
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 20:14:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1cad38-49f9-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 22:14:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7289DCE12AB;
 Wed, 24 Jul 2024 20:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF4DC32781;
 Wed, 24 Jul 2024 20:14:11 +0000 (UTC)
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
X-Inumbo-ID: 4c1cad38-49f9-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721852052;
	bh=5LteRdY+MfTqF8UhxIIySAt41BaRsjswPvyJjP3n5fU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lfrVrzn4ts5Kuw82hwAt3NxiycGHXHxSSKuIH2Pz00LWir474etVQ7eUccouiQalD
	 qgNDnhCyBM6wD2WpFC7vBRkSbh0gGYHIQoNRTbimD7pg1gY2dZqF8QFE5sc3PVwOCM
	 Wrhj/lSI7nfNObD5B4++7Md97yHenfy5MPuYAkljVuE8/XDy2oEvE7rdpbsmaHazNc
	 C/O0jwTU+63/9bn8WS83bhDuO3Qx69L6LuKgOx+xPoC2RIz2QDYHaH9Ya9CPmWsCZ1
	 tzwYUEtpIcGLS3EF3Zl8u6vCMQ5XpQPDopvyeuvIOBpFKFDpW+QpJ7OJcH78YVLw2F
	 sjWR5Qx6NHBPQ==
Date: Wed, 24 Jul 2024 13:14:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Techguru <techguru@byiq.org>
cc: xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen for Apple Silicon (M1 and beyond)
In-Reply-To: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com>
Message-ID: <alpine.DEB.2.22.394.2407241309170.4857@ubuntu-linux-20-04-desktop>
References: <d5c3e0900db98aaaeb7fb52f16598257@mail.infomaniak.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Jul 2024, Techguru wrote:
> Hello,
> Stefano, on IRC, suggested that I start a discussion on this mailing
> list regarding my intention to bring up a fully function XEN on Apple
> Silicon (M1 and beyond).  I am in the process of getting up to speed
> on your governance policies, applied for Coverity access to use some
> of the known issues there as training wheels, and putting my gitlab
> fork into good working order with CI.
> 
> I would rather not duplicate effort which has already been proposed,
> so definitely open to any pointers, any requests for how to chunk
> things into smaller patches, any requests for particular
> ordering/sequencing of patch sets.
> 
> Some obvious areas:
> 16k pages;

For this, do you know if 4K pages are supported (in addition to 16K)? It
would be a lot easier to keep running Xen using 4K pages and run guests
on top of Xen which use 16K pages. In the past, we had Linux using 64K
pages running on top of Xen using 4K pages for example.


> device trees;

You might be able to use the device tree which is used to boot Linux on
Apple silicon


> interrupts;

If the interrupt controller is not an ARM GIC, then we need a driver for
it in Xen


> power management;
> any essential device drivers.

In addition to the interrupt controller, we might need drivers for the
UART or framebuffer to see Xen output. Also the timer. Xen has a driver
for the ARM Generic Timer but if Apple has a different timer, that is
something else to consider.

