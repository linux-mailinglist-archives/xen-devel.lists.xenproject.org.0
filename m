Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66A7BA22C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 17:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613032.953286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoQ6b-0005cI-16; Thu, 05 Oct 2023 15:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613032.953286; Thu, 05 Oct 2023 15:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoQ6a-0005Za-UR; Thu, 05 Oct 2023 15:17:36 +0000
Received: by outflank-mailman (input) for mailman id 613032;
 Thu, 05 Oct 2023 15:17:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoQ6Z-0005ZU-Eh
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 15:17:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoQ6Y-00088I-Ng; Thu, 05 Oct 2023 15:17:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoQ6Y-0002Qu-Cb; Thu, 05 Oct 2023 15:17:34 +0000
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
	bh=TLOJxUxq4KNWIs6HqbgDH6iJFYlmDHOEWMelFQK332I=; b=H+1ocaVb7Je1qj032BrTBMl/Bk
	t2Nr7U8bEU8KkbLV7aZEtjoSlles+I9ddv2wNSDSyg/oVbqaPs5wbzbavMh3FPCTnD6ppqso14LKi
	BWFZKQFjIqq1aD2GGasCOXKRg6QXDjBxl+JPA6dq1CWx+xP7RBHiuvJYCOvTtZ1H8xrw=;
Message-ID: <e092e1ac-e457-40e4-bb2d-79419d703e71@xen.org>
Date: Thu, 5 Oct 2023 16:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm/ioreq: guard interaction data on read/write
 operations
Content-Language: en-GB
To: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
 "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231005133011.2606054-1-andrii_chepurnyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231005133011.2606054-1-andrii_chepurnyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrii,

On 05/10/2023 14:30, Andrii Chepurnyi wrote:
> For read operations, there's a potential issue when the data field
> of the ioreq struct is partially updated in the response. To address
> this, zero data field during read operations. This modification
> serves as a safeguard against implementations that may inadvertently
> partially update the data field in response to read requests.
> For instance, consider an 8-bit read operation. In such cases, QEMU,
> returns the same content of the data field with only 8 bits of
> updated data. This behavior could potentially result in the
> propagation of incorrect or unintended data to ioreq clients.
> During a write access, the Device Model only need to know the content
> of the bits associated with the access size (e.g. for 8-bit, the lower
> 8-bits). During a read access, the Device Model don't need to know any
> value. So restrict the value it can access.
> 
> Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Unless there are any objections, I will commit the patch tomorrow (Friday).

Cheers,

-- 
Julien Grall

