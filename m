Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCF44D55C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 11:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224695.388143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml7kK-0000od-QM; Thu, 11 Nov 2021 10:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224695.388143; Thu, 11 Nov 2021 10:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml7kK-0000lj-Mm; Thu, 11 Nov 2021 10:55:56 +0000
Received: by outflank-mailman (input) for mailman id 224695;
 Thu, 11 Nov 2021 10:55:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ml7kJ-0000ld-2P
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 10:55:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ml7kI-0003Rt-Vs
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 10:55:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ml7kI-00072l-Up
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 10:55:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1ml7kD-000516-Tx; Thu, 11 Nov 2021 10:55:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=1LPA2ORd2xkFkwn7DDZvn+7hCTiyqtUcTpI6/HQgUL4=; b=LlLHPZoQZwbECiLZn5W7XUF6uy
	ieJIPodcIy/hQr4dnoeBXq255QaS7Zde8rQQ9UfN2LUxsQyclJEtJ/jBWt+ouXIa3SB0/rbbmlcYk
	tJ6uF1fwacK1d2sWIBGjnJ7XHnzbAkGfGi/ZzZcaAGMJ93ZZatqN1yrHXrJBa2f0uGb8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24972.63157.335230.592275@mariner.uk.xensource.com>
Date: Thu, 11 Nov 2021 10:55:49 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org,
    xen-devel@lists.xenproject.org,
    oleksandr_tyshchenko@epam.com,
    Bertrand.Marquis@arm.com,
    Volodymyr_Babchuk@epam.com,
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 for-4.16] xen/arm: allocate_bank_memory: don't create memory banks of size zero
In-Reply-To: <20211110205555.945026-1-sstabellini@kernel.org>
References: <20211110205555.945026-1-sstabellini@kernel.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

To the maiontainer who will review this: could you
please consider these comments as part of your review:

Stefano Stabellini writes ("[PATCH v2 for-4.16] xen/arm: allocate_bank_memory: don't create memory banks of size zero"):
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> In regards to inclusion in 4.16.
> 
> If we don't fix this issue in 4.16, default usage of Xen+Linux won't be
> affected.
> 
> However:
> - Non-Linux OSes that cannot cope with zero-size memory banks could
>   error out. I am not aware of any but there are so many out there in
>   embedded it is impossible to tell.
> - downstream Xen calling make_hypervisor_node for DomUs will crash
> - future Xen calling make_hypervisor_node for DomUs will have to make
>   sure to fix this anyway
> 
> If we commit the patch in 4.16, we fix these issue. This patch is only 2
> lines of code and very easy to review. The risk is extremely low.
> 
> Difficult to say what mistakes could have been made in analysis and
> preparation because it is a trivial if-zero-return patch, which is
> likely to fix latent bugs rather than introducing instability.

Then, subject as usual to satisfactory maintainer review,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

