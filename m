Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D65B02D1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401351.643205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt96-0006t1-RR; Wed, 07 Sep 2022 11:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401351.643205; Wed, 07 Sep 2022 11:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt96-0006rl-Ny; Wed, 07 Sep 2022 11:23:04 +0000
Received: by outflank-mailman (input) for mailman id 401351;
 Wed, 07 Sep 2022 11:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVt95-0006qS-LB
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVt94-0003rR-E7; Wed, 07 Sep 2022 11:23:02 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVt94-0005Ur-6x; Wed, 07 Sep 2022 11:23:02 +0000
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
	bh=yMaeCOuQqEnswGVCYMoa6kBWGy/c9kwqMVWaf82VIYg=; b=IpACjnDcUZtXTYCB8kEVq0MaE4
	SlY8rDYV6Yzyd06huqwfUoHfZqUjHhY3Dv0sfYyXeXXKVxLF6D/PdXHRAoY0Hyxj6fA6wfDXj7HBb
	o+8qGLA1at/ywHpF/CURJc4IMhOHJPj76O2zVmXT5XQrs48Jgle72zOh8Sw3cksF2ydU=;
Message-ID: <206db3d1-4609-fea6-9cb2-a56cc9d6f7ba@xen.org>
Date: Wed, 7 Sep 2022 12:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v7 2/9] xen/arm: assign static shared memory to the
 default owner dom_io
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906085941.944592-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/09/2022 09:59, Penny Zheng wrote:
> +static int __init assign_shared_memory(struct domain *d,
> +                                       uint32_t addr_cells, uint32_t size_cells,
> +                                       paddr_t pbase, paddr_t psize)
> +{
> +    mfn_t smfn;
> +
> +    dprintk(XENLOG_INFO,
> +            "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> +            d, pbase, pbase + psize);
> +
> +    smfn = acquire_shared_memory_bank(d, pbase, psize);
> +    if ( mfn_eq(smfn, INVALID_MFN) )
> +        return -EINVAL;
> +
> +    /*
> +     * DOMID_IO is auto-translated (i.e. it seems RAM 1:1). So we do not need

Hmmm... I should have re-read my sentence before hitting sending. It 
should be "is not auto-translated" and s/seeems/sees/.

Other than that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

