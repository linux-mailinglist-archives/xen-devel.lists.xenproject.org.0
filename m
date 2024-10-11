Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3599A444
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 14:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817041.1231147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFCO-0005RK-Ax; Fri, 11 Oct 2024 12:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817041.1231147; Fri, 11 Oct 2024 12:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFCO-0005Op-7r; Fri, 11 Oct 2024 12:56:52 +0000
Received: by outflank-mailman (input) for mailman id 817041;
 Fri, 11 Oct 2024 12:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZOt=RH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1szFCM-00054s-Hm
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 12:56:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4727db0e-87d0-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 14:56:49 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c8af23a4fcso2594138a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 05:56:48 -0700 (PDT)
Received: from CSGPROD108744 ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93711bc1bsm1911735a12.23.2024.10.11.05.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 05:56:48 -0700 (PDT)
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
X-Inumbo-ID: 4727db0e-87d0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728651408; x=1729256208; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFfl8TBLL4YoWstkWMP+nF9hc3H20+6374dsV4djux0=;
        b=FnT7xRR64+5KExXiHB6664nVOvTICzEZYDenYdq3ZV504ILt1yaRHlHIMyCOCBYhmc
         Red1bBIK2ib1zM9b9itDM7xsiz5arAMzfUM3QMaWvNLQCjHX67XggmRTOa2fW04/1TaM
         GOvw2L7FI1FNw237suasbjpW/XAKbi80MGOSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651408; x=1729256208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFfl8TBLL4YoWstkWMP+nF9hc3H20+6374dsV4djux0=;
        b=vtdfgWbYsrzWdKpjrK9DRuf+C1baVGRSiSShlJNYM8EWG+3kldwWvbTVIUwkdnr88Q
         FmUqN8dfIypMI42nuGzwZcFViEQrlaho784SOb82A7F1lckrF6i6IipppVR+i35BhofG
         j5tQI0gWNmtWFHmwEZ/KM5c3UgMkHmJp7PTnUpdVLlBrUGLipf0YiHt3XN4x2aqdExsr
         TTCSHhh/fH2xqDzSvVrfZLpfKZPZpzUG+edHsGboe/AfnvaS3EyJBW6ajKcy1h9duFjQ
         JBKBa4tpM6Z7PjLxzo3T8DmGolfO59nx0MiYP3gBbI9HkLbRypn8GYEsFBMgvXRJRc4/
         yk/g==
X-Gm-Message-State: AOJu0YxNXJUSn2admy+wssTAbz423/NNAMdwytEcaL4GgbadxAXHrIc3
	EhCH3HqPARnhSwoeIvr8ET6irV0Y5AhTabw2f50v+YexGjCqPdbBJFxzCXlqRz8=
X-Google-Smtp-Source: AGHT+IEMXiFFhjmwoDAtt7sDJkNr2qAe62wkKXMaryNPni4dESKVsePAUEWGnK3SSNaMCA8zTIUgbA==
X-Received: by 2002:a05:6402:280d:b0:5c8:85a1:a12f with SMTP id 4fb4d7f45d1cf-5c948d79a60mr1473416a12.33.1728651408421;
        Fri, 11 Oct 2024 05:56:48 -0700 (PDT)
Date: Fri, 11 Oct 2024 13:56:46 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
Message-ID: <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-6-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011085244.432368-6-frediano.ziglio@cloud.com>

On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/reloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> index e50e161b27..e725cfb6eb 100644
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -65,7 +65,7 @@ typedef struct memctx {
>      /*
>       * Simple bump allocator.
>       *
> -     * It starts from the base of the trampoline and allocates downwards.
> +     * It starts on top of space reserved for the trampoline and allocates downwards.

nit: Not sure this is much clearer. The trampoline is not a stack (and even if
it was, I personally find "top" and "bottom" quite ambiguous when it grows
backwards), so calling top to its lowest address seems more confusing than not.

If anything clarification ought to go in the which direction it takes. Leaving
"base" instead of "top" and replacing "downwards" by "backwards" to make it
crystal clear that it's a pointer that starts where the trampoline starts, but
moves in the opposite direction.

My .02 anyway.

>       */
>      uint32_t ptr;
>  } memctx;
> -- 
> 2.34.1
> 
> 

Cheers,
Alejandro

