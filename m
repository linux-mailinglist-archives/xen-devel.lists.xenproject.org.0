Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00E4073CF
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184850.333631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOprf-0007MU-Tr; Fri, 10 Sep 2021 23:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184850.333631; Fri, 10 Sep 2021 23:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOprf-0007Ke-QL; Fri, 10 Sep 2021 23:23:23 +0000
Received: by outflank-mailman (input) for mailman id 184850;
 Fri, 10 Sep 2021 23:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpre-0007KY-On
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:23:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d208a4f4-f201-42f6-9efc-e5b3668f1202;
 Fri, 10 Sep 2021 23:23:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2949961206;
 Fri, 10 Sep 2021 23:23:21 +0000 (UTC)
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
X-Inumbo-ID: d208a4f4-f201-42f6-9efc-e5b3668f1202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631316201;
	bh=N7LKktutD+QwQybp5f/rKrBsVZiJeC/R7umGYSMMqXk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TYKH7ZNKWMXywDAwVeL41AEHBwT+2Vzt7M/6twb7POXVBhQz+P2DkIFADYuFtOdGx
	 LF5gd7EKeDKaPExyAi4PbCfFtOpf4PZKeC0CAoYYc7ez0923ROqEZUr7zW85B4ktpa
	 lDlIki6s0Z4rv0McrrYS37v9U87OlK9g27aPge3XQfDC23vaKfSY+DESsMrbkfCJf6
	 VosSrN7sZEIiDmiae/9ba5j5NXfePWjNrK56ye2MER1IFu1M4Imlq6wZv8foOSJtF8
	 8QDQKcxjTlAh5c1MqN8Q6IUytTWPH7eBVXeIsK3kgdDK5RHZuOPPn4d6ft5vBuA0me
	 boG9DR4Cs9CZA==
Date: Fri, 10 Sep 2021 16:23:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/12] swiotlb-xen: limit init retries
In-Reply-To: <984fa426-2b7b-4b77-5ce8-766619575b7f@suse.com>
Message-ID: <alpine.DEB.2.21.2109101621430.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <984fa426-2b7b-4b77-5ce8-766619575b7f@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> Due to the use of max(1024, ...) there's no point retrying (and issuing
> bogus log messages) when the number of slabs is already no larger than
> this minimum value.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -207,7 +207,7 @@ retry:
>  	swiotlb_set_max_segment(PAGE_SIZE);
>  	return 0;
>  error:
> -	if (repeat--) {
> +	if (nslabs > 1024 && repeat--) {
>  		/* Min is 2MB */
>  		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
>  		bytes = nslabs << IO_TLB_SHIFT;
> @@ -243,7 +243,7 @@ retry:
>  	rc = xen_swiotlb_fixup(start, nslabs);
>  	if (rc) {
>  		memblock_free(__pa(start), PAGE_ALIGN(bytes));
> -		if (repeat--) {
> +		if (nslabs > 1024 && repeat--) {
>  			/* Min is 2MB */
>  			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
>  			bytes = nslabs << IO_TLB_SHIFT;
> 

