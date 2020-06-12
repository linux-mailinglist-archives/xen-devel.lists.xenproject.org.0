Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C31F7714
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhVc-0005VP-BL; Fri, 12 Jun 2020 11:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5ow=7Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjhVa-0005VA-8E
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:06:02 +0000
X-Inumbo-ID: b32a9052-ac9c-11ea-8496-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b32a9052-ac9c-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 11:06:01 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id x1so9670451ejd.8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=snziYwGaN8wiceNBMz7wJmdc/YjHgkwqTeoUraCt86Y=;
 b=oerEcU3yIuYxIwD3mDvcsL+KzrT7sai0TC54j6IenSO7z24f/et2ajSqYMgRo8PNTh
 3EwLPdQL3gVYxmGo8McAsdglsNBWOT9LPraPoxzmtBsi71GR3QWACry25rBQj9kC5Djr
 mFNf1ODpb+ktsTVVH0mt6RqT4gRnmeWvqQefi3el73nhsU5hR72SfWCRMx2+vGHb3w08
 961JfOKYQE8HI3bOaP2m4y59zX1Bir69Cqb6rZwhUkUssiHzTGKx6cNNA513g6aEZKDB
 woaNRBv3tJ3gxqXBcjlLIjSdxkSO52iaQs/TVzoHp3R4o+8uN6f9TPKMEBGToxJRDzcG
 Zyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=snziYwGaN8wiceNBMz7wJmdc/YjHgkwqTeoUraCt86Y=;
 b=axtW277DoWoNgJXZ3fmIQ5hGLmRb9y8Xtn2LZKe7U1q6sCKASs07y0Vn6wRM2vy54N
 EljfxQOmaDv4rsG9FzCCnMiidQP80ORqnWdm1VOI5RuUE4xF2vIhMh/NjWEkO8yiGtfh
 N/ncp+q7koeF6qVkjmskpdPyMTnvmQUdTe1V9KhZbsaFjMTb5mlfFg6BJsEYhwVYiapi
 o+UPxmWQ8iejsRL7gH3hT9DbRmhlVCXWBGQ6uQqJjOWhI0xFdgI9a7Ah68SlpRZHFYr4
 0Jd2ij65AGNr10Wm9bLLpDzvyjrx0GbBVWapQZ9+UY1c+oIMA6CUv+KaqfQKMAwQQCG7
 mzuQ==
X-Gm-Message-State: AOAM5333C3gejb7F4dPRday6gnlRtH7mgZpXe4vAVR5qHo4Qi+Fv5TKb
 WJauzhdgLuObqu88DZ9ABNM=
X-Google-Smtp-Source: ABdhPJybbeO4l3wHoQuTbi/8+MIE0sXGFTBJDCFA3Ubvml6WIbpH4sbPOJVTjtgCjnNaiMbzbEVw3w==
X-Received: by 2002:a17:906:470a:: with SMTP id
 y10mr13267678ejq.535.1591959960552; 
 Fri, 12 Jun 2020 04:06:00 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id u13sm3416468ejf.60.2020.06.12.04.05.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 04:05:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200612105519.18728-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200612105519.18728-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.14] tools/libxc: Drop config_transformed parameter
 from xc_cpuid_set()
