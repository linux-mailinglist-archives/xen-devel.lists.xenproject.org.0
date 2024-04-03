Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FDB896EDA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700525.1093808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzik-0004VO-S1; Wed, 03 Apr 2024 12:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700525.1093808; Wed, 03 Apr 2024 12:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzik-0004Tr-PI; Wed, 03 Apr 2024 12:28:02 +0000
Received: by outflank-mailman (input) for mailman id 700525;
 Wed, 03 Apr 2024 12:28:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPGy=LI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rrzij-0004Tl-NR
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:28:01 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c2f52db-f1b5-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 14:28:00 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34373f95c27so1079242f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 05:28:00 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m3-20020adffa03000000b003432dcdb5d3sm17029236wrr.35.2024.04.03.05.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 05:27:59 -0700 (PDT)
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
X-Inumbo-ID: 9c2f52db-f1b5-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712147280; x=1712752080; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WAxZ+GfbMAjFr5Owm39HF59RqDhdQiLbL2mYjceALbg=;
        b=K+2mKNrklvawTA3EqrHJ3znXnBbkVoN9NogKt94Zn2xfuGWP+dqWIr/az3gT3BjO6M
         WFoI7rG8iHq6VzDOcPxN7jiO0n69rQlm4GJX/doMo7IZYZiYVJ26g4IGMYKqcVVf0VrY
         lnEgJ6yUBPZKHaLLZbkCVYF6Id/sVinQapkhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712147280; x=1712752080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAxZ+GfbMAjFr5Owm39HF59RqDhdQiLbL2mYjceALbg=;
        b=oIUdRKdn6WY4ne8YQr7yJc67Zyww4eCI9Wv2MMeKXeGuR6+95nMnfA/d8ABem+I3RR
         +Ad1jSnCHSMiS/Sb9rxMICk6phHZpENXJBRH5Oc+ngB45UBLa3z1ZNE1Qszt8zsyuLNp
         fKlZOBLmwYGJaApUq/+H4t8nafL+YfiIn+SmHC1Djz+dbNVOJznkJzNc/qDXwgnQIuV0
         n+AV6ejtSH31vkrAp5fC1u36uP2UGHK2ESY7ZD1PO7M5zYBM4Kg/zDguFmje3/F1XPDn
         4KTLYVBfASD6aOXMU2SpYwX9C0mLr3KISK8YPI+rKhyrMv1ERHFdbeyVVO5A+KPdMVgl
         Xrlg==
X-Gm-Message-State: AOJu0YwTUo72Iz+9tmbG3Hf8dArm4c5EeuomBsBYpiJTOviOFI8C3n95
	YQOhrR3lDlmfocN5B6DKlBCrNAdoMdNVyI8i7uqI8iVA+45As5UoMFtcjkCfmAU=
X-Google-Smtp-Source: AGHT+IG+Z8ojPz5QzhZ0J8s/dlm4jnwyzJiBPXHMTIowv3geRfF9br6IWym4BDXx0Pvv8B9LILTZ1A==
X-Received: by 2002:adf:ff8b:0:b0:33e:cf4d:c581 with SMTP id j11-20020adfff8b000000b0033ecf4dc581mr10294170wrr.41.1712147280291;
        Wed, 03 Apr 2024 05:28:00 -0700 (PDT)
Date: Wed, 3 Apr 2024 13:27:58 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 2/5] tools/init-xenstore-domain: Replace variable MB()
 usage
Message-ID: <3a701137-a0c5-4437-9461-f7a5063de1e6@perard>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-3-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325204515.250203-3-jason.andryuk@amd.com>

On Mon, Mar 25, 2024 at 04:45:12PM -0400, Jason Andryuk wrote:
> The local MB() & GB() macros will be replaced with a common
> implementation, but those only work with constant values.  Introduce a
> static inline mb_to_bytes() in place of the MB() macro to convert the
> variable values.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v4:
> New
> ---
>  tools/helpers/init-xenstore-domain.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index 1683438c5c..5405842dfe 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -20,7 +20,6 @@
>  #include "init-dom-json.h"
>  
>  #define LAPIC_BASE_ADDRESS  0xfee00000UL
> -#define MB(x)               ((uint64_t)x << 20)
>  #define GB(x)               ((uint64_t)x << 30)
>  
>  static uint32_t domid = ~0;
> @@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
>  static xentoollog_level minmsglevel = XTL_PROGRESS;
>  static void *logger;
>  
> +static inline uint64_t mb_to_bytes(int mem)
> +{
> +	return (uint64_t)mem << 20;
> +}
> +
>  static struct option options[] = {
>      { "kernel", 1, NULL, 'k' },
>      { "memory", 1, NULL, 'm' },
> @@ -76,8 +80,8 @@ static int build(xc_interface *xch)
>      int rv, xs_fd;
>      struct xc_dom_image *dom = NULL;
>      int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
> -    uint64_t mem_size = MB(memory);
> -    uint64_t max_size = MB(maxmem ? : memory);
> +    uint64_t mem_size = mb_to_bytes(memory);
> +    uint64_t max_size = mb_to_bytes(maxmem ? : memory);

Looks like this change actually fix a bug. When `maxmem` is set, we
would have "max_size = maxmem", otherwise, it would be 
"max_size = memory << 20"

The macro should have been written as
 #define MB(x)               ((uint64_t)(x) << 20)

This patch could be backported to 4.17 and later, with:
    Fixes: 134d53f57707 ("tools/init-xenstore-domain: fix memory map for PVH stubdom")

Anyway, this patch on it's own looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

