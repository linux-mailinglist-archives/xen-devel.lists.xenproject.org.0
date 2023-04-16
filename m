Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8A06E386D
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 14:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521544.810277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po1q3-0001bI-Fo; Sun, 16 Apr 2023 12:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521544.810277; Sun, 16 Apr 2023 12:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po1q3-0001Yl-DE; Sun, 16 Apr 2023 12:50:39 +0000
Received: by outflank-mailman (input) for mailman id 521544;
 Sun, 16 Apr 2023 12:50:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po1q1-0001Yf-Kl
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 12:50:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po1q1-0002X8-5o; Sun, 16 Apr 2023 12:50:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po1q0-0004UO-Tp; Sun, 16 Apr 2023 12:50:37 +0000
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
	bh=d6s+DZMw/J0/1XlNrVNF3o4YPzAck+dr1lmeDx3RelA=; b=YDM0YLM8ma8e69yFNZC3pa6VMI
	EN80ZkYuBbVBbTjth5YcNXFZOQlGNQWTJrauFLeZf4pJVhzBlQsnGZqUWsO6W8COcmT60KD1fJToB
	PoroCuJcKjHJ7QMmW2epbPaJUfjqGuSoxExmtROvyaWMwIxIiW+4v9bWNo9ovxKcERG0=;
Message-ID: <bed2fc02-6b6a-aecc-e279-e7ea3ddffe7e@xen.org>
Date: Sun, 16 Apr 2023 13:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] xen/arm: mark __guest_cmpxchg always_inline
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230414185714.292881-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 14/04/2023 19:57, Stewart Hildebrand wrote:
> When building the hypervisor with -Og, we run into a __bad_cmpxchg link error:
> 
> aarch64-none-linux-gnu-ld: prelink.o: in function `__int_cmpxchg':
> .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference to `__bad_cmpxchg'
> aarch64-none-linux-gnu-ld: .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference to `__bad_cmpxchg'
> aarch64-none-linux-gnu-ld: ./.xen-syms.0: hidden symbol `__bad_cmpxchg' isn't defined
> aarch64-none-linux-gnu-ld: final link failed: bad value
> 
> This is due to the function __guest_cmpxchg not being inlined in the -Og build
> with gcc 12. Fix this by marking __guest_cmpxchg always_inline.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com
> ---
> I considered also changing "guest_cmpxchg64" just below in the same file to
> always_inline, but I decided not to because this function does not take a size
> parameter.

Make sense. I will fixed the signed-off-by line issue reported by Henry 
while committing:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

