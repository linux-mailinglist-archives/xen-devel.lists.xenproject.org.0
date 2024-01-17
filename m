Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F4830BA4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 18:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668538.1040797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ9Jf-0000H2-FK; Wed, 17 Jan 2024 17:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668538.1040797; Wed, 17 Jan 2024 17:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ9Jf-0000Ep-BH; Wed, 17 Jan 2024 17:03:03 +0000
Received: by outflank-mailman (input) for mailman id 668538;
 Wed, 17 Jan 2024 17:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ9Je-0000Bp-4f
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 17:03:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c11bc6-b55a-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 18:03:00 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e8cc3b738so5779165e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 09:03:00 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 i16-20020a5d55d0000000b00337c7423b95sm280136wrw.61.2024.01.17.09.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 09:02:59 -0800 (PST)
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
X-Inumbo-ID: 44c11bc6-b55a-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705510979; x=1706115779; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvp026MHz3JkS6+UT/ZQDhxHa937cgigcAz8wghcck0=;
        b=Lgb49DtKr9RKN8JmMfpT1CC9GOtXN6cpzjkjYqC0lsafKk5P9il9s+AcEKJtZGsQKE
         1Sp8ApUz+uugi7DEuKZSXN/c/TEtyVz464Pp1WbKLYApT09G5DT2btI5woA75EA8nBPz
         ACIwnYOw63cCb9gYrsrPqONS3Qg9gNx2nZQOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705510979; x=1706115779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvp026MHz3JkS6+UT/ZQDhxHa937cgigcAz8wghcck0=;
        b=mdGde3i5XXEPAoaojf+0VeTfXexGpthRk1gf6YtzF0FGBvXl5Gg5L/1HCqOXL+ofbE
         KKIQDk+myny101kViYVrtUwW13LqBMX9pa8XKz2JUtlW3piL8lZkhSFkg/9HRpg+Ug03
         yF3djFTE8VRCgpIEEFryIr/PAiwfcLmsSWLSXzVosow8QooGlooYl0ONgw8phBhOQh64
         iLZsSJYG+F+6QpTe1sDP3n+GzRfxgzj/b5sHeI/jw0ps+BSCiZ9KPgQn8MLduPU/2zFw
         iWXKgp6kPScSVgmr0xs6GaqkZGuqhzZzPzdjp8cerSNW7j+N7Yoxta/NXmPHh4YG6E98
         U0SQ==
X-Gm-Message-State: AOJu0YxrEAK3yagdtG2ZoRsd7UJFfT4XZuS2bjFXBn/4W52vuSKUcMwu
	pUkv53DF/+2/6pBgPnRPjZ5qeuqjRgWpbw==
X-Google-Smtp-Source: AGHT+IGftehkKxIZ7xSzzAug4JJBDxAS3ii84iNehj++CNjxP/+3qQf7GcK16hPBCZRm/REfxNRfGg==
X-Received: by 2002:a05:600c:45ca:b0:40e:44af:8b1e with SMTP id s10-20020a05600c45ca00b0040e44af8b1emr5168435wmo.160.1705510979588;
        Wed, 17 Jan 2024 09:02:59 -0800 (PST)
Date: Wed, 17 Jan 2024 18:02:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 1/8] common: assembly entry point type/size annotations
Message-ID: <ZagIQkyR0SoScaAc@macbook>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <38de36da-0822-4452-9594-8d50a5a77335@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38de36da-0822-4452-9594-8d50a5a77335@suse.com>

On Mon, Jan 15, 2024 at 03:34:05PM +0100, Jan Beulich wrote:
> Recent gas versions generate minimalistic Dwarf debug info for items
> annotated as functions and having their sizes specified [1]. Furthermore
> generating live patches wants items properly annotated. "Borrow" Arm's
> END() and (remotely) derive other annotation infrastructure from
> Linux'es, for all architectures to use.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
> ---
> v5: Drop CODE_ALIGN fallback. s/algn/align/g.
> v3: New, generalized from earlier x86-only version. LAST() (now
>     LASTARG()) moved to macros.h.
> ---
> TBD: {CODE,DATA}_ALIGN are byte granular, such that a value of 0 can be
>      specified (in case this has some special meaning on an arch;
>      conceivably it could mean to use some kind of arch default). We may
>      not strictly need that, and hence we could also make these power-
>      of-2 values (using .p2align).
> 
> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
> still have ALIGN.

SYM_ALIGN seems fine for the purpose here.

> 
> Note further that FUNC()'s etc "align" parameter is intended to allow
> for only no or a single argument. If we wanted to also make the fill
> value customizable per call site, the constructs would need re-doing to
> some degree.
> 
> --- /dev/null
> +++ b/xen/include/xen/linkage.h
> @@ -0,0 +1,54 @@
> +#ifndef __LINKAGE_H__
> +#define __LINKAGE_H__
> +
> +#ifdef __ASSEMBLY__
> +
> +#include <xen/macros.h>
> +
> +/* CODE_ALIGN needs to be specified by every architecture. */
> +#ifndef CODE_FILL
> +# define CODE_FILL ~0
> +#endif
> +
> +#ifndef DATA_ALIGN
> +# define DATA_ALIGN 0
> +#endif
> +#ifndef DATA_FILL
> +# define DATA_FILL ~0

I find the fills a bit odd, compared to what we use now (nops for x86
IIRC).

Thanks, Roger.

