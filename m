Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750BF417E5D
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195694.348503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTunA-0002ty-1K; Fri, 24 Sep 2021 23:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195694.348503; Fri, 24 Sep 2021 23:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTun9-0002rV-Tz; Fri, 24 Sep 2021 23:39:43 +0000
Received: by outflank-mailman (input) for mailman id 195694;
 Fri, 24 Sep 2021 23:39:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTun8-0002rP-WC
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:39:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b092362d-1d90-11ec-bb28-12813bfff9fa;
 Fri, 24 Sep 2021 23:39:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01B3E61212;
 Fri, 24 Sep 2021 23:39:40 +0000 (UTC)
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
X-Inumbo-ID: b092362d-1d90-11ec-bb28-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632526781;
	bh=ncldt2P4bIC1q0WncDFHmYhS3OigG1VYxOsQVRu860c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GP6CsIqmUCRQzhbBD6eY7TSIOgEdziqRs+kPsMf1CwlauVFZ8Wbz55JvCANGlb9cK
	 im7cyAdNILqHOWoERJ4A1TJZG1+CLEcezGSjEP3v/15uhMKmeNsXuuab5L6QuEkT8h
	 5L0mcPffEvm0yxr2n7xhYnYntSOpligALZpgrCgbpP+YaIYkTfz/D4aS7ErLXmBbEq
	 xvg7Z5X30fQbVHf62G1xhYH2GKapaWpuIaF10A7ISYCZa0AZ3L0wRJwB+aBcTKbOSd
	 0e5JAeO/7gn0CTQnWHTH4LQWMN+eGBqp6+9M6zvIDREy/OES6zzJSKk1sjooJ5NLMS
	 DL6CWD2Nj4CBg==
Date: Fri, 24 Sep 2021 16:39:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 01/11] xen/arm: Fix dev_is_dt macro definition
In-Reply-To: <20210923125438.234162-2-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241639230.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-2-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This macro is not currently used, but still has an error in it:
> a missing parenthesis. Fix this, so the macro is properly defined.
> 
> Fixes: 6c5d3075d97e ("xen/arm: Introduce a generic way to describe device")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> New in v2
> ---
>  xen/include/asm-arm/device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 582119c31ee0..64aaa2641b7f 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -29,7 +29,7 @@ typedef struct device device_t;
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

