Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB85764EDD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 11:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570966.893621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOx1h-0005N2-Fc; Thu, 27 Jul 2023 09:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570966.893621; Thu, 27 Jul 2023 09:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOx1h-0005L2-Cw; Thu, 27 Jul 2023 09:11:17 +0000
Received: by outflank-mailman (input) for mailman id 570966;
 Thu, 27 Jul 2023 09:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOx1f-0005Kp-Oe
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 09:11:15 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88509f7e-2c5d-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 11:11:13 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so177066b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 02:11:13 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 h4-20020aa786c4000000b00682a99b01basm1038080pfo.0.2023.07.27.02.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:11:11 -0700 (PDT)
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
X-Inumbo-ID: 88509f7e-2c5d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690449072; x=1691053872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cACJ3NT7rSPHksG1CSCDv/QZVUluNTqq4KXvaW886oI=;
        b=lKnOasFRjAEbGh7P40XbzLKtOkahlmVFUDvqCWW3ZgaRuzNJSwp4sTaKgMwNwz+Jpc
         hA4nVDJPH5aqf4q8bVxcWLUkzXpK23oeAFnlJRwJaEUIleLrrgs7btXzJpx3+9HaPfQV
         hGIP/T6lERVA8hpdk6KZN9Q4J/+wilHe5ZItz/9QQ1qHO3gv2Y4k+BaS5cDcOKz/WLAL
         6NaRvNv6KF2mZ19RDXY6rbQZ5sQKyx2Yj2LrfaBgxjqmYdHbumQCN0WmWtbB+gjDIGzm
         PXmUTQGLOY5T8H3PnVo3H27NG4eQhipuKvHt4yAhK97ujnI+IJGqA8lmlUO0fy4wYeay
         +oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449072; x=1691053872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cACJ3NT7rSPHksG1CSCDv/QZVUluNTqq4KXvaW886oI=;
        b=cLKYmsXoIJjzMKxts0wtJh2wUb10a7ZVCMI7xdczE7FlZwA5awcabiq6hvyr9yGjfs
         yrSGm0ch4XMkssaMbq/BqAUSswZs26l/NbZDxztObVTPW4pUjyCzMZyGa1Kv+93neSQJ
         lvYqC0MSNEoeCi3aQ2IGAExPiDMO/s9rNSz+dp1uyjuesxinCL+M1cse51Plbp+hjxjp
         lgJt/qPouQIqGBKt5xWTvdC7aZa1xQI5HVP2l0XPWOoRb1wvFQZkApVg/75S4DAGjwzC
         CzMUoo8xHaDWVmuw5Rm4hGLRj6yOIioZqehqON3GD2KAclvB4NwrjoCm8I2vdIriTGuC
         BQGA==
X-Gm-Message-State: ABy/qLbTJGCg63TK4Iiey55p3meKgb8/gK5dCaJnJ93mdlMjClADr+3f
	Uhc1h9RcicKGzzC2+GUJxqpZkQ==
X-Google-Smtp-Source: APBJJlFfFWIsc+pfSeu4dzuDSzimKXTbXaekoL0gFKsbHel8kB/qljY4u0PtyM2mUW/wDh3jQGEPVg==
X-Received: by 2002:a05:6a00:2d82:b0:675:8627:a291 with SMTP id fb2-20020a056a002d8200b006758627a291mr4692915pfb.3.1690449072033;
        Thu, 27 Jul 2023 02:11:12 -0700 (PDT)
Message-ID: <1eb30b9e-c43b-b81e-4d96-5d6fa4f2894a@bytedance.com>
Date: Thu, 27 Jul 2023 17:10:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 22/49] sunrpc: dynamically allocate the sunrpc_cred
 shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-23-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-23-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/27 16:04, Qi Zheng wrote:
> Use new APIs to dynamically allocate the sunrpc_cred shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   net/sunrpc/auth.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
> index 2f16f9d17966..6b898b1be6f5 100644
> --- a/net/sunrpc/auth.c
> +++ b/net/sunrpc/auth.c
> @@ -861,11 +861,7 @@ rpcauth_uptodatecred(struct rpc_task *task)
>   		test_bit(RPCAUTH_CRED_UPTODATE, &cred->cr_flags) != 0;
>   }
>   
> -static struct shrinker rpc_cred_shrinker = {
> -	.count_objects = rpcauth_cache_shrink_count,
> -	.scan_objects = rpcauth_cache_shrink_scan,
> -	.seeks = DEFAULT_SEEKS,
> -};
> +static struct shrinker *rpc_cred_shrinker;
>   
>   int __init rpcauth_init_module(void)
>   {
> @@ -874,9 +870,16 @@ int __init rpcauth_init_module(void)
>   	err = rpc_init_authunix();
>   	if (err < 0)
>   		goto out1;
> -	err = register_shrinker(&rpc_cred_shrinker, "sunrpc_cred");
> -	if (err < 0)
> +	rpc_cred_shrinker = shrinker_alloc(0, "sunrpc_cred");
> +	if (!rpc_cred_shrinker)

Here should set err to -ENOMEM, will fix.

>   		goto out2;
> +
> +	rpc_cred_shrinker->count_objects = rpcauth_cache_shrink_count;
> +	rpc_cred_shrinker->scan_objects = rpcauth_cache_shrink_scan;
> +	rpc_cred_shrinker->seeks = DEFAULT_SEEKS;
> +
> +	shrinker_register(rpc_cred_shrinker);
> +
>   	return 0;
>   out2:
>   	rpc_destroy_authunix();
> @@ -887,5 +890,5 @@ int __init rpcauth_init_module(void)
>   void rpcauth_remove_module(void)
>   {
>   	rpc_destroy_authunix();
> -	unregister_shrinker(&rpc_cred_shrinker);
> +	shrinker_free(rpc_cred_shrinker);
>   }

