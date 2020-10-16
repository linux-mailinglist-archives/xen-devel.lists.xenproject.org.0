Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F0290956
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8171.21754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSGP-00063l-UM; Fri, 16 Oct 2020 16:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8171.21754; Fri, 16 Oct 2020 16:07:29 +0000
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
	id 1kTSGP-00063M-RG; Fri, 16 Oct 2020 16:07:29 +0000
Received: by outflank-mailman (input) for mailman id 8171;
 Fri, 16 Oct 2020 16:07:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTSGN-00063H-Ue
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:07:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17021f39-b029-4ad9-9f6b-089d1450a108;
 Fri, 16 Oct 2020 16:07:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTSGL-0000j7-TI; Fri, 16 Oct 2020 16:07:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTSGL-00062F-Kt; Fri, 16 Oct 2020 16:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTSGN-00063H-Ue
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:07:28 +0000
X-Inumbo-ID: 17021f39-b029-4ad9-9f6b-089d1450a108
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 17021f39-b029-4ad9-9f6b-089d1450a108;
	Fri, 16 Oct 2020 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3FDsXG7XIzLfVnJV29U2nAMTGO4lnOKRwV0u1qfRMr8=; b=WugEQxXZyJpNPN97IZ1nG7ydrl
	7exmvF8Q/S530PYdSpcv0Y3uU9f8b/INKkFgJiWbl2kWZrGp0gQy8exaTM0Cln4OQ9N24iF34+S0n
	4sVDu6WGLmtv6IZ6zAM0DJCwqJXVAFk4kpOpd4D27Qx2jeil251uWCkARhj2cDHE8uuI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTSGL-0000j7-TI; Fri, 16 Oct 2020 16:07:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTSGL-00062F-Kt; Fri, 16 Oct 2020 16:07:25 +0000
Subject: Re: [PATCH 4/5] iommu: set 'hap_pt_share' and 'need_sync' flags
 earlier in iommu_domain_init()
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-5-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e5ff6f9b-939f-dc04-561a-d77afbf1863a@xen.org>
Date: Fri, 16 Oct 2020 17:07:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201005094905.2929-5-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 05/10/2020 10:49, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Set these flags prior to the calls to arch_iommu_domain_init() and the
> implementation init() method. There is no reason to hide this information from
> those functions and the value of 'hap_pt_share' will be needed by a
> modification to arch_iommu_domain_init() made in a subsequent patch.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/drivers/passthrough/iommu.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 642d5c8331..fd9705b3a9 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -174,15 +174,6 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
>       hd->node = NUMA_NO_NODE;
>   #endif
>   
> -    ret = arch_iommu_domain_init(d);
> -    if ( ret )
> -        return ret;
> -
> -    hd->platform_ops = iommu_get_ops();
> -    ret = hd->platform_ops->init(d);
> -    if ( ret || is_system_domain(d) )
> -        return ret;
> -
>       /*
>        * Use shared page tables for HAP and IOMMU if the global option
>        * is enabled (from which we can infer the h/w is capable) and
> @@ -202,7 +193,12 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
>   
>       ASSERT(!(hd->need_sync && hd->hap_pt_share));
>   
> -    return 0;
> +    ret = arch_iommu_domain_init(d);
> +    if ( ret )
> +        return ret;
> +
> +    hd->platform_ops = iommu_get_ops();
> +    return hd->platform_ops->init(d);
>   }
>   
>   void __hwdom_init iommu_hwdom_init(struct domain *d)
> 

-- 
Julien Grall

