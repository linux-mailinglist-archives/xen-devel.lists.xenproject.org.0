Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4929B1EE15
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074958.1437423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukRL8-0006KY-Gi; Fri, 08 Aug 2025 17:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074958.1437423; Fri, 08 Aug 2025 17:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukRL8-0006J5-E4; Fri, 08 Aug 2025 17:57:14 +0000
Received: by outflank-mailman (input) for mailman id 1074958;
 Fri, 08 Aug 2025 17:57:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukRL6-0006Ip-PV
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:57:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukRL6-00840D-0X;
 Fri, 08 Aug 2025 17:57:12 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukRL5-009Op5-2t;
 Fri, 08 Aug 2025 17:57:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=bvFuWTz5Ug366ZF+g+XdWCG3kViw1DzJk1heNfwXdE8=; b=pyoCq5PflIppSqv7w0kBIDPNFn
	tZMlfu2MxObO9CfxTyPR6bsp46VcZ+CB9uoJxNtVAyf8yX9kdg6+NlrZ+/EkhnR+xfH1OHvNXG2wo
	OWf8AYnvci3enmXIJkR9tg+7i9AnTNDH/KJBvLg+DyCIXA8elcapCMnKN3+WW1PW3fZ4=;
Message-ID: <44b43350-8c0a-497d-b0b0-034a548afac0@xen.org>
Date: Fri, 8 Aug 2025 18:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/4] tools/tests: introduce unit tests for domain ID
 allocator
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250808021938.669855-1-dmukhin@ford.com>
 <20250808021938.669855-4-dmukhin@ford.com>
 <230593d5-f3a2-4be8-973a-530c2debcb08@xen.org>
In-Reply-To: <230593d5-f3a2-4be8-973a-530c2debcb08@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/08/2025 18:56, Julien Grall wrote:
> Hi Denis,
> 
> On 08/08/2025 03:20, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Introduce some basic infrastructure for doing domain ID allocation 
>> unit tests,
>> and add a few tests that ensure correctness of the domain ID allocator.
> 
> I am quite happy to see more unit tests for Xen :).
> 
>>
>> Use <xen-tools/bitops.h> and xen/lib/find-next-bit.c in test hardness 
>> code.
>>
>> Adjust find-next-bit.c to be compiled with __XEN_TOOLS__.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> With a couple of remarks below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Actually, this should have been a Reviewed-by tag. Sorry.

Cheers,

-- 
Julien Grall


