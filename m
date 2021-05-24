Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992B38E70F
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 15:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131762.246110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llAEk-0005Bm-A4; Mon, 24 May 2021 13:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131762.246110; Mon, 24 May 2021 13:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llAEk-00059C-6Q; Mon, 24 May 2021 13:03:14 +0000
Received: by outflank-mailman (input) for mailman id 131762;
 Mon, 24 May 2021 13:03:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llAEj-00058u-5j
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 13:03:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llAEh-00030j-Ue; Mon, 24 May 2021 13:03:11 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llAEh-00082C-Oz; Mon, 24 May 2021 13:03:11 +0000
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
	bh=QJ3IMcTv4kUxe9obVbYvMYWE9NpIOFpHsqzo25ed3xA=; b=AxpOyR4mBA8mMUdsQWbcaS6NSK
	Vzm0yxLwpv0k6SqfWOoVSgSb5c76EsNyN9g7nZew2SOxJxsL1oWg4FJOZ6QhsjndcWFSK7M7E44Uw
	a1ZtmlRFQbKsxcNhoCQ4nShkT2iAHoWYjM+9zp9hvnkiiAQBcy1sTcVLWF6ZD+lEQmkc=;
Subject: Re: [XEN PATCH v1] libxl/arm: provide guests with random seed
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20210524080057.1773-1-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a3c51dea-80e5-df92-3757-72809ad96434@xen.org>
Date: Mon, 24 May 2021 14:03:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524080057.1773-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 24/05/2021 09:00, Sergiy Kibrik wrote:
> Pass random seed via FDT, so that guests' CRNGs are better seeded early at boot.
> Depending on its configuration Linux can use the seed as device randomness
> or to just quickly initialize CRNG.
> In either case this will provide extra randomness to further harden CRNG.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   tools/libxl/libxl_arm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
> index 34f8a29056..05c58a428c 100644
> --- a/tools/libxl/libxl_arm.c
> +++ b/tools/libxl/libxl_arm.c
> @@ -342,6 +342,12 @@ static int make_chosen_node(libxl__gc *gc, void *fdt, bool ramdisk,
>           if (res) return res;
>       }
>   
> +    uint8_t seed[128];

I couldn't find any documentation for the property (although, I have 
found code in Linux). Can you explain where the 128 come from?

Also, local variables should be defined at the beginning of the function.

> +    res = libxl__random_bytes(gc, seed, sizeof(seed)); > +    if (res) return res;
> +    res = fdt_property(fdt, "rng-seed", seed, sizeof(seed));
> +    if (res) return res;
> +
>       res = fdt_end_node(fdt);
>       if (res) return res;

Cheers,

-- 
Julien Grall

