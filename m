Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8010AF0C55
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030316.1403971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrim-0005fI-4Y; Wed, 02 Jul 2025 07:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030316.1403971; Wed, 02 Jul 2025 07:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrim-0005cF-1B; Wed, 02 Jul 2025 07:17:32 +0000
Received: by outflank-mailman (input) for mailman id 1030316;
 Wed, 02 Jul 2025 07:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uWrik-0005c9-CL
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:17:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ca56390-5714-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:17:28 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso63755925e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 00:17:28 -0700 (PDT)
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390bf8sm192666895e9.4.2025.07.02.00.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:17:27 -0700 (PDT)
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
X-Inumbo-ID: 9ca56390-5714-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751440648; x=1752045448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mYTbfn+CDu82xWppkTWr4AlzQy3c+TrZHAZXnDBh+Q=;
        b=bjI0jc5xO+oCho2ziRJ1+aCQhxaRkJUDHy57uH95IOUcHA1JxamGv2eC0w7v/nzuNF
         QW/UFrgngUmVgGfRkzyWN0Dxjj1Q61aP5X0BlggyHWaTPdxD0Dvb1i4riSiHhhnBKTV9
         mUOiZC8hV9OHB/5PwP0FYPtVamWkK1J17lbLFYKIXeOvjsh8b7XvLf+6Qm5Fhy4sN0NJ
         R3GIgkKkyis8LYGy7YrzUAvbEfiwU+AG3qSSinqQSCZMkBfsbX2+tJ3cakG8v4RbsF+I
         TXC9B3Ey5J2/f1W83Dkio6y28E+pdwaeYKtIwyT1gI1Z1DndsmofgHqHRX9dMAm3iNkr
         ZbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440648; x=1752045448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mYTbfn+CDu82xWppkTWr4AlzQy3c+TrZHAZXnDBh+Q=;
        b=RrBHrNGvzgPhZm0sCcEfyITLsWS9blctQOVEWuep7jyR6EU8Cj+hy+iHOQ5ueAoYXk
         BSlNKGotRfzTMkneZVxqgOH/MSNuBGUqFtV40c1BSV7jOgOOj0TshnyRZcd8VDS9XZE3
         29GBIfkq4eYMj6u2aGnpSTp7yHMWNcdvvqyo1f8IAVlHY/B6WAV9h4eKAwY39TBZMjqU
         kYFPXFocMfJO3GJHncOHHevJbHACdGgF/1ELcY+5CJvuYL0LK5UBz+ucXHjs/u8l0lqd
         iFCNAx9cqzn4UkdtSEb/Wsz6RiNFmB9HLEYcs39VESSQXQfnQnDsBOtUClTxhRMtJHJ/
         G+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUnXMykiv/Ufj22ojyV6unZAUbA825FexNLia3gWbaYsjq8SmgEySz30pFDYYTMWNhT2UWzad6+asE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLurmPrXGCfJ+FqOIxjp1bYYovvqN0YLIu3p4K6DbxmjsJ7yZe
	nQYOy4nwNXeQ11x1DAwfLGM53UONhFofcxJIK3RL1DE0dbfg8ik1exUwtT/tjTwGLbH/KfmEe5s
	6INcV
X-Gm-Gg: ASbGncu7BKhg/zczFHanbJxkjtsCl2lXd3ZeOPxL6NGi9rCtV1ntXSSEzt5eGQdQXGf
	rdwZMldQo5bTyUQzxFLcx5wzZi12WSUlvVEFx/3ejz2ZpwtMGQJUXQyz6DMkqNjxPhbkWwiZAGp
	sk6wAHkiAp9GryHgNKQJ3+OhrikR1uyCm2PaRSLiCu63SZCPa3kPxan1yNR0zoqTLYLIjvzErXU
	0X7W/K+4yNXmPlcVoLBTvcp97PRPwkkcyotSXNwBxaWdLDWlJm6pux2aj2+nBq1NGb/Xg6nP/dL
	hwr0kTbAcJPEZ9Kc+ctCa6nexMg6rCDJCJHcoWKDn+q+Srqap9LTSOIK9srcu+25FQLjgykRY0p
	vWDoKGlZ8Ij7suHL3aPuPkJF9FyApjg==
X-Google-Smtp-Source: AGHT+IHzlLfxniq4XX72IM2MrdX4hE0Z9INHIuIGd41cfA7yt48Bx9dLsKjimCcK3PNVwCEbSlvG8w==
X-Received: by 2002:a05:600c:4f4d:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-454a4ad0a59mr9264015e9.15.1751440648158;
        Wed, 02 Jul 2025 00:17:28 -0700 (PDT)
Message-ID: <d0b25f1f-2774-4494-94e5-a6a58f995657@linaro.org>
Date: Wed, 2 Jul 2025 09:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/68] accel: Remove unused MachineState argument of
 AccelClass::setup_post()
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Julian Armistead <julian.armistead@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20250701144017.43487-1-philmd@linaro.org>
 <20250701144017.43487-16-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250701144017.43487-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/7/25 16:39, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/accel.h | 2 +-
>   accel/accel-system.c | 2 +-
>   accel/xen/xen-all.c  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
> index f327a71282c..a6a95ff0bcd 100644
> --- a/include/qemu/accel.h
> +++ b/include/qemu/accel.h
> @@ -45,7 +45,7 @@ typedef struct AccelClass {
>       void (*cpu_common_unrealize)(CPUState *cpu);
>   
>       /* system related hooks */
> -    void (*setup_post)(MachineState *ms, AccelState *accel);
> +    void (*setup_post)(AccelState *as);
>       bool (*has_memory)(AccelState *accel, AddressSpace *as,
>                          hwaddr start_addr, hwaddr size);
>   
> diff --git a/accel/accel-system.c b/accel/accel-system.c
> index 913b7155d77..af713cc9024 100644
> --- a/accel/accel-system.c
> +++ b/accel/accel-system.c
> @@ -58,7 +58,7 @@ void accel_setup_post(MachineState *ms)
>       AccelState *accel = ms->accelerator;
>       AccelClass *acc = ACCEL_GET_CLASS(accel);
>       if (acc->setup_post) {
> -        acc->setup_post(ms, accel);
> +        acc->setup_post(accel);
>       }
>   }
>   
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 1117f52bef0..ba752bbe5de 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -63,7 +63,7 @@ static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
>       xen_igd_gfx_pt_set(value, errp);
>   }
>   
> -static void xen_setup_post(MachineState *ms, AccelState *accel)
> +static void xen_setup_post(AccelState *as)
>   {

This method only accesses xen_domid/xen_domid_restrict, which are both
related to the 'accelerator', not the machine. Besides, xen_domid aims
to be in Xen AccelState and xen_domid_restrict a xen_domid_restrict
QOM property.

Regards,

Phil.

