Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7572C6F79
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 12:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39966.73028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyXX-0001rI-Om; Sat, 28 Nov 2020 11:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39966.73028; Sat, 28 Nov 2020 11:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyXX-0001qt-L3; Sat, 28 Nov 2020 11:37:19 +0000
Received: by outflank-mailman (input) for mailman id 39966;
 Sat, 28 Nov 2020 11:37:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiyXV-0001ql-R7
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:37:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyXV-0005CU-0b; Sat, 28 Nov 2020 11:37:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyXU-0005Me-QN; Sat, 28 Nov 2020 11:37:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=j4Ev1HJphgPb5eW0/uIqr2mAojAbh0QOI9ysdTCWlqs=; b=Qks2uU5fMosYcu/KNPNmIfBl9/
	gDd6yupNdMN2WbhWxwvp8Xnt7amKSMtno3Yml54Z1GqyP5ktAQ8oATc1Z/qhFDwF8YgYOAdeD479P
	uVVbOC15cSzB4kfHnTuUdVjVvey00QsKAoQ8pF9xBYLMGWsXIgXPpVl9rnnvXmgUpLMI=;
Subject: Re: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq()
 in init_*_irq_data()
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, =?UTF-8?Q?Roger_Paul_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20201128113102.6446-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <1682e9e6-a1b2-f0e9-2cba-f7154c5e02b7@xen.org>
Date: Sat, 28 Nov 2020 11:37:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128113102.6446-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

Please ignore this version as I forgot to call add_maintainers.pl.

Sorry for the noise.

Cheers,

On 28/11/2020 11:31, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> init_one_desc_irq() can return an error if it is unable to allocate
> memory. While this is unlikely to happen during boot (called from
> init_{,local_}irq_data()), it is better to harden the code by
> propagting the return value.
> 
> Spotted by coverity.
> 
> CID: 106529
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Roger Paul Monné <roger.pau@citrix.com>
> 
> ---
>      Changes in v2:
>          - Add Roger's reviewed-by for x86
>          - Handle
> ---
>   xen/arch/arm/irq.c | 12 ++++++++++--
>   xen/arch/x86/irq.c |  7 ++++++-
>   2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 3877657a5277..b71b099e6fa2 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -88,7 +88,11 @@ static int __init init_irq_data(void)
>       for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
>       {
>           struct irq_desc *desc = irq_to_desc(irq);
> -        init_one_irq_desc(desc);
> +        int rc = init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
>           desc->irq = irq;
>           desc->action  = NULL;
>       }
> @@ -105,7 +109,11 @@ static int init_local_irq_data(void)
>       for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
>       {
>           struct irq_desc *desc = irq_to_desc(irq);
> -        init_one_irq_desc(desc);
> +        int rc = init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
>           desc->irq = irq;
>           desc->action  = NULL;
>   
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 45966947919e..3ebd684415ac 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -428,9 +428,14 @@ int __init init_irq_data(void)
>   
>       for ( irq = 0; irq < nr_irqs_gsi; irq++ )
>       {
> +        int rc;
> +
>           desc = irq_to_desc(irq);
>           desc->irq = irq;
> -        init_one_irq_desc(desc);
> +
> +        rc = init_one_irq_desc(desc);
> +        if ( rc )
> +            return rc;
>       }
>       for ( ; irq < nr_irqs; irq++ )
>           irq_to_desc(irq)->irq = irq;
> 

-- 
Julien Grall

