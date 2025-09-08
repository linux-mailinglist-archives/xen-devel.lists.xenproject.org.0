Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011BB487A5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 10:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114843.1461650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXgH-0005CL-M8; Mon, 08 Sep 2025 08:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114843.1461650; Mon, 08 Sep 2025 08:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXgH-00059L-It; Mon, 08 Sep 2025 08:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1114843;
 Mon, 08 Sep 2025 08:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvXgF-00059F-Mf
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 08:56:55 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c40073c3-8c91-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 10:56:53 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6263d0e4b94so3097054a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 01:56:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04709b3effsm1230356566b.5.2025.09.08.01.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 01:56:52 -0700 (PDT)
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
X-Inumbo-ID: c40073c3-8c91-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757321813; x=1757926613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3Oj13E/8iwlGqxNJRLrxfjHufoWXuRWkz35ljJcAxo=;
        b=CoNdOlEh9FcEq0hxHzbtNrfLhTeXbPTRTRGVQkF6Mxayyog9LooRKzsWZ9I6QkHuXW
         HcfhuebyYsV5uvRdy6TcZ/A7C+pnmfUeKxzrTxqGTQzN7M++hfgYqWD0p0gzBo3Bx3Go
         hJloJSTSwN2pA6t/mnLPalJrzXWIefQdKUw1ctLskq/DN6fH9Gt7dxDAqAbBXomozlnY
         8kuWWDuzLEOZgdbYCmuBNlFHubwQrUvNOwZWjGwfbLNYB6zLMwT3CG8D7WUyZkDdr6Ks
         zUIvuci7TBIngqluesADLS+ZOYO79xZp2W29OJlk9TdrJXCS64wjTsI8vd9ntLyDXwZi
         zbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321813; x=1757926613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3Oj13E/8iwlGqxNJRLrxfjHufoWXuRWkz35ljJcAxo=;
        b=a/9nARB/rR+VY7pp30z92+nltrAshh3tLFfOP0NbpW9Eewz6OGUi7icSN2HNS84sfy
         xl/q9swvwEfmZlTHZofCF8Ay9y3gJuG3248A3dyt02w8nkeVXm9FCmyqVpfnbJmXetwv
         pxR5Pt5n7k71hu2dRuv6cOrKnRsjqHK5qvwcMTSjh5+kI1DEE+aNnvfeRTZBilYfBfmV
         HH63yGA5gdAN/nMv3t+aNyaeallSxo0jJG1v3Abk6vA8RG2ZYO7cxa34uzq2N2BVhd4w
         8MXh+ZvlC5J02kFEg6O8TakDaBurCPzR5yILQbVfLKRq/3mhxSw5Tr1wYPD7D+sQClKU
         xCDA==
X-Forwarded-Encrypted: i=1; AJvYcCWI20GhSJpa1tQeAzIaXVkXu/VUx50OdCWLPtrN/Rfom2HOPmueFEKRg9Tf77uytD0ANWUVDnoryOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFlUJC36K7uMdq8QF6h6ko2VMXGswMa1aCLPGxTRf0yrXz4tO6
	XwsJPpM9rmZUDZgNIRTBqtKnmIgkPGH/gJcp8RWnet20litHuoVBRR5Hd7pxLoK9mg==
X-Gm-Gg: ASbGncuXypxFcY8b4voY4hp6ALrnOSgqwsmDE4qwNwrciB5Y/wB1lhWStXsxcrBBLJJ
	4WzJ16bIneDt6AEuvPRVgjL984INdF0wxlVETbl0Z28Sx6a1ELKKhxlv6moOoYSyk5dutpcpPN7
	Sk0dbb77yQsaBooIvivs6j3T8aZeTwLtedu0v1hMISZJgYyo8iCzeaHKsRUcwYxdHTUQGJp4O1T
	KeDrIA3neTCqkfPcYh2nId2UoXT1+9z2g/kIFLaBuRs1rlaGGsYCtwESk+xB7rZ2QsPuCYYOY0j
	+uQW/1zRAvwbozwBQRJLplqvs2VVLcA1xOe1tn9UtKL5031sveWJT2gnM5ZjrgIhnpD8yMyyRky
	TgatkwNZc/dQF9Wir83LghbIXutYxGZEKtfe5Fo5APdadxdOgqp1aQPW5r3t1hc0AYimEfDpI//
	nCJhbUIMua0mr6xxh3tA==
X-Google-Smtp-Source: AGHT+IFf6FpZO6cyWpcxo7Ko6NZ7qThjf3QzFX4rgMALkIbN5x0R8dWzA4WGMsrltvbBnDsvO5GZAw==
X-Received: by 2002:a17:907:3dac:b0:afe:9e58:7550 with SMTP id a640c23a62f3a-b04b140cfe6mr710473466b.19.1757321812961;
        Mon, 08 Sep 2025 01:56:52 -0700 (PDT)
Message-ID: <6647009f-a1f8-4cf0-923a-c04f0a59106a@suse.com>
Date: Mon, 8 Sep 2025 10:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] efi: Support using Shim's LoadImage protocol
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
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
In-Reply-To: <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2025 14:10, Gerald Elder-Vass wrote:
> @@ -1047,6 +1056,46 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>      return gop_mode;
>  }
>  
> +static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
> +{
> +    static EFI_GUID __initdata shim_image_guid = SHIM_IMAGE_LOADER_GUID;
> +    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
> +    SHIM_IMAGE_LOADER *shim_loader;
> +    EFI_HANDLE loaded_kernel;
> +    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    EFI_STATUS status;
> +    bool verified = false;
> +
> +    /* Look for LoadImage first */
> +    if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_image_guid, NULL,
> +                                           (void **)&shim_loader)) )
> +    {
> +        status = shim_loader->LoadImage(false, ImageHandle, NULL,
> +                                        (void *)kernel.ptr, kernel.size,
> +                                        &loaded_kernel);
> +        if ( !EFI_ERROR(status) )
> +            verified = true;
> +
> +        /* LoadImage performed verification, now clean up with UnloadImage */
> +        shim_loader->UnloadImage(loaded_kernel);
> +    }
> +
> +    /* else fall back to Shim Lock */
> +    if ( !verified &&
> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                                           (void **)&shim_lock)) &&
> +         !EFI_ERROR(shim_lock->Verify(kernel.ptr, kernel.size)) )

As already said on an earlier version, the use of !EFI_ERROR() here is a
behavioral change from ...

> @@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>       * device tree through the efi_check_dt_boot function, in this stage
>       * verify it.
>       */
> -    if ( kernel.ptr &&
> -         !kernel_verified &&
> -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                                           (void **)&shim_lock)) &&
> -         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )

... checking for EFI_SUCCESS alone here. There's also nothing in the
description justifying the change. (See the various EFI_WARN_* that exist.)

Jan

