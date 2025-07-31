Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D41B1770A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 22:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066385.1431608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZk0-0004KH-Ou; Thu, 31 Jul 2025 20:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066385.1431608; Thu, 31 Jul 2025 20:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZk0-0004IW-M4; Thu, 31 Jul 2025 20:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1066385;
 Thu, 31 Jul 2025 20:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhZjz-00045i-Au
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 20:19:03 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98f789f0-6e4b-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 22:19:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC66C461B0;
 Thu, 31 Jul 2025 20:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEC6C4CEEF;
 Thu, 31 Jul 2025 20:18:59 +0000 (UTC)
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
X-Inumbo-ID: 98f789f0-6e4b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753993140;
	bh=M9oiKHqkI0BQpgZpaTh8G1mh4IuSI9Cvuuc19iuTS10=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eSHwfO3Pq5kp46aKch2xrwPzXT8z1vkIS91QEivnSvM7tWMjzof5u08HBHR5ikgKE
	 vBSoLoPsKoVCqUkFxUNE+zesHo6md2EludO+y8aUP1gMZViSB8faq6MW6Z1OYaMFsr
	 iJbdSiSFY65YJYKnmlAHAgIbQrgEs7UqkrJXqYdDQv2UysJI3dARKENWlAiNj6jSk1
	 PxdJHzId8biAeJqoffAs79BfxU1n+Yrhmuw2ZOmMbjaRUxKnbMP++HBmbgqjqPMixm
	 s/0jjF0Cy6zt0OywhsZil+s2FeeE2odNhqBqe51koY3ipyfLBJPhmJcwzEkRO7Rnje
	 LAE5bph0ZemmQ==
Date: Thu, 31 Jul 2025 13:18:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] common: Make livepatch dependent on HAS_VMAP
In-Reply-To: <8d2d444c-29cb-45da-9bf0-03dac4d01cb8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507311318500.468590@ubuntu-linux-20-04-desktop>
References: <20250731080522.810468-1-michal.orzel@amd.com> <20250731080522.810468-3-michal.orzel@amd.com> <8d2d444c-29cb-45da-9bf0-03dac4d01cb8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, Jan Beulich wrote:
> On 31.07.2025 10:05, Michal Orzel wrote:
> > It should not be possible to select and build livepatch if HAS_VMAP is
> > not selected. This is the case on MPU systems.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> I agree this is necessary for now, so
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

