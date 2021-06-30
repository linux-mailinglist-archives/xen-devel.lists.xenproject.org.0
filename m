Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E2B3B87E6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 19:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148218.273906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeGz-0000p6-3y; Wed, 30 Jun 2021 17:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148218.273906; Wed, 30 Jun 2021 17:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeGy-0000nH-VU; Wed, 30 Jun 2021 17:45:16 +0000
Received: by outflank-mailman (input) for mailman id 148218;
 Wed, 30 Jun 2021 17:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyeGx-0000n9-Cg
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 17:45:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeGv-0002Tx-JR; Wed, 30 Jun 2021 17:45:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeGv-00057o-DE; Wed, 30 Jun 2021 17:45:13 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=FfI6ppnPns+NmCdd9yp8YwCtDplHv5GrM16/jYM7ZEI=; b=FosGCeCZPOimqoK8lPvV8K2pFU
	FrR0gDwTJAp7VA2KBkxm98Olt6z4q/cWzI6vow2rTAzFS91Z8hrdRPH6G89wACVMVRiOdO5HhANjJ
	2/VhM/x8bDN1vpjEjfLxkNHZWWw6J317SIv4vq/v1zoXj5EZ8l+FnoS28plfwM7FeWvM=;
Subject: Re: [PATCH 3/9] xen/arm: introduce CONFIG_STATIC_ALLOCATION
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2b604aba-1d12-7957-ad9b-114f6ad1f857@xen.org>
Date: Wed, 30 Jun 2021 18:45:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607024318.3988467-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/06/2021 03:43, Penny Zheng wrote:
> For now, since the feature of Domain on Static Allocation is only supported
> on ARM Architecture, this commit introduces new CONFIG_STATIC_ALLOCATION to
> avoid bringing dead codes in other archs.

Similarly to patch #2, I think it would be better to introduce this 
Kconfig when it is used or after the common code is introduced. This 
would prevent dead Kconfig.

Cheers,

> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> changes v2:
> - new commit
> ---
>   xen/arch/arm/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..f165db8ecd 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -278,6 +278,9 @@ config ARM64_ERRATUM_1286807
>   
>   	  If unsure, say Y.
>   
> +config STATIC_ALLOCATION
> +    def_bool y
> +
>   endmenu
>   
>   config ARM64_HARDEN_BRANCH_PREDICTOR
> 

-- 
Julien Grall

