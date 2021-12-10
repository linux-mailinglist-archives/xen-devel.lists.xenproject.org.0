Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF24707BD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 18:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244153.422277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvk4T-00065Z-E8; Fri, 10 Dec 2021 17:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244153.422277; Fri, 10 Dec 2021 17:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvk4T-00063T-Ag; Fri, 10 Dec 2021 17:52:37 +0000
Received: by outflank-mailman (input) for mailman id 244153;
 Fri, 10 Dec 2021 17:52:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvk4S-00063N-2a
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 17:52:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvk4R-00037R-NU; Fri, 10 Dec 2021 17:52:35 +0000
Received: from [54.239.6.184] (helo=[192.168.9.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvk4R-0008IX-HR; Fri, 10 Dec 2021 17:52:35 +0000
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
	bh=mFLkAe1BqLOkHYPmQsRDn3d96hBZR/mvshxGtHkWqys=; b=YNMIKuC7/0ijt6uQxWWQR4dFFE
	IKVvuZRKE0EW6jnzOODtAEYn50FSL0TzzxfiLAgXzPgi/QJ9lBtQLhy/YvhF8F+WMMDtPtFHxN8m7
	BwcaCBxyEEu9AawosHtbN8lJdj2uljhFzfA0YAbzetxn7dVYeyKd8bLqVg+2B81NMJVc=;
Message-ID: <78ee3d68-7901-2cfe-b0f1-76239339dc49@xen.org>
Date: Fri, 10 Dec 2021 17:52:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <20211209072918.460902-3-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211209072918.460902-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 09/12/2021 07:29, Oleksandr Andrushchenko wrote:
> +unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    if ( !has_vpci(d) )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        int ret = pci_host_iterate_bridges_and_count(d, vpci_get_num_handlers_cb);
> +
> +        return ret < 0 ? 0 : ret;

Sorry I only spotted this now. AFAICT, ret is not meant to return ret < 
0 in this case. But if it were then I think it would be wrong to 
continue as nothing happened because the code will likely fall 
over/crash when registering the I/O handlers.

I would document this oddity with

if ( ret < 0 )
{
    ASSERT_UNREACHABLE();
    return 0;
}

I can do the change on commit if the others are happy with it.

Cheers,

-- 
Julien Grall

