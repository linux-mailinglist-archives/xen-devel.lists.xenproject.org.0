Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C081A8AA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 22:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658340.1027461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4TY-0000el-7j; Wed, 20 Dec 2023 21:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658340.1027461; Wed, 20 Dec 2023 21:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4TY-0000b6-4w; Wed, 20 Dec 2023 21:51:36 +0000
Received: by outflank-mailman (input) for mailman id 658340;
 Wed, 20 Dec 2023 21:51:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rG4TW-0000aw-SE
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 21:51:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rG4TW-0007Uk-C8; Wed, 20 Dec 2023 21:51:34 +0000
Received: from 82-132-213-104.dab.02.net ([82.132.213.104] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rG4TW-0003Mq-4g; Wed, 20 Dec 2023 21:51:34 +0000
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
	bh=eu/nqB68o8w+B15F+MrepASwvGr9ZMO0Y4hexlAgBIM=; b=635FwM7lWH2a+d4CwFoO2oooAm
	WC77l2QbeNZ0FrUaXhCXJ0f8rpZ0UivLLjjIiEzrzDW0lCh3zanmEetwHJnOfQt8zGJSEXb5PIjMr
	84zeavJITOudNjWq+xBjQw11batUW+UOsWqS6zB8Nfio+arHjKGKOQjZ4/HrLgyxSXQE=;
Message-ID: <38dfe5ac-790e-4479-b7a8-ab3d5d0d0db2@xen.org>
Date: Wed, 20 Dec 2023 21:51:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xmalloc: XMEM_POOL_POISON improvements
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231220214716.2510402-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231220214716.2510402-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 20/12/2023 21:47, Andrew Cooper wrote:
> When in use, the spew:
> 
>    (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at common/xmalloc_tlsf.c:246
> 
> is unweidly and likely meaningless to non-Xen developers.  Therefore:
> 
>   * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
>   * Pull memchr_inv() out into the if(), and provide an error message which
>     clearly states that corruption has been found.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With one remark:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Observations from the debugging of:
>    https://github.com/Dasharo/dasharo-issues/issues/488
> 
> v2:
>   * Switch to printk()+BUG()

I would suggest to add a sentence about the switch to printk() + BUG() 
in the commit message. Maybe:

"CONFIG_XMEM_POOL_POISON can be enabled even on production build. So we 
should switch from ASSERT() to BUG()."

Cheers,

-- 
Julien Grall

