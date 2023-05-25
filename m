Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC771052C
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 07:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539306.840051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q23GT-0003f7-LB; Thu, 25 May 2023 05:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539306.840051; Thu, 25 May 2023 05:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q23GT-0003cQ-Hf; Thu, 25 May 2023 05:11:53 +0000
Received: by outflank-mailman (input) for mailman id 539306;
 Thu, 25 May 2023 05:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SX5k=BO=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1q23GS-0003cK-9Y
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 05:11:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a72d56ee-faba-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 07:11:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC5D663FA3;
 Thu, 25 May 2023 05:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20665C4339B;
 Thu, 25 May 2023 05:11:48 +0000 (UTC)
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
X-Inumbo-ID: a72d56ee-faba-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684991508;
	bh=a0tzE9UDpxf2Gv03EAySk423E9WJbttajURADQK6RpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E+prJKSG6S1YLfI14dLgGo1xJFb3uRkM/dPsvsquftreGTEc4mdpGqCTE7w1vcjIj
	 vXMGcd2WHPPBm1xLHJDAP249/W6Mjfg3E1wmwyNnriWw5w6b2O48gkDtDkdrifnm1o
	 dVEl9xgtqcSrvqF9PsN5b4phTeSzfIA8mVgdMgaaj9Ww8A1OtUxS2OZhLGE9GyqD9P
	 c/H04SuRMQyVKw3raKrejRwKGEX+ueVginsBjR+mXRD1JokoUZucIdWlb6z37Szt2f
	 we9Y9GD0a5ZcpY+bQ+CiF+F4ncxe/vM8aRqCaCPwGGjMNcIc6pNuAtIvQ5g91kxp2P
	 a4yZbJWlTgikA==
Date: Wed, 24 May 2023 22:11:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Subject: Re: [PATCH] xen/netback: Pass (void *) to virt_to_page()
Message-ID: <20230524221147.5791ba3a@kernel.org>
In-Reply-To: <20230523140342.2672713-1-linus.walleij@linaro.org>
References: <20230523140342.2672713-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 May 2023 16:03:42 +0200 Linus Walleij wrote:
> virt_to_page() takes a virtual address as argument but
> the driver passes an unsigned long, which works because
> the target platform(s) uses polymorphic macros to calculate
> the page.
> 
> Since many architectures implement virt_to_pfn() as
> a macro, this function becomes polymorphic and accepts both a
> (unsigned long) and a (void *).
> 
> Fix this up by an explicit (void *) cast.

Paul, Wei, looks like netdev may be the usual path for this patch 
to flow thru, although I'm never 100% sure with Xen.
Please ack or LUK if you prefer to direct the patch elsewhere?

