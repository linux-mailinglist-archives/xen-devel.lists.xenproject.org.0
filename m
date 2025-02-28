Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138DA49B27
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 15:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898747.1307251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0tw-00059U-Ff; Fri, 28 Feb 2025 13:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898747.1307251; Fri, 28 Feb 2025 13:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0tw-000582-Cj; Fri, 28 Feb 2025 13:59:40 +0000
Received: by outflank-mailman (input) for mailman id 898747;
 Fri, 28 Feb 2025 13:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1to0tu-00057w-Ir
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 13:59:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cca244a-f5dc-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 14:59:33 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e0939c6456so2911391a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 05:59:33 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6f5363sm289401066b.123.2025.02.28.05.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 05:59:32 -0800 (PST)
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
X-Inumbo-ID: 3cca244a-f5dc-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740751173; x=1741355973; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8+pSrbZB3kmNbwh95tcRi7cNkyGyn2cxWbS+iSeZcsA=;
        b=l7E5SFlmn3524jIA6pTelxmVFAyJYJOTLr/c1prbnuCCfNuzxcomgWolnLCc2WgjsX
         WvyvAQM+CPOT1PCtsUyLpFeqNaQtPHfgfUBBpyhZzxY2+HKb6PiAZvurmv3ttMKpfiPQ
         UaCdWPZc2rhBUV31MItR1Re7vwhOgAurvWm9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751173; x=1741355973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+pSrbZB3kmNbwh95tcRi7cNkyGyn2cxWbS+iSeZcsA=;
        b=tSTRuy6pT8bi/8X9MC+EicEIibwCO5ubdFSV4HRneEWEqCr5ADclx0nplecnLyu7DE
         c8z+Gu+EvWwWHN8lfu5jp3IhHDC1b7fKcKXdi85PdWQlSnl9kMt1/gJk41LA0+EQzIfH
         RwQPeXZBVCuHUQ0FQ2fN4LvA/YvLylod6nI4iiSThZ7s48G2nMlo70S+GG5rWCo8t+6R
         KPQa4JZg9CYIN2SG/tEyq8RL1CR2hlTYWfdYUdp0jED+DZvovYr7L0tFO3gYo3hb2MW6
         9fw7qbsswe06hDSQ6E0NYGlGGQS8ZmP94yzlWvTidU/N82ebUUUpVSilB13e+uFmpQts
         vOUw==
X-Gm-Message-State: AOJu0YyXbN4+qNSwWzsFru0bj8MLe/+PBSOAm0hWa5hr69vvJTvpFtBz
	TPC7oc/iewLv2/ZN49dMqAWkWIoPtl9HOVQ3r4U9baSnYBvAYHL97dfTQTZyRIee7as0YimXvWp
	E
X-Gm-Gg: ASbGncudoLQ4nAmqw2mAKmvpVb3Pbi/DJdVX0L65m9Wn5kKllvRlGL/aByRPuaBUJ5/
	x8ghCpXdK1wFXWsutMtJ+T+ZXrAa+zMhtEEcBVvFLkyOB1/vlOQqmz9letquk833UBVnKT7mDit
	zWREM5agHx6SxWZ5X9wmtYafzdll0HObH0SB0hYDYzzY55l3/fnIO4qBkRNyE9AEs8/U1jipKC4
	zVaUO2JTlY7TnXWGWBq5TKKac/dRqCXyepOhGWY0RpmioagG9OJ6BfSUuNMDyMY79YVhKWi2w49
	NRLlIgDUZpYL+Rh4E8V3IUsk9J6yN7A=
X-Google-Smtp-Source: AGHT+IGfPwo0JAZMfo85OW2ngRKEr0sdSwXgF7nh1Xl4uA7gVxD6BxbEbR7QKy2c96hbuudfN7uU8Q==
X-Received: by 2002:a17:907:9482:b0:abf:377:9c62 with SMTP id a640c23a62f3a-abf2655b36fmr328271866b.24.1740751172763;
        Fri, 28 Feb 2025 05:59:32 -0800 (PST)
Date: Fri, 28 Feb 2025 14:59:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jiqian Chen <Jiqian.Chen@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] tools/ctrl: Silence missing GSI in
 xc_pcidev_get_gsi()
Message-ID: <Z8HBQyVHtQaGtc6K@macbook.local>
References: <20250226201022.42447-1-jason.andryuk@amd.com>
 <20250226201022.42447-2-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226201022.42447-2-jason.andryuk@amd.com>

On Wed, Feb 26, 2025 at 03:10:21PM -0500, Jason Andryuk wrote:
> It is valid for a PCI device to not have a legacy IRQ.  In that case, do
> not print an error to keep the lgs clean.
                                 ^ logs?
> 
> This relies on pciback being updated to return -ENOENT for a missing
> GSI.
> 
> Fixes: b93e5981d258 ("tools: Add new function to get gsi from dev")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  tools/libs/ctrl/xc_linux.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
> index 92591e49a1..c18f09392f 100644
> --- a/tools/libs/ctrl/xc_linux.c
> +++ b/tools/libs/ctrl/xc_linux.c
> @@ -78,7 +78,8 @@ int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
>                  IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
>  
>      if (ret < 0) {
> -        PERROR("Failed to get gsi from dev");
> +        if (errno != ENOENT)
> +            PERROR("Failed to get gsi from dev");

Nit: isn't the style of xc_pcidev_get_gsi() wrong?  From what I see in
this same file and all other files in libs/ctrl it should use the
hypervisor coding style.

Thanks, Roger.

