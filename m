Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B4AF6408
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 23:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031562.1405383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX51v-0001WP-J0; Wed, 02 Jul 2025 21:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031562.1405383; Wed, 02 Jul 2025 21:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX51v-0001TE-Fj; Wed, 02 Jul 2025 21:30:11 +0000
Received: by outflank-mailman (input) for mailman id 1031562;
 Wed, 02 Jul 2025 21:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFEm=ZP=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1uX51u-0008Uo-1k
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 21:30:10 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9951ed8-578b-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 23:30:08 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-23636167b30so46267265ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 14:30:08 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da845sm13498733a12.53.2025.07.02.14.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:30:06 -0700 (PDT)
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
X-Inumbo-ID: b9951ed8-578b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751491807; x=1752096607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZehWfMyIfkq6yTIuw9X1Gv3CLzMTYrvvswzJWpiCog=;
        b=sF9FghDSFG9LdMmsw1SP8QqalqAoOBn2oTlnbkRRC86wfYmn4Q5P269MfMl4nyMqD5
         24BkWFwM4YmfrzWiRgOg4pfHG8U52dAiuryBWgjgo6eRTmDmoESQuLxMuPVWeIu7TTBo
         dtfwD/82rQwW2YYTRsqaxjfTuA6x9+f8E6QXl3g3AeObLy4x1mI+endStuDM8huGRNMg
         1Nq0+WeOQXONxfoLh+kukfjpGG5m5I7SCWXpTD8oJfd5aE1jxnfa8t75hqPrnLrF+LXZ
         2svqLX2W5+F4X8QjrvxVI5k6HBh3RT0Cf+qBCVmQpw1KVVjn63f4lDYa7zLe0JLR7Bj6
         RO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751491807; x=1752096607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZehWfMyIfkq6yTIuw9X1Gv3CLzMTYrvvswzJWpiCog=;
        b=mIANhPwJ5Jm6gVlnDpChBZoOzAJIsAzIPxBDs62TnyqQlsnkvc3XzDK1xLHes027px
         LPTx58UU2nD63udFc4A8vEalwQt1S4imlALTJTpdteT6/MKawateiYrB4WzeCd/cKBUF
         Jl0Db4TFJXWvGaHwIuorQaedeoa6F/a3QrJk2UTfLwjLFCT8uKlp5qtdMIjL+PH1SRmu
         iYa8kKrKw3KKh0ioZpaJxP0l6DB8yWfZhqUFD/cHCfI/ljo/6468mUUGZS3pmw53v+Dc
         jghflz0ohLOu5xX4EtFiXLs99LJYe8wan8FbIsMTKRV37pfvfLzRYUE2oGYOFIP+kFn4
         GSlA==
X-Forwarded-Encrypted: i=1; AJvYcCVakZ+3RCljR/bRnTZs1f/+yOX3zHrd1dEgcECihAZxhctPgx8c0Yg1kpIWOSs3IIDazM5Y6amQ3FQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFXl0jDsBe6/ovCwejMgAgbn4S4fJ8AdSyBLjUZvBw2hvH7e5p
	uamaJ2rVZy2nxDhWWFPrZJ0QrcVB5g12V6TaoQ90gagwrRAFWR+81OFvdhUWAn+BgHg=
X-Gm-Gg: ASbGnctiohjojg/lPI3jU/ptf0RN12x3jow8QRzAR8HLGDO6tjIjOZqXab51QRLtYKe
	hpM1rMSoUrA2UJM7LueMqzv6EJGEYa6o3JbtXoyEWAKxRbHAGj3jFdB/+OanJnSnL7+NBUuh4rd
	yot9rUroxaKjZNzzbTcBfAy1rBPK+wtTGJ894uC+Eq9ATf8+LDWbuoDbcd19sf5lhjl6XQOgIOa
	xWCG5TdjRuZmd+7rOtPA+Mb+H7SZkfgN1Cwm6e4YvHTqYkxYm7ljqpYFkf3SqtKvX1MyhZjjqhW
	2DQE9k1rh09TTSc4L4EnRlADraODJv1WnOC3TPG1HTiJI+ZTLJbKCAGKMPeRVJ9esFkQkOvD8S8
	=
X-Google-Smtp-Source: AGHT+IG9no+Unkyg/FYILPO1RDG3pnFNTZHuoOP0I7KlSIk1kl7bNstbmqliucHtTcpqKD2VVL5JCg==
X-Received: by 2002:a17:903:238a:b0:235:6f7:b918 with SMTP id d9443c01a7336-23c797a85a4mr15391395ad.28.1751491806805;
        Wed, 02 Jul 2025 14:30:06 -0700 (PDT)
Message-ID: <ec12909f-4a74-413f-a600-2882b67d09df@linaro.org>
Date: Wed, 2 Jul 2025 14:30:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 59/65] accel: Always register
 AccelOpsClass::get_virtual_clock() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-60-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250702185332.43650-60-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/25 11:53 AM, Philippe Mathieu-Daudé wrote:
> In order to dispatch over AccelOpsClass::get_virtual_clock(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_virtual_clock() mandatory.
> Register the default cpus_kick_thread() for each accelerator.

Same same.

>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/accel-ops.h        | 2 ++
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/tcg/tcg-accel-ops.c         | 2 ++
>   accel/xen/xen-all.c               | 1 +
>   system/cpus.c                     | 7 ++++---
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   8 files changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


