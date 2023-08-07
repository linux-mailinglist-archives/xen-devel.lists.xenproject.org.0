Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D50F772767
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578511.906045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT12f-00020k-54; Mon, 07 Aug 2023 14:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578511.906045; Mon, 07 Aug 2023 14:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT12f-0001tl-1D; Mon, 07 Aug 2023 14:17:05 +0000
Received: by outflank-mailman (input) for mailman id 578511;
 Mon, 07 Aug 2023 14:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNKM=DY=joelfernandes.org=joel@srs-se1.protection.inumbo.net>)
 id 1qT11n-0001q7-MS
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:16:11 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f46e693b-352c-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:16:09 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so73207501fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 07:16:09 -0700 (PDT)
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
X-Inumbo-ID: f46e693b-352c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1691417769; x=1692022569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=;
        b=KDeUHSfDD3L4EI9ZDbXXnOCIgf36k4kTiyHRIIffaGRG3HCFl39GcfvKDi2APyBxt9
         uIkOV41JjBWzvcfkl4hWbMoMF6B7yW2N6o4toZetNa+16q9cwIbk8dhp8WLMlbMnqtzs
         lrCcsJN2ho/fqPCpmMmUqd/p18Lc2P1XhR9Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417769; x=1692022569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=;
        b=Fyz0LdMT+XDtd8qUGL0u1pk3J9VOlmpNgSrVQ40CsOmi6sqNJD8+c8EfpPLHZnUwTp
         HkMOgh4q+AQqRMTG4LA6IkcabBx1OhssIqYLVYzI7lSlDSFNbXC3llVdZQQA3/X3q0eR
         sep0363xb1kOlW0v55qLKcr1kTrVnpj06jpxAOAPiffmAl94DFKgj/CZZK7IIEYKakDG
         o/xVoOUpmJK7DZkMTdGNiVhzpZ4LaXTPkLTgZtiCHGVo7IgGQpetLpqKO2w6UdQRddwA
         RP8tEUtrNsG0UbcG0gLpwtx/VDGUbthGRjH4olsCJa8sjpOiYfbQIeIyy7Y3rxKD5Dj8
         bVEw==
X-Gm-Message-State: AOJu0YzM/AGaD0mG8upaxKKPI6maFxjTFTg+b0TlCycA+zKdev1NLpjX
	4uWnJpVnaukqXvhxl4neOigkwazQa+koHdxbNJVmvw==
X-Google-Smtp-Source: AGHT+IGOrJUhdG+ahMA8bObfIwJouhmkY47ZzUfvTwinDgzhZuBpH+4Q7OaueJuZRAHK8xn8XVlTzjWWvAUYbt+ovvQ=
X-Received: by 2002:a2e:b166:0:b0:2b9:dd3b:cf43 with SMTP id
 a6-20020a2eb166000000b002b9dd3bcf43mr6572529ljm.13.1691417768626; Mon, 07 Aug
 2023 07:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com> <20230807110936.21819-19-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-19-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:16:03 -0400
Message-ID: <CAEXW_YTKHUeZHWtzeSG5Tt7MscNKjVTScBWkVDkC4Orisa7w=Q@mail.gmail.com>
Subject: Re: [PATCH v4 18/48] rcu: dynamically allocate the rcu-lazy shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru, 
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org, 
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, 
	cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com, 
	gregkh@linuxfoundation.org, muchun.song@linux.dev, simon.horman@corigine.com, 
	dlemoal@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dm-devel@redhat.com, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 7:36=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.com=
> wrote:
>
> Use new APIs to dynamically allocate the rcu-lazy shrinker.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

For RCU:
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

- Joel


> ---
>  kernel/rcu/tree_nocb.h | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
> index 5598212d1f27..e1c59c33738a 100644
> --- a/kernel/rcu/tree_nocb.h
> +++ b/kernel/rcu/tree_nocb.h
> @@ -1396,13 +1396,6 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, stru=
ct shrink_control *sc)
>
>         return count ? count : SHRINK_STOP;
>  }
> -
> -static struct shrinker lazy_rcu_shrinker =3D {
> -       .count_objects =3D lazy_rcu_shrink_count,
> -       .scan_objects =3D lazy_rcu_shrink_scan,
> -       .batch =3D 0,
> -       .seeks =3D DEFAULT_SEEKS,
> -};
>  #endif // #ifdef CONFIG_RCU_LAZY
>
>  void __init rcu_init_nohz(void)
> @@ -1410,6 +1403,7 @@ void __init rcu_init_nohz(void)
>         int cpu;
>         struct rcu_data *rdp;
>         const struct cpumask *cpumask =3D NULL;
> +       struct shrinker * __maybe_unused lazy_rcu_shrinker;
>
>  #if defined(CONFIG_NO_HZ_FULL)
>         if (tick_nohz_full_running && !cpumask_empty(tick_nohz_full_mask)=
)
> @@ -1436,8 +1430,16 @@ void __init rcu_init_nohz(void)
>                 return;
>
>  #ifdef CONFIG_RCU_LAZY
> -       if (register_shrinker(&lazy_rcu_shrinker, "rcu-lazy"))
> -               pr_err("Failed to register lazy_rcu shrinker!\n");
> +       lazy_rcu_shrinker =3D shrinker_alloc(0, "rcu-lazy");
> +       if (!lazy_rcu_shrinker) {
> +               pr_err("Failed to allocate lazy_rcu shrinker!\n");
> +       } else {
> +               lazy_rcu_shrinker->count_objects =3D lazy_rcu_shrink_coun=
t;
> +               lazy_rcu_shrinker->scan_objects =3D lazy_rcu_shrink_scan;
> +               lazy_rcu_shrinker->seeks =3D DEFAULT_SEEKS;
> +
> +               shrinker_register(lazy_rcu_shrinker);
> +       }
>  #endif // #ifdef CONFIG_RCU_LAZY
>
>         if (!cpumask_subset(rcu_nocb_mask, cpu_possible_mask)) {
> --
> 2.30.2
>

