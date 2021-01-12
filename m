Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9982F2363
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 01:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65423.115911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz7bN-0004BW-LL; Tue, 12 Jan 2021 00:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65423.115911; Tue, 12 Jan 2021 00:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz7bN-0004BA-IA; Tue, 12 Jan 2021 00:32:01 +0000
Received: by outflank-mailman (input) for mailman id 65423;
 Tue, 12 Jan 2021 00:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kz7bM-0004Ap-8U
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 00:32:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ad7025d-bcec-4f9d-899b-87b864e0bb92;
 Tue, 12 Jan 2021 00:31:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 967BA22CB8;
 Tue, 12 Jan 2021 00:31:58 +0000 (UTC)
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
X-Inumbo-ID: 9ad7025d-bcec-4f9d-899b-87b864e0bb92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610411518;
	bh=Hk0XdrDcRdGgcdKKr85SZEPzvFDL38elHblvqsg4Kyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fKOITv5PbD+WJbB9VxywHGRkdMDJ/8o9hqQWqxnXqIFJi+4PidEc2XXPXj8PcjpKE
	 rfH78Es85bsmpALibat0u5CWYAD2601QJmw5FR7DGNgUSve3cnRuSS3h3G8YNtxrSM
	 v+a+hdSfS0dlq3aBhVxpOfv22d9xjWQ0Cauo6adO8BPUvC8YQjrFr4X4eOPv0i8dFz
	 IAy8QUPxSkTSZq9j5f/N8/pPv9yqaeeCFNg2ZEAWQiDtie7rBPZlKYOL3dmnR4yxH7
	 T15hkcqhalVXIFl3FSM6F0zK9dB5uSHKGpw7sUDkptxYMGuHfVYPjt9u0WhkWIMcBC
	 r1bz84NOljKYA==
Date: Mon, 11 Jan 2021 16:31:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] iommu/arm: ipmmu-vmsa: Use 1U << 31 rather than 1 <<
 31
In-Reply-To: <1610361235-32697-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101111631460.2495@sstabellini-ThinkPad-T480s>
References: <1610361235-32697-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Jan 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Replace all the use of 1 << 31 with 1U << 31 to prevent undefined
> behavior in the IPMMU-VMSA driver.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This is a follow-up to
> https://patchew.org/Xen/20201224152419.22453-1-julien@xen.org/
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 346165c..aef358d 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -187,7 +187,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
>  #define IMCAAR               0x0004
>  
>  #define IMTTBCR                        0x0008
> -#define IMTTBCR_EAE                    (1 << 31)
> +#define IMTTBCR_EAE                    (1U << 31)
>  #define IMTTBCR_PMB                    (1 << 30)
>  #define IMTTBCR_SH1_NON_SHAREABLE      (0 << 28)
>  #define IMTTBCR_SH1_OUTER_SHAREABLE    (2 << 28)
> @@ -251,7 +251,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
>  #define IMUCTR(n)              ((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
>  #define IMUCTR0(n)             (0x0300 + ((n) * 16))
>  #define IMUCTR32(n)            (0x0600 + (((n) - 32) * 16))
> -#define IMUCTR_FIXADDEN        (1 << 31)
> +#define IMUCTR_FIXADDEN        (1U << 31)
>  #define IMUCTR_FIXADD_MASK     (0xff << 16)
>  #define IMUCTR_FIXADD_SHIFT    16
>  #define IMUCTR_TTSEL_MMU(n)    ((n) << 4)
> -- 
> 2.7.4
> 

