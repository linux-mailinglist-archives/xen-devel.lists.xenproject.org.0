Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4C2B9E89
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 00:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31461.61845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kftbR-0003Ed-By; Thu, 19 Nov 2020 23:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31461.61845; Thu, 19 Nov 2020 23:44:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kftbR-0003EE-8d; Thu, 19 Nov 2020 23:44:37 +0000
Received: by outflank-mailman (input) for mailman id 31461;
 Thu, 19 Nov 2020 23:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kftbP-0003E9-Gw
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:44:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d05e92b6-e411-4dea-9e7a-23ead6b593c9;
 Thu, 19 Nov 2020 23:44:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1E8422227;
 Thu, 19 Nov 2020 23:44:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kftbP-0003E9-Gw
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:44:35 +0000
X-Inumbo-ID: d05e92b6-e411-4dea-9e7a-23ead6b593c9
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d05e92b6-e411-4dea-9e7a-23ead6b593c9;
	Thu, 19 Nov 2020 23:44:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B1E8422227;
	Thu, 19 Nov 2020 23:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605829473;
	bh=J+rHZlNXQ50MPLCu9PF3eq71Es79PZVFv2lVUS6TJ9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jPxP5yu6049nF6ofeLzSBHuqsHgbxkcaDUvfOOwqyBAnUqvj5JRRyVwO3q3ahpsDw
	 TBGjjzOAIL/V+Wje8fUxFUn7rcPVSt1V0PEWVLXDDV6Yecy4o9KTJUYCFpGgP+90l4
	 h+jo30K6VMHBLrjdY49Bpvuc62IjX/7pyBzEwjAg=
Date: Thu, 19 Nov 2020 15:44:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/irq: Propagate the error from init_one_desc_irq()
 in init_irq_data()
In-Reply-To: <20201119145434.28065-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2011191542200.7979@sstabellini-ThinkPad-T480s>
References: <20201119145434.28065-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> init_one_desc_irq() can return an error if it is unable to allocate
> memory. While this is unlikely to happen during boot (called from
> init_irq_data()), it is better to harden the code by propagting the
> return value.
> 
> Spotted by coverity.
> 
> CID: 106529
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Hi Julien,

Thanks for the patch. I was about to commit it when I realized there is
one more caller: xen/arch/arm/irq.c:init_local_irq_data

Should we change that too to check for the return error?


> ---
>  xen/arch/arm/irq.c | 7 ++++++-
>  xen/arch/x86/irq.c | 7 ++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 3877657a5277..279d221a2b85 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -88,7 +88,12 @@ static int __init init_irq_data(void)
>      for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
>      {
>          struct irq_desc *desc = irq_to_desc(irq);
> -        init_one_irq_desc(desc);
> +        int rc;
> +
> +        rc = init_one_irq_desc(desc);
> +        if ( rc )
> +            return rc;
> +
>          desc->irq = irq;
>          desc->action  = NULL;
>      }
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 45966947919e..3ebd684415ac 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -428,9 +428,14 @@ int __init init_irq_data(void)
>  
>      for ( irq = 0; irq < nr_irqs_gsi; irq++ )
>      {
> +        int rc;
> +
>          desc = irq_to_desc(irq);
>          desc->irq = irq;
> -        init_one_irq_desc(desc);
> +
> +        rc = init_one_irq_desc(desc);
> +        if ( rc )
> +            return rc;
>      }
>      for ( ; irq < nr_irqs; irq++ )
>          irq_to_desc(irq)->irq = irq;
> -- 
> 2.17.1
> 

