Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED59F4B29
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 13:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859076.1271227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNWu0-0002HZ-6C; Tue, 17 Dec 2024 12:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859076.1271227; Tue, 17 Dec 2024 12:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNWu0-0002ES-3I; Tue, 17 Dec 2024 12:42:16 +0000
Received: by outflank-mailman (input) for mailman id 859076;
 Tue, 17 Dec 2024 12:42:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tNWty-0002EM-P4
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 12:42:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tNWty-0082CS-0R;
 Tue, 17 Dec 2024 12:42:14 +0000
Received: from [89.27.170.32] (helo=[172.16.75.124])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tNWty-00E4oT-0k;
 Tue, 17 Dec 2024 12:42:14 +0000
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
	bh=hxiQVjBSU1RtH1fXpA14/J9g3f4frsN07DrC7hrMxBo=; b=wHRLSwyAtS7ZKXxGodG4fr+rwj
	zDh6qwCEfVDOxs/HE3MiSgcOk3C45Ode/FXkD6TIrdpEQaOcgz+VG1fRkO/706+re2oc3SLkPM3Xq
	26zMKATpR8/R7UxdX9nH4YUbHFA6BybAYU9BtPqxGM5rwbFXN4n5d139F12HzVDNTEjQ=;
Message-ID: <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
Date: Tue, 17 Dec 2024 13:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
Content-Language: en-GB
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Can you clarify why this is an RFC?

On 17/12/2024 11:47, Sergiy Kibrik wrote:
> Allow to build ARM configuration with support for initializing hardware domain.
> On ARM it is only possible to start hardware domain in multiboot mode, so
> dom0less support is required. This is reflected by dependency on DOM0LESS_BOOT
> instead of directly depending on ARM config option.

I am a bit confused with the explanation. We already have an hardware 
domain on Arm. It is dom0. So what are you trying to achieve? Is this 
remove some permissions from the hardware domain?

If so, why can't the hardware domain stay as dom0 and you remove the 
feature you don't want (e.g. control domain)?

Are you sure this patch is sufficient to use the late hwdom feature? 
Looking at the code, to enable the late hwdom, the user needs to provide 
a domid on the command line. But AFAICT, there is no way to provide a 
domain ID in the DOM0LESS case...

> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   xen/common/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 90268d9249..7368ca8208 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -374,7 +374,7 @@ endchoice
>   config LATE_HWDOM
>   	bool "Dedicated hardware domain"
>   	default n
> -	depends on XSM && X86
> +	depends on XSM && (X86 || DOM0LESS_BOOT)

This will enable LATE_HWDOM for other arch. Is this what we want?

>   	help
>   	  Allows the creation of a dedicated hardware domain distinct from
>   	  domain 0 that manages devices without needing access to other

Cheers,

-- 
Julien Grall


