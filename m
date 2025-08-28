Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C093EB397A1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097822.1452025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYTg-0008ED-GW; Thu, 28 Aug 2025 08:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097822.1452025; Thu, 28 Aug 2025 08:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYTg-0008CD-DF; Thu, 28 Aug 2025 08:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1097822;
 Thu, 28 Aug 2025 08:59:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urYTf-0008Bi-1Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:59:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urYTZ-00AqRq-18;
 Thu, 28 Aug 2025 08:59:21 +0000
Received: from [15.248.2.24] (helo=[10.24.67.148])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urYTZ-005XNc-10;
 Thu, 28 Aug 2025 08:59:21 +0000
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
	bh=UdmYXuvlq2RhkD9sTNBC/CZn9tcfG0l7cBtkAb1AF4o=; b=PKJ8ZKvbh7P1L9FzbU0Qku9GpZ
	3ICO3WZoLhqrU9szu24iGQ28YBH5tLzk0pbOFDGgc0T2Nzpls6VUyLZQLii/cDKEj1a8u/jD9dTMz
	wkkY2H+cmdgEgZJR6UTKKwp+ugC89J3XgW5J9kpDF7koKFbO81K9ZLv3JTTxWD/Uw9qM=;
Message-ID: <fa4ceec0-64f5-4462-9d84-def71cf12cf0@xen.org>
Date: Thu, 28 Aug 2025 09:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997.git.dmytro_prokopchuk1@epam.com>
 <72b403be-bfaf-497f-90c8-d1cc9ff84ce8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72b403be-bfaf-497f-90c8-d1cc9ff84ce8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/08/2025 09:42, Jan Beulich wrote:
> On 28.08.2025 10:17, Dmytro Prokopchuk1 wrote:
>> Resolve infinite loop issue in the 'fail:' cleanup path of the function
>> 'assign_shared_memory()'. The issue was caused by an 'unsigned long' type
>> for the loop counter 'i', which could underflow and wrap around, violating
>> termination conditions.
>> Change 'i' to a signed data type ('long') to ensure safe termination of
>> the 'while (--i >= 0)' loop.
> 
> If I was a maintainer of this code, I would strongly object to such a change.
> A signed type variable used as (effectively) an array index is almost always
> conceptually wrong. Plus i continues to be compared to nr_pages, which still
> is of an unsigned type.
> 
> What imo wants changing instead is the use of the variable:
> 
>   fail:
>      while ( i-- > 0 )
>          put_page_nr(page + i, nr_borrowers);
> 
> or yet more simply
> 
>   fail:
>      while ( i-- )
>          put_page_nr(page + i, nr_borrowers);
> 
> See e.g. prepare_staticmem_pages() for a similar case.

+1 with Jan's comment.

Cheers,

-- 
Julien Grall


