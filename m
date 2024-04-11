Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9018A1EB9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704152.1100344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzNV-0004Go-TI; Thu, 11 Apr 2024 18:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704152.1100344; Thu, 11 Apr 2024 18:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzNV-0004Ep-Pc; Thu, 11 Apr 2024 18:42:29 +0000
Received: by outflank-mailman (input) for mailman id 704152;
 Thu, 11 Apr 2024 18:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruzNU-0004Ej-IQ
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:42:28 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e829e4b-f833-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 20:42:27 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d727074eso217513e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 11:42:27 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a8-20020a05600c348800b00417bc4820acsm3198806wmq.0.2024.04.11.11.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 11:42:25 -0700 (PDT)
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
X-Inumbo-ID: 3e829e4b-f833-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712860946; x=1713465746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WwIN2CQdQkp0fXwawdET2VP2E5y1MwZbc1XGcTTlqlg=;
        b=dirik6cBqg7UimcyomcJKz2V21mN386fL1yFJ5iKYB7jckttO9ZxzplJbT2NdSd696
         6H1sOyZScFyrG9zUUDteiyCAkEKf8BdsZ2TfDRC30pSrk2bPY3KQEDVs7dNaphENKdeG
         akYKNCLfHNP8R3BrlSK4uHgNZAjq4Xw37ZriA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712860946; x=1713465746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwIN2CQdQkp0fXwawdET2VP2E5y1MwZbc1XGcTTlqlg=;
        b=IPn7wFi1v9UEab8zjWk74EP6Y2lE9Fu9vAPBJIkffqUscRiVddwGfTm3QZZ6lXI2pl
         8cO9Efxza5YU906bkR+i8DZKSVEXDXCBnR3yOxnbd50q4xuwW8EDHFhb/PB62veiNcdc
         S4PXNOIHNBNIOnS/skYuD9405ZPKKeegRB2vYI6hN6s1oew06doyeW6JHHVH0T2kVQ1X
         8pmtPjFjXQglc5U4cgiHYznCiGThA8mpwnbBA6u3x1MGSJNRNhy1Ew2ZICczP2NixUA5
         /KJlZAuk8xzil90w/d824elaTK6l0WTubH7D1/kxHeMwEt7hnqb9/RaNg0MvbAb/LBEm
         vetg==
X-Forwarded-Encrypted: i=1; AJvYcCVQAmPy0aZUs+JAXEdhyFGcn4yjDf98iPmZGKRywGGZe/boOcHrMIw3/0ahrUceKabuZYV45TJCBqhoPf/Doqlnidm2F5Jyp8SXG0OGbek=
X-Gm-Message-State: AOJu0YwNLXdr5WW1aKC6m7CRt/zWEt9aZkRRvsncOStwiBkVcHaWaFwU
	4tkSSkiY0PvnFPAqcxIzXgTT6bzLKUbncqjl/zSKKvaWGIyxP3KfCIRmAK0+osY=
X-Google-Smtp-Source: AGHT+IGpb1qrkpo0o+xj09e/VqrHcWWrbzmWq3G0vPrqn2sF1ZCXQI9qE2LIpEU84yV6fNwcNiBd3g==
X-Received: by 2002:a05:6512:4c7:b0:516:d219:377c with SMTP id w7-20020a05651204c700b00516d219377cmr400759lfq.69.1712860946532;
        Thu, 11 Apr 2024 11:42:26 -0700 (PDT)
Message-ID: <db0f49d5-ea9e-4c62-b7ac-c856656b1e29@citrix.com>
Date: Thu, 11 Apr 2024 19:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Implemented Amd Secure Processor device driver
To: Andrei Semenov <andrei.semenov@vates.fr>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
 <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2024 4:36 pm, Andrei Semenov wrote:
> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
> ---
>  xen/arch/x86/include/asm/psp-sev.h | 655 +++++++++++++++++++++++
>  xen/drivers/Kconfig                |   2 +
>  xen/drivers/Makefile               |   1 +
>  xen/drivers/crypto/Kconfig         |  10 +
>  xen/drivers/crypto/Makefile        |   1 +
>  xen/drivers/crypto/asp.c           | 808 +++++++++++++++++++++++++++++
>  xen/include/xen/types.h            |   2 +-
>  7 files changed, 1478 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/x86/include/asm/psp-sev.h
>  create mode 100644 xen/drivers/crypto/Kconfig
>  create mode 100644 xen/drivers/crypto/Makefile
>  create mode 100644 xen/drivers/crypto/asp.c

I'm not going to dive into all of this, but give some high level
feedback to start with.

CCP is driver/crypto in Linux for historical reasons, but is it really
right here?  We can pick whatever we think is suitable.

psp-sev.h looks like it's only the MMIO protocol to the ASP, and that it
shouldn't need including anywhere else?  If so, we're trying to move
those header files to be local to the asp.c dir.


Can you discuss this comment:
>     CET shadow stack: adapt #CP handler???

some more.  What's going on?


> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 449947b353..f7599845fd 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -6,7 +6,7 @@
>  
>  /* Linux inherited types which are being phased out */
>  typedef int8_t s8;
> -typedef uint8_t u8;
> +typedef uint8_t u8, __u8;
>  typedef int16_t s16;
>  typedef uint16_t u16, __u16;
>  typedef int32_t s32;

The comment is here for a reason, so reviewers don't accept hunks like this.

psp-sev.h should be written using normal C99 integer types please.

~Andrew

