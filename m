Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC5956966
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 13:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779563.1189273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0fl-00079x-Ss; Mon, 19 Aug 2024 11:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779563.1189273; Mon, 19 Aug 2024 11:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg0fl-00078B-PX; Mon, 19 Aug 2024 11:35:41 +0000
Received: by outflank-mailman (input) for mailman id 779563;
 Mon, 19 Aug 2024 11:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg0fk-000785-1b
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 11:35:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27431ef7-5e1f-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 13:35:38 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso46251285e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 04:35:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396e0edsm619916766b.222.2024.08.19.04.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 04:35:35 -0700 (PDT)
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
X-Inumbo-ID: 27431ef7-5e1f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724067336; x=1724672136; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZSnyPp5I8ZzYOSC8r9y4DICPE+jaj/ujt+3Vx/s5gU=;
        b=TJmH5BwDnFpCl7nGPsTrseQ3v2DIBFpPXvZ8lvebG2CmOKa29NDRdb69aCMdGwnvb5
         lFgioP28Z2c2F484sr/E+MoMU1e444KMdDRl65HNkFkGh6W5ArHctLQpZiLd2BJUnUhA
         /D9R8cPM+Vt18AlgdSoUpx1FKP5yN66WYbDZpqC9vjT6J1gSmv7KW1uNPYgkJz7oSPVL
         PintEomJZ4UJFYHlfg+kyTEIBhj4XwYQUsXtQMRV9O7uQfPJJm7UQKVbK7uW1Ne7g4AC
         1HEUQT9v4BghRQrT9c1wBzg/uuf8N6y5+fFisrRfNomaaufA/CTFy8M/lCerJe+jZ/KI
         +xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067336; x=1724672136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZSnyPp5I8ZzYOSC8r9y4DICPE+jaj/ujt+3Vx/s5gU=;
        b=mshmFF/chtjl1Aj/VLyJ3+pZgI0DIWfSKlO/sITZ/uVxyOWvEZAZma4dLN8vNzeDh6
         K2L19rUSLfhhaTNm5977HJzeME653h7YU/Cyi8noi/PIYrNh/XdoGHjpW13lpEVCzUE7
         H9OmJsIhjDwDGy4Qktr5vOPaTzpZO1SM6FwyRalXIbb0LKECQpkZIriEeuvI9NOt88Gn
         4M6EHXekRygjbsruyG7jGldcGa1+OqtQF1xCvG44+gJSt0g6IZpfydsn0+HetC0tO2YY
         xsHijM4PIkL/OEC0WogusUD0An84G1iApr9eMlihrB539EdjevZFUva3iKQ6a5ZL5ueD
         hnGw==
X-Forwarded-Encrypted: i=1; AJvYcCXXKxXPN0gj0/XBmSxzZGldWvFKXMzhZnibJtGsmuk0NGLPrbTFqNL4MIRyhiSPRRLJB6y5SBXQC8jLRmxoDJeYqkpGiEOMF92kTn+NIIM=
X-Gm-Message-State: AOJu0YwKU1zzVq8YalZqxVDG2rfNcLofTN6JGpHt4mQ2L/kTDg3vbGEj
	FqjktelqlydyYbl4OgFJmA2INC4wWPQ5rhhu2bDymL/3iKlGj7EQgONuY0+Ncw==
X-Google-Smtp-Source: AGHT+IGXfeJuq4efzTUo620nLNM7ozIi/qh46btWrvRqaBwr8OJKrTEuOWfn6emVpsGRCiqMmvqN+w==
X-Received: by 2002:a5d:548c:0:b0:368:3f6a:1dea with SMTP id ffacd0b85a97d-37194315601mr8417703f8f.6.1724067335901;
        Mon, 19 Aug 2024 04:35:35 -0700 (PDT)
Message-ID: <271cf485-c03a-4592-a1fb-d6d201fbe74b@suse.com>
Date: Mon, 19 Aug 2024 13:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240819110729.205707-1-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240819110729.205707-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2024 13:07, Frediano Ziglio wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
>  /* generic routine for printing error messages */
>  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>  {
> -    static const CHAR16* const ErrCodeToStr[] __initconstrel = {
> -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           = L"Not found",
> -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            = L"The device has no media",
> -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       = L"Media changed",
> -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        = L"Device error",
> -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    = L"Volume corrupted",
> -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       = L"Access denied",
> -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    = L"Out of resources",
> -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         = L"Volume is full",
> -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  = L"Security violation",
> -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           = L"CRC error",
> -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    = L"Compromised data",
> -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    = L"Buffer too small",
> +#define ERROR_MESSAGE_LIST \
> +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
> +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
> +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
> +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
> +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
> +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
> +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
> +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
> +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
> +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
> +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
> +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
> +
> +    static const struct ErrorStrings {

__initconst?

> +        CHAR16 start;
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
> +        ERROR_MESSAGE_LIST
> +    } ErrorStrings __initconst = {
> +        0
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) , L ## str
> +        ERROR_MESSAGE_LIST
> +    };
> +    static const uint16_t ErrCodeToStr[] __initconst = {
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) \
> +        [~EFI_ERROR_MASK & code] = offsetof(struct ErrorStrings, msg_ ## code),
> +        ERROR_MESSAGE_LIST
>      };
>      EFI_STATUS ErrIdx = ErrCode & ~EFI_ERROR_MASK;
>  
> @@ -308,7 +325,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>      PrintErr(L": ");
>  
>      if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> -        mesg = ErrCodeToStr[ErrIdx];
> +        mesg = (CHAR16*) ((char*) &ErrorStrings + ErrCodeToStr[ErrIdx]);

Please never cast away const. Also (nit) please put the blanks at the right
places. Finally instead of casting to char * (something string-like)
intermediately, perhaps better cast to void *? Taken together

        mesg = (const CHAR16 *)((const void *)&ErrorStrings + ErrCodeToStr[ErrIdx]);

(which looks like it'll then also need line-wrapping).

Further please add an appropriate Fixes: tag.

Jan

