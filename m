Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2621E7694
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:26:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZOp-0005cC-HS; Fri, 29 May 2020 07:25:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeZOo-0005c7-Bu
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:25:50 +0000
X-Inumbo-ID: 9eef271c-a17d-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eef271c-a17d-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=avu625cK9g/Vkyk5Cu/wReuBeqnDW8McW9abrjzuw2k=; b=e25Z1HptLuji0F/REtUTm9IQyT
 E3IA+pSglAscxwPxluBVKIGiRvD5I4BX+eKMe6SnZJD/WVWA+hQqfoLcxbylOn/Phk343YJ5OmYG7
 sz8tK+Ypqf3ixY0M9JlPu9xRkLdO6Oui8/69rIVyqf2h48sTA45mp0OxhruMh8Egorng=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeZOl-0004sH-Du; Fri, 29 May 2020 07:25:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeZOl-0000lA-6Y; Fri, 29 May 2020 07:25:47 +0000
Subject: Re: [PATCH v2 3/3] clang: don't define nocall
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-4-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8aa8d35f-2928-2096-a47c-26659c5a43a2@xen.org>
Date: Fri, 29 May 2020 08:25:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528144023.10814-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 28/05/2020 15:40, Roger Pau Monne wrote:
> Clang doesn't support attribute error, and the possible equivalents
> like diagnose_if don't seem to work well in this case as they trigger
> when when the function is not called (just by being used by the
> APPEND_CALL macro).

OOI, could you share the diagnose_if change you tried?

> 
> Define nocall to a noop on clang until a proper solution can be found.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/include/xen/compiler.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index c22439b7a4..225e09e5f7 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -20,7 +20,11 @@
>   
>   #define __weak        __attribute__((__weak__))
>   
> -#define nocall        __attribute__((error("Nonstandard ABI")))
> +#if !defined(__clang__)
> +# define nocall        __attribute__((error("Nonstandard ABI")))
> +#else
> +# define nocall
> +#endif
>   
>   #if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
>   #define unreachable() do {} while (1)
> 

Cheers,

-- 
Julien Grall

