Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48102772768
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578509.906038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT12e-0001tA-Qd; Mon, 07 Aug 2023 14:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578509.906038; Mon, 07 Aug 2023 14:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT12e-0001r4-Nj; Mon, 07 Aug 2023 14:17:04 +0000
Received: by outflank-mailman (input) for mailman id 578509;
 Mon, 07 Aug 2023 14:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNKM=DY=joelfernandes.org=joel@srs-se1.protection.inumbo.net>)
 id 1qT10a-0001nV-OT
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:14:56 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7c08f84-352c-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:14:55 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9bb097c1bso70380181fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 07:14:54 -0700 (PDT)
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
X-Inumbo-ID: c7c08f84-352c-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1691417694; x=1692022494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
        b=rUbGf+JZcp35dmq7w8slw0nHgKluYcuW30g35dHvkRNE8GAplx/bmohiweQc5R1m+t
         n8zrOL6x18GLNviLyBdF1SBbwknD+YT0R92Z3r7ozf/LbxR/ZX+oGNC6AweYXTnFy1Td
         qjM3KL4IzdURsMRiax7oRl3ig1sdRDyJ5+2Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417694; x=1692022494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
        b=CP6jlHg3e20+fXL3dQRiTWA/QacVmTeoRotK/6PzTz+epFyaECn/E/giPkUKVUNhAM
         mVvqZ5gP77YaK2u7qfRy9I8/M1y1A0iNp5IgK/kJY7ZTCJ+5U//z/Fkv5N96RW2uqHkk
         14kGteuFMQnOklZ77DnBJXdNxOpulzxIC4iBlY3CJT/JViUfl4fg6DO7znJy/g5PdcEs
         MQq9yU+Q1fu1w/KU2cbJ8dz2jqQwKLoP+g7tE7shbzjB5ZZgNs2VEl4R6fGHDrIm8vXe
         xFsQDUZTHfAcmwQmkKF3j5Yffpcgu5eTz+Ov4HB5uSCzSPT7An/O6ftvtmqqx1+gVIGb
         +BpA==
X-Gm-Message-State: AOJu0Yy26obgSDXuBfMpRyox5PgQc8bcQlezfBqR/JRnCE3+cRrs8+/A
	EIgxrVqiZL4E59nH0Qaf27cdEh47U7DazOLABdH7Sg==
X-Google-Smtp-Source: AGHT+IEUzxQ8uhfef4Gwj5w4R2S1a/fG2YmFdaAnrERcAODuTjnUg5MW8ffcyCI3WwFTK01hsv/WyE2OTkrmMwFZBOU=
X-Received: by 2002:a2e:9254:0:b0:2b6:dfef:d526 with SMTP id
 v20-20020a2e9254000000b002b6dfefd526mr6547671ljg.11.1691417693488; Mon, 07
 Aug 2023 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com> <20230807110936.21819-20-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-20-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:14:48 -0400
Message-ID: <CAEXW_YQHGBE2kKupLf12BGOEU5GnQsBUtVQcyMnzxUZ4y48QFA@mail.gmail.com>
Subject: Re: [PATCH v4 19/48] rcu: dynamically allocate the rcu-kfree shrinker
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

On Mon, Aug 7, 2023 at 7:17=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.com=
> wrote:
>
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

For RCU:
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

- Joel


> ---
>  kernel/rcu/tree.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 7c79480bfaa0..3b20fc46c514 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3449,13 +3449,6 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, str=
uct shrink_control *sc)
>         return freed =3D=3D 0 ? SHRINK_STOP : freed;
>  }
>
> -static struct shrinker kfree_rcu_shrinker =3D {
> -       .count_objects =3D kfree_rcu_shrink_count,
> -       .scan_objects =3D kfree_rcu_shrink_scan,
> -       .batch =3D 0,
> -       .seeks =3D DEFAULT_SEEKS,
> -};
> -
>  void __init kfree_rcu_scheduler_running(void)
>  {
>         int cpu;
> @@ -4931,6 +4924,7 @@ static void __init kfree_rcu_batch_init(void)
>  {
>         int cpu;
>         int i, j;
> +       struct shrinker *kfree_rcu_shrinker;
>
>         /* Clamp it to [0:100] seconds interval. */
>         if (rcu_delay_page_cache_fill_msec < 0 ||
> @@ -4962,8 +4956,18 @@ static void __init kfree_rcu_batch_init(void)
>                 INIT_DELAYED_WORK(&krcp->page_cache_work, fill_page_cache=
_func);
>                 krcp->initialized =3D true;
>         }
> -       if (register_shrinker(&kfree_rcu_shrinker, "rcu-kfree"))
> -               pr_err("Failed to register kfree_rcu() shrinker!\n");
> +
> +       kfree_rcu_shrinker =3D shrinker_alloc(0, "rcu-kfree");
> +       if (!kfree_rcu_shrinker) {
> +               pr_err("Failed to allocate kfree_rcu() shrinker!\n");
> +               return;
> +       }
> +
> +       kfree_rcu_shrinker->count_objects =3D kfree_rcu_shrink_count;
> +       kfree_rcu_shrinker->scan_objects =3D kfree_rcu_shrink_scan;
> +       kfree_rcu_shrinker->seeks =3D DEFAULT_SEEKS;
> +
> +       shrinker_register(kfree_rcu_shrinker);
>  }
>
>  void __init rcu_init(void)
> --
> 2.30.2
>

