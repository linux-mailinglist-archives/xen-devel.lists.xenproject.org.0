Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA52764E9B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 11:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570961.893602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwxp-0003Im-KN; Thu, 27 Jul 2023 09:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570961.893602; Thu, 27 Jul 2023 09:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwxp-0003Gg-Ha; Thu, 27 Jul 2023 09:07:17 +0000
Received: by outflank-mailman (input) for mailman id 570961;
 Thu, 27 Jul 2023 09:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOwxo-0003Ga-Hb
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 09:07:16 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9d91b61-2c5c-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 11:07:14 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so176603b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 02:07:14 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902ee8b00b001b7e63cfa19sm1063627pld.234.2023.07.27.02.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:07:12 -0700 (PDT)
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
X-Inumbo-ID: f9d91b61-2c5c-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690448833; x=1691053633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKiGuCYavgdrONYSlKU+hjlx/AzCB2LKMORbFgw7HEo=;
        b=DjrROq91sf6Va+7++jhnZLLfMfZ3NpR+vs103Gffs3+O08HW6byjEgnIqMIjx7XVVU
         6Esw8LCCRNx5FIzgZD2yLlNtiJ3fWUXbMzLdc62rKZLebfjHSG7L7jgEMl0D1hE7ZoNg
         HZ2c9Q9i+LL0tt0iImhvHFOK+Hduw2G0dP+6wK+guSG8W2Nz3BegBODQY1lmNQJ14Dz4
         uuXi2h/k5/64PvGOHou6Defqpklm1cGUHs8RqpArf+xI1YmvbpRswY34ry3JAORO90Jx
         4NSzh0j5w+vqWxK/Ia35MiibA4wNxyya8QHOgB3QIdRRJ50Wt48gZu09EVgownqRkh1E
         f6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448833; x=1691053633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKiGuCYavgdrONYSlKU+hjlx/AzCB2LKMORbFgw7HEo=;
        b=lzowHeMegd9YBC1uLkS7sQaTfX9g6yVzKfecE+6CLfK208ahA6XG8QtfTjXBxRGd16
         fmjSkyBuIFe/NO1EReSYwHgb0P56BSq1E/zUzd6QqhzfPnwgQg/K5mFGj0VjFnyHqb4/
         1dNmr1pHCBVrcdhXRYRLuPh6k3eO4inOqbhRt/i0XTZeVWoQaO6ntZTKXaN9pd3P43Vv
         kdlAfhqSMJiIwT4TvaCMxVbQIdglUJ3rMkq2JjbMLh7orYU5gW+yFGsHNHFDm+w/rxa8
         mg5oy5cS5CFAsISn9C3mt1LP60EFWDF0CofkgCapKycPjByJulkmtSxa/P/7Z2S63S3t
         QRhA==
X-Gm-Message-State: ABy/qLbSln4JN0SM4nLDMy6DBpyVZAKTOfSOJfIYwG3mVzPXgfHOWWb7
	eZuMxCxshLEdneaEEiPrtEZJGQ==
X-Google-Smtp-Source: APBJJlEquEzidizjgrmS1e55j2UU3CMKKyxPnlaVqAXQYQ+ePfvdxx8A4f9JU/BbmCjGKzVhoGuchQ==
X-Received: by 2002:a17:90a:128e:b0:263:25f9:65b2 with SMTP id g14-20020a17090a128e00b0026325f965b2mr4139877pja.4.1690448832920;
        Thu, 27 Jul 2023 02:07:12 -0700 (PDT)
Message-ID: <19461737-db63-2ab5-110b-e65035881ae2@bytedance.com>
Date: Thu, 27 Jul 2023 17:06:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/49] nfs: dynamically allocate the nfs-acl shrinker
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
 <20230727080502.77895-16-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-16-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/27 16:04, Qi Zheng wrote:
> Use new APIs to dynamically allocate the nfs-acl shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/nfs/super.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/nfs/super.c b/fs/nfs/super.c
> index 2284f749d892..072d82e1be06 100644
> --- a/fs/nfs/super.c
> +++ b/fs/nfs/super.c
> @@ -129,11 +129,7 @@ static void nfs_ssc_unregister_ops(void)
>   }
>   #endif /* CONFIG_NFS_V4_2 */
>   
> -static struct shrinker acl_shrinker = {
> -	.count_objects	= nfs_access_cache_count,
> -	.scan_objects	= nfs_access_cache_scan,
> -	.seeks		= DEFAULT_SEEKS,
> -};
> +static struct shrinker *acl_shrinker;
>   
>   /*
>    * Register the NFS filesystems
> @@ -153,9 +149,17 @@ int __init register_nfs_fs(void)
>   	ret = nfs_register_sysctl();
>   	if (ret < 0)
>   		goto error_2;
> -	ret = register_shrinker(&acl_shrinker, "nfs-acl");
> -	if (ret < 0)
> +
> +	acl_shrinker = shrinker_alloc(0, "nfs-acl");
> +	if (!acl_shrinker)
>   		goto error_3;

Here should set ret to -ENOMEM, will fix.

> +
> +	acl_shrinker->count_objects = nfs_access_cache_count;
> +	acl_shrinker->scan_objects = nfs_access_cache_scan;
> +	acl_shrinker->seeks = DEFAULT_SEEKS;
> +
> +	shrinker_register(acl_shrinker);
> +
>   #ifdef CONFIG_NFS_V4_2
>   	nfs_ssc_register_ops();
>   #endif
> @@ -175,7 +179,7 @@ int __init register_nfs_fs(void)
>    */
>   void __exit unregister_nfs_fs(void)
>   {
> -	unregister_shrinker(&acl_shrinker);
> +	shrinker_free(acl_shrinker);
>   	nfs_unregister_sysctl();
>   	unregister_nfs4_fs();
>   #ifdef CONFIG_NFS_V4_2

