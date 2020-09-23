Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B49275EED
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 19:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL8nv-0000QD-Sj; Wed, 23 Sep 2020 17:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDdr=DA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kL8nu-0000Q5-BN
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 17:43:42 +0000
X-Inumbo-ID: a5278fce-e628-471b-b630-e76d9a11c3cf
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5278fce-e628-471b-b630-e76d9a11c3cf;
 Wed, 23 Sep 2020 17:43:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72A7020665;
 Wed, 23 Sep 2020 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600883020;
 bh=Dv1ZVTm54NNGTbN2W/VYizSyFO51TBojndLO/is6yNk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ypLjP00iRzX0431xOR9cGpIGNl9TFU4/1WzCK5vRi6xNFaBJi6GqGbw0tLl52rMQo
 HXHJ7NiPSglWMluakHbkh3inM16CvkQ/VFQhOUw2NGP5SwBuUZaux43b3HZubFQDe3
 m/fDZJ9ROKayT9uYQ7dhkwrNvUgb/3nk4VP4eWb0=
Date: Wed, 23 Sep 2020 10:43:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm SMMUv{1, 
 2} drivers
In-Reply-To: <20200923082832.20038-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2009231043310.1495@sstabellini-ThinkPad-T480s>
References: <20200923082832.20038-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 23 Sep 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> SMMUv{1, 2} are both marked as security supported, so we would
> technically have to issue an XSA for any IOMMU security bug.
> 
> However, at the moment, device passthrough is not security supported
> on Arm and there is no plan to change that in the next few months.
> 
> Therefore, mark Arm SMMUv{1, 2} as supported but not security supported.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> ---
>  SUPPORT.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 25987ec1dfb6..f35943a432f7 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -62,8 +62,8 @@ supported in this document.
>  
>      Status, AMD IOMMU: Supported
>      Status, Intel VT-d: Supported
> -    Status, ARM SMMUv1: Supported
> -    Status, ARM SMMUv2: Supported
> +    Status, ARM SMMUv1: Supported, not security supported
> +    Status, ARM SMMUv2: Supported, not security supported
>      Status, Renesas IPMMU-VMSA: Supported, not security supported
>  
>  ### ARM/GICv3 ITS
> -- 
> 2.17.1
> 

