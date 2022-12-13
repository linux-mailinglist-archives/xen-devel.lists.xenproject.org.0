Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D996564BBDB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 19:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461053.719085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59vm-00056t-Cr; Tue, 13 Dec 2022 18:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461053.719085; Tue, 13 Dec 2022 18:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59vm-000544-8s; Tue, 13 Dec 2022 18:23:06 +0000
Received: by outflank-mailman (input) for mailman id 461053;
 Tue, 13 Dec 2022 18:23:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p59vk-00053y-LV
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 18:23:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p59vk-00080j-Bd; Tue, 13 Dec 2022 18:23:04 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p59vk-0002Ki-56; Tue, 13 Dec 2022 18:23:04 +0000
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
	bh=72riBgDDk87ReXXsjXAPbj/2mCgXQUGBgBSX9xb4wXQ=; b=OzKw/ZVnIcJdXxKdvyZiBaXyO2
	qHmlpkDd67nuneA0D2ocCjp/Igp0+2WBCAjOcWQJv+snlCY1qmPIm/6LahvCf45Zuj8hQld6D8krU
	ycC4KlRJbjdy+dlRbVxbhVgpXftsET4wKeefJEzhUub4ml1B2t4OQheEAMqQDn8xk4qQ=;
Message-ID: <48622388-b6de-e6dd-065d-0de6e8d8fbbb@xen.org>
Date: Tue, 13 Dec 2022 18:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 09/18] xen/arm32: head: Remove restriction where to
 load Xen
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, Luca.Fancellu@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-10-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221212095523.52683-10-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2022 09:55, Julien Grall wrote:
>   /*
>    * Map the UART in the fixmap (when earlyprintk is used) and hook the
>    * fixmap table in the page tables.
> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
> index b7c02c919064..907fb93d4df0 100644
> --- a/xen/arch/arm/domain_page.c
> +++ b/xen/arch/arm/domain_page.c
> @@ -60,6 +60,7 @@ bool init_domheap_mappings(unsigned int cpu)
>       for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
>       {
>           lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
> +

While the newline is correct, this shouldn't have been part of this 
patch. So I have dropped it from this patch.

Cheers,

-- 
Julien Grall

