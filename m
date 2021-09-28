Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3741A9B3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197672.350853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7a5-0002Z0-L0; Tue, 28 Sep 2021 07:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197672.350853; Tue, 28 Sep 2021 07:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7a5-0002WX-Hq; Tue, 28 Sep 2021 07:31:13 +0000
Received: by outflank-mailman (input) for mailman id 197672;
 Tue, 28 Sep 2021 07:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6b1=OS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mV7a3-0002WR-Fy
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:31:11 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 53547801-c2da-4924-80a0-5ff2bb4ccb01;
 Tue, 28 Sep 2021 07:31:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 172BED6E;
 Tue, 28 Sep 2021 00:31:10 -0700 (PDT)
Received: from [10.57.20.114] (unknown [10.57.20.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 456C63F7B4;
 Tue, 28 Sep 2021 00:31:07 -0700 (PDT)
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
X-Inumbo-ID: 53547801-c2da-4924-80a0-5ff2bb4ccb01
Subject: Re: [PATCH v2 01/11] xen/arm: Fix dev_is_dt macro definition
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-2-andr2000@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <0eda8f1b-a090-5a9b-b9ea-3160be789ab8@arm.com>
Date: Tue, 28 Sep 2021 09:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210923125438.234162-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This macro is not currently used, but still has an error in it:
> a missing parenthesis. Fix this, so the macro is properly defined.
> 
> Fixes: 6c5d3075d97e ("xen/arm: Introduce a generic way to describe device")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
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
> 

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

