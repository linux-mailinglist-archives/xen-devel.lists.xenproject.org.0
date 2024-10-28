Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652EF9B2F9A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826426.1240668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OTe-0006DR-4d; Mon, 28 Oct 2024 12:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826426.1240668; Mon, 28 Oct 2024 12:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OTe-0006Bi-1W; Mon, 28 Oct 2024 12:04:06 +0000
Received: by outflank-mailman (input) for mailman id 826426;
 Mon, 28 Oct 2024 12:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5OTc-0006Bc-C8
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:04:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b95355c9-9524-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:04:03 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso4966380a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 05:04:03 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb62c14c4sm3116471a12.44.2024.10.28.05.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 05:04:02 -0700 (PDT)
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
X-Inumbo-ID: b95355c9-9524-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730117043; x=1730721843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BYGJQQKJW3V1Myv3BMAi7AnEWVSCsWC1Vq4yZjb50UM=;
        b=IapitQek4xw5j1Hj+JhZ51vTkEpBdk7rxiFUBtbWCPZgJR/tcKoAC8vIJPQDF/mvJ8
         fPzLOzl+3wsrgQK/fkL1YhAx53iffD/4OYjK+TtZySKXM24kYfLqv76EzJOR2w3H8Mh/
         iayzuM5kngPYHwZrhJyNp/Ee+SJ716zwllmk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730117043; x=1730721843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYGJQQKJW3V1Myv3BMAi7AnEWVSCsWC1Vq4yZjb50UM=;
        b=U8Yopn29eg4B1m8RB4VkviKumNTM2kDlt/c7zwe7WCprSkBTEpvo6fMKGMAw2lM5fI
         HUHEjvlRJA8i5vgf4NJDVlpneWkLSFeFxBuWH34Xl7/XPoBKdibOFavu5fLpK4A5tQsf
         OuzvIAjrFGoT9irnpDTLicgdbPkm4jnV7Aiux+oardK3SshU99jz87i0PDnEfoIjinbe
         8uVQ+gLFPYuJ/9JRj3GEVJksvI11M/VwvtjrXCWlU6dMxavsY+5L1lEQ9xVU9YVv2oZ8
         WjmVwNy9ca6qpFJ5X6lzAIhbBjqrazHJNW8gfOzynfnS09afRn+gRBSj6y8nhvdG64h9
         EH6A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/vlS3HyindJVSPz9pgox1nQiw27MNErPzYemN+wCK/tkHC1/F7n/ItHYjeqYW2w+e8h8cmACy90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjY3qQCk75JfBekHx6Q7QvGgumwHaIj7vgiJend7aHcp7TXawf
	cyGYqQwkqItiX83sddXUkY6J0gGBEqjN0zQDdaemjcNN/Lwaf3wpUfqDxyy1t84=
X-Google-Smtp-Source: AGHT+IHCh01kmogZbd2xD0zcSRfc887nNpmdozP1Ufh4F/boo5CAPeWXf0zebEWZiHyhRFfTi9NdVA==
X-Received: by 2002:a05:6402:5203:b0:5c2:6d16:ad5e with SMTP id 4fb4d7f45d1cf-5cbbf8c616fmr5711578a12.19.1730117042690;
        Mon, 28 Oct 2024 05:04:02 -0700 (PDT)
Message-ID: <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
Date: Mon, 28 Oct 2024 12:03:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20241028114831.27487-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241028114831.27487-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 11:48 am, Roger Pau Monne wrote:
> Clang 19 complains with the following error when building libxl:
>
> libxl_utils.c:48:15: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
>    48 |     char path[strlen("/local/domain") + 12];
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
> string length to be known at build time.  Note ARRAY_SIZE() accounts for the
> NUL terminator while strlen() didn't, hence subtract 1 from the total size
> calculation.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/libs/light/libxl_utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
> index 10398a6c8611..b3f5e751cc3f 100644
> --- a/tools/libs/light/libxl_utils.c
> +++ b/tools/libs/light/libxl_utils.c
> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned
>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
>  {
>      unsigned int len;
> -    char path[strlen("/local/domain") + 12];
> +    char path[ARRAY_SIZE("/local/domain") + 11];
>      char *s;
>  
>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>  {
>      unsigned int len;
> -    char path[strlen("/local/pool") + 12];
> +    char path[ARRAY_SIZE("/local/pool") + 11];
>      char *s;
>  
>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Although I have a minor preference for sizeof() as suggested by Frediano.

Can fix on commit, if you're happy?

~Andrew

