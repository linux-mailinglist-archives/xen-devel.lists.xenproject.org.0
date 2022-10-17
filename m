Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE26012DD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 17:44:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424492.671950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okSI8-0002EF-Dy; Mon, 17 Oct 2022 15:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424492.671950; Mon, 17 Oct 2022 15:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okSI8-0002CN-B2; Mon, 17 Oct 2022 15:44:36 +0000
Received: by outflank-mailman (input) for mailman id 424492;
 Mon, 17 Oct 2022 15:44:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okSI7-0002CH-4n
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 15:44:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okSI6-0001r3-RR; Mon, 17 Oct 2022 15:44:34 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.28.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okSI6-0005YK-Kw; Mon, 17 Oct 2022 15:44:34 +0000
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
	bh=/xuBuoMqB4hdz+Ie3uwYj/llYSc2NJLicPHD7Cw+eKs=; b=BurSefkm63mghCCJCeuPIZq1Sr
	bzGPN9qtQ7IASBhuF3hR+SvsewYQnktK6jyuOJ5VUNYORRs+y6nAvLnPqWlEBBr4JFnptod46mtLD
	sUE1Zpk1Xg+DFhcVMp67mkIJW9tueXraKFbaiD1QHJac8ASv7hd/UEVPr48KYCJRO+bg=;
Message-ID: <a03729ef-0883-c535-d971-3c265de6b69e@xen.org>
Date: Mon, 17 Oct 2022 16:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017074618.36818-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221017074618.36818-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 17/10/2022 08:46, Henry Wang wrote:
>       if ( p2m->root )
> @@ -1762,6 +1778,20 @@ int p2m_init(struct domain *d)
>       INIT_PAGE_LIST_HEAD(&p2m->pages);
>       INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
>   
> +    /*
> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> +     * when the domain is created. Considering the worst case for page
> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
> +     * For GICv3, the above-mentioned P2M mapping is not necessary, but since
> +     * the allocated 16 pages here would not be lost, hence populate these
> +     * pages unconditionally.
> +     */
> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, 16, NULL);
> +    spin_unlock(&d->arch.paging.lock);
> +    if ( rc != 0 )
> +        return rc;


p2m_set_allocation() wants to be called after 'p->domain' is set. So 
p2m_teardown_final() will not return early and leak memory (as Andrew 
pointed out).

For simplicity I would move the code right at the end of the function. 
But if you want to keep it here then...

> +
>       p2m->vmid = INVALID_VMID;

... this needs to be done first as well.

>   
>       rc = p2m_alloc_vmid(d);

Note that if you move the code at the end. Then you will need to add:

if ( rc )
   return rc;

after the call to p2m_alloc_table();

Other than that the code looks good to me.

Cheers,

-- 
Julien Grall

