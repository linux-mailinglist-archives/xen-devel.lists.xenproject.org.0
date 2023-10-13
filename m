Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A27C8C75
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616789.959053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrM8x-0003D5-P8; Fri, 13 Oct 2023 17:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616789.959053; Fri, 13 Oct 2023 17:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrM8x-0003AQ-ME; Fri, 13 Oct 2023 17:40:11 +0000
Received: by outflank-mailman (input) for mailman id 616789;
 Fri, 13 Oct 2023 17:40:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrM8w-0003A6-3u
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:40:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrM8v-0008CR-R1; Fri, 13 Oct 2023 17:40:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrM8v-0007KS-Lv; Fri, 13 Oct 2023 17:40:09 +0000
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
	bh=HmyVQMLKHXWwfRauUOHm7oHqbk1jFeOKM4uIY7bkzPk=; b=tuc9mPDIX6OdY7H+Adv2uMBSdv
	2Q9TN4yhd4JCBTHa+7h+IWRkmgr32vsxwvNezx4l7g/EOSXM9BA1B1MpjqE5Ua5gCYp9tNnJ4FUUS
	7aP5IH4EvLdw+1/jg9rRw9P1oM18+g9y8QHBTd+5xqQQ/tr+cXUIZ1iqbtyWB9qv03wI=;
Message-ID: <15c7c0a5-6064-400b-9022-0dda9b8f7bef@xen.org>
Date: Fri, 13 Oct 2023 18:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] xen/arm: Split MMU-specific setup_mm() and related
 code out
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-6-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-6-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> setup_mm() is used for Xen to setup memory management subsystem,
> such as boot allocator, direct-mapping, xenheap initialization,
> frametable and static memory pages, at boot time.
> 
> We could inherit some components seamlessly for MPU support, such
> as the setup of boot allocator, whilst we need to implement some
> components differently for MPU, such as xenheap, etc. Also, there
> are some components that is specific to MMU only, for example the
> direct-mapping.
> 
> Therefore in this commit, we split the MMU-specific setup_mm() and
> related code out. Since arm32 and arm64 have completely different
> setup_mm() implementation, take the opportunity to split the
> arch-specific setup_mm() to arch-specific files, so that we can
> avoid #ifdef. Also, make init_pdx(), init_staticmem_pages(),
> setup_mm(), and populate_boot_allocator() public for future MPU
> implementation.

I am a bit confused with the last sentence. AFAICT, even without the MPU 
work, I think you already need to export init_pdx() & co because it is 
called from two different units.

> 
> With above code movement, mark setup_directmap_mappings() as static
> because the only caller of this function is now in the same file
> with it. Drop the original setup_directmap_mappings() declaration
> and move the in-code comment on top of the declaration on top of
> the function implementation.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>

With the above comment clarified:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

