Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442259F4FEB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859356.1271481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZnw-00061z-Ax; Tue, 17 Dec 2024 15:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859356.1271481; Tue, 17 Dec 2024 15:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZnw-00060P-8I; Tue, 17 Dec 2024 15:48:12 +0000
Received: by outflank-mailman (input) for mailman id 859356;
 Tue, 17 Dec 2024 15:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toaA=TK=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tNZnv-00060J-4A
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:48:11 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5065d83d-bc8e-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 16:48:10 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-29ff8053384so2883416fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:48:09 -0800 (PST)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2a3d2928e81sm2820976fac.37.2024.12.17.07.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 07:48:08 -0800 (PST)
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
X-Inumbo-ID: 5065d83d-bc8e-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734450488; x=1735055288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0mmYM+VbtglGVT88HwKy5Bu24H9an/svIIsHPSJEpQ=;
        b=P6FXLurWSAV7Y+bWGhGgFB7rEC49zaJjFNk7LGLfY4iwnndYBizP1gNoDF4J0a6Q4r
         E7fn0HYLHjXN4AVhDUE+I8P8ehDSE3mAAdGnMJG8ChjKyMzI9Vq7dSgv9VGsqg1UEnD7
         LDWjooGoFLd0vJJ1wzHYx2Gw8+PSGviU0BjKINXGnukUq973jQ+yyHBTNKpU+Ov1SAYk
         aWlGi7dtziCc46ArGlvari5qKJnpfMvy3PGbUm1N/z7VmfX2e6EFyg5tO+IL1/b9+Lf/
         9jBAFjhB19KIkaq4MlFM0wTQOLRdMAWnrL9Gn+LMCJ151sXkSScJnJow51ItV0/YSZqP
         SkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734450488; x=1735055288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0mmYM+VbtglGVT88HwKy5Bu24H9an/svIIsHPSJEpQ=;
        b=IUfqdsFw5quUaeC1/cQhlQF2V6hJcdXraj3EhmyToP0PUdyLUw9x97UH5ZbFTuEt9A
         MLaBw4yLrInbRSUcgNk02Rl2Z4JJh70K36BR3D6ticNcLF06E1Xq23K/dWr6tYszhFNb
         s0yVqFTEIkiwvyNJhRXkzc57c6MKldHKG+sTiKGI0+2YOjpbMKxlqIIybcX38VFP2Bv8
         cRC1iDgYOl2J8VxWNdxYxXVrtiJwzeB8QD+3C97VXnglNsasf744DFjWdPlBpL16nCdu
         sP/i2TaMbHRm7f8VR/2iJjxRx69VOsP0dOLq+69WvjO3Wvv/G2x3JR5ZgzUEdSqryEke
         Z9yw==
X-Forwarded-Encrypted: i=1; AJvYcCUSACmIbtYAOTMORdzMkBdwYfWZij7LyGdoM33kS5RnHaEXmZszx/w3KPkzXWfNqizAdtEj5DAqJOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYBPMy3uLJuhkg8Tx6FeN4yYrrzc5EVv3YU/rS327MmhhQGOdE
	IojTp8OoJXFTTzpjJGn2QF50T7FiSxJK4hT+d9392l1w2s+Admw2yxRI6nMBoxg=
X-Gm-Gg: ASbGncuUXas08c0etyoM+wZoUWUhd/1lgWx4swdiFjOjITw/MBfyypCZU4wXPGeOOo3
	maC2p7fhOEKZw0IhEGDgj7dJ/1hVF7E6Cmvz84zc2lScshndvL9KiSmZfEuq8cALCjm4V5WLgI3
	PaaRiBbVn8iMAvn7jNTbPtY+eiv4aMFI+CFianaJX++CbRYwNX/6J9nywz+ylxC4oi4AQtWTO7O
	GBjtCRL1bceGAWBfbjrjJIGqzTGQ2Oifqak/SLf2FgGxs8MO5oZwMsV43pWPoQnLCLaqER0SQ==
X-Google-Smtp-Source: AGHT+IGRz3A2ptnwB7Owk61+AP8XwGp3U+GE+iecH8uI4ib2xQbTKNBFAXxFrfg7epRGuva8qv6lLQ==
X-Received: by 2002:a05:6870:71c4:b0:27c:52a1:f311 with SMTP id 586e51a60fabf-2a3ac96d7cemr8441207fac.42.1734450488663;
        Tue, 17 Dec 2024 07:48:08 -0800 (PST)
Message-ID: <e9045660-8cfa-4cbd-a920-89af4d033aea@linaro.org>
Date: Tue, 17 Dec 2024 09:48:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] include: Cleanups around 'exec/cpu-common.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Paul Durrant <paul@xen.org>,
 Yanan Wang <wangyanan55@huawei.com>, Anton Johansson <anjo@rev.ng>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20241217151305.29196-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241217151305.29196-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/17/24 09:13, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/xen: Remove unnecessary 'exec/cpu-common.h' header
>    system/numa: Remove unnecessary 'exec/cpu-common.h' header
>    system/accel-ops: Remove unnecessary 'exec/cpu-common.h' header

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

