Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5BFAE9DDD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026328.1401517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUm6V-0002J1-Ou; Thu, 26 Jun 2025 12:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026328.1401517; Thu, 26 Jun 2025 12:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUm6V-0002HZ-LA; Thu, 26 Jun 2025 12:53:23 +0000
Received: by outflank-mailman (input) for mailman id 1026328;
 Thu, 26 Jun 2025 12:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUm6T-0002Fy-RZ
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:53:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 881b837e-528c-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 14:53:18 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a510432236so747387f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:53:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8607c96sm156411895ad.138.2025.06.26.05.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:53:17 -0700 (PDT)
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
X-Inumbo-ID: 881b837e-528c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750942398; x=1751547198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gXDUW5WwrevfyDEA07KKbi2JpoDr3uAr7Hsstk9AqxI=;
        b=YwyIVVsd/GxrcmahY3r79kZSHMlXfLE9+nZcYSrqLx3HfntpAUceW20Qwttz+refHO
         kvU81c+SSY24rdPtWyIf3YNYrBizvZ6bhhwzze+bGnMlChSVXZDrkeMi8Ov2+9+u5K3s
         L9pidQTXf4ODVXeOyscGmUBbWb23kIFBOF7IJSb2xZpiGm1qpaBH0EVqfmtgPqmsSsDW
         83Ysx3IFJkZDnw+jChDNFbz59RH93D8JgpNy3zaAUy/PI12hkx91/U96V3xEZItaxj25
         VhimvPsL9f6gQvr6ym72dkjhOQ6WUrKSehP7ba7STjvlqDYD06qXiRQnvqW0/VZuehuq
         HMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942398; x=1751547198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXDUW5WwrevfyDEA07KKbi2JpoDr3uAr7Hsstk9AqxI=;
        b=MZSKys6UxOIhUvxlS0KoM3MlVyLZOwS/a5+4EwtGpn4+P144sdYJ9aHJ8oe0OQt9t2
         E799Z37A3cN0grofVwbj+ZfxHFV69hQOOhKxbVsKSoMuQL0xbuCU41D40FsxIIa+zjBI
         NywWSgIy1EEIooYUrebdq9597bpM426aW6s57nu2tYhnYFIuI/ipzQEi4pKw3aL8+EIX
         wctH2dVaU/VaLfOUoUP1o80tezEn3i+NUkWht9W1AE3gjInB9mP6pwnLTLq06phxyCti
         N818QJOPRQ5bf72prMZ9WBMRQ7vtS15QaFVS38tvqBllZFa7zGise2QW9v6hcbEDu2fv
         Kfag==
X-Forwarded-Encrypted: i=1; AJvYcCWCc2t3i0YOOOpFVlZaadcbqusHQEIDeLAoLl0ppWYMXovxzvLBGwvuUqmBUacPvPHYjGkM37ad9pQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzMvYelI1AqtsPKfzWzLpwpE/4ikVO+jX9cK7qbR97dZ3YnbOU
	Op7pTeRVHYq+Mwt0pOJGRupCPCGuFXCO6DLdd1DVfyvSApRhySQHoQ5/B0d4I52RTw==
X-Gm-Gg: ASbGncvOcjR3Svw0pb8GNkrSXaByG9n4KFlEk7Fcc3hYASq9jw93y15ryntdgMFxbXn
	P2rwM6r0oP6lS9w36D7gZZSuzCyJ6oaIM0iNFR7PEM3an7zhSK3sk3tBfx6L/kTa7SWaifjAvV1
	4xk4XcRvqZhDx3/LJPnXl4k7AnrIvq25DfXsBvu3xsC1DNkeklHXyhwTT2a+ZcRGCej7HflDC3r
	0YufxoOId66Tj2oSj1S6Y9BY1Sspzqth+NmK29SFxa6F9//eRoiHMZiyc4bGpfga4CsnJRrBstK
	Bfgv0+PyPujzEjcFIzpkeIMAPVEIBsHmQxRKJT0X/F5cfwnCGHoS6fy5xQBgPgEa4uN9v8j7YTy
	bTWbGM+FTCIWThE7TTFQixg77AroXzlEUUS+T+36ph8eOnY0=
X-Google-Smtp-Source: AGHT+IF5qX8MT0FiR76B6K3JXP2hKh9+95y8Fhhenb0Opf0TlMZv8/UgfAOKKOtNpxpt2Bb6yE6zQg==
X-Received: by 2002:a05:6000:1446:b0:3a1:fcd6:1e6b with SMTP id ffacd0b85a97d-3a6ed65b46emr5590981f8f.57.1750942397554;
        Thu, 26 Jun 2025 05:53:17 -0700 (PDT)
Message-ID: <e6687ac7-8ff1-4418-a32e-1fc610045c2a@suse.com>
Date: Thu, 26 Jun 2025 14:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/efi: Handle cases where file didn't come from
 ESP
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
 <20250625073408.7496-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250625073408.7496-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 09:34, Frediano Ziglio wrote:
> A boot loader can load files from outside ESP.

I think it would have helped if you said somewhere what ESP is. People may
think of this as UEFI System Partition (or some such), which doesn't collapse
to the acronym used.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -443,6 +443,18 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
>      CHAR16 *pathend, *ptr;
>      EFI_STATUS ret;
>  
> +    /*
> +     * In some cases the image could not come from a specific device.
> +     * For instance this can happen if Xen was loaded using GRUB2 "linux"
> +     * command.
> +     */

I consider this bogus: Why in the world would one use "linux" for loading Xen?

Yet I'll commit this as-is anyway, as Marek has acked it, just with ...

> @@ -1404,7 +1427,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>          /* Read and parse the config file. */
>          if ( read_section(loaded_image, L"config", &cfg, NULL) )
>              PrintStr(L"Using builtin config file\r\n");
> -        else if ( !cfg_file_name )
> +        else if ( !cfg_file_name && file_name)

... the style issue addressed here.

Jan

