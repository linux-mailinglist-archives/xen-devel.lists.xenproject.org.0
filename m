Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF54073DB
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184863.333652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpun-00008X-KX; Fri, 10 Sep 2021 23:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184863.333652; Fri, 10 Sep 2021 23:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpun-000069-HP; Fri, 10 Sep 2021 23:26:37 +0000
Received: by outflank-mailman (input) for mailman id 184863;
 Fri, 10 Sep 2021 23:26:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpum-000063-1w
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:26:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89efd266-128e-11ec-b293-12813bfff9fa;
 Fri, 10 Sep 2021 23:26:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 922D4611B0;
 Fri, 10 Sep 2021 23:26:34 +0000 (UTC)
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
X-Inumbo-ID: 89efd266-128e-11ec-b293-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631316394;
	bh=nWCVWm37Cn4aTHD9fKKBK0iiTuNj5cGbnQ7UNy5fjiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p13Fcm19TN9LmTK4LlFXJYisdlx8j91SHYqgG2d+C217OScazn4CK+Goc+whmNQJa
	 ccx3b/fMa+GAFLShtrkw2wCd2vAY0tVJ+/AqBkqitqoL9L5oLqKutEGWAUNAK+R3Y/
	 sJqYpnAww5AVQqbFTNJObMcBwqD6gchOiTNTjN98IwZcwwgsltdB9KUR7ykVRaKEAN
	 o9ueydR3zF1hTRSg1zy6p3RmdqXl4lQpCX4HY/6cZ/OXW5AaL4X2m1jBP05g7PMx33
	 +7J7HWLwwv6rZO1z4o22ZhLOTgTt2k1dFajut6FdFj+OYvmqqJyJqr4D0oscTPpFLh
	 iOJfITNuWNWmw==
Date: Fri, 10 Sep 2021 16:26:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/12] swiotlb-xen: arrange to have buffer info logged
In-Reply-To: <2e3c8e68-36b2-4ae9-b829-bf7f75d39d47@suse.com>
Message-ID: <alpine.DEB.2.21.2109101626250.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <2e3c8e68-36b2-4ae9-b829-bf7f75d39d47@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> I consider it unhelpful that address and size of the buffer aren't put
> in the log file; it makes diagnosing issues needlessly harder. The
> majority of callers of swiotlb_init() also passes 1 for the "verbose"
> parameter. 
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -253,7 +253,7 @@ retry:
>  		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
>  	}
>  
> -	if (swiotlb_init_with_tbl(start, nslabs, false))
> +	if (swiotlb_init_with_tbl(start, nslabs, true))
>  		panic("Cannot allocate SWIOTLB buffer");
>  	swiotlb_set_max_segment(PAGE_SIZE);
>  }
> 

