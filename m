Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC019753FDC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 18:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563710.881128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLjz-0007hD-Ir; Fri, 14 Jul 2023 16:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563710.881128; Fri, 14 Jul 2023 16:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLjz-0007eJ-G1; Fri, 14 Jul 2023 16:33:59 +0000
Received: by outflank-mailman (input) for mailman id 563710;
 Fri, 14 Jul 2023 16:33:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKLjy-0007eD-Nn
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 16:33:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKLjx-0007SW-KA; Fri, 14 Jul 2023 16:33:57 +0000
Received: from [54.239.6.186] (helo=[192.168.4.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKLjx-0003Lu-Bz; Fri, 14 Jul 2023 16:33:57 +0000
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
	bh=1ILi0ItHcgzrW8xZ+Ep/hwYSPduYCjt3oeIawq8gqTE=; b=eoVwxr4ZDFA34WHFXSBEAjVuz7
	2VS7PDIylJa/n92N3M7N9mbRtCFi2MCepORIzTbN3hS5xXCBjmc40Zht4y+raJh6Si119CH7bSQVQ
	6XwHS3pLCODMygNwdC6GApt7NHZnPnfql2th02JhuXZ5JNsx021yxje2d9Q7CPFWqoBI=;
Message-ID: <768da4a9-bcf9-0c13-a573-c535ecd7468f@xen.org>
Date: Fri, 14 Jul 2023 17:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Add missing 'U' in IMTTLBR0_TTBR_MASK
 for shifted constant
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230704203032.4062921-1-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2307051555460.761183@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2307051555460.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/07/2023 23:55, Stefano Stabellini wrote:
> On Tue, 4 Jul 2023, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> With enabling both CONFIG_UBSAN and CONFIG_IPMMU_VMSA I have got the following
>> splat when an IOMMU driver tried to setup page tables:
>>
>> (XEN) ipmmu: /soc/iommu@e67b0000: d1: Set IPMMU context 1 (pgd 0x77fe90000)
>> (XEN) ================================================================================
>> (XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/ipmmu-vmsa.c:558:51
>> (XEN) left shift of 1048575 by 12 places cannot be represented in type 'int'
>> (XEN) Xen WARN at common/ubsan/ubsan.c:172
>> (XEN) ---[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Tainted:      S ]----
>> ...
>>
>> This points to shifted constant in IMTTLBR0_TTBR_MASK. Fix that by adding
>> missing 'U' to it.
>>
>> This should also address MISRA Rule 7.2:
>>
>> A "u" or "U" suffix shall be applied to all integer constants that
>> are represented in an unsigned type.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed.

Cheers,

-- 
Julien Grall

