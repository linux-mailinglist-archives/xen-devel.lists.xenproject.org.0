Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B6B53E5AD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 18:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342642.567700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyFQX-0005pk-Bc; Mon, 06 Jun 2022 16:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342642.567700; Mon, 06 Jun 2022 16:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyFQX-0005nI-6U; Mon, 06 Jun 2022 16:18:01 +0000
Received: by outflank-mailman (input) for mailman id 342642;
 Mon, 06 Jun 2022 16:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NV1H=WN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nyFQV-0005nC-Iv
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 16:17:59 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aabeae7-e5b4-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 18:17:58 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id q7so20529305wrg.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jun 2022 09:17:58 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a7bc349000000b0039746638d6esm17590755wmj.33.2022.06.06.09.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 09:17:57 -0700 (PDT)
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
X-Inumbo-ID: 3aabeae7-e5b4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RaQhq4KYkeTpBP9+9/YIEr0G6PjvF+TDJNb+GzMN8pE=;
        b=HCzloWuy8I0Pmkrc7dz8TytjmK6UWi8puFvzfUR+KM+5a651GzRP7FiAcVbTbXc5aF
         RpSyHIBoUAGSSTyLU1+2UgnXIGQ3x2Ml+503h9bYVrx10KgYl/iVV1rIvGsH8yz4fMrW
         THxdwFoza4sqeOLwiNooiNIHwvyWq++PCiYnhvUEsxQp5wyUKi3onG8GkasksmAj6W91
         T3dcgZOBFYHLdWRP3bupBiooLri+byrfeV7Qpi+zmlI+Bqps8LbOk5k+rrYQk6R7ObDI
         yohDP+sRBKbbIFKO51mIv+NPs8E47vrNQey39aELE8uZoBYAOvtLXVa2kdC3jzl57ldc
         DTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RaQhq4KYkeTpBP9+9/YIEr0G6PjvF+TDJNb+GzMN8pE=;
        b=Rb+puOO5Xhg6L3Vb2fTbpQpHoEX7GXS1qgadNzwH+yZBFMdxesm5Spj8/1TBRgBFRp
         gzpPwCrRE4LUW7yPImxqOujM7Yc4Hka1wk9McRuGiGpMLYTVkqy8p2hzUdJrlhCnywpM
         dIujFMYc9tkEoKhNJ5ML6qsheJXnoCgRe58qXyRqaI33u7b0Fd4Ye6FQdLqCOKzJP/ok
         mSFWQ9EpcpFwLUwJnTWrRFwrJ1YIsxllktjGdC3RrLedsasxgaofBd6Xbfb4qVBLP3PY
         d75HNG9h/dvg6SFjFjghyK1MWWH2nu0JEn/wWaL4nZTCdok0Kjtu6tKsA3aZiM0ebHxy
         IH/w==
X-Gm-Message-State: AOAM532ufNOF9BLqK4AcM2gEe2wKxclNaypUQAFF9QVHd4YIEe+b+opr
	k/mPmEcnyPK6GiQKEUxBrmU=
X-Google-Smtp-Source: ABdhPJyubms71mI0yq0O8eaFjibbBPQLqWwuuEbqo88skGsbrd3DUTneQb2KakphwFPQ3zQZUIvfJg==
X-Received: by 2002:adf:a3d3:0:b0:213:baff:7654 with SMTP id m19-20020adfa3d3000000b00213baff7654mr17611749wrb.158.1654532277594;
        Mon, 06 Jun 2022 09:17:57 -0700 (PDT)
Subject: Re: [PATCH] xen: unexport __init-annotated
 xen_xlate_map_ballooned_pages()
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 moderated for non-subscribers <xen-devel@lists.xenproject.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Julien Grall
 <julien.grall@arm.com>, Shannon Zhao <shannon.zhao@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20220606045920.4161881-1-masahiroy@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <20c9cd23-429f-896c-b59b-c518ff2562e2@gmail.com>
Date: Mon, 6 Jun 2022 19:17:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220606045920.4161881-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06.06.22 07:59, Masahiro Yamada wrote:

Hello

> EXPORT_SYMBOL and __init is a bad combination because the .init.text
> section is freed up after the initialization. Hence, modules cannot
> use symbols annotated __init. The access to a freed symbol may end up
> with kernel panic.
>
> modpost used to detect it, but it has been broken for a decade.
>
> Recently, I fixed modpost so it started to warn it again, then this
> showed up in linux-next builds.
>
> There are two ways to fix it:
>
>    - Remove __init
>    - Remove EXPORT_SYMBOL
>
> I chose the latter for this case because none of the in-tree call-sites
> (arch/arm/xen/enlighten.c, arch/x86/xen/grant-table.c) is compiled as
> modular.

Good description.


>
> Fixes: 243848fc018c ("xen/grant-table: Move xlated_setup_gnttab_pages to common place")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I think the patch is correct.

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> ---
>
>   drivers/xen/xlate_mmu.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/xen/xlate_mmu.c b/drivers/xen/xlate_mmu.c
> index 34742c6e189e..f17c4c03db30 100644
> --- a/drivers/xen/xlate_mmu.c
> +++ b/drivers/xen/xlate_mmu.c
> @@ -261,7 +261,6 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t **gfns, void **virt,
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL_GPL(xen_xlate_map_ballooned_pages);
>   
>   struct remap_pfn {
>   	struct mm_struct *mm;

-- 
Regards,

Oleksandr Tyshchenko


