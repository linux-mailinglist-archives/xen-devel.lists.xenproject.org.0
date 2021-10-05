Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C5421B59
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 02:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201853.356491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXYmB-0001RR-Il; Tue, 05 Oct 2021 00:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201853.356491; Tue, 05 Oct 2021 00:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXYmB-0001PT-Eu; Tue, 05 Oct 2021 00:57:47 +0000
Received: by outflank-mailman (input) for mailman id 201853;
 Tue, 05 Oct 2021 00:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXYmA-0001Oo-1E
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 00:57:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40245a20-2577-11ec-bec4-12813bfff9fa;
 Tue, 05 Oct 2021 00:57:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 363696140B;
 Tue,  5 Oct 2021 00:57:44 +0000 (UTC)
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
X-Inumbo-ID: 40245a20-2577-11ec-bec4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633395464;
	bh=PrNXBNszwWDc2/Ya6RS7TEevhzR3nEWnHU7H6WQvUCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OIcrMmmaeaVRe9KJKh7U5UmnsA057Fp2598gFKi60HhSLfLwWl1uvaTHULAWNOyka
	 /VK0HKN5fI39AebI4mRUy5gqgrJC+qeQ4eFFvLK0z58eEvJYy/Ppcr5v/qtplbo61x
	 kYJlGlwhfjQJc3SQK1UsfgXCpq6/DTnpxO0qH5lHJqQGAoh6oFelpGNJ0USq/OQzuN
	 n8mUfQDMILPl85CEN7/1yp61huutFadn+xlNDwJz96WKN6ib8ts2EaWJSTaUmpw+JU
	 tr/ej5sUQdV6z3a8Z9dfZSJ9vZUHRePa40Qqy4FzBA0sb0+UiH8TNHWR/Opd98a33b
	 p36wY4W8jDmPg==
Date: Mon, 4 Oct 2021 17:57:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v4 01/11] xen/arm: Fix dev_is_dt macro definition
In-Reply-To: <20211004141151.132231-2-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2110041757350.3209@sstabellini-ThinkPad-T480s>
References: <20211004141151.132231-1-andr2000@gmail.com> <20211004141151.132231-2-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Oct 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This macro is not currently used, but still has an error in it:
> a missing parenthesis. Fix this, so the macro is properly defined.
> 
> Fixes: 6c5d3075d97e ("xen/arm: Introduce a generic way to describe device")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

I committed this patch


> ---
> New in v2
> ---
>  xen/include/asm-arm/device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 5ecd5e7bd15e..ebe84ea853cd 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -27,7 +27,7 @@ typedef struct device device_t;
>  
>  /* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
>  #define dev_is_pci(dev) ((void)(dev), 0)
> -#define dev_is_dt(dev)  ((dev->type == DEV_DT)
> +#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
>  
>  enum device_class
>  {
> -- 
> 2.25.1
> 

