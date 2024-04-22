Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF38AD378
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 19:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710180.1109274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxmG-0002qx-Sf; Mon, 22 Apr 2024 17:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710180.1109274; Mon, 22 Apr 2024 17:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxmG-0002pP-Po; Mon, 22 Apr 2024 17:48:28 +0000
Received: by outflank-mailman (input) for mailman id 710180;
 Mon, 22 Apr 2024 17:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryxmF-0002p4-9P
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:48:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 841d5c10-00d0-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 19:48:24 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3455ff1339dso3617003f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:48:24 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e32-20020a5d5960000000b0033ec9ddc638sm12596641wri.31.2024.04.22.10.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:48:23 -0700 (PDT)
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
X-Inumbo-ID: 841d5c10-00d0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713808104; x=1714412904; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G3L/NmElsyhmYgD3dp+mfLt4eHvN9kbaxLsAUWOU2kM=;
        b=QCi5N991vJaIGQe0f0ib+RQXcwTlJN2+maZaTIep6qtz80TnTM1xcPOhM5vjg7xwKy
         Xxskym06Dw77qW4ed1zAcNT9BoFOX8AcJcRClshluTHiw8N0IjV5TFBGeI4vATzTMMdv
         Dj/oDAjERqwrRjTvDHk5tInr+pVWhR9fFrZUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713808104; x=1714412904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3L/NmElsyhmYgD3dp+mfLt4eHvN9kbaxLsAUWOU2kM=;
        b=HyFcyFCx2DB+v1K1fNXfYOBKEuQcTU7iUfNzCHbwqOAJAUt6oRxSYsTSneOgXA2Bur
         BeUenTGr+Twa0jvnuDIzUw0L5hl8aVgIFc5vlpoIcL+lDMm1O95A5xiN7DxpHDj7YxFt
         bFJMKVEsg5yfJH3BZmVFWTzTMqz+WbBwCR8Ds2GVKOUdeaar3t+A4XbWWEQBc9EFqVPs
         j075R9X27wCaMnIY0CcpW+kh/3mWf9Y5n8ITyylOhjA0ZFNuFOK7XGVHf6320awgieLM
         VVgm6kCZ+aXyjdXYnPe3AQ0dYqdltkvSk7o0p9ji4mpLdy/FoyLVOX6h7dr43NsHdbtI
         /Hfg==
X-Gm-Message-State: AOJu0YyQitNhpnnjPxU64efZZGuEYrmxkh2csxGvLreCR4DfKM827ABA
	4qySWpRIqLNux1gbZX5Jf/FWPpYS3J15TpC9ayWhfWrbrWwT0r7+Jby8XglRXyQ=
X-Google-Smtp-Source: AGHT+IEf2kjNcx3rNjl8CT5xF39x1ZpWFEXUchaBArDqLwV/MuqnFmilOgkqTTllxXQaKS6icd2BBw==
X-Received: by 2002:a5d:6886:0:b0:34a:48a0:fa70 with SMTP id h6-20020a5d6886000000b0034a48a0fa70mr9294814wru.40.1713808103722;
        Mon, 22 Apr 2024 10:48:23 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:48:22 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/5] x86: Use getopt to handle command line args
Message-ID: <5ece784e-cc8c-4cbb-9ea3-a55f29fab1ac@perard>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-5-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416091546.11622-5-fouad.hilly@cloud.com>

On Tue, Apr 16, 2024 at 10:15:45AM +0100, Fouad Hilly wrote:
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 0c0b2337b4ea..e3c1943e3633 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -11,6 +11,7 @@
>  #include <sys/stat.h>
>  #include <fcntl.h>
>  #include <xenctrl.h>
> +#include <getopt.h>
>  
>  static xc_interface *xch;
>  
> @@ -22,7 +23,8 @@ static void usage(const char *name)
>      printf("%s: Xen microcode updating tool\n"
>             "Usage: %s [microcode file] [options]\n"
>             "Options:\n"
> -           "show-cou-info   show CPU information and exit\n",
> +           "  -h, --help            display this help and exit\n"
> +           "  -s, --show-cpu-info   show CPU information and exit\n",
>             name, name);
>  }
>  
> @@ -86,6 +88,13 @@ int main(int argc, char *argv[])
>      char *filename, *buf;
>      size_t len;
>      struct stat st;
> +    int opt;
> +
> +    static const struct option options[] = {
> +        {"help", no_argument, NULL, 'h'},
> +        {"show-cpu-info", no_argument, NULL, 's'},
> +        {NULL, no_argument, NULL, 0}
> +    };
>  
>      xch = xc_interface_open(NULL, NULL, 0);
>      if ( xch == NULL )
> @@ -95,19 +104,22 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc < 2 )
> -    {
> -        fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
> -        show_curr_cpu(stderr);
> -        exit(2);
> -    }
> +    if ( argc != 2 )
> +        goto ext_err;

Why only two arguments allowed? And why check `argc` before calling
getopt_long() ?


>  
> -    if ( !strcmp(argv[1], "show-cpu-info") )
> +    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
>      {
> -        show_curr_cpu(stdout);
> -        return 0;
> +        switch (opt)
> +        {
> +        case 'h':
> +            usage(argv[0]);
> +            exit(EXIT_SUCCESS);
> +        case 's':
> +            show_curr_cpu(stdout);
> +            exit(EXIT_SUCCESS);
> +        default:
> +            goto ext_err;
> +        }
>      }
>  
>      filename = argv[1];

So, after calling getopt_long(), the variable `optind` point to the next
argument that getopt_long() didn't recognize as an argument. It would be
a good time to start using it, and check that the are actually argument
left on the command line, even if in the current patch the only possible
outcome is that argv[1] has something that isn't an option.

> @@ -152,4 +164,11 @@ int main(int argc, char *argv[])
>      close(fd);
>  
>      return 0;
> +
> + ext_err:
> +    fprintf(stderr,
> +            "xen-ucode: Xen microcode updating tool\n"
> +            "Usage: %s [microcode file] [options]\n", argv[0]);

Isn't there a usage() function that we could use?

> +    show_curr_cpu(stderr);

Why call show_curr_cpu() on the error path?

> +    exit(STDERR_FILENO);

Still not an exit value.

Thanks,

-- 
Anthony PERARD

