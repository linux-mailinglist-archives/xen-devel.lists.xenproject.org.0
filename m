Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC008D2216
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 18:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731255.1136676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC08v-0002AZ-9R; Tue, 28 May 2024 16:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731255.1136676; Tue, 28 May 2024 16:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC08v-00028W-6b; Tue, 28 May 2024 16:57:45 +0000
Received: by outflank-mailman (input) for mailman id 731255;
 Tue, 28 May 2024 16:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sC08t-00028Q-Nt
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 16:57:43 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64fde130-1d13-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 18:57:41 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6ab8e0c42d3so4820976d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 09:57:41 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac070c2edfsm45583876d6.23.2024.05.28.09.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 09:57:39 -0700 (PDT)
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
X-Inumbo-ID: 64fde130-1d13-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716915460; x=1717520260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/eHTXTVwEYNnZ/xW+SMGR390e6jeab4vsoSzjxmcj30=;
        b=TnvehRktMzrLzd9q7DzUKwykVtAaphzyY1H0/67rk2yU4TxD8r/hpDmKSkBiUZZ8Je
         jtxQMf/ygX38ta/l43wBbE+T7VcTVeMLGpxPrEvnCHbCC8wZAi7rLZNTEiPIFnn1nEEE
         xhG9qlHwEaMXjUdpko9C1y2u/5XVLjV8HT0R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716915460; x=1717520260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eHTXTVwEYNnZ/xW+SMGR390e6jeab4vsoSzjxmcj30=;
        b=W1rGtGfgDz1lbpTZQGbVg5aAWeJHwPxbDNbKXKct2nO54XHW6K50DdSAzBeTPqpVn6
         Nbp/NRJl/trN778da1CUDvxmcQhZY0bv3LlciOojSrBk4WtSy880v+qVrvo2OitFFFhh
         jMlfljDM8R0oHRxfsOREQjzoaENVpWC1z1/pcWJLdAILLhERQPtKXl/mWcaLRlIll1RU
         HH5UCDkMPYYIkmtqv9bHeC6ZhG3Prw5ZcjDXHUd5aYCpeeMW5IUczBDsx7zUIK9vHPfK
         4EK7qada80V8PkJSX5uGSfB1yxIvxOsGLJsnRmofu5YruV47uJNp/TrBMilTgw1Wb1EH
         c4lA==
X-Forwarded-Encrypted: i=1; AJvYcCVPEvalzv3ro+IbotWVQjw/0U+MlZwkz3Tm1KoyWkQRZPdfTg8tH4Col5EALJxP8Hv+3XIA3PRz2fuSuAbHUX6tENtXvb8wVRAdNxexKeg=
X-Gm-Message-State: AOJu0YzYqOhFu59yVNMKbnn9/BS1PhaPGkisoQ7HYv1bD5yluw6gv3UU
	cQCuHGBkDQ5MLC8sqCjZDRO+YIjWZghiA39mXqqSFctciaMguUhbaRdfbO9a63RFYUCeX8jTb62
	d2d8=
X-Google-Smtp-Source: AGHT+IHceOzp/InMKPF77JJNvFDPBrbiW12Y92Q9lwTChgipJzCd8FoD3DHwVPePaLXl4/TARNW0uw==
X-Received: by 2002:a05:6214:3281:b0:6aa:12cc:5adb with SMTP id 6a1803df08f44-6abcd0dee8dmr129085676d6.33.1716915460082;
        Tue, 28 May 2024 09:57:40 -0700 (PDT)
Message-ID: <95c38b73-0f37-4077-aede-8b5b6fce3fa7@citrix.com>
Date: Tue, 28 May 2024 17:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/ucode: refactor xen-ucode to utilize getopt
To: Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
 <20240528152943.3915760-3-fouad.hilly@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240528152943.3915760-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2024 4:29 pm, Fouad Hilly wrote:
> Use getopt_long() to handle command line arguments.
> Introduce ext_err for common exit with errors.
> xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2

Importantly, not.  That's deferred until the next patch.

> Introducing usage() to handle usage\help messages in a common block.
> show_curr_cpu is printed to stdout only.
>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
> [v4]
> 1- Merge three patches into one.
> 2- usage() to print messages to the correct stream.
> 3- Update commit message and description.
> ---
>  tools/misc/xen-ucode.c | 51 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 12 deletions(-)
>
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 390969db3d1c..6f9dd2a7e431 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -11,12 +11,23 @@
>  #include <sys/stat.h>
>  #include <fcntl.h>
>  #include <xenctrl.h>
> +#include <getopt.h>
>  
>  static xc_interface *xch;
>  
>  static const char intel_id[] = "GenuineIntel";
>  static const char   amd_id[] = "AuthenticAMD";
>  
> +static void usage(FILE *stream, const char *name)
> +{
> +    fprintf(stream, "%s: Xen microcode updating tool\n"
> +           "Usage: %s [microcode file] [options]\n"

Options are typically expressed first when writing this.

> +           "options:\n"
> +           "  -h, --help            display this help and exit\n"
> +           "  -s, --show-cpu-info   show CPU information and exit\n",

The "and exit" is pointless to state like this.

> +           name, name);

Alignment is out by one column here.

Also, previously, usage() was always followed by show_curr_cpu(). 
That's still easy to retain by reordering the two static functions.

> +}
> +
>  static void show_curr_cpu(FILE *f)
>  {
>      int ret;
> @@ -77,6 +88,13 @@ int main(int argc, char *argv[])
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

Typically we prefer static variables before automatic variables.  This
block can just be repositioned.

>  
>      xch = xc_interface_open(NULL, NULL, 0);
>      if ( xch == NULL )
> @@ -86,22 +104,25 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc < 2 )
> +    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
>      {
> -        fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
> -        show_curr_cpu(stderr);
> -        exit(2);
> +        switch (opt)
> +        {
> +        case 'h':
> +            usage(stdout, argv[0]);
> +            exit(EXIT_SUCCESS);

Blank line here, ...

> +        case 's':
> +            show_curr_cpu(stdout);
> +            exit(EXIT_SUCCESS);

... and here.

> +        default:
> +            goto ext_err;
> +        }
>      }
>  
> -    if ( !strcmp(argv[1], "show-cpu-info") )
> -    {
> -        show_curr_cpu(stdout);
> -        return 0;
> -    }
> +    if ( optind == argc )
> +        goto ext_err;

This is a change in API, because now "show-cpu-info" needs to take a --
to be interpreted.

I suspect we want:

    if ( optind == argc )
        goto ext_err;

    /* For backwards compatibility to the pre-getopt() cmdline handling */
    if ( !strcmp(argv[optind], "show-cpu-info") )
    {
        show_curr_cpu(stdout);
        return 0;
    }

to retain compatibility.  (Also, this means you won't have the code
rejected by XenRT when this gets added to Xen.)

All of this I can fix on commit, but there's quite a lot in the way of
changes.

~Andrew

