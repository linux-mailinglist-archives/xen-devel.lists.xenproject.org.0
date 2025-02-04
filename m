Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365BA27D3C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 22:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881872.1292042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfQO0-0006aL-Ub; Tue, 04 Feb 2025 21:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881872.1292042; Tue, 04 Feb 2025 21:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfQO0-0006Y5-RR; Tue, 04 Feb 2025 21:23:12 +0000
Received: by outflank-mailman (input) for mailman id 881872;
 Tue, 04 Feb 2025 21:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uBag=U3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tfQNy-0006Xz-R6
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 21:23:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ac50512-e33e-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 22:23:08 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38db0146119so135491f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 13:23:08 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390da712f9sm143965e9.28.2025.02.04.13.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 13:23:06 -0800 (PST)
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
X-Inumbo-ID: 3ac50512-e33e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738704188; x=1739308988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn+lx0Ff72ivxp1p+qnbfxeJnBt8j/pOvF6+ZRbIJJI=;
        b=QYHKLl919oUv7X9CJ3eiDojijiM+FR1ssoBXTGkDSMtV5ABjurEGdFGe8detPyxNoX
         FII3e8JeBvOP+LrPQDhr6tmW18yEJSxhWbtfWiHDb3X650L5MGA5xbcaa3UCY6acmS6e
         CnK532/y2Xc/tfhe/QclS5kmrVSwdAWsYCIp0CX79lmL+HaBCazPjel2ZgvHkOECs7of
         KWRrrEP0FMxcvu1mBI7lpZVwx06OLirw4Co+4nxzqIHwCdD6P5CikOGIUdOkca15MOI+
         L9rs0zhwz0pL5/wIp3ECS4GUS2c1HbOB0/NNg1fPKBpj4tJtvcI3nGim6Rs+Uf5rEKMg
         UQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738704188; x=1739308988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn+lx0Ff72ivxp1p+qnbfxeJnBt8j/pOvF6+ZRbIJJI=;
        b=otRwzgJXPwUjyQmRLvJQp+ThOkKNUrlfELJhp9re8oL1Q2j1svj1nKl1nDP9FL6D/7
         jeMnfHSgOW0IZoKtOChbP7mxB4XN3KOT6r0TCurk3Q0uHR4gLEGBBId9QB94s+9suzyz
         GdLVbTiGK2YcVIK8/GikgPoOy3xuLrddNJZxiPCnv60Z1TdJuifyYzTaf/rDfa+Ip0P4
         0L8yd+dRsylUb0W0c47y56uVb8E7h51NJjOawn8zOX8pl80ISSTqG7ymN0/MMvU2Gb+y
         PHzTaLK94zEAHYKB00ddWX6SLyVgp50/cIIJILaXZTCiWIs+aClEit4SVxNajOGHlhKI
         EC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5MiiVKLpcq2LbmtaVt9D0SsRGs/NZAtspYf51AbATnJk40y+S0IA2tezuPd34dGL0wK6sWjrMADE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE5RuafItHR60wwlEgDgDetI1Y7yasdfr+3N4/L2dB1D/Cofol
	PWmK2NsV6+iCazci+oYxhB0hT3LlPF0YI8qUDL33mS5k6UUd7lF5lLDJr9MNDHM=
X-Gm-Gg: ASbGncvG7IJe7A0DgYLjQjaq8q/qTG6Y6w+g54wH9RtV4D6Yumb8XvKddPMoC0BgJov
	OjTacMMdKnBMvlhsc1itgODqWdbNVTyaviScYJJe1jJATIERP8MhJvsjXOgLGQdIO2k29boYMZh
	Sjn3yUIT9/QHJXRP1xGpSgPYSPeysYOKkBRfQzYTzPpDGRxcY1w3y6gyDTEFKnFWYJKFyLJ05rZ
	NLS/tm17LC6x9dd9tS3kQjP1Kpjj5UYTKLb+en5KfttdsenlC5XH6O4ZmfsJ9iSDnF3tDe4sQuL
	p6OG+iXgqcCwdhorADrw+O/U5njnJitgWpvx4OYYozI7P8fRUskMSttNjyU=
X-Google-Smtp-Source: AGHT+IGRP9ASmGxa2gIONHJIeMtoDj7oJUvBP0OJC4QP6gu30veETmQ2is+YMCAe0VEvAsK8Ub4iQQ==
X-Received: by 2002:a05:6000:4012:b0:38a:8d32:2707 with SMTP id ffacd0b85a97d-38da5404c5emr3942983f8f.26.1738704188204;
        Tue, 04 Feb 2025 13:23:08 -0800 (PST)
Message-ID: <47873abc-2203-4911-8933-c1804abb75bc@linaro.org>
Date: Tue, 4 Feb 2025 22:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/*/xen*: Prefer QOM cast for XenLegacyDevice
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250125181343.59151-10-philmd@linaro.org>
 <20250127094129.15941-1-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250127094129.15941-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/1/25 10:41, Bernhard Beschow wrote:
> Makes the code less sensitive regarding changes in the class hierarchy which
> will be performed in the next patch.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/usb/xen-usb.c            | 6 +++---
>   hw/xen/xen-legacy-backend.c | 2 +-
>   hw/xen/xen_pvdev.c          | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