Date: Fri, 12 Jun 2020 12:05:58 +0100
Message-ID: <000301d640a9$743c5510$5cb4ff30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJxpHaew1P/sNsDF5l3fu7RdB3IxKeeCdQQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 12 June 2020 11:55
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu
> <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH for-4.14] tools/libxc: Drop config_transformed parameter from xc_cpuid_set()
> 
> libxl is now the sole caller of xc_cpuid_set().  The config_transformed output
> is ignored, and this patch trivially highlights the resulting memory leak.
> 
> "transformed" config is now properly forwarded on migrate as part of the
> general VM state, so delete the transformation logic completely, rather than
> trying to adjust just libxl to avoid leaking memory.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> 
> For 4.14 for hopefully obvious reasons.
> 
> Ian: for backport to 4.13 and earlier, there are a number of options.  The
> reasoning we used to delete the other callers of xc_cpuid_set() is still
> valid, but probably not backport material.
> 
> OTOH, moding libxl_cpuid_set() (as it was back then) to loop over cpuid_res[]
> and free them all should work.
> ---
>  tools/libxc/include/xenctrl.h |  3 +--
>  tools/libxc/xc_cpuid_x86.c    | 25 +------------------------
>  tools/libxl/libxl_cpuid.c     |  3 +--
>  3 files changed, 3 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index f9e17ae424..113ddd935d 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1795,8 +1795,7 @@ int xc_domain_debug_control(xc_interface *xch,
>  int xc_cpuid_set(xc_interface *xch,
>                   uint32_t domid,
>                   const unsigned int *input,
> -                 const char **config,
> -                 char **config_transformed);
> +                 const char **config);
> 
>  /*
>   * Make adjustments to the CPUID settings for a domain.
> diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
> index 89d2ecdad2..b42edd6457 100644
> --- a/tools/libxc/xc_cpuid_x86.c
> +++ b/tools/libxc/xc_cpuid_x86.c
> @@ -279,7 +279,7 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
>   */
>  int xc_cpuid_set(
>      xc_interface *xch, uint32_t domid, const unsigned int *input,
> -    const char **config, char **config_transformed)
> +    const char **config)
>  {
>      int rc;
>      unsigned int i, j, regs[4] = {}, polregs[4] = {};
> @@ -288,9 +288,6 @@ int xc_cpuid_set(
>      unsigned int nr_leaves, policy_leaves, nr_msrs;
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> 
> -    for ( i = 0; i < 4; ++i )
> -        config_transformed[i] = NULL;
> -
>      if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
>           di.domid != domid )
>      {
> @@ -365,13 +362,6 @@ int xc_cpuid_set(
>              continue;
>          }
> 
> -        config_transformed[i] = calloc(33, 1); /* 32 bits, NUL terminator. */
> -        if ( config_transformed[i] == NULL )
> -        {
> -            rc = -ENOMEM;
> -            goto fail;
> -        }
> -
>          /*
>           * Notes for following this algorithm:
>           *
> @@ -399,11 +389,6 @@ int xc_cpuid_set(
>                  set_feature(31 - j, regs[i]);
>              else
>                  clear_feature(31 - j, regs[i]);
> -
> -            config_transformed[i][j] = config[i][j];
> -            /* All non 0/1 values get overwritten. */
> -            if ( (config[i][j] & ~1) != '0' )
> -                config_transformed[i][j] = '0' + val;
>          }
>      }
> 
> @@ -421,16 +406,8 @@ int xc_cpuid_set(
>      }
> 
>      /* Success! */
> -    goto out;
> 
>   fail:
> -    for ( i = 0; i < 4; i++ )
> -    {
> -        free(config_transformed[i]);
> -        config_transformed[i] = NULL;
> -    }
> -
> - out:
>      free(leaves);
> 
>      return rc;
> diff --git a/tools/libxl/libxl_cpuid.c b/tools/libxl/libxl_cpuid.c
> index 4e4852ddeb..796ec4f2d9 100644
> --- a/tools/libxl/libxl_cpuid.c
> +++ b/tools/libxl/libxl_cpuid.c
> @@ -421,7 +421,6 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
>  {
>      libxl_cpuid_policy_list cpuid = info->cpuid;
>      int i;
> -    char *cpuid_res[4];
>      bool pae = true;
> 
>      /*
> @@ -444,7 +443,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid,
> 
>      for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++)
>          xc_cpuid_set(ctx->xch, domid, cpuid[i].input,
> -                     (const char**)(cpuid[i].policy), cpuid_res);
> +                     (const char**)cpuid[i].policy);
>  }
> 
>  static const char *input_names[2] = { "leaf", "subleaf" };
> --
> 2.11.0



