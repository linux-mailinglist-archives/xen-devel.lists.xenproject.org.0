Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D89191312
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:26:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkRz-0007tW-Ki; Tue, 24 Mar 2020 14:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGkRx-0007tL-Cf
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:22:37 +0000
X-Inumbo-ID: e897c225-6dda-11ea-841b-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e897c225-6dda-11ea-841b-12813bfff9fa;
 Tue, 24 Mar 2020 14:22:36 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v1so6753298edq.8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 07:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4c9BzGTaFKahl1/eNqTdpOD1GYzEveY8QyF3cGnidg4=;
 b=NIwR4T/ROQQPf+d6IJDbNBKimtyVkRnkCb58v+Yf4vfokvP2MrJvk6LTwKhEU6uEBN
 3WQ3F+LuLSyZVFC793O9nfcwPNK0q4+bQdFBDnjlnwqITHe8aiHlm4uBGJeLclzpS3yu
 LEjiEdSBH/Ls8yIAnuPgw2dA8rDYsdk29itvEOMGpP9KlEr0RAEw9rCv4QJwmxbZAEJw
 pNslUizPhc4Epv3nD1/mTJYghnfW+wlikGZWVIcwhq6imMa/pWAik8I5dUZ8u5V5Pc4+
 f4VajOEHqH0F7VgjeLK51BKx4BV944xwRsziANdrSExHjwq21fpnP/fDeaDWc4MeNoVj
 E1ng==
X-Gm-Message-State: ANhLgQ2Hu6ZPBfpRqfbnmKztSUfimvvVLldvN/OQQeJV+eQNNecfZShr
 RWzV7skINV4KbOV5Pk3bBm8=
X-Google-Smtp-Source: ADFU+vujjMwqfjdJ4CKXY8y9P54dqX4MT7DeN8NR8Rvj0eF5dCxiTC6aXMyyWmx1FYwHeDWdJy+Nfg==
X-Received: by 2002:a50:998b:: with SMTP id m11mr27497040edb.36.1585059755628; 
 Tue, 24 Mar 2020 07:22:35 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id g4sm634707eje.0.2020.03.24.07.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:22:35 -0700 (PDT)
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-6-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <65cb0423-09c3-209a-85dc-63b07085d7ac@xen.org>
Date: Tue, 24 Mar 2020 14:22:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200310174917.1514-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v6 5/5] domain: use PGC_extra domheap page
 for shared_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 10/03/2020 17:49, paul@xen.org wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently shared_info is a shared xenheap page but shared xenheap pages
> complicate future plans for live-update of Xen so it is desirable to,
> where possible, not use them [1]. This patch therefore converts shared_info
> into a PGC_extra domheap page. This does entail freeing shared_info during
> domain_relinquish_resources() rather than domain_destroy() so care is
> needed to avoid de-referencing a NULL shared_info pointer hence some
> extra checks of 'is_dying' are needed.
> 
> NOTE: For Arm, the call to free_shared_info() in arch_domain_destroy() is
>        left in place since it is idempotent and called in the error path for
>        arch_domain_create().

The approach looks good to me. I have one comment below.

[...]

> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 4ef0d3b21e..4f3266454f 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1651,24 +1651,44 @@ int continue_hypercall_on_cpu(
>   
>   int alloc_shared_info(struct domain *d, unsigned int memflags)
>   {
> -    if ( (d->shared_info.virt = alloc_xenheap_pages(0, memflags)) == NULL )
> +    struct page_info *pg;
> +
> +    pg = alloc_domheap_page(d, MEMF_no_refcount | memflags);
> +    if ( !pg )
>           return -ENOMEM;
>   
> -    d->shared_info.mfn = virt_to_mfn(d->shared_info.virt);
> +    if ( !get_page_and_type(pg, d, PGT_writable_page) )
> +    {
> +        /*
> +         * The domain should not be running at this point so there is
> +         * no way we should reach this error path.
> +         */
> +        ASSERT_UNREACHABLE();
> +        return -ENODATA;
> +    }
> +
> +    d->shared_info.mfn = page_to_mfn(pg);
> +    d->shared_info.virt = __map_domain_page_global(pg);

__map_domain_page_global() is not guaranteed to succeed. For instance, 
on Arm32 this will be a call to vmap().

So you want to check the return.

Cheers,

-- 
Julien Grall

