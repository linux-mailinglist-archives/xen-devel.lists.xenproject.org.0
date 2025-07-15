Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A4B066C2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 21:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044696.1414788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ublHs-0008Oy-Re; Tue, 15 Jul 2025 19:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044696.1414788; Tue, 15 Jul 2025 19:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ublHs-0008M6-OH; Tue, 15 Jul 2025 19:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1044696;
 Tue, 15 Jul 2025 19:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZCKb=Z4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ublHs-0008Li-6O
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 19:26:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88bfab38-61b1-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 21:25:58 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so23020915e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 12:25:58 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560d019f1esm106171085e9.10.2025.07.15.12.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 12:25:56 -0700 (PDT)
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
X-Inumbo-ID: 88bfab38-61b1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752607557; x=1753212357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKhCPr5YjI/Ci5CHnyjBRTjG0SEjgGthCbWh+QDUAuw=;
        b=E/oT5wN3NbBcBnrrr7kDhxDgzg115FNj2Ly7FIKIolXLbv2nihT+7QvaWDGjmbmR4b
         Q/CNLV50GEKDdxLaX0/s4Ea2DdRnPxG4N4R4tksPNkFsL0YgGtdzxC8VtJ9C1/yxYrCC
         vKTXEK76HcKo2KrQRcGo2Tmu+r62zYHkLBmxLhr9Nt4iStMgi6/Uo+qKjXJkMTJzKs7d
         hkLqbhGljgEuB+eo8PUUoycpAJtTQrRv9LMWwQDNuoNGjVEfyYH7xNLz3TYyOqkmWbt/
         GyLKhtdmR0/2jmydpMD2SBU4mCMLczioynuJN6APm6jJyxdXd/CF4IU9hh0oz2KRrwJy
         77iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752607557; x=1753212357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKhCPr5YjI/Ci5CHnyjBRTjG0SEjgGthCbWh+QDUAuw=;
        b=c0dxHHhkWinxPgCu88951jfqktLjJrS46Ow6NQGjeefnuhZ9DyzwVvxUBdaw9VLwDb
         x2xAe5kWNtBn5Y3YW8aI5YnJzP7uH1FcWnY/hLlbMmPS5xyB2v4MRUMPYNc2+woS+Sgd
         2HWTbGwfTqPtmj4camR9dIIsn4g+7tgoR0VrgW15mYXdIJMexdBLrEx3us3bxC1oOIJr
         ckadBOR5IMhZP15L2SBrng74Bt4caOGXaQe/Z+lVuwpP5ti4hO+siD6ZnZ4/tfdi/28l
         jrGI+XdaoiMpXewng+P2LChD9qYB41vGQeg0nbFuvHr4cOpGqj+BgH6tA0CCO3EPSBR4
         JeBg==
X-Forwarded-Encrypted: i=1; AJvYcCXB8XxLhzvkZyC/XxrTjrIN4kRhQv61wGZZZg+LA9eYPxxA0mMI8avPmzSMYPlQ2nlUD9/4fTLo76A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMk9Ui/6e4aUV5UA6+PI/ruvCrorHCW6ZXabN+3vTGBdXgpFRP
	237jFbgBDvJEuULsNyXuPjir6cYdMYirfx1Ad4tQL5KWlhpSGZwt0WafdH6mLDPhgu4=
X-Gm-Gg: ASbGncssNvvHDO1ydxAfY4ptUmcT5MaA9sQyvDc9wcA8NkBhIBOFNfwjuDRqPyqTKEf
	RCT/3Oa5WuqarPnfLbTP+PDpxa3YVmDROdE5bIYKngdCI3cz8iRXpL3x7SucSG5RLaiw9KRmo3A
	I9bxdseirlN9PieIbI+r73r/tLscZKO1OEFJe9RPP40hGuYpxsrS2kNjE8GcvpksYh/aB7n7Hua
	Pzw/USKOF7mEIrLEEni10EwBM9qbaM2MHdMA/HbvS51h20ezEVyVz0N80840OiQktq3eTy35FZn
	1+umv1cM5ZLATU1yPg5jME7BuE7St9YjYJUz3HtPkyjL1mspqj9y8QCNDKHdmpd0lJGwOZS7nN0
	2bmocVtcBgcCaqxMmW80uFm/YpuHsm2CfdoejbHTFrG5aLYHmSVY4Iml+o3sAE4iAPXevgRA=
X-Google-Smtp-Source: AGHT+IGv53aFY/smpgFXW/oCSTDYePapi7m1QyfIY3Vehuu2Sb23CG8TNHwz9smozWCA7Gl/gnLoeQ==
X-Received: by 2002:a05:600c:3b94:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-4562e3b9a23mr134365e9.18.1752607557447;
        Tue, 15 Jul 2025 12:25:57 -0700 (PDT)
Message-ID: <d384b96e-c705-41c1-9990-81755d2f850f@linaro.org>
Date: Tue, 15 Jul 2025 21:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/xen-pvh: Remove unnecessary 'hw/xen/arch_hvm.h'
 header
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Maydell
 <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>
References: <20250715071528.46196-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250715071528.46196-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/7/25 09:15, Philippe Mathieu-Daudé wrote:
> "hw/xen/arch_hvm.h" only declares the arch_handle_ioreq() and
> arch_xen_set_memory() prototypes, which are not used by xen-pvh.c.
> Remove the unnecessary header inclusion.
> 
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20250513171737.74386-1-philmd@linaro.org>
> ---
>   hw/arm/xen-pvh.c | 1 -
>   1 file changed, 1 deletion(-)

Queued, thanks.

