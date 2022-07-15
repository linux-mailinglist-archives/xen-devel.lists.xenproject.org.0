Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F1F5766F1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368488.599797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQPJ-00028Q-Hh; Fri, 15 Jul 2022 18:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368488.599797; Fri, 15 Jul 2022 18:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQPJ-00026B-Dp; Fri, 15 Jul 2022 18:51:21 +0000
Received: by outflank-mailman (input) for mailman id 368488;
 Fri, 15 Jul 2022 18:51:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQPH-000265-Ue
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:51:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQPH-0003DY-R7
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:51:19 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQPH-0004tM-Lc
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:51:19 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=tyn1zz5tm3g7Y0vssQxQtttPAqBN/BP25WP5W3PwqUE=; b=KQKSRWQz3D7CEwr+Rr0HwWcd+J
	hPVHtnXiEswvIqL1SaYVwZbVZyySc+/ttu+y0IFCzcE6seER3E2niqLSvqxszeKiIMxIf9UykH2aQ
	nZ5XJPKoR+7E3lAdGuF4e1ojmC+VlYW3UiPQwNRje2Ff3iGCcvF9Ak1jwT3X0HKIyaAA=;
Message-ID: <411c7978-d98d-cacd-c485-18ba1570514b@xen.org>
Date: Fri, 15 Jul 2022 19:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v8 6/9] xen/arm: introduce CDF_staticmem
To: xen-devel@lists.xenproject.org
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220707092244.485936-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/07/2022 10:22, Penny Zheng wrote:
> In order to have an easy and quick way to find out whether this domain memory
> is statically configured, this commit introduces a new flag CDF_staticmem and a
> new helper is_domain_using_staticmem() to tell.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v8 changes:
> - #ifdef-ary around is_domain_using_staticmem() is not needed anymore
> ---
> v7 changes:
> - IS_ENABLED(CONFIG_STATIC_MEMORY) would not be needed anymore
> ---
> v6 changes:
> - move non-zero is_domain_using_staticmem() from ARM header to common
> header
> ---
> v5 changes:
> - guard "is_domain_using_staticmem" under CONFIG_STATIC_MEMORY
> - #define is_domain_using_staticmem zero if undefined
> ---
> v4 changes:
> - no changes
> ---
> v3 changes:
> - change name from "is_domain_static()" to "is_domain_using_staticmem"
> ---
> v2 changes:
> - change name from "is_domain_on_static_allocation" to "is_domain_static()"
> ---
>   xen/arch/arm/domain_build.c | 5 ++++-
>   xen/include/xen/domain.h    | 8 ++++++++
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..b76a84e8f5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3287,9 +3287,12 @@ void __init create_domUs(void)
>           if ( !dt_device_is_compatible(node, "xen,domain") )
>               continue;
>   
> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
> +            flags |= CDF_staticmem;
> +
>           if ( dt_property_read_bool(node, "direct-map") )
>           {
> -            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )

It is not clear to me why dropping IS_ENABLED(...) here is fine. What 
would happen if a user specify "xen,static-mem" in the device-tree but 
forgot CONFIG_STATIC_MEMORY in Xen?

Cheers,

-- 
Julien Grall

