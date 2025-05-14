Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD1AB6438
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983906.1370084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6V3-0008W8-3z; Wed, 14 May 2025 07:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983906.1370084; Wed, 14 May 2025 07:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6V3-0008Uf-0v; Wed, 14 May 2025 07:25:57 +0000
Received: by outflank-mailman (input) for mailman id 983906;
 Wed, 14 May 2025 07:25:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF6V1-0008UW-Tb
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:25:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6V1-008GI3-0u;
 Wed, 14 May 2025 07:25:55 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6V0-00DC2q-1K;
 Wed, 14 May 2025 07:25:54 +0000
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
	bh=Wh6cCxySR+znIGOb8CBHhWfKFkfCOTetRj7E2RyU2MI=; b=J8ye3vxXSYOfXfMQnd+pdW7DYr
	PGAtDX6g7wiHjYDWKfO1qjLge3Wv+hF2Z7ghBXZpxlPlBhykurF76n6vQLE9Tv7AM4eQw16yBWnFV
	4DZ9NOBIWgHE1QwHKZNuY6N7KfYAcl729iwhQK26YkXQ4gnscofMvwcpgoU29Qe9kMuk=;
Message-ID: <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
Date: Wed, 14 May 2025 08:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 13/05/2025 15:29, Oleksii Kurochko wrote:
> Refactor construct_domU() to improve architecture separation and reduce
> reliance on ARM-specific logic in common code:
> - Drop set_domain_type() from generic code. This function is specific
>    to ARM and serves no purpose on other architectures like RISC-V,
>    which lack the arch.type field in kernel_info.

So you will only ever boot one type of domain on RISC-V? IOW, no 32-bit
or else?

> - Introduce arch_construct_domU() to encapsulate architecture-specific
>    DomU construction steps.
> - Implement arch_construct_domU() for ARM. This includes:
>    - Setting the domain type for CONFIG_ARM64.
>    - Handling static memory allocation if xen,static-mem is present in
>      the device tree.
>    - Processing static shared memory.
> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>    this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>    at least, now.

This looks shortsighted. If there is a plan to use CONFIG_STATIC_SHM on 
RISC-V (I don't see why not today), then
I think the code should stick in common/ even if it is not fully usable
yet (that's the whole point of have CONFIG_* options).

Cheers,

-- 
Julien Grall


