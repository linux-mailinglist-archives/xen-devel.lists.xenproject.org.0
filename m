Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B33FF5A4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 23:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177681.323281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLuL0-0008Kx-2y; Thu, 02 Sep 2021 21:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177681.323281; Thu, 02 Sep 2021 21:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLuKz-0008I1-VN; Thu, 02 Sep 2021 21:33:33 +0000
Received: by outflank-mailman (input) for mailman id 177681;
 Thu, 02 Sep 2021 21:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wyV=NY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLuKy-0008Hr-Qq
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 21:33:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d28cab53-46fe-448d-aef2-2bc219758426;
 Thu, 02 Sep 2021 21:33:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48F6A610CF;
 Thu,  2 Sep 2021 21:33:31 +0000 (UTC)
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
X-Inumbo-ID: d28cab53-46fe-448d-aef2-2bc219758426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630618411;
	bh=iI+f+PiR3CEK6K0nqtCXsTZumkL7k+UZRF03zicNu5I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jDOKDKMwyschsIyb505laIpMeD4OziXeu/U7R0ZbkabCj7drfHt/n5Vo8Xn1pFJU0
	 zxDu8hFfYGoRm2aCVxMgpMTp3HeXeGhU2CMaw69BsCu4QHm8jBhCJtEc/rpkx5pHQ3
	 u0Wund2RJDa01U1cOfRZxoDKZ5aAOyyUA401+5HnNd+pg6/i1TMUR/BdqYu76d0zGr
	 mlmG7e8nkvrvCuVFtWaVMMJyxDeOSIO8QKxbRjCs9zCFfIm+it9wtxEJFjbvAi6d/u
	 Axs7189/XKBNLDk+F6rPeDZdbUUboDWLH715F78x6ugSLq4nnPAzPuGrH7BSsfuzgB
	 VW38OfvxMIKig==
Date: Thu, 2 Sep 2021 14:33:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
Subject: Re: [PATCH v5 0/7] Domain on Static Allocation
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109021422170.26072@sstabellini-ThinkPad-T480s>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Aug 2021, Penny Zheng wrote:
> Static Allocation refers to system or sub-system(domains) for which memory
> areas are pre-defined by configuration using physical address ranges.
> Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
> beginning, shall never go to heap allocator or boot allocator for any use.
> 
> Memory can be statically allocated to a domain using the property "xen,static-
> mem" defined in the domain configuration. The number of cells for the address
> and the size must be defined using respectively the properties
> "#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> 
> This Patch Serie only talks about Domain on Static Allocation.
> 
> Looking into related [design link](
> https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
> for more details.
> 
> The whole design is about Static Allocation and 1:1 direct-map, and this
> Patch Serie only covers parts of it, which are Domain on Static Allocation.
> Other features will be delievered through different patch series.


I reviewed the whole series and I think it is in great shape and really
close to be committed. Probably the series only needs one more update
and I think we should target the 4.16 release.

I haven't replied to all patches because I agree
with Julien and Jan's comments and everything else looked fine.

