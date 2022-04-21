Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371750ABE9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 01:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310511.527384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhg46-00064W-70; Thu, 21 Apr 2022 23:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310511.527384; Thu, 21 Apr 2022 23:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhg46-00062h-3w; Thu, 21 Apr 2022 23:18:22 +0000
Received: by outflank-mailman (input) for mailman id 310511;
 Thu, 21 Apr 2022 23:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhg44-00062Z-JS
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 23:18:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52dfda99-c1c9-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 01:18:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1491261EA5;
 Thu, 21 Apr 2022 23:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA51C385A7;
 Thu, 21 Apr 2022 23:18:15 +0000 (UTC)
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
X-Inumbo-ID: 52dfda99-c1c9-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650583095;
	bh=wAlm6QlmE5vrtKgm8mKwkm92dsQdTmg8jgylRHRpKdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b897pQ7WHELW+y5IW3gX5iFYkZIYjG0pt0fYwKpwF0fJ2UPrcuw2/AAK79KjVqOHq
	 GWD38s9mo5gJ+8cmot8ULakTF5q7mJsUotB16K5O/J6EjdzdufWebUEzfIKF/MjZbZ
	 Ddoc+en+ZHhGH+9iK+GFpNNS9n42vhrDjqPbAwtzQb2H+PuBGElnHjemsTZXI/xFKG
	 7FiI87aERh7BQNpiRNZQW0yusoPkcLtt81oKluFSzBlha69OClxG9HcZr6YHm0Emc+
	 QW8H30gahXOIui3mZnX3AXE6Yf367eX951iFD2IKI3nQ4026nd3/JRWM06Gy5aopMo
	 UlhMOvpdiGvaw==
Date: Thu, 21 Apr 2022 16:18:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <404e095e-6645-6f00-40e1-64574a6d2c3e@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204211618080.915916@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop> <20220416001701.1301324-2-sstabellini@kernel.org> <6e01871e-9e47-2d92-617e-952dde2df3b2@arm.com> <alpine.DEB.2.22.394.2204201630330.915916@ubuntu-linux-20-04-desktop>
 <404e095e-6645-6f00-40e1-64574a6d2c3e@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Apr 2022, Michal Orzel wrote:
> On 21.04.2022 01:31, Stefano Stabellini wrote:
> > 
> > Oops, yes I did. Well spotted. Just sending this one update here.
> > 
> > 
> > ---
> > gitlab-ci: add an ARM32 qemu-based smoke test
> > 
> > Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> > the test-artifacts qemu container. The minimal test simply boots Xen
> > (built from previous build stages) and Dom0.
> > 
> > The test needs a working kernel and minimal initrd for dom0. Instead of
> > building our own kernel and initrd, which would mean maintaining one or
> > two more builting scripts under automation/, we borrow a kernel and
> > initrd from distros.
> > 
> > For the kernel we pick the Debian Bullseye kernel, which has everything
> > we need already built-in. However, we cannot use the Debian Bullseye
> > initrd because it is 22MB and the large size causes QEMU to core dump.
> > 
> > Instead, use the tiny busybox-based rootfs provided by Alpine Linux,
> > which is really minimal: just 2.5MB. Note that we cannot use the Alpine
> > Linux kernel because that doesn't boot on Xen.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Thanks!

