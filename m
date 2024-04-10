Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6889F8E9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 15:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703303.1098910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYPo-0003Jp-Ls; Wed, 10 Apr 2024 13:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703303.1098910; Wed, 10 Apr 2024 13:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYPo-0003HT-Iq; Wed, 10 Apr 2024 13:55:04 +0000
Received: by outflank-mailman (input) for mailman id 703303;
 Wed, 10 Apr 2024 13:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Wol=LP=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruYPm-0003FI-UZ
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 13:55:02 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec56e5cf-f741-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 15:55:00 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so10552475e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 06:55:00 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b00416c160ff88sm2378404wmq.1.2024.04.10.06.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 06:54:59 -0700 (PDT)
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
X-Inumbo-ID: ec56e5cf-f741-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712757300; x=1713362100; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZIA6m6jMVARV50mGP6l13RB67dMJdaB5b9QrDrXt7o=;
        b=LIlgPCobYiWpNEPQiuT5rClbLe1SUtMzCVe3CrYrNbZGv8phiuqUkFnk2O/NVYVhgG
         K2yn6Sno/BZQWCCq3O8RflCUZoznk2Y/LOX7vGX1gpULz3/ukiQjKGq30sJ6CBNsKG1e
         b9FsET8t8lZYM20uNmM7RxxaTHxiGTEu8CCTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757300; x=1713362100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZIA6m6jMVARV50mGP6l13RB67dMJdaB5b9QrDrXt7o=;
        b=F3zgA7XVYjy09ZwItN1T5i18TKB8lD7L6R2STre+aoMMw+pk95ktdIiGxU6zhy1wdT
         DrokjZfIWxgbKSg14Z0cX60UbCq0HR54r32wLC2iAQFoy2g2iiRjA72eYWtjJxTBOKs6
         6Jpxe9LHdbAzhjkfmNnj+1ouV8M7RsGgPV5Lkj9rGDnDSjKU3ygvIuJvMfvEcs8eDhyl
         jXTe1rE/vRD9jb7ga9g7SAzaToHcnac/OMEelk0eh9qR0Skxf5wfrlEr9kSMafSDdrT0
         h/yRNS9A6WH6Uy/slTIVCCt6DXyUkKUwDxfF62vCsG+lWsQf7VGg/X+vWXrDGbbsWF2z
         JZvg==
X-Gm-Message-State: AOJu0YxO92D39kCv+laVJgcI+9YEl/zccB5PSIY8Cm5d0Q74amDbZNjX
	Ldx6l1BCM8LUzvhuMt1tahURz3uJrPEzjnRDYmbV5en+FtyrXP6A468xu+cepQcujjnCYPZ/9uz
	v
X-Google-Smtp-Source: AGHT+IGt1CFAk0TFtOPyjYyKU6ONOS5iIserIMQY/YztpyF8wmk5CCy3FFakDBG0xwuib8jkB42nAQ==
X-Received: by 2002:a05:600c:474e:b0:416:3deb:e3ef with SMTP id w14-20020a05600c474e00b004163debe3efmr2364194wmo.1.1712757300091;
        Wed, 10 Apr 2024 06:55:00 -0700 (PDT)
Date: Wed, 10 Apr 2024 14:54:58 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/5] x86: Use getopt to handle command line args
Message-ID: <d5928474-c6ce-40d4-a7f2-ab7d46730891@perard>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-5-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405121128.260493-5-fouad.hilly@cloud.com>

On Fri, Apr 05, 2024 at 01:11:27PM +0100, Fouad Hilly wrote:
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 1edcebfb9f9c..9bde991c5df5 100644
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
> @@ -20,7 +21,10 @@ static const char   amd_id[] = "AuthenticAMD";
>  static void usage(const char *name)
>  {
>      printf("%s: Xen microcode updating tool\n"
> -            "Usage: %s [<microcode file> | show-cpu-info]\n"
> +            "Usage: %s [<microcode file> | --show-cpu-info]\n"

This look like a change worth mentioning to users, can we add something
in the CHANGELOG to say "show-cpu-info" is no longer an option and
users/admin should use "--show-cpu-info" instead?

> +            "\n"
> +            "  -h, --help            display this help and exit\n"
> +            "  -s, --show-cpu-info   show CPU information and exit\n"
>              "\n"
>              , name, name);
>  }
> @@ -82,9 +86,16 @@ static void show_curr_cpu(FILE *f)
>  int main(int argc, char *argv[])
>  {
>      int fd, ret;
> -    char *filename, *buf;
> +    char *filename = NULL, *buf;
>      size_t len;
>      struct stat st;
> +    int opt;
> +
> +    const static struct option options[] = {
> +        {"help", no_argument, NULL, 'h'},
> +        {"show-cpu-info", no_argument, NULL, 's'},
> +        {NULL, no_argument, NULL, 0}
> +    };
>  
>      xch = xc_interface_open(NULL, NULL, 0);
>      if ( xch == NULL )
> @@ -94,20 +105,33 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc < 2 )
> +    if ( argc != 2 )

This is overly restrictive, and doesn't need to be, especially when this
patch introduces the use of getopt_long().

> +        goto ext_err;
> +
> +    while ( (opt = getopt_long(argc, argv, "hs:", options, NULL)) != -1 )

`-s` requires an argument but `--show-cpu-info`, looks there's an extra
':' in the `optstring`, it should read "hs", not "hs:".

>      {
> -        usage(argv[0]);
> -        show_curr_cpu(stderr);
> -        exit(2);
> +        switch (opt)
> +        {
> +            case 'h':
> +                usage(argv[0]);
> +                exit(EXIT_SUCCESS);
> +            case 's':
> +                if ( argc > 2 )

Why is `-s` only allowed alone? What if want to include some other
option like "--json" to print the cpu-info in a different format?

I think one way to deal with this would be to record the fact that we
want to display the cpu information, and after the getopt_long() loop,
check that they are no more arguments. (Check out `optind` in the man page)

> +                    goto ext_err;
> +                show_curr_cpu(stdout);
> +                exit(EXIT_SUCCESS);
> +            default:
> +                goto ext_err;
> +        }
>      }
>  
> -    if ( !strcmp(argv[1], "show-cpu-info") )
> +    filename = argv[1];



> +    if ( filename == NULL )
>      {
> -        show_curr_cpu(stdout);
> -        return 0;
> +        printf("File name error\n");
> +        goto ext_err;
>      }
>  
> -    filename = argv[1];
>      fd = open(filename, O_RDONLY);
>      if ( fd < 0 )
>      {
> @@ -149,4 +173,9 @@ int main(int argc, char *argv[])
>      close(fd);
>  
>      return 0;
> +
> +ext_err:
> +    usage(argv[0]);
> +    show_curr_cpu(stderr);

Why is show_curr_cpu() called on an error path?

> +    exit(STDERR_FILENO);

STDERR_FILENO isn't an exit code, it's a file descriptor.


Thanks,

-- 
Anthony PERARD

