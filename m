Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E625E9F8144
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 18:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861387.1273310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOK3S-0005yN-Ci; Thu, 19 Dec 2024 17:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861387.1273310; Thu, 19 Dec 2024 17:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOK3S-0005w2-9q; Thu, 19 Dec 2024 17:11:18 +0000
Received: by outflank-mailman (input) for mailman id 861387;
 Thu, 19 Dec 2024 17:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGg9=TM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tOK3R-0005vw-2O
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 17:11:17 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40f75467-be2c-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 18:11:15 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3862df95f92so616155f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 09:11:15 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656af6c5bsm56868735e9.2.2024.12.19.09.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 09:11:14 -0800 (PST)
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
X-Inumbo-ID: 40f75467-be2c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734628274; x=1735233074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBkyLcSf+GGjx0/wEp5sNI3G9o82r4z7VP+tvGX1FFs=;
        b=p3XRUtXz5swqiBi8f3ySKX/uZTFSo3nEHKOLgYUrkLOGFIcLoQX4RrZjJ4wFb+0INg
         EVyx2995LV/Sn9s9GyqDrpN+3dELziNjwtvPO3Ubt3lRfYT2CuU54QectX2fm8hTtPs2
         OoL/wGq+wXXhV4RrzECY39rkG5+lPKaRGNcL7ecZ65P3g4218LAS5+ZrFW7GgdxhiV8F
         IyxavF0xHSLaWbZ9ZO6VltjQGXq/5dw8P2SjOy411A7R2tl16uOEbQFNf5Q2jKpFyqnq
         /3uU2yepNedE4dyG5GAjMogt+ja9NbqCypN5jNKtKkC5tk5VviPlL8TGmjtgWEvGjcNQ
         twzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734628274; x=1735233074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBkyLcSf+GGjx0/wEp5sNI3G9o82r4z7VP+tvGX1FFs=;
        b=u7ldkuhU3WJUQYzTB/H/E5qUlqJG0FYm3/FQLlQdkyT3LciDQv6lH4bLR+XjgGFZcL
         YKZS6ON7DSSpUFjYph2mfEglcqQ6ZyXsmJ/F/wgBjwXuxgnnpn8WWhFLIuAxOgYuFMci
         eRyFjlkbV1bCFnn2DHP4BpvXF++K7/YqfSoaRU/VbuQuvNqE08xjdfJ/JVu9r0JRqoFE
         jFgU+RdP+3NFua86g0qdxVNN+JeLcbgUMAcxxXoroVvH+J/V2xSQNmxFRrAgDCBYZzd8
         1z3nNR5sUnosl2Cwc9wCRtO1UwKwYhP9kqQL9eipUhAQg70azcpaDuAzgOlkxfdsfvLQ
         CAkA==
X-Forwarded-Encrypted: i=1; AJvYcCXhCRuWIHxNoOeo2xe+YJcczaP0lGCBiGyD5wgmlp/9pNMeP1fQHN5t00taoIz0+h7gcdw9HxwNe3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl9o6fA0hxGBm52uxX4mM3IxfRDLDbQcNXzo2sHJJ4QhDLpziV
	oqWGYZ4xqcJ7/PZg77w7G2I7GWH+7yxuAlKQ0LXxsv4iNaWb5ImxjM1nss1inoI=
X-Gm-Gg: ASbGnctgrBmLAXV5RyvNGcH0HRqh16m7QOvGTv5rXhtelDPG7hDGBn+agrVkGlyNXo/
	qYpZxJ94yXwSirWBRc1VSZEFbCSuSYcZAsKqidjC7ZTCE2SpTUy6rpJBeG7wRLRr87HUFzTR4Tm
	9k48WQV8vwVY1IRm59hN4/Iu8QBVLBljjCg09TFqrfUj64SGF53Dx1b/EW9/3NTT7O/j3HHqu4r
	oaBZ45zFyIE89cNpvczN4r0FI3xH6JQBvLQFsLIHeqBGzmyq9o0ulvnVih8urleFUu2hUM=
X-Google-Smtp-Source: AGHT+IHpT4Cngp0M8WEaFs5xmzjkRHwEThdLD+vf8y+j4IJr4Ju/MTBQiPksoiGJOn+hCcIMUHT/9Q==
X-Received: by 2002:a5d:5846:0:b0:385:f417:ee3d with SMTP id ffacd0b85a97d-388e4d86e8amr7323979f8f.35.1734628274513;
        Thu, 19 Dec 2024 09:11:14 -0800 (PST)
Message-ID: <7f4b7cc0-a012-4243-a3bc-c678688f5ece@linaro.org>
Date: Thu, 19 Dec 2024 18:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] include: Cleanups around 'exec/cpu-common.h' header
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Anton Johansson <anjo@rev.ng>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20241217151305.29196-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241217151305.29196-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/24 16:13, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (3):
>    hw/xen: Remove unnecessary 'exec/cpu-common.h' header
>    system/numa: Remove unnecessary 'exec/cpu-common.h' header
>    system/accel-ops: Remove unnecessary 'exec/cpu-common.h' header

Series queued.


