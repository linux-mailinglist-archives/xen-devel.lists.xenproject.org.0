Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B906367EE2C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 20:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485909.753349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLUR8-0004hY-Rf; Fri, 27 Jan 2023 19:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485909.753349; Fri, 27 Jan 2023 19:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLUR8-0004ff-Od; Fri, 27 Jan 2023 19:30:58 +0000
Received: by outflank-mailman (input) for mailman id 485909;
 Fri, 27 Jan 2023 19:30:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLUR7-0004fZ-Bv
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 19:30:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLUR6-0006YJ-Vx; Fri, 27 Jan 2023 19:30:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLUR6-0001TA-PS; Fri, 27 Jan 2023 19:30:56 +0000
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
	bh=lPZItNN6eNhhUYlN0kWXTystKfOq9xQ6Lt3Jg7aTSL8=; b=NHtZXYwK43tc7fxQv9oQw+9CUH
	KLZlvy6XHkU3ycAA5tb/j33oWz8mTPyU8QYPJFzIMAvs3XSYNTtZuWvJdZy6evYXYgpjLxDpV22S3
	HifwDnjK+llYlD3N4/0WxC4Ns32f94f71vfXnCSLFuExlaLXA4L08N5EOxcOhLFC+vME=;
Message-ID: <5c1428a5-155f-b582-75b2-395f88086d15@xen.org>
Date: Fri, 27 Jan 2023 19:30:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 12/14] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-13-julien@xen.org>
 <ddbcb326-b158-daa4-e9d2-42c420983497@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ddbcb326-b158-daa4-e9d2-42c420983497@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 16/01/2023 08:53, Michal Orzel wrote:
> On 13/01/2023 11:11, Julien Grall wrote:
>> +static void __init prepare_boot_identity_mapping(void)
>> +{
>> +    paddr_t id_addr = virt_to_maddr(_start);
>> +    lpae_t pte;
>> +    DECLARE_OFFSETS(id_offsets, id_addr);
>> +
>> +    /*
>> +     * We will be re-using the boot ID tables. They may not have been
>> +     * zeroed but they should be unlinked. So it is fine to use
>> +     * clear_page().
>> +     */
>> +    clear_page(boot_first_id);
>> +    clear_page(boot_second_id);
>> +    clear_page(boot_third_id);
>> +
>> +    if ( id_offsets[0] != 0 )
>> +        panic("Cannot handled ID mapping above 512GB\n");
> I might be lost but didn't we say before that we can load Xen in the first 2TB?
> Then, how does this check correspond to it?

I forgot to change the check after we decided to extend the reserved 
area from 512GB to 2TB. I will update it in the next version.

Cheers,

-- 
Julien Grall

