Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D46C505E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 17:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513539.794682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1Bn-0004wh-L7; Wed, 22 Mar 2023 16:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513539.794682; Wed, 22 Mar 2023 16:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1Bn-0004uf-IM; Wed, 22 Mar 2023 16:19:51 +0000
Received: by outflank-mailman (input) for mailman id 513539;
 Wed, 22 Mar 2023 16:19:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pf1Bm-0004uZ-Te
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 16:19:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pf1Bm-0002ai-Fz; Wed, 22 Mar 2023 16:19:50 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pf1Bm-0007oE-AG; Wed, 22 Mar 2023 16:19:50 +0000
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
	bh=3D/jzghZkivbzV4M+eZ8tar/uH5q6CF79NHLLhydqFg=; b=w1AZ1W5S1okPxJ+IfCp30zG1Hk
	qw3DXEmXZPBzzf33VNiz/hEY6KNTbMnlv3GYyV/WqnaS4ERqRyzJbOUlp4YWbj/wZ1XlyiYqCIIM+
	9OJYsmkyjPLib9DUT5zvZngZyvDiddP5eepiZ3UQkzCUck0kmNkJvtb3KJPD7vOq2L88=;
Message-ID: <130680d1-155e-e989-8ab9-2ef59ca59fd6@xen.org>
Date: Wed, 22 Mar 2023 16:19:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230322102941.959-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 22/03/2023 10:29, Michal Orzel wrote:
> When vgic_reserve_virq() fails and backend is in domain, we should also
> free the allocated event channel.
> 
> When backend is in Xen and call to xzalloc() returns NULL, there is no
> need to call xfree(). This should be done instead on an error path
> from vgic_reserve_virq().

Most likely this was implemented this way to avoid a double "if ( 
vpl011->backend_in_domain)". TBH, I am not very thrilled with this 
approach. Could we instead consider to use domain_pl011_deinit()? (A 
couple of tweak would be necessary to use it)

> Also, take the opportunity to return -ENOMEM
> instead of -EINVAL when memory allocation fails.
> 
> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/vpl011.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 541ec962f189..df29a65ad365 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>           vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
>           if ( vpl011->backend.xen == NULL )
>           {
> -            rc = -EINVAL;
> -            goto out1;
> +            rc = -ENOMEM;
> +            goto out;
>           }
>       }
>   
> @@ -720,12 +720,15 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>   out2:
>       vgic_free_virq(d, vpl011->virq);
>   
> +    if ( vpl011->backend_in_domain )
> +        free_xen_event_channel(d, vpl011->evtchn);
> +    else
> +        xfree(vpl011->backend.xen);

There is another bug here (unrelated to your change). You want to use 
XFREE() to avoid an extra free in domain_pl011_deinit(). Can you look at it?

> +
>   out1:
>       if ( vpl011->backend_in_domain )
>           destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>                                   vpl011->backend.dom.ring_page);
> -    else
> -        xfree(vpl011->backend.xen);
>   
>   out:
>       return rc;

-- 
Julien Grall

