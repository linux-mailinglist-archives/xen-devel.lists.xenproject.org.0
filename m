Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F7FB3B42F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100685.1454019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtRO-0000wB-Kw; Fri, 29 Aug 2025 07:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100685.1454019; Fri, 29 Aug 2025 07:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtRO-0000u9-IA; Fri, 29 Aug 2025 07:22:30 +0000
Received: by outflank-mailman (input) for mailman id 1100685;
 Fri, 29 Aug 2025 07:22:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urtRN-0000u3-Qx
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:22:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urtRN-00CV9v-02;
 Fri, 29 Aug 2025 07:22:29 +0000
Received: from [2a02:8012:3a1:0:a40e:c7d9:d4:3bff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urtRM-007CL9-2S;
 Fri, 29 Aug 2025 07:22:28 +0000
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
	bh=9aErw/EgOQXqimj01T+ARj6RDIPREnaDxlMPoINa4uA=; b=vJqsQ/4CUO73E+9ZlWR4gmNXfX
	7bGxWrvC8gxoTAhOT52VmCoODZ/AtP4jSuZzECKs0YRQ4NT/bvk1/JhbDZcpDFYVKW3Yj6UiXaVqo
	JPMj03HR6OrH8bFDi83nYLAwRlnyXNm40yGWS7GI7JPBWsskxuFUlJBHWFLPlBf1kO8o=;
Message-ID: <3e97a88c-4b5e-4735-bbb5-2515dedb333b@xen.org>
Date: Fri, 29 Aug 2025 08:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] xen/arm: map static memory on demand
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <30cbc79f765c21759d74377e55cc471210fc2575.1756379422.git.hari.limaye@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <30cbc79f765c21759d74377e55cc471210fc2575.1756379422.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hari,

On 28/08/2025 12:12, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> In the function `init_staticmem_pages` we need to have mapped static
> memory banks for initialization. Unlike on an MMU system, we cannot map
> the entire RAM

Even on the MMU system we don't always map the full RAM (for instance on 
arm32). This is why we have infrastructure like map_domain_page() 
(Temporary mapping) and map_domain_page_global() (more permanent).

on an MPU system as we have a limited number of MPU
> memory regions. To solve this, transiently map the static memory banks
> for initialization.

I am guessing you implemented the helper because in 
unmap_staticmem_pages_to_xen(), we are calling scrub_one_page(). This 
will be using map_domain_page() and unmap_domain_page(). I am a bit 
confused why we end up with brand new helpers rather than implementation 
map_domain_page() and unmap_domain_page()?

Cheers,

-- 
Julien Grall


