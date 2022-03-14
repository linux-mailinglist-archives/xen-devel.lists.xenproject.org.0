Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DC4D8C51
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 20:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290440.492560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqJ4-0002yi-Mq; Mon, 14 Mar 2022 19:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290440.492560; Mon, 14 Mar 2022 19:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqJ4-0002w1-JQ; Mon, 14 Mar 2022 19:24:38 +0000
Received: by outflank-mailman (input) for mailman id 290440;
 Mon, 14 Mar 2022 19:24:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTqJ2-0002vn-Ul
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 19:24:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqJ2-0003Ba-B4; Mon, 14 Mar 2022 19:24:36 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqJ2-0005Qx-4n; Mon, 14 Mar 2022 19:24:36 +0000
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
	bh=8gtPwiqOeQZnseOV29wmVeGpt4i/hWpcXBGZOXmEd6c=; b=SdVsxZdxIEfRZRCO6Pj+c/ypHY
	pEQPIxxiTE+rWhhDMUU0dIW1tOdkvnyCa0y7OV3/bi9jaKBy6Jyzio1tEM0VPMj+n+mQufOFZtpiz
	1avqCkw7alVrTVU8FCnAmb1MuS6lpzil6OCYqjVzcPKCRsOQodTBGiKbC5Euy7GoSA0o=;
Message-ID: <af4b8672-2a23-af3f-dd1c-cf44bb601304@xen.org>
Date: Mon, 14 Mar 2022 19:24:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 24/36] xen/arm: enable consider_modules for coloring
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-25-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-25-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> In order to relocate Xen the function get_xen_paddr will be used in the
> following patches. The method has "consider_modules" as a prerequisite
> so it has to be enabled both for ARM32 and coloring.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> ---
>   xen/arch/arm/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index f39c62ea70..0bfe12da57 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -442,7 +442,7 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
>       return fdt;
>   }
>   
> -#ifdef CONFIG_ARM_32
> +#if defined (CONFIG_ARM_32) || (CONFIG_COLORING)

Please fold this change in the first use of consider_modules().

Cheers,

-- 
Julien Grall

