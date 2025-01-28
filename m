Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9982A202F2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 02:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878274.1288444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcaHx-0001qJ-77; Tue, 28 Jan 2025 01:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878274.1288444; Tue, 28 Jan 2025 01:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcaHx-0001oh-4R; Tue, 28 Jan 2025 01:21:13 +0000
Received: by outflank-mailman (input) for mailman id 878274;
 Tue, 28 Jan 2025 01:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tcaHv-0001ob-H0
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 01:21:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2511a3b1-dd16-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 02:21:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A5285C5861;
 Tue, 28 Jan 2025 01:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4548C4CED2;
 Tue, 28 Jan 2025 01:21:02 +0000 (UTC)
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
X-Inumbo-ID: 2511a3b1-dd16-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738027264;
	bh=sTxYZq/jdJVkxS5kHUyvBdCxB0yAB1dWDP2A/jGH8VE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dvkDchOhbr+XNnS3JoPq6IoJZkjXBfqLI2PnkVQ75sjE9JGxOzeDFmyj8YcdYeyOn
	 sz7fSATmXN/VDM9kKpM6BZdTsYKyqLLQtuSjRk58moOakMT8rgJsEgnfIzr8LF4I1b
	 8MFuDzgemwQd0QUzNiNdgSQ5zhTLrLr/aowyfDoGBuJxQWZilfiQOjG0AcANQkIcP3
	 2ZF6dGT71IY64bOS74buSmsl6/lJzOaS8nMuvd+r4avfE+N5lToBO1ewssjo9R4oUK
	 rxOiSPEq25fqf3WnHsS0N9r4n/L/343ixNSqCDFSld69Zf2cwkof5PmwjzyOsnpA59
	 s4lrbcXvMoLYg==
Date: Mon, 27 Jan 2025 17:21:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
In-Reply-To: <E2EF4E08-8D6D-4F43-99D1-BDAE3FB76CF4@arm.com>
Message-ID: <alpine.DEB.2.22.394.2501271720282.11086@ubuntu-linux-20-04-desktop>
References: <20250127104556.175641-1-michal.orzel@amd.com> <20250127104556.175641-3-michal.orzel@amd.com> <E2EF4E08-8D6D-4F43-99D1-BDAE3FB76CF4@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-362762593-1738025722=:11086"
Content-ID: <alpine.DEB.2.22.394.2501271720280.11086@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-362762593-1738025722=:11086
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2501271720281.11086@ubuntu-linux-20-04-desktop>

On Mon, 27 Jan 2025, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 27 Jan 2025, at 10:45, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
> > arch/arm/platforms/vexpress.c: In function 'vexpress_smp_init':
> > arch/arm/platforms/vexpress.c:102:12: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Werror=format=]
> >  102 |     printk("Set SYS_FLAGS to %"PRIpaddr" (%p)\n",
> > 
> > When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long.
> > Commit 96f35de69e59 dropped __virt_to_maddr() which used paddr_t as a
> > return type. Without a cast, the expression type is unsigned long long
> > which causes the issue. Fix it.
> > 
> > Fixes: 96f35de69e59 ("x86+Arm: drop (rename) __virt_to_maddr() / __maddr_to_virt()")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> I’ve tested this one and it fix the compilation issue on the above setup, I’ve also tested
> that it doesn’t introduce issues on other setup (e.g. arm64)
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-362762593-1738025722=:11086--

