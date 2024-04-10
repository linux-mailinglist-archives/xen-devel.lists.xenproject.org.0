Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7686989F9A8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 16:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703337.1098960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYif-0000N7-Vy; Wed, 10 Apr 2024 14:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703337.1098960; Wed, 10 Apr 2024 14:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYif-0000LQ-TD; Wed, 10 Apr 2024 14:14:33 +0000
Received: by outflank-mailman (input) for mailman id 703337;
 Wed, 10 Apr 2024 14:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Wol=LP=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruYie-0007Wf-2b
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 14:14:32 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a58cfc53-f744-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 16:14:30 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-416b66163a9so16170865e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 07:14:30 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gw9-20020a05600c850900b00416c990d650sm2407573wmb.28.2024.04.10.07.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 07:14:29 -0700 (PDT)
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
X-Inumbo-ID: a58cfc53-f744-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712758470; x=1713363270; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gLLf+Fm+o8svuDRuzCFMJnpRBjJr/TBMx/w9Ap41cg=;
        b=aAlLY3nPLPDKPq0WvHafdPVknEyzG/kBEr+4/Uorq9CWOZMb7yXstVZob1cz+UrIAG
         yGSMZqM4bkrSQGM9zCAP/2FQQSIVirCqcrD5rzu8BMoeyd6+mQglb0DdVVNXL2RTmmXV
         UFjIRa3MF+MTDrUZNQZsKbj+M+2HXs3EuMTmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712758470; x=1713363270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gLLf+Fm+o8svuDRuzCFMJnpRBjJr/TBMx/w9Ap41cg=;
        b=VQImCHBd3M+c/3LBuUyrI9WvdLJzo8cXJh3uNT1k7cogr51oWQAR8v9sUErkE4xy9F
         RTk8hnGyQDOKcRW0E8YUN+43WCfuz+EUWNYROFMvu0rJXa1wLyYoZ7SeZtUvtVMxu9e6
         x1CiniouoKv4NffYlLxJuSFaKaIQSN8TFjs24e/zTDVWxiJJcfESukHfa/FVIruFzaap
         L4tNzYfM0I9fRQ1SIiP1iS19RTtU6le+j/K9+B7pYAKODPCnwKUbq6CiYgWKkKyIkHyE
         lLRd6Nh+CSzSjgPQblY31N3NRiagtwgzkaI5fqwRnjumYtJoKv3Pi2KsUfF8cHmd2nDt
         xR7A==
X-Gm-Message-State: AOJu0YwGVJEh8+8pn8TQt379YUXkfnmtdin9tWOOquEvB/XjZMD2dyuT
	ZiJ/qC6CP5H/jF16f5exHRuUSaTvLxVD2twhQKQPswhf6aCBSk8xa84xGELPCT4=
X-Google-Smtp-Source: AGHT+IH8cTlGH3r3zM5iW8UhLJYXUXZ3P9P9xzqU2P8YwP8SBQtgHdH2xkjsp9tkJIEVSkSlmv9GfQ==
X-Received: by 2002:a05:600c:4e94:b0:416:3416:205 with SMTP id f20-20020a05600c4e9400b0041634160205mr2562944wmq.23.1712758469852;
        Wed, 10 Apr 2024 07:14:29 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:14:29 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86: Add --force option to xen-ucode to override
 microcode version check
Message-ID: <f18c84db-a4d3-497b-adb7-67cc18b24973@perard>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-6-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405121128.260493-6-fouad.hilly@cloud.com>

On Fri, Apr 05, 2024 at 01:11:28PM +0100, Fouad Hilly wrote:
> diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> index 5ecdfa2c7934..edce45bc2a17 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -21,10 +23,11 @@ static const char   amd_id[] = "AuthenticAMD";
>  static void usage(const char *name)
>  {
>      printf("%s: Xen microcode updating tool\n"
> -            "Usage: %s [<microcode file> | --show-cpu-info]\n"
> +            "Usage: %s [[--force] <microcode file> | --show-cpu-info]\n"

How about "Usage: %s [OPTIONS..] [MICROCODE FILE]" ?

>              "\n"
>              "  -h, --help            display this help and exit\n"
>              "  -s, --show-cpu-info   show CPU information and exit\n"
> +            "  -f, --force           force to skip micorocde version check\n"

typo: microcode ;-)

>              "\n"
>              , name, name);
>  }
> @@ -89,11 +92,13 @@ int main(int argc, char *argv[])
>      char *filename = NULL, *buf;
>      size_t len;
>      struct stat st;
> +    uint32_t ucode_flag = XENPF_UCODE_FLAG_FORCE_NOT_SET;
>      int opt;
>  
>      const static struct option options[] = {
>          {"help", no_argument, NULL, 'h'},
>          {"show-cpu-info", no_argument, NULL, 's'},
> +        {"force", required_argument, NULL, 'f'},

This is weird, could you do without the argument?

It is weird because sometime "microcode file" is an argument of
"--force", sometime it is part of the rests of the options.

>          {NULL, no_argument, NULL, 0}
>      };
>  
> @@ -105,10 +110,10 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc != 2 )
> +    if ( argc < 2 || argc > 3)
>          goto ext_err;
>  
> -    while ( (opt = getopt_long(argc, argv, "hs:", options, NULL)) != -1 )
> +    while ( (opt = getopt_long(argc, argv, "hsf:", options, NULL)) != -1 )
>      {
>          switch (opt)
>          {
> @@ -120,12 +125,17 @@ int main(int argc, char *argv[])
>                      goto ext_err;
>                  show_curr_cpu(stdout);
>                  exit(EXIT_SUCCESS);
> +            case 'f':
> +            ucode_flag = XENPF_UCODE_FLAG_FORCE_SET;
> +                filename = optarg;
> +                break;
>              default:
>                  goto ext_err;
>          }
>      }
>  
> -    filename = argv[1];
> +    if ( argc == 2 )
> +        filename = argv[1];

Sometime we take filename from argv[1], sometime we don't? The logic is
going to be very confusing, takeout of context, only set `filename` from a
single place please.


Thanks,

-- 
Anthony PERARD

