Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D539F8D17
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 08:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861622.1273591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOX9H-0003mP-7x; Fri, 20 Dec 2024 07:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861622.1273591; Fri, 20 Dec 2024 07:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOX9H-0003k5-3k; Fri, 20 Dec 2024 07:10:11 +0000
Received: by outflank-mailman (input) for mailman id 861622;
 Fri, 20 Dec 2024 07:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSC2=TN=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1tOX9F-0003gj-7c
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 07:10:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f73a216-bea1-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 08:10:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B6545C596A;
 Fri, 20 Dec 2024 07:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF46C4CECD;
 Fri, 20 Dec 2024 07:10:02 +0000 (UTC)
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
X-Inumbo-ID: 6f73a216-bea1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734678603;
	bh=+Qa20dpz1k2c9j6vQ8UiCWd2lz481p5oFDkSS/B0hoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5NxcrqoUXs+GvMI+39Hg4JYtrYykJ4MertG5+Rp/4KqLmsmqf3i0g4Bsg2psaayn
	 igOHH0/xTMHnNuP4BeyO7QiLqh6oFhaVbzHRCb6Vi0c3m/A23xtwctJ6ymZ22lJkse
	 fa0qX/sqE5IeGXO3xSvmqLCOUx6IMHrMB7vA3Taw=
Date: Fri, 20 Dec 2024 08:09:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
Cc: linux-kernel@vger.kernel.org, Jan Beulich <jbeulich@suse.com>,
	stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/1] lib: Remove dead code
Message-ID: <2024122042-guidable-overhand-b8a9@gregkh>
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-2-ariel.otilibili-anieli@eurecom.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219224645.749233-2-ariel.otilibili-anieli@eurecom.fr>

On Thu, Dec 19, 2024 at 11:45:01PM +0100, Ariel Otilibili wrote:
> This is a follow up from a discussion in Xen:
> 
> The if-statement tests `res` is non-zero; meaning the case zero is never reached.
> 
> Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
> --
> Cc: stable@vger.kernel.org

Why is "removing dead code" a stable kernel thing?

confused,

greg k-h

