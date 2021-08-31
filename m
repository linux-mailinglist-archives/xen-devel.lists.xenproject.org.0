Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E233FCF4D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 23:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175984.320388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLBeD-00060A-T8; Tue, 31 Aug 2021 21:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175984.320388; Tue, 31 Aug 2021 21:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLBeD-0005x4-PU; Tue, 31 Aug 2021 21:50:25 +0000
Received: by outflank-mailman (input) for mailman id 175984;
 Tue, 31 Aug 2021 21:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLBeC-0005wy-Tg
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 21:50:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71e39252-0aa5-11ec-ad88-12813bfff9fa;
 Tue, 31 Aug 2021 21:50:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4826360200;
 Tue, 31 Aug 2021 21:50:23 +0000 (UTC)
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
X-Inumbo-ID: 71e39252-0aa5-11ec-ad88-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630446623;
	bh=LLs5/U3xoDrfZP6xHjj4M1l0zoAdilk2UEoctdzkmkw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DDRJeT+egUxWhkd+MEil9XwX27Ga7B1ME7bCKNFx9o0lgJwUAB7gOtVUGKbyr61lX
	 UnPpy/jF7auzNcm+iCPd3R/TmOWC7y9EiJ67EL2FXMpLgbIdHqxbpbP0CLFaWdYDZh
	 d2Ask9gqCGGStg0uoFNVZlKuzeoGyw/53WyxpbK38RRp3x9UieAjotTl5MCliBrNlQ
	 RuYU86FakFf0qf4Nrq9vNptcqJ+v3IoZP5pSQuyCE+ck+ub6SksMfDeDG6wV7J/x8h
	 HuNWfrg7ZKtbA5Ej4eLM0TWBH/jZ9RIE0d8R0kYhj0vEpss/DHp1Ht3Mutq+7advs7
	 KrW1qs706HjyA==
Date: Tue, 31 Aug 2021 14:50:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Skakun <Roman_Skakun@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrii Anisov <Andrii_Anisov@epam.com>, Roman Skakun <rm.skakun@gmail.com>
Subject: Re: Disable IOMMU in Dom0
In-Reply-To: <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2108311444310.18862@sstabellini-ThinkPad-T480s>
References: <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Aug 2021, Roman Skakun wrote:
> Hi, Stefano!
> 
> I have seen your negotiation of disabling xen-swiotlb for devices which are controlled by IOMMU in Dom0:
> https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s/
> 
> As I was thinking to create a common implementation because I have the issue
> when device controlled by IOMMU using xen-swiotlb fops and bounce buffer as the result.
> https://lore.kernel.org/xen-devel/060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org/T/
> 
> Do you have any future plans to finish implementation for upstream?

Hi Roman,

The feature is already upstream in Linux as f5079a9a2, and the new
feature flags are XENFEAT_direct_mapped and XENFEAT_not_direct_mapped.

If you have a setup where Dom0 is not 1:1 mapped (which is not currently
possible with upstream Xen but it is possible with cache coloring) and
uses the IOMMU to make device DMA work like regular DomUs, then passing
XENFEAT_not_direct_mapped to Linux would make it work. Without
XENFEAT_not_direct_mapped, Linux would try to use swiotlb-xen which has
code that relies on Linux being 1:1 mapped to work properly.

Is that the same problem that you have, or is dom0 1:1 mapped in your
case? If dom0 is 1:1 mapped then swiotlb-xen should work regardless of
whether the IOMMU is enabled or disabled.

I hope this helps.

Cheers,

Stefano

