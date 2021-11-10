Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274D44CB22
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 22:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224475.387764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkuvn-0007OL-1f; Wed, 10 Nov 2021 21:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224475.387764; Wed, 10 Nov 2021 21:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkuvm-0007Ma-Uh; Wed, 10 Nov 2021 21:14:54 +0000
Received: by outflank-mailman (input) for mailman id 224475;
 Wed, 10 Nov 2021 21:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8kS=P5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mkuvl-0007MS-Ho
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 21:14:53 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ec7d2ed-426b-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 22:14:52 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id r12so15779670edt.6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 13:14:52 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id jg32sm413052ejc.43.2021.11.10.13.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 13:14:51 -0800 (PST)
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
X-Inumbo-ID: 3ec7d2ed-426b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pVqcXx7C0fqhjhlcziBwzk8JZGrQTdhS7OcL/lTo6mA=;
        b=SWEzlZluf+5KmilXdPadvhOvwQbCAxrok4mr4mlbfCYQas/KyVLZowhXIu+yBN0lJ1
         M/4Tj4aqnrOsayf7DmBqOIDtbdz93Flr4DDhS5meCJ4PIveO7+7Oc64CsLQZSKkiHOtb
         teg3lt6OEcooAnZ9gSwPbasUMJPxp3Ja/wYXETXA0Re9DU/9SEZelC5d+DUHHJpnlN+y
         6ChvBCFHEOXs6eUmKgkl4F8WuKotJ78tBADkEAT7N3ISANwsdTieYKaAOGazN4GsOsm8
         HkSYMdLUi8EieoL/ZMYPDOMRWVzKKVxjXUJMe82a5iKfkTUdAdYWx5uyhEEkd/R5YTbX
         MKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pVqcXx7C0fqhjhlcziBwzk8JZGrQTdhS7OcL/lTo6mA=;
        b=y+GMK+4ksuauT4NqCvpEHPuUJS4a9dQhfFzxy67G+hMm9mi8iFb4QlsFiZlscoXhcj
         tATCT2/N0ds7aQw63gaVXL9dwK8tXjo/iYjuXZLhbeyf4w+PSdKcRGNnVOrEOtw/+cej
         qh5ytkzKz8csgYB/yDDsN8JnseIWwdeSlo5CGCi2NWauPNwFFL0h3u1Nwo2NkMlD1Dl5
         csx0YrPTbnby6qlJzj+GLfcNaQcsXZMWqQlC6D5VHLn4xwIwQdRWdqQBl3wiBEPWFsBM
         hVf91D7qSbrfMwMLWRVkbPDQYGZqxaYEqFrH9aqV9LmA3PbOn/45WLzPyo3asAoyCtrb
         Lu4Q==
X-Gm-Message-State: AOAM531lpRvr/hOb42bTp0PJe132CnOnxfv5GUa+oDxPA5+i8uZxTQpL
	PCoKicOVKXH6uNVQKtI945g7yP0Mmpc=
X-Google-Smtp-Source: ABdhPJwpMeQbjcWOlvRSjgZ9auGqmQpAkM4yAKQTG/xVkoHyMiaKsi9RFSNajThJKjQbvExi8/H/zA==
X-Received: by 2002:a17:906:140b:: with SMTP id p11mr2724059ejc.116.1636578891982;
        Wed, 10 Nov 2021 13:14:51 -0800 (PST)
Subject: Re: [PATCH v2 for-4.16] xen/arm: allocate_bank_memory: don't create
 memory banks of size zero
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, xen-devel@lists.xenproject.org,
 oleksandr_tyshchenko@epam.com, iwj@xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211110205555.945026-1-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6464f476-758a-5d89-20c5-c7335caaa0af@gmail.com>
Date: Wed, 10 Nov 2021 23:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211110205555.945026-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.11.21 22:55, Stefano Stabellini wrote:

Hi Stefano

> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> allocate_bank_memory can be called with a tot_size of zero, as an
> example see the implementation of allocate_memory which can call
> allocate_bank_memory with a tot_size of zero for the second memory bank.
>
> If tot_size == 0, don't create an empty memory bank, just return
> immediately without error. Otherwise a zero-size memory bank will be
> added to the domain device tree.
>
> Note that Linux is known to be able to cope with zero-size memory banks,
> and Xen more recently gained the ability to do so as well (5a37207df520
> "xen/arm: bootfdt: Ignore empty memory bank"). However, there might be
> other non-Linux OSes that are not able to cope with empty memory banks
> as well as Linux (and now Xen). It would be more robust to avoid
> zero-size memory banks unless required.
>
> Moreover, the code to find empty address regions in make_hypervisor_node
> in Xen is not able to cope with empty memory banks today and would
> result in a Xen crash. This is only a latent bug because
> make_hypervisor_node is only called for Dom0 at present and
> allocate_memory is only called for DomU at the moment. (But if
> make_hypervisor_node was to be called for a DomU, then the Xen crash
> would become manifest.)
>
> Fixes: f2931b4233ec ("xen/arm: introduce allocate_memory")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v2:
> - improve commit message
> - add in-code comment
>
> In regards to inclusion in 4.16.
>
> If we don't fix this issue in 4.16, default usage of Xen+Linux won't be
> affected.
>
> However:
> - Non-Linux OSes that cannot cope with zero-size memory banks could
>    error out. I am not aware of any but there are so many out there in
>    embedded it is impossible to tell.
> - downstream Xen calling make_hypervisor_node for DomUs will crash
> - future Xen calling make_hypervisor_node for DomUs will have to make
>    sure to fix this anyway
Regarding calling make_hypervisor_node() for DomU. I am wondering 
whether algorithms (unallocated_memory and memory_holes)
to find extended regions called from make_hypervisor_node() are also 
suitable for DomU? Anyway, this is not something which is directly 
related to this patch.


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


>
> If we commit the patch in 4.16, we fix these issue. This patch is only 2
> lines of code and very easy to review. The risk is extremely low.
>
> Difficult to say what mistakes could have been made in analysis and
> preparation because it is a trivial if-zero-return patch, which is
> likely to fix latent bugs rather than introducing instability.
>
> ---
>   xen/arch/arm/domain_build.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9e92b640cd..fe38a7c73c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -395,6 +395,14 @@ static bool __init allocate_bank_memory(struct domain *d,
>       struct membank *bank;
>       unsigned int max_order = ~0;
>   
> +    /*
> +     * allocate_bank_memory can be called with a tot_size of zero for
> +     * the second memory bank. It is not an error and we can safely
> +     * avoid creating a zero-size memory bank.
> +     */
> +    if ( tot_size == 0 )
> +        return true;
> +
>       bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
>       bank->start = gfn_to_gaddr(sgfn);
>       bank->size = tot_size;

-- 
Regards,

Oleksandr Tyshchenko


