Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA29196CDE
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 13:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIVoA-00086S-8C; Sun, 29 Mar 2020 11:08:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fisU=5O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIVo8-00086N-My
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 11:08:48 +0000
X-Inumbo-ID: a9d73480-71ad-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9d73480-71ad-11ea-a6c1-bc764e2007e4;
 Sun, 29 Mar 2020 11:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CUrShOrePW/ZoVJk9L2UdObQT+etNeBb7tCJfSd9MTA=; b=cQsSIALhdnv4z7ZnzzA5HA+oa7
 NJkk9RK85TWaITFMmYlYdr7MuCXWqbTF/8+DT2s3UYZkjvPIovJMK0uQJcx8pbxRPJYEW0ALEf7A1
 nC4D2hKLbVwXLPbzXw30nzA+KD06jiFJw2TtrPvvhi+DhK8ybEhf1ROq/qThxafVcTsA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIVo2-0000nJ-8m; Sun, 29 Mar 2020 11:08:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIVo2-0002ld-1a; Sun, 29 Mar 2020 11:08:42 +0000
To: Simran Singhal <singhalsimran0@gmail.com>, xen-devel@lists.xenproject.org
References: <20200329072242.GA1394@simran-Inspiron-5558>
From: Julien Grall <julien@xen.org>
Message-ID: <6f04a17f-610e-1370-7aed-446f46472bc2@xen.org>
Date: Sun, 29 Mar 2020 12:08:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200329072242.GA1394@simran-Inspiron-5558>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] xen/x86: Use min macro instead of ternary
 operator
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 29/03/2020 08:22, Simran Singhal wrote:
> Replace ternary operator with macro min as it is shorter and
> thus increases code readability. Macro min return the minimum of the
> two compared values.

While I understand the ternary operator is doing exactly the same as a 
min(), I read the current code as "If there is an error then return the 
error code, otherwise return 0".

This is quite different from the meaning of "min" which is "I want the 
minimum of the two values". Therefore I am not convinced using min() is 
the right thing to do.

> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
> ---
>   xen/arch/x86/bzimage.c    | 2 +-
>   xen/arch/x86/mm.c         | 2 +-
>   xen/arch/x86/mm/p2m-ept.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
> index ac4fd428be..f396aa3445 100644
> --- a/xen/arch/x86/bzimage.c
> +++ b/xen/arch/x86/bzimage.c
> @@ -136,7 +136,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
>           *image_len = output_len;
>       }
>   
> -    return err > 0 ? 0 : err;
> +    return min(0, err);
>   }
>   
>   /*
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 2fac67ad57..c7617f80e8 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1988,7 +1988,7 @@ static int demote_l3_table(struct page_info *page)
>           page->partial_flags = partial_flags;
>           rc = -ERESTART;
>       }
> -    return rc > 0 ? 0 : rc;
> +    return min(0, rc);
>   }
>   
>   static int demote_l4_table(struct page_info *page)
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index eb0f0edfef..38faa4df52 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -1069,7 +1069,7 @@ static int ept_change_entry_type_range(struct p2m_domain *p2m,
>       if ( sync )
>           ept_sync_domain(p2m);
>   
> -    return rc < 0 ? rc : 0;
> +    return min(rc, 0);
>   }
>   
>   static void ept_memory_type_changed(struct p2m_domain *p2m)
> 

-- 
Julien Grall

