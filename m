Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E0A115CC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 01:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872137.1283092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXqqz-0006NW-9j; Wed, 15 Jan 2025 00:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872137.1283092; Wed, 15 Jan 2025 00:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXqqz-0006LF-73; Wed, 15 Jan 2025 00:01:49 +0000
Received: by outflank-mailman (input) for mailman id 872137;
 Wed, 15 Jan 2025 00:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tXqqx-0006L9-Re
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 00:01:47 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e85b26fa-d2d3-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 01:01:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E331A41DF6;
 Tue, 14 Jan 2025 23:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1727C4CEDD;
 Wed, 15 Jan 2025 00:01:41 +0000 (UTC)
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
X-Inumbo-ID: e85b26fa-d2d3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736899304;
	bh=R5zLWF7CbOxpfboysM0ptUUtByEdQJcyaoamCb44Zic=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AlM6PkkFCtHnMVVMSXFes10U94llQpl5jo1qnvjauWoEc/xd/Gi3pJJ8dpzMyOJkB
	 wTLYlybnW3hO+v9f8sIEOuaoRJoZRdh/cYVePR1YICKJyPGWCXopf8y9Wg0hVvIUhz
	 T7uvmjDQ9KQUkvyzZlJ2Q415HpZpyHJnmojbzHdTS3Hh/zvpUMoD1fIhbAKdQ4L2zd
	 q3qooO+8XJE9gowk3hWuMbzU99ZBXgqgW1ThEWyoHG+mmLa+XRPzi7kSYm7cNzZrD+
	 gj78gZrv2RsUo2wD/AUyFn/6p/hrrPsXf77+qZak86YY9DIlYAMVF7Tr4HUEnxBgin
	 MNvHxfndnkYew==
Date: Tue, 14 Jan 2025 16:01:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Milan Djokic <milandjokic1995@gmail.com>
cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
    sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    Slavisa.Petrovic@rt-rk.com, Milan.Djokic@rt-rk.com, 
    rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, 
    takakura@valinux.co.jp, linux-kernel@vger.kernel.org, 
    xen-devel@lists.xenproject.org, iommu@lists.linux.dev, 
    oleksii.kurochko@gmail.com
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
In-Reply-To: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
Message-ID: <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Oleksii

On Tue, 14 Jan 2025, Milan Djokic wrote:
> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> 
> This patch introduces initial support for running RISC-V as a Xen guest.
> It provides the necessary infrastructure and stubs for Xen-specific
> operations. Key changes include:
> 
> - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
>   and interfaces, with function implementations stubbed for future work.
> - Introduction of Xen-specific headers for RISC-V, including event
>   handling, hypervisor interaction, and page management. Functions are
>   defined but not yet implemented.
> - Stub implementations for memory management, grant tables, and context
>   switching in the Xen environment, allowing further development and
>   integration.
> 
> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>

Hi Milan, Slavisa,

Thank you very much for your contribution! Which Xen tree are you using
for development? I am asking because RISC-V support in Xen is still in
the process of being upstreamed, and [1] is the tree that consolidates
all patches currently on the to-be-upstreamed list.  

While the specific Xen tree you are using is not particularly important
at this stage, and using [1] is not a requirement, I am asking because
it is essential to align on the hypervisor ABI, especially regarding any
details that have not yet been upstreamed. Specifically, is there
anything in this patch series that relies on features not yet upstream
in Xen?  

[1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads

