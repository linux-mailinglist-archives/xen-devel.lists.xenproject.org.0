Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D17B256CA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 00:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080394.1440831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umK8X-0000YI-57; Wed, 13 Aug 2025 22:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080394.1440831; Wed, 13 Aug 2025 22:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umK8X-0000Vy-2R; Wed, 13 Aug 2025 22:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1080394;
 Wed, 13 Aug 2025 22:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umK8V-0000Vs-Te
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 22:39:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714462fa-7896-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 00:39:59 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so2390055e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 15:39:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4530a8sm48815802f8f.38.2025.08.13.15.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:39:58 -0700 (PDT)
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
X-Inumbo-ID: 714462fa-7896-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755124798; x=1755729598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vWd3APzGmEVc6GEtfE7z1vcUyLzkfJ/i1RhtHPCY/1E=;
        b=X7XWPldTOWlmx+ZAyrp2KTkA4wRVMutTkvKJ2N/HUDM1MePk1I5fTcdyCjrETVDL/b
         Nc894I7fdIQmWG8ZzEaXdj25OjunFY2k5xEGYIfY6NBkZajeia1wnNqwBREATZr46n29
         64tC5zxULl8MdVMrHTSTfz5z3k0Jx5Ul9vIHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755124798; x=1755729598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWd3APzGmEVc6GEtfE7z1vcUyLzkfJ/i1RhtHPCY/1E=;
        b=LXCut54zOSJ2wb2jMASs85lDzyNqji3QGawfsO1JrAiGaAxMzQpymydLuSB3esbM7w
         UVwNPXqhsJnKU4477UMjhhGEt7vzmZRpCcUxdZ+O913MOe75HbkgGfykZZOgN8L0zV6K
         dg9h1HeCh9jaWCf0A9TgbT6TCVPRp/S0TZayvGhu2FdterVwWs9baFhWTA3lvth1DmXy
         dO7q/RwPCHmlJipXXnV+6p6TwJA2uGqKj+IHfgA+P/MzSl/A9dnOd7+yeh6DgqA1/Yvx
         8PpOGSQncaOZQ/q1PlV2V35gF//zZmuOiMvqaWMFxLLt1wCJvDD8MkEqvcYhpbEz5fZ2
         8sfA==
X-Forwarded-Encrypted: i=1; AJvYcCXJcU6b54k814+X5znwSVHgznMzwENPvg0fEcLLCg4b0Un9i2N6YlzfsojJIEHrBqyOfkjGfAkky+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcEgytpzQgQwD1Qy/xMPqwb0nS31gTBpsknCrCHDTf9RbJYrGH
	cB9wzVG3hkA26pZz+HXZHKSWdYwBk7BenRSGp9d2r8h2XA9iONrvCi50aWtuliHRRMw=
X-Gm-Gg: ASbGncvbHc98jZ7egkbl0iqKmnIp4Cgm+yEV+G5Z5e3Oaz1XwCfHmlyeHDmbgYHHeWl
	HQWeWV0BkA1eUbGjsIRI5iSeR0u9Lt0hsiGQtnF0yEc/qBCEHDjayM8A28n6G0SUEofWj1acaYU
	UbtpSQ9It5kKtGrFBZ+6MBA0ofgRsKTYK3trDZT+EbLPYNQlYz7IyZvW/obbD2glBwdFDXxcU80
	rXJ+dbRMrCB2rJnfnZZuE6PH+LEcKx+6jVKL1ZGdxG6JtX0AVvFhP8Sh6k3T4fW3BT6LpVzCAzG
	v8py0L+2FaK4JaELgDbBv8wjuxhONGkpvBxJ/ADEbYxDQlJrDRq8tmfMp4AeJI7ohqQdxROWpNN
	8TxfeTPUAxBZP+v7WWjLSdbdCIoZmMKVNQvi8cInkpJZt06TARdHANeNxtLyubLskeQES
X-Google-Smtp-Source: AGHT+IHRserOVL2c18Bu/axnWisPhE9j7MfII9Pq7WJs3M+RGqnpCj9o2NrMbJTvbpZ9WjWcvHSyRw==
X-Received: by 2002:a05:600c:19d2:b0:458:bd08:72a8 with SMTP id 5b1f17b1804b1-45a1b7b2166mr3454445e9.13.1755124798401;
        Wed, 13 Aug 2025 15:39:58 -0700 (PDT)
Message-ID: <a4ff322a-8cf3-4e8f-b243-6153e823eafd@citrix.com>
Date: Wed, 13 Aug 2025 23:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/3] xen/efi: efibind: Drop alternative define for old
 GCC versions
To: nicola.vetrini@gmail.com, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
 <4140895d7382e1e1d84b5f3988b497a7edd67034.1755111932.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4140895d7382e1e1d84b5f3988b497a7edd67034.1755111932.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2025 8:12 pm, nicola.vetrini@gmail.com wrote:
> From: Nicola Vetrini <nicola.vetrini@gmail.com>
>
> Since the toolchain baseline for GCC is 5.1, there is no need for
> this case.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> ---
> Mentioned in https://gitlab.com/xen-project/xen/-/issues/201

I personally am in favour of this change, but in the past there has been
objection to changing this header it is vendered from elsewhere.

e.g. far more could be stripped out if ...

> ---
>  xen/arch/x86/include/asm/x86_64/efibind.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
> index b29342c61cac..d71b9324a6bb 100644
> --- a/xen/arch/x86/include/asm/x86_64/efibind.h
> +++ b/xen/arch/x86/include/asm/x86_64/efibind.h
> @@ -173,10 +173,8 @@ typedef uint64_t   UINTN;
>  #ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
>      #ifdef _MSC_EXTENSIONS
>          #define EFIAPI __cdecl  // Force C calling convention for Microsoft C compiler

... it's noted that Xen doesn't use MSC and I can't see anyone taking
the time to make it work.

~Andrew

