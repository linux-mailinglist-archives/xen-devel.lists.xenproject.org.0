Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4711A12DDE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873148.1284129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB9o-0004oF-8g; Wed, 15 Jan 2025 21:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873148.1284129; Wed, 15 Jan 2025 21:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB9o-0004mG-5w; Wed, 15 Jan 2025 21:42:36 +0000
Received: by outflank-mailman (input) for mailman id 873148;
 Wed, 15 Jan 2025 21:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYB9n-0004mA-7A
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:42:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06a4db4-d389-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 22:42:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5B3F7A4259C;
 Wed, 15 Jan 2025 21:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00249C4CED1;
 Wed, 15 Jan 2025 21:42:30 +0000 (UTC)
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
X-Inumbo-ID: a06a4db4-d389-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736977352;
	bh=Nk2mXVaQ1JVNfZEWArSFIIuKPAJ+ylEmBweqLgrdQ1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JiRu1jTzg1v7MssrwcFbGgfgR8f893pMaOlZNWRpNjVvLjyGqGKER/dmUAPclCb0R
	 7Mo8c6HgwbVd7VaHqX+FSTFdfgqzg4ghGk4m1mO6FmIQoBaLWN34jOErMZEJmayApq
	 dEQDGkSNUHYSVKHmiOgbGXMqxL89wRf1oMTzUBtHaQ2C0e6m8t6SO7777t+8RbdmGz
	 cKrWoeFBo7TjOllZQGerxoYVltlrC2Kl77cweGf3ASWF4OCx7piZtMxX6gOhH+voC6
	 pFCekeAM/BY8yJ0kglWUxiSzdiRYdO+5ilCYPOhOwJyB91hqC8rYiQiQ1K8h9l3b7s
	 8oluk6yawwb2Q==
Date: Wed, 15 Jan 2025 13:42:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/2] ARM: ITS: implement quirks and add support for
 Renesas Gen4 ITS
In-Reply-To: <f165108869cc485ff45fbe870005040c23e83b6c.1736931052.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2501151342200.2684657@ubuntu-linux-20-04-desktop>
References: <cover.1736931052.git.mykyta_poturai@epam.com> <f165108869cc485ff45fbe870005040c23e83b6c.1736931052.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are number of ITS implementations exist which are different from
> the base one which have number of functionalities defined as is
> "IMPLEMENTATION DEFINED", e.g. there may exist differences in cacheability,
> shareability and memory requirements and others. This requires
> appropriate handling of such HW requirements which are implemented as
> ITS quirks: GITS_IIDR (ITS Implementer Identification Register) is used to
> differentiate the ITS implementations and select appropriate set of
> quirks if any.
> 
> As an example of such ITSes add quirk implementation for Renesas Gen4 ITS:
> - add possibility to override default cacheability and shareability
> settings used for ITS memory allocations;
> - change relevant memory allocations to alloc_xenheap_pages which allows
> to specify memory access flags, free_xenheap_pages is used to free;
> - add quirks validation to ensure that all ITSes share the same quirks
> in case of multiple ITSes are present in the system;
> 
> The Gen4 ITS memory requirements are not covered in any errata as of yet,
> but observed behavior suggests that they are indeed required.
> 
> The idea of the quirk implementation is inspired by the Linux kernel ITS
> quirk implementation [1].
> 
> Changelog:
> v2 -> v3:
> - added missing memset;
> v1 -> v2:
> - switched to using alloc_xenheap_pages/free_xenheap_pages for ITS memory
> allocations;
> - updated declaration of its_quirk_flags;
> - added quirks validation to ensure that all ITSes share the same quirks;
> - removed unnecessary vITS changes;
> 
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> [1] https://elixir.bootlin.com/linux/v5.16.1/source/drivers/irqchip/irq-gic-v3-its.c

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


