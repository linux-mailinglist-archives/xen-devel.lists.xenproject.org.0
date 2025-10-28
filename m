Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBAFC1373B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 09:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151970.1482515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDell-0001IA-6R; Tue, 28 Oct 2025 08:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151970.1482515; Tue, 28 Oct 2025 08:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDell-0001Fv-3b; Tue, 28 Oct 2025 08:09:29 +0000
Received: by outflank-mailman (input) for mailman id 1151970;
 Tue, 28 Oct 2025 08:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=alTg=5F=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vDelk-00017m-4S
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 08:09:28 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b9b4e9e-b3d5-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 09:09:26 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so13228335e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 01:09:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6?
 ([2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a36easm182193715e9.10.2025.10.28.01.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:09:25 -0700 (PDT)
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
X-Inumbo-ID: 6b9b4e9e-b3d5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761638966; x=1762243766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3Q842JtEA97RNc6zbk+HgDVLhIp8lx7SKgQXkLwS8g=;
        b=FeN/89If9kCYNpVh56NWK5u+CxTA4b+Lz6yFTOUd++MQTCqqfOAho7hCWnQYV6JySU
         LaLJbSWPxHdWulkLOHWebmIf93nCEpolg58wJJOT9JHlicXD8YgXuXyVjNv3dqVCtuJ9
         cUf+Zx3AXzUOw4TlX5GAU6ClM0CbfMoFbiHwxY1pcvdTNmQXz7UFgr6fEi8T7BK0sXPc
         +RU7SKkvmB1IAt3czgdYRBWXeeYLaGx1jeylqryLjN8rTGbL4WegE7tOvZLwApH9eVya
         ZW5K2rDaWFDmIGep9fcfQylou4TXWgS+S4GD1p/TOPFJx0PYsatVIeovLpoHdN3NdPV/
         FxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761638966; x=1762243766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3Q842JtEA97RNc6zbk+HgDVLhIp8lx7SKgQXkLwS8g=;
        b=j+7pk0gYXJeAVLdDPUlGTV31hQyxWuFhQ/cLTw8wMR18e87BXa5Tew6f1jvjY4K1yl
         kCASgM4MibH+7RCRgC6EPdbhQ048HFMmoF5aAbdDooNnw9OKHXXNoX92kbgXkW96TgXt
         8CBiIwEYjwRRyfqktEH9smWmcetWpagIR97nDRZtmIinc/XfIgnI6PfPUyLqOCn+cD4P
         WxJkrbR7rSDOjeP9XB3Uzw7SfrZptS/KBDIY7yDCzg34HDVWD+KF+ecAJf116TFVbZNr
         q8uXBh4qdhIlGu8LG2UvhpdBvV2srVmT4d8TSWYa7rr/chNbEZIU4oVg+WnWokLatH5q
         Csbg==
X-Forwarded-Encrypted: i=1; AJvYcCXRSAZVtaGbtiZ+LN8807T8715iSDOIgOxIUBD3lnKTtcJ33S4CAHO+DZu+MV1F8R7H2PjEH7YV6eA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8cLmarDZsa4po1FQ9bJTOGY0qMTxtYRXe2p1wMI+xKyayzKup
	+ywdnszyMO9tuhbEgzBOP4MZ4cZTm3BMqgWPVWQ3nIz3hk5zNw45uUNtOeGGI2iSQjc=
X-Gm-Gg: ASbGncvpK+F/JcbykogYAyZyUSLlRZi0DxrI2EgpY8dSi6jz+SPrHPk016BuhDkLwZC
	N/ZEqwiyobtNH3mwEIVGPesGOPJSvh03xz8i2LtUABi2HXpOhmrPrY5pprya59DJQ8rtQGIcmzc
	MAvn/SSIezCBoRP0NkPjj9gCoslapPdNThpe0Hw394rwKnKcvPrVcwzrdFcAQhfFL5w6624EyNI
	va6Kgk0UEoAjkrJW8e7UyNnJIRGxKmzFOHdMR5H3TIXuBy6aw5Pgau7oZf9BiQJ6WyGBZvrGnj1
	m/0sSJBmjHB2o6WSHp1YGc25iUAGSY89GweaDmMv67dGf5CG8pjFtiJ537tENcct0IWgpXAs81S
	YO3JfYFKMxTyAAB8fg1JohQJg8MChTPXWGO5XnhLE/5FHFJSqhrhRIamCk4iFYCppCxEQB+ZmSA
	jp3Tdnn49/jwrvrIb12wh89m8T06ElhyecliAQdqfRjD2/tLd3oW5t4sU=
X-Google-Smtp-Source: AGHT+IHID5e8uBGPQLvO5Mm9gwxpOr/rM39suLHjKNm8MlJEv+Itxnbzy1ijVhWeoY04xD5t1A3jZQ==
X-Received: by 2002:a05:600c:190a:b0:471:9da:524c with SMTP id 5b1f17b1804b1-47717dfd4bbmr19110135e9.12.1761638965836;
        Tue, 28 Oct 2025 01:09:25 -0700 (PDT)
Message-ID: <17cc53d4-6819-443f-bfff-5de787d87329@linaro.org>
Date: Tue, 28 Oct 2025 09:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/xen: Replace target_ulong by agnostic
 target_long_bits()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anton Johansson <anjo@rev.ng>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251022140114.72372-1-philmd@linaro.org>
 <20251022140114.72372-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251022140114.72372-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-22 16:01, Philippe Mathieu-Daudé wrote:
> Both are equivalent:
> 
>    target_long_bits()
> 
>    sizeof(target_u?long) * BITS_PER_BYTE
> 
> Prefer the former which is target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


