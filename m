Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEB9BCFBE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830368.1245348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KvG-0006Km-Om; Tue, 05 Nov 2024 14:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830368.1245348; Tue, 05 Nov 2024 14:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KvG-0006IK-Ld; Tue, 05 Nov 2024 14:52:46 +0000
Received: by outflank-mailman (input) for mailman id 830368;
 Tue, 05 Nov 2024 14:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8KvF-0006IE-AD
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:52:45 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bd36b09-9b85-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:52:42 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so65701095e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:52:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116ae82sm16393042f8f.93.2024.11.05.06.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 06:52:40 -0800 (PST)
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
X-Inumbo-ID: 9bd36b09-9b85-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjliZDM2YjA5LTliODUtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE4MzYyLjIwMTI0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730818361; x=1731423161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vDwRSdEgINUlqUqy5I5C5bRD86V+LmDkk/eVT9gVhus=;
        b=PdhH4aLLDqi/pWk0RJCWBA87rCCOHTIZbP2lY+xqkT2pu9BH1uK3JuggIWlA6+Nh2e
         SiyjwNQlWCrBL026IUsGSolPp9SSppgUe2Muts05MWqd0Lhr49FSmsZUzkz5aN4QF0bc
         sfqpfxln4SRd9rRGJKZJE47viQQJaeYBJTxqw+PxBONONtTB2p6EYbo0XmYj88u76XAD
         wWHocYj+u2NQsbZf9W27tpcpoHq3p7qE4WNTMW1tE4qYu4Hvb7DROwoPi+y2mlvdm0bl
         nWRjwt0wAErlxywdlu+M1KnanSGV5kBkYY3up5H0Vz6h/UtAr/hjhhMiGq4uS1Q8gh1n
         OBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730818361; x=1731423161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDwRSdEgINUlqUqy5I5C5bRD86V+LmDkk/eVT9gVhus=;
        b=p0j525MBn1hHu/RAy+Ygk9AVgJI/0JE9k2JlKF9vlFbGm+CenDexhrF9NeR4yf0+5g
         +0VjrAQYTdwtW4zE9zuhE7M0JvKqXA3hcTNJKW2YKP/J2GRHCUz0z+HRqGSz/0L176NH
         HkvnnmmStalZTE/HpIBfFIB7uLdISa+0wIjuX8fvdJ7SMpFfJHMTiFlnl2sWqd4xCMyF
         upiWGjRqETLK1cbw07va9LmzKu1QZpv2abv4QUdJ3HFzLGBvcUYffkSCoVNEjWRNvQjv
         cjyrfS1sDsviIGAjTAFEfCksN4QwsiFsoqPZLPeyOcti4imod7Vqfi0U2F6M2kwT348J
         DIxg==
X-Forwarded-Encrypted: i=1; AJvYcCXaJnT4XFXJD1nMv6BhaWkuT96A2GbFiSj4i4DkSIBVLr3Xul25NQWBDo9BYN0+V1XyGCgUL04mGIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqW+5rfdPM7ojXbdYeizv1LhdMQi8alfRVasS+xJSF7Ith+bov
	oyxuFVy3PN+/Ad7E7fnbb9sgHvliSy57FLE+wzrFBaO87PuEV1RpFtULapQQGw==
X-Google-Smtp-Source: AGHT+IGMpBomYZKQzrcPOfv3iKK3VoUUEh9QMIQQ63YmIp9DDmcyUAMEcYnjLOE7PHisnsoWJ1oirw==
X-Received: by 2002:a05:600c:3b82:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-4328b4bdc8dmr135273065e9.32.1730818361468;
        Tue, 05 Nov 2024 06:52:41 -0800 (PST)
Message-ID: <c55fdc20-2a58-4978-bd78-4cba90a7a8e4@suse.com>
Date: Tue, 5 Nov 2024 15:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240819142953.415817-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2024 16:29, Frediano Ziglio wrote:
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

A while ago Andrew and I discussed this, and I was apparently wrongly expecting
him to come back here, as (iirc; no record of this that I could find in the mail
archives, so I'm sorry if my recollection is wrong) he was the one to object. We
concluded that it wants at least considering to undo the respective part of
00d5d5ce23e6, finding a different solution to the Clang issue there.

Jan

