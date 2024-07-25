Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34E93BCCA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764711.1175213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsRM-0005Oq-Ts; Thu, 25 Jul 2024 06:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764711.1175213; Thu, 25 Jul 2024 06:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsRM-0005NN-Qp; Thu, 25 Jul 2024 06:59:04 +0000
Received: by outflank-mailman (input) for mailman id 764711;
 Thu, 25 Jul 2024 06:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Od1u=OZ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sWsRL-0005LV-5H
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:59:03 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ed894ae-4a53-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 08:59:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 6F022A02C4;
 Thu, 25 Jul 2024 08:59:00 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8b8yThK8-v56; Thu, 25 Jul 2024 08:59:00 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 53DEBA02A2;
 Thu, 25 Jul 2024 08:59:00 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sWsRI-000000004wm-0H3M; Thu, 25 Jul 2024 08:59:00 +0200
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
X-Inumbo-ID: 5ed894ae-4a53-11ef-bbff-fd08da9f4363
Date: Thu, 25 Jul 2024 08:59:00 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2] mini-os: put sanity_check() under CONFIG_TEST
Message-ID: <20240725065859.mp2ijjthuhw7ecgj@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240725064254.7545-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725064254.7545-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le jeu. 25 juil. 2024 08:42:54 +0200, a ecrit:
> Hide the sanity_check() function, as it is used nowhere. By putting it
> under #ifdef CONFIG_TEST it will stay around, but it won't be
> included in normal production builds.
> 
> Call sanity_check() from the periodic thread of the test app, causing
> a sanity check every second.
> 
> Since any application linked with Mini-OS can't call sanity_check()
> (there is no EXPORT_SYMBOL for it), there is zero chance of breaking
> any use case.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
> V2:
> - don't remove it, but just hide it (Samuel Thibault)
> ---
>  include/lib.h | 2 ++
>  mm.c          | 2 ++
>  test.c        | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/include/lib.h b/include/lib.h
> index abd4e9ab..de67bab0 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -152,8 +152,10 @@ do {                                                           \
>  
>  #define BUG_ON(x) ASSERT(!(x))
>  
> +#ifdef CONFIG_TEST
>  /* Consistency check as much as possible. */
>  void sanity_check(void);
> +#endif
>  
>  /* Get own domid. */
>  domid_t get_domid(void);
> diff --git a/mm.c b/mm.c
> index 4aa0c6ca..a5d3f5e5 100644
> --- a/mm.c
> +++ b/mm.c
> @@ -395,6 +395,7 @@ void fini_mm(void)
>  {
>  }
>  
> +#ifdef CONFIG_TEST
>  void sanity_check(void)
>  {
>      int x;
> @@ -410,3 +411,4 @@ void sanity_check(void)
>          }
>      }
>  }
> +#endif
> diff --git a/test.c b/test.c
> index 465c54e8..4dd6e260 100644
> --- a/test.c
> +++ b/test.c
> @@ -185,6 +185,7 @@ static void periodic_thread(void *p)
>      {
>          gettimeofday(&tv, NULL);
>          printk("T(s=%ld us=%ld)\n", tv.tv_sec, tv.tv_usec);
> +        sanity_check();
>          msleep(1000);
>      }
>  }
> -- 
> 2.43.0
> 

-- 
Samuel
`When you say "I wrote a program that crashed Windows", people just stare at
you blankly and say "Hey, I got those with the system, *for free*".'
(By Linus Torvalds)

