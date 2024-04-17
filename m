Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B808A88E8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 18:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707658.1105767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx8C4-0006fi-8Y; Wed, 17 Apr 2024 16:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707658.1105767; Wed, 17 Apr 2024 16:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx8C4-0006dA-5m; Wed, 17 Apr 2024 16:31:32 +0000
Received: by outflank-mailman (input) for mailman id 707658;
 Wed, 17 Apr 2024 16:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f8dp=LW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rx8C2-0006d4-VG
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 16:31:30 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c38763-fcd7-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 18:31:28 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-78f05aec21cso32997985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 09:31:28 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05620a244d00b0078ed5316f96sm5925584qkn.6.2024.04.17.09.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 09:31:27 -0700 (PDT)
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
X-Inumbo-ID: f0c38763-fcd7-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713371488; x=1713976288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=38be+M3cpELmqT7R1wOxJRnFHrXUQichlNZQ4Ydt7RQ=;
        b=liCS6KTgXQyA2n+1VBbf1DU7ycyjkXZFbCEvibDlN5ZkzZqmd9pDpsFWT5MyTFUfGV
         ZWZkG4KOWftzFMywhrEcDrRMqIvr/hTMIuJRhKf6nliiqHcTsfX21ttEiPR0SproVvVM
         AWBVWBpTp+2hTRYX5dtrrUQZPbEiCIBhaJhHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713371488; x=1713976288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38be+M3cpELmqT7R1wOxJRnFHrXUQichlNZQ4Ydt7RQ=;
        b=VLz5OUr0BuYSqPkBK63aBQ21yE1ZYPkD8pD5rleQdkclts6STuBUEFnLqJhg1E5blR
         B6tfwvTrVml7L90sD175fTZ7dHdANdUDBFpFkmHuMP6B9GYkdJMuv8V0zT/2OXD7Q/fQ
         5GfuEZudimkObN45nGIx6UgaiU7E4/5A7C41QO1BJQnRRa7b6I5hbiZJhA+eEOkz1k7W
         HAR7Yaa9HSYjLcsvgnfj6vIf3yaIdcLlzHj+Q29cyvX1k7wZ1xabhKcBXTKa9Gp2eRz1
         ElT6gmCbYl8CzpxARRlIMKEbdNRnzpKBqE/uPf+6N0hIPWgFIDhNY+ORM5FweiJhKktS
         Gi/g==
X-Forwarded-Encrypted: i=1; AJvYcCXQz9euYjSCLS7r2QojF0iIrfURo2CzUL/RW657rWXdcfWharUKR/Thjn4oUz+yZam+EgKM4Ybdgf3VdcxBcUbgJ/CYjX7g36wI0Px6aD8=
X-Gm-Message-State: AOJu0YwjJRBfU1YJds8icnMbUMLcTOHMLmLcUr5oMeRYye9wx3osW8g3
	YPvQ6gWRafwpOJ2+dhSGBdE1J0zfDq8fTZqCPqcEgvCnX2yivjFvwZ7/BpvovQg=
X-Google-Smtp-Source: AGHT+IGYh77g3PzBc96W6RRjpAV8s6nDCsb5Zc161rTm6KPffMIJbt1eMKqWhW8SuoklIwymgMooiA==
X-Received: by 2002:a05:620a:4494:b0:78d:767f:248 with SMTP id x20-20020a05620a449400b0078d767f0248mr21204037qkp.2.1713371487843;
        Wed, 17 Apr 2024 09:31:27 -0700 (PDT)
Message-ID: <94210509-fa5f-4682-ba0e-11ac7f852b46@citrix.com>
Date: Wed, 17 Apr 2024 17:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] gzip: drop huffman code table tracking
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
 <20240417143716.27189-7-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240417143716.27189-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/04/2024 3:37 pm, Daniel P. Smith wrote:
> The "tracking" bits does not appear to be used, so dropping from the code.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/common/gzip/inflate.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index c18ce20210b0..15bc187c2bbe 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -264,8 +264,6 @@ static const int dbits = 6;          /* bits in base distance lookup table */
>  #define BMAX 16         /* maximum bit length of any code (16 for explode) */
>  #define N_MAX 288       /* maximum number of codes in any set */
>  
> -static unsigned __initdata hufts;      /* track memory usage */
> -
>  /*
>   * Given a list of code lengths and a maximum table size, make a set of
>   * tables to decode that set of codes.  Return zero on success, one if
> @@ -445,7 +443,6 @@ static int __init huft_build(
>                      goto out;
>                  }
>                  DEBG1("4 ");
> -                hufts += z + 1;         /* track memory usage */
>                  *t = q + 1;             /* link to list for huft_free() */
>                  *(t = &(q->v.t)) = (struct huft *)NULL;
>                  u[h] = ++q;             /* table starts after link */
> @@ -1028,15 +1025,12 @@ static int __init inflate(struct gzip_state *s)
>      /* decompress until the last block */
>      h = 0;
>      do {
> -        hufts = 0;
>  #ifdef ARCH_HAS_DECOMP_WDOG
>          arch_decomp_wdog();
>  #endif
>          r = inflate_block(s, &e);
>          if (r)
>              return r;
> -        if (hufts > h)
> -            h = hufts;
>      } while (!e);

With 'hufts' removed, the local variable 'h' is now dead too.  It gets
read inside an #ifdef DEBUG, but as it's rendering a unqualified number
to stderr, it can also be deleted.

Specifically, I recommend this additional delta:

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 15bc187c2bbe..13015bb45f4a 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1015,7 +1015,6 @@ static int __init inflate(struct gzip_state *s)
 {
     int e;                /* last block flag */
     int r;                /* result code */
-    unsigned h;           /* maximum struct huft's malloc'ed */
 
     /* initialize window, bit buffer */
     wp = 0;
@@ -1023,7 +1022,6 @@ static int __init inflate(struct gzip_state *s)
     s->bb = 0;
 
     /* decompress until the last block */
-    h = 0;
     do {
 #ifdef ARCH_HAS_DECOMP_WDOG
         arch_decomp_wdog();
@@ -1045,9 +1043,6 @@ static int __init inflate(struct gzip_state *s)
     flush_output(s, wp);
 
     /* return success */
-#ifdef DEBUG
-    fprintf(stderr, "<%u> ", h);
-#endif /* DEBUG */
     return 0;
 }
 

which I'm happy to fold on commit.

~Andrew

