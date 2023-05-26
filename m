Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D071264B
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 14:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540104.841592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WGS-0001Zx-61; Fri, 26 May 2023 12:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540104.841592; Fri, 26 May 2023 12:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WGS-0001Xf-3P; Fri, 26 May 2023 12:09:48 +0000
Received: by outflank-mailman (input) for mailman id 540104;
 Fri, 26 May 2023 12:09:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q2WGQ-0001XW-AF
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 12:09:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q2WGP-0007h1-JZ; Fri, 26 May 2023 12:09:45 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.95.96.139])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q2WGP-0002tG-DG; Fri, 26 May 2023 12:09:45 +0000
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
	bh=oO6Lm0cwvoASXQTywWMRuAMiRTjNWPRWvHlEXdn1Iig=; b=wr8MQVIoUVJ5LNL9XrL7o5zZDs
	10QoXI+O2wCK4tVaGWzsGanTZ7tV3DVaH7+jdybzSzeVfJv9aN8KH+BmIFQmX9Z2zuKFVlXpGYBtX
	7EoUsD0Ilsg+k5cYJpfKwpcjE4CUTvzNTcWcuBwxpsO3eiGHpPZEVthrJAkbU0EcjkLA=;
Message-ID: <06e6c3a1-e2ab-6e82-1899-fdcd8add31cf@xen.org>
Date: Fri, 26 May 2023 13:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2] xen/arm: un-break build with clang
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230525191531.120224-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230525191531.120224-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/05/2023 20:15, Stewart Hildebrand wrote:
> clang doesn't like extern with __attribute__((__used__)):
> 
>    ./arch/arm/include/asm/setup.h:171:8: error: 'used' attribute ignored [-Werror,-Wignored-attributes]
>    extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
>           ^
>    ./arch/arm/include/asm/lpae.h:273:29: note: expanded from macro 'DEFINE_BOOT_PAGE_TABLE'
>    lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
>                                ^
>    ./include/xen/compiler.h:71:27: note: expanded from macro '__section'
>    #define __section(s)      __used __attribute__((__section__(s)))
>                              ^
>    ./include/xen/compiler.h:104:39: note: expanded from macro '__used'
>    #define __used         __attribute__((__used__))
>                                          ^
> 
> Simplify the declarations by getting rid of the macro (and thus the
> __aligned/__section/__used attributes) in the header. No functional change
> intended as the macro/attributes are present in the respective definitions in
> xen/arch/arm/mm.c.
> 
> Fixes: 1c78d76b67e1 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable the identity mapping")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

