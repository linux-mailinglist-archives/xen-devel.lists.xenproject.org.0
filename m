Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35D7D4D70
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621803.968612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvER2-000063-Av; Tue, 24 Oct 2023 10:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621803.968612; Tue, 24 Oct 2023 10:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvER2-0008VF-84; Tue, 24 Oct 2023 10:14:52 +0000
Received: by outflank-mailman (input) for mailman id 621803;
 Tue, 24 Oct 2023 10:14:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvER0-0008Tt-Tz
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:14:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvER0-0004nF-3I; Tue, 24 Oct 2023 10:14:50 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEQz-00068f-To; Tue, 24 Oct 2023 10:14:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Mn08rQzR8Ae69Dh/78nb9A/ArCoiEJYWrtsE8HpL6Xw=; b=JCqr0IG7LjM2l4QIyTDCE4BtO/
	nYrrTa3RxeVTFtgA2un+j4kc+sreG/Z9yPti03BkL63rrFYXzg52kAp3NWSo7dDaMCcVw1mbfpeqk
	loPh5ReHR3rzvx3dxYZ6RsysCpGjITPQHJzNX5pxiawhrySGBuHI9Cqb5ScSCI9obU3c=;
Message-ID: <16d4ffd6-340d-4166-96a2-7809ba461111@xen.org>
Date: Tue, 24 Oct 2023 11:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm64: domctl: Avoid unreachable code in
 subarch_do_domctl()
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20231023175220.42781-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231023175220.42781-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I forgot to CC the maintainers.

On 23/10/2023 18:52, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The 'break' the XEN_DOMCTL_set_address_size is unreachable and tools
> like Eclair will report as a violation of Misra Rule 2.1.
> 
> Furthermore, the nested switch is not very easy to read. So move
> out the nested switch in a separate function to improve the
> readability and hopefully address the MISRA violation.
> 
> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Only compiled tested. Waiting for the CI to confirm there is no
> regression.
> ---
>   xen/arch/arm/arm64/domctl.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 14fc622e9956..8720d126c97d 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -33,27 +33,31 @@ static long switch_mode(struct domain *d, enum domain_type type)
>       return 0;
>   }
>   
> +static long set_address_size(struct domain *d, uint32_t address_size)
> +{
> +    switch ( address_size )
> +    {
> +    case 32:
> +        if ( !cpu_has_el1_32 )
> +            return -EINVAL;
> +        /* SVE is not supported for 32 bit domain */
> +        if ( is_sve_domain(d) )
> +            return -EINVAL;
> +        return switch_mode(d, DOMAIN_32BIT);
> +    case 64:
> +        return switch_mode(d, DOMAIN_64BIT);
> +    default:
> +        return -EINVAL;
> +    }
> +}
> +
>   long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>   {
>       switch ( domctl->cmd )
>       {
>       case XEN_DOMCTL_set_address_size:
> -        switch ( domctl->u.address_size.size )
> -        {
> -        case 32:
> -            if ( !cpu_has_el1_32 )
> -                return -EINVAL;
> -            /* SVE is not supported for 32 bit domain */
> -            if ( is_sve_domain(d) )
> -                return -EINVAL;
> -            return switch_mode(d, DOMAIN_32BIT);
> -        case 64:
> -            return switch_mode(d, DOMAIN_64BIT);
> -        default:
> -            return -EINVAL;
> -        }
> -        break;
> +        return set_address_size(d, domctl->u.address_size.size);
>   
>       default:
>           return -ENOSYS;

-- 
Julien Grall

