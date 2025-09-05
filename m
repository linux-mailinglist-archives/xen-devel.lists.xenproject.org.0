Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8691B4631E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 21:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112313.1460639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uubkC-0003lf-Hr; Fri, 05 Sep 2025 19:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112313.1460639; Fri, 05 Sep 2025 19:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uubkC-0003iz-E0; Fri, 05 Sep 2025 19:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1112313;
 Fri, 05 Sep 2025 19:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfYY=3Q=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uubkB-0003it-BO
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 19:05:07 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3989a3fe-8a8b-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 21:05:02 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3e46fac8421so672258f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 12:05:02 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a1f807f9sm31600377f8f.38.2025.09.05.12.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 12:05:00 -0700 (PDT)
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
X-Inumbo-ID: 3989a3fe-8a8b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757099101; x=1757703901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6nzf2l82j6ghu3fUKUCxp+1Esp+rN4o4BInmeEEC9F0=;
        b=kFlr0+e+nmoVZMW4Gj2io6kLrnKTeZvRvji75cK7p5kXExsF6IhH8NpeORAfOKHKkz
         JML+U1Bdoh/kxVdW1yAK5YhxiIt0tekjAeyzmXh2XdDTVexNhIKGdvowkeP/vOILxCVM
         QQWslmZSguclj0VEnfOKX27W+z+x3aYUDD8Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099101; x=1757703901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nzf2l82j6ghu3fUKUCxp+1Esp+rN4o4BInmeEEC9F0=;
        b=qLZM3sraquY86fmMM9U/U/GH10qbSJM4W3oGKw1dbDll11L5eYObV9StKjyKXLHgxo
         u9MLSSsH08mRludQCuhJbcWNeooL4RTum/mFCLuq2UgmBK8mng+C8BLa/na+RxMj2UYR
         b3KjN/+6aTQqx9uukbuA+ZlDy1iRzCzTQyQeeoFh1HtdpO6pUx7tUoe6dvQqZk58x3pR
         Hq072AhcRqxEBi4y5dy1P+npkvJWhY2FqIGYb9FyKsBpPW/zc0flgbJQHwnTrGP5qLy1
         Hd9tsZkyHpuoGvXhm1UOyT2w/hycwRKnt0OZ9KX1hZc1QqNB5mUBIFVlj+dE1MUiW6ih
         X+PA==
X-Forwarded-Encrypted: i=1; AJvYcCU+pHHSYoph9uimUU9U4zRoX5WhNNmF0LkC2JYzoIOJbYwX3Z9OpKIMp3s3Q6LXyyENFfYiy6NmqG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzivL7D+Hq65d8CRZkOPftGrqi5f+uhfgY3wOwRop3UeymtH7n9
	wxONXz8U1WpuLyAQcNCTYwRfRGSBHFe4zeUybVztxVtL+KX5PjFe1T1wneozqh1FRgY=
X-Gm-Gg: ASbGncsNHzw/OasZTjWshb8Hs8MOz7J1/nxn4f71m3bMhuRGxe6CAGF7Mt8MkvzYgEy
	ftgFS990GJmb02Nf23ZeKWzNJiHoVN4AP4VTQvRaMTpQD/f3+MB/sdemGFeLFZbEzsr1mLwImdT
	3mVSlypea5tSzhEik4tE9MzjwfrE7R/UizuUNZ6q3vnsdpdGA4i0kfO7MhiYrRL9HolPqAGszpO
	aYLGPpQxe3GveODOQfYjS19cjtdXjoLoavUltgiHyt/eAT/zygZbwjab98MvzGVYYtGZe6SQopr
	nYSODyWrU642t0B/SP9krXEXULU/25h1eNnzRGEh3flBduaQlUjyrrqUqpux8E/9eDQ+m15/C9j
	yRclGRqzsq4gtJNZqdivfIk4e7drz6cGxcyiScALFofM19SQeqYLACirNxOGWK9rRfzFRsO/Iih
	14c2oY5+u+a8TfQg==
X-Google-Smtp-Source: AGHT+IFXw+piYTULfvnwMt5iJjLe7sKHtFOvyw5kuX+qmAGBbI3a88bs3bGXordQ7q26yfwDV5/mzA==
X-Received: by 2002:a05:6000:2307:b0:3ce:f9b7:4db with SMTP id ffacd0b85a97d-3d1de6a8dc5mr20101714f8f.24.1757099101387;
        Fri, 05 Sep 2025 12:05:01 -0700 (PDT)
Message-ID: <79893688-1ee1-4fb5-8703-c2f3b7d3da40@citrix.com>
Date: Fri, 5 Sep 2025 20:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] efi: Support using Shim's LoadImage protocol
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2025 1:10 pm, Gerald Elder-Vass wrote:
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index ccbfc401f7ba..0a72c293301d 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
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

I think this wants a bit of the explanation given in reply to v3. 
Something like:

/* Always unload the image.  We only wanted LoadImage to perform
verification anyway, and in the case of a failure, there may still be
cleanup needing to be performed. */

I can fix this on commit if there are no other concerns.

~Andrew

