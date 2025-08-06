Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32533B1C49F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 13:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071633.1435051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujc1W-00007u-EK; Wed, 06 Aug 2025 11:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071633.1435051; Wed, 06 Aug 2025 11:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujc1W-00004s-BQ; Wed, 06 Aug 2025 11:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1071633;
 Wed, 06 Aug 2025 11:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujc1V-0008WC-3V
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 11:09:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3d487f1-72b5-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 13:09:31 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso440315e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 04:09:31 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e58400f5sm42973835e9.2.2025.08.06.04.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:09:30 -0700 (PDT)
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
X-Inumbo-ID: d3d487f1-72b5-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754478571; x=1755083371; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxIvSoWBKo41DppR8gQkPHqo85xyT2GTIIMzJywv40Y=;
        b=fuE6uAgTAYLMrRpaVZb6PQfTvbgsmYEMeKn0bFE4HkSPDKdLanuKsjRLjJ52sTbUjt
         QOmrjz/pz04mLsv4oZ2cT5ks8rkir4ksG3Kq/ZQa0mX054xtPjigFUf4NdHxVO8yj277
         Tag3mDWpJgRCzHNppNMjcwo/JoUqbfgbVbJ4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754478571; x=1755083371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxIvSoWBKo41DppR8gQkPHqo85xyT2GTIIMzJywv40Y=;
        b=RLQk04VPa3rL3L7hYmRmLXo7Dl4nsFwvvp0DdAyuQZAqX6q+2wb1XwSSZXDuKjlslG
         E9MdrGIvfkoq8mlhAGF9BBp/5DN0WtP3MNPraAManKxSYx8qJMReQGnvjI2aA4x1926h
         Q2kpy/l1/PxJbbP+Tu/Nd2Y0o5+ZG84vDgZ0NGnigSJtlzQYN/Jn3PtEebDdfBfFmAhg
         V/rd7kIC9u+u192WaSk+gcOcIJZ1tvg/HZHkcvSoKu3kQPIU6uUjd2L06llElC03bM6D
         7D3CAhJVRaj8x1uf48W30xnKVIMyOOJsrK4iMDfyDT8SGkDlA9LjsHZhAO9fF3jZzFYf
         mnaQ==
X-Gm-Message-State: AOJu0YwPr2wMxeOlKtZirfwhF2emiZLgnwpzRVs0FHjh/xsgt+AaAFiE
	Ex6YOGN+LFGUwQPJ/yEfXjvfFRZx+jQQBId0kNHjzrJBpOf4T94nGXhTDGDCvss+Ubs=
X-Gm-Gg: ASbGncv6oxHOIiqsOsNJPsxYRegY9V2J1oSC1ELfMGIxFlXcxVICw1LSylVWzFl8oa0
	NyelGCT6cWhE1G20q+QDVDdn/YWKBTHNJQSRGL0PHcadrEiBNehJjEtupajACVcny4B3A5/yfBE
	FMMLqtXKJoSbgPdiMqO6Mu81gNDHeqGUqQz/TQtDb9GNeD03kA8X8lPp0g1RBYsM6SXJwMD+Ddi
	QRPEW8cdGD2mQ97vGOpx1ZzyiA+4BmfleRhA1NolasQ/aBTRqnlzYuv4zVihkENK/oBDcaTmipq
	f9j1w5Htt5aPQzrzoMCnyh9O6HpLSC6WrzM6zK7LXMximi1vDuisk9FzVTyEHhqKmxwI4ITg2cR
	t1bV+60V1OqDdj1PjIcZzQZVYwBXAJlH1Qwv0bTyEJRYndGQTc4WJ/e4s1lmnLstNBA==
X-Google-Smtp-Source: AGHT+IE76XiG+FguFPwiOOK7ZieP1V/4KTiO+FikepCIF6Zd+51xa3VVRbagmtK3bCLfJ2ynI8DKOw==
X-Received: by 2002:a05:600c:3555:b0:459:d6a6:792 with SMTP id 5b1f17b1804b1-459e70e84ecmr20743305e9.29.1754478571279;
        Wed, 06 Aug 2025 04:09:31 -0700 (PDT)
Date: Wed, 6 Aug 2025 13:09:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
Message-ID: <aJM36pEZpn5IHSBf@macbook.local>
References: <20250725212235.753363-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250725212235.753363-1-dmukhin@ford.com>

On Fri, Jul 25, 2025 at 09:24:48PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> __printk_ratelimit() is never used outside of the console driver.
> Remove it from the lib.h and merge with the public printk_ratelimit().
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 29 ++++++++++++-----------------
>  xen/include/xen/lib.h      |  1 -
>  2 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 75fa033ce74d..80f8f2ed1bae 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -979,7 +979,7 @@ static void vprintk_common(const char *fmt, va_list args, const char *prefix)
>      char         *p, *q;
>      unsigned long flags;
>  
> -    /* console_lock can be acquired recursively from __printk_ratelimit(). */
> +    /* console_lock can be acquired recursively from printk_ratelimit(). */
>      local_irq_save(flags);
>      rspin_lock(&console_lock);
>      state = &this_cpu(state);
> @@ -1266,13 +1266,19 @@ void console_end_sync(void)
>      atomic_dec(&print_everything);
>  }
>  
> +/* minimum time in ms between messages */
> +static int __read_mostly printk_ratelimit_ms = 5 * 1000;
> +
> +/* number of messages we send before ratelimiting */
> +static int __read_mostly printk_ratelimit_burst = 10;

You possibly want to make them const for the time being?

It's unclear whether we would like to dynamically change those values
in the future.  Given the current usage they would better be const.

> +
>  /*
>   * printk rate limiting, lifted from Linux.
>   *
>   * This enforces a rate limit: not more than one kernel message
>   * every printk_ratelimit_ms (millisecs).
>   */
> -int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
> +int printk_ratelimit(void)

As suggested by Jan, I would just make this static and remove the
prototype from lib.h.  That results in less changes, and allows to
more easily export the fine grained function in the future if we had a
need to.

Thanks, Roger.

