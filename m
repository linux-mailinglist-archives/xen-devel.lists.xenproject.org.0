Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA6527059
	for <lists+xen-devel@lfdr.de>; Sat, 14 May 2022 11:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329006.552166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npoIb-0000XK-Op; Sat, 14 May 2022 09:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329006.552166; Sat, 14 May 2022 09:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npoIb-0000Uw-La; Sat, 14 May 2022 09:42:57 +0000
Received: by outflank-mailman (input) for mailman id 329006;
 Sat, 14 May 2022 09:42:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npoIZ-0000Un-P4
 for xen-devel@lists.xenproject.org; Sat, 14 May 2022 09:42:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npoIZ-0006tj-F8; Sat, 14 May 2022 09:42:55 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npoIZ-0006sy-95; Sat, 14 May 2022 09:42:55 +0000
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
	bh=oIDlj52g1MF3vOuZyycDBzSjmrx0tFAuuA+z+XxJFlE=; b=HS2M+EhB80QprHnAgRKZNpJCzI
	cxDUQtQRvzE3j0s38/7OvP8Algn0e00N/2WFNBByxZ1CMnf20KMyQAEzM8uzso4FuM4jHhKALv/5i
	mkzt02qIftxDkht3FZBeWMzL91oaRZcmOzTq9kxQLg3FdZT0QHzW0+m+/6dvqZNoQNRw=;
Message-ID: <67fc612a-136a-bc20-6725-ff2c5c1917e2@xen.org>
Date: Sat, 14 May 2022 10:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v3 10/19] xen/arm32: mm: Re-implement
 setup_xenheap_mappings() using map_pages_to_xen()
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-11-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220221102218.33785-11-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/02/2022 10:22, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() call by map_pages_to_xen() call.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>      Changes in v3:
>          - Fix build when CONFIG_DEBUG=y
> 
>      Changes in v2:
>          - New patch
> 
>      TODOs:
>          - add support for contiguous mapping

This todo was a left-over because _PAGE_BLOCK will try to use the 
contiguous bit (see patch #5).

Cheers,

-- 
Julien Grall

