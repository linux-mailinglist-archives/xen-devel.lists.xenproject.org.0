Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A61831BDA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 15:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668806.1041265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTlL-0008TW-VZ; Thu, 18 Jan 2024 14:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668806.1041265; Thu, 18 Jan 2024 14:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTlL-0008Qz-Sg; Thu, 18 Jan 2024 14:52:59 +0000
Received: by outflank-mailman (input) for mailman id 668806;
 Thu, 18 Jan 2024 14:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSQR=I4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQTlK-0008PG-Sv
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 14:52:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43c43954-b611-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 15:52:56 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e8ddebc71so10892545e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 06:52:56 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 a17-20020a05600c349100b0040e95e81e48sm927221wmq.14.2024.01.18.06.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 06:52:55 -0800 (PST)
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
X-Inumbo-ID: 43c43954-b611-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705589576; x=1706194376; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQQxwmLUjSGgvDZ2qLnWoQvdTd95faRl+5ilr40g8+Q=;
        b=MGi8PsYO9DNPqWl3HEm85aFiAydf2PNsXEON9clkYbGtDdgwSw0CsZY6tRsEfNEjKl
         WNW5/80KfTwcGB6Xp3bUXNyJfCklRghBV1UFtfk0UuXp37O1JBXPwW6fJ75AICvO9F1r
         G4t30WdzJhsNnfc/q4s6Fw405ZDxbmNXhnkko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705589576; x=1706194376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQQxwmLUjSGgvDZ2qLnWoQvdTd95faRl+5ilr40g8+Q=;
        b=pfkrlC+kFZpR0yBk23aAsGuCaTqxyjDyNsj9GL1ytwEGZ8QfmV3DtK9W6mqqP+YaAp
         SdhzcSsIDKZbdHpe2L5gShzGCjTuZrfBGI15ikEiS8/8oJ/IXclSL4YXrMPL0P806nUp
         7l9POTtFKLA51Odsj2CQY8PYJjcLWSz53SJcUHpD006WwOLbd4MMahvON+z91UmC58JC
         SIGjEGhmWVUDbLt+7xv11MAHN1yO0JO7M0GFj+CyXQFho8HbfVfo3Rsrl9int2sDLnw1
         BQ8dSlRuLkO3u2RxX8eGS7ytm8ruLQ8aqV23yvVaX7pT4kvhBEniT4B/Ew6qXvm2rcym
         1s8A==
X-Gm-Message-State: AOJu0YypVQZRSgLXWRk9LlEl6RT8XVuYr4IS1Y+sD2wWeokCx8hNS1Gv
	B7fOTXpGn/5yTQl4283/SZSzAwyM+9Ep3JLWzZV71WwxUT/k3GDbISg2FLn+dQo=
X-Google-Smtp-Source: AGHT+IEq5L5Df3ZCRyvyigKA42Yvak45Tt+41r+LgQZMtJu2zrv010GP5ASs4uYBwK14rFD192e92w==
X-Received: by 2002:a7b:cd0a:0:b0:40e:4a46:b82a with SMTP id f10-20020a7bcd0a000000b0040e4a46b82amr650188wmj.113.1705589575696;
        Thu, 18 Jan 2024 06:52:55 -0800 (PST)
Date: Thu, 18 Jan 2024 15:52:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 1/8] common: assembly entry point type/size annotations
Message-ID: <Zak7Rmbj_izBvcC4@macbook>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <38de36da-0822-4452-9594-8d50a5a77335@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38de36da-0822-4452-9594-8d50a5a77335@suse.com>

On Mon, Jan 15, 2024 at 03:34:05PM +0100, Jan Beulich wrote:
> Recent gas versions generate minimalistic Dwarf debug info for items
> annotated as functions and having their sizes specified [1]. Furthermore
> generating live patches wants items properly annotated. "Borrow" Arm's
> END() and (remotely) derive other annotation infrastructure from
> Linux'es, for all architectures to use.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
> +#endif
> +
> +#define SYM_ALIGN(align...) .balign align
> +
> +#define SYM_L_GLOBAL(name) .globl name
> +#define SYM_L_WEAK(name)   .weak name
> +#define SYM_L_LOCAL(name)  /* nothing */
> +
> +#define SYM_T_FUNC         STT_FUNC
> +#define SYM_T_DATA         STT_OBJECT
> +#define SYM_T_NONE         STT_NOTYPE
> +
> +#define SYM(name, typ, linkage, align...)         \
> +        .type name, SYM_T_ ## typ;                \
> +        SYM_L_ ## linkage(name);                  \
> +        SYM_ALIGN(align);                         \
> +        name:
> +
> +#define END(name) .size name, . - name
> +
> +#define FUNC(name, align...) \
> +        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
> +#define LABEL(name, align...) \
> +        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
> +#define DATA(name, align...) \
> +        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
> +
> +#define FUNC_LOCAL(name, align...) \
> +        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
> +#define LABEL_LOCAL(name, align...) \
> +        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)

One thing that I've noticed while reviewing further patches, the usage
of CODE_ALIGN and CODE_FILL in LABEL_LOCAL() means that CODE_FILL must
always be a nop, or else the assembler will put garbage while padding
the symbol, and hence the preceding code will no longer fallthrough
into the label?

Looking further, LABEL_LOCAL() is always used when there's no
fallthrough, but it's IMO not obvious from the description here.

Thanks, Roger.

