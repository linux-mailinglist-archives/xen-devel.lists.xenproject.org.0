Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA8852FA0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679856.1057602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZr6I-0006yO-JI; Tue, 13 Feb 2024 11:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679856.1057602; Tue, 13 Feb 2024 11:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZr6I-0006w5-G8; Tue, 13 Feb 2024 11:37:22 +0000
Received: by outflank-mailman (input) for mailman id 679856;
 Tue, 13 Feb 2024 11:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oPHc=JW=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rZr6G-0005wr-Q7
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:37:20 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3066ea-ca64-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:37:20 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b28aadb28so2675574f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:37:20 -0800 (PST)
Received: from [192.168.8.23] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 p16-20020adfcc90000000b0033b2497fdaesm9276695wrj.95.2024.02.13.03.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:37:19 -0800 (PST)
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
X-Inumbo-ID: 3f3066ea-ca64-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707824240; x=1708429040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQis1qvp/U8auXJAKP/yrBgCFkOt5KYyAk393lVPOdY=;
        b=A/qaFvjRaEk9VPB003SzkFxMiqXqQF8U5aejURJ8RMLIF62S3dVo13ZocTrddcUH62
         Y9JsKA4yZ6Kh/JfAdt6uayffK59/NPlhbEqo83/sDaFwIIEzJTiAS9vSMGKbScPN2AWH
         kKUGEDHQhWRGgw6uAQazkPohwVEFYOzU7U2kBcPntd6z7HSsoaAed7YhfawYoMRTL7+0
         17558DQNgncwUuoAre6MO59PnVK8rlITo3AvFnx20Sm34ue7lw5M8gqwjbQnNxlxrKCN
         k/WuGBG6kZ7ufRhfpQXYiiT53uiM4OKGhn1fX52g3j1yUMb4XToy2/6WPl8qJusBLQiW
         HEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824240; x=1708429040;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQis1qvp/U8auXJAKP/yrBgCFkOt5KYyAk393lVPOdY=;
        b=V92P9JXmePywvcuj1/xz5ZQpxJepkAOo4BIk4NCj6+wvXKidvCTPKhn3g7d9ZPJ/IT
         MFI4BCpNl5Jh8iiaNcwKP6yD0qtvW4wDraUGUlifIAjJsca1KDokev5FftncTbq5lzox
         Rhni9ZpuBqb/DXT+IYO57APeX8fXUIWmg/ysCmM7Z71tFE59XuRSkTB7J1G5HwlKYBlA
         13Zfrdcnk4l5bwJ15z229pxpbTGCxb6aErSS5mfshBLhS5f0enGv/1F4Sl5DZIQiXqmj
         WqXIJIZMHB7wbffUg0g1Vnluq8Rt/LPvnT3VRCaMl9/wUElFGbgn1U8YPecO8WS3wvB+
         cIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWczQWpPNEnXcy4Ekpvg1hcUvPC8zhmhYMA0aCtCjeytkI6A3/MnJDBdchxJWAkQsNW65HvbAJ0LWVyLbgBZWIBOoNB8ntIl4eQJf7NqN0=
X-Gm-Message-State: AOJu0YywD5ZNkvK/1HqgvCNela6Yy1k7k6v9m5a8bLZM1wdRNNpG6tWe
	0DOieewGWIUSRGRhgbtkYaYPHVdwnWFy+EcDcIw+Ay4TvndIjM0l
X-Google-Smtp-Source: AGHT+IFK4Uezp+NtfTRO82kWqc1JFIQYUrKoKWoO8VA6xRW8Sfp6GwechICHtRD/UhF7cWc5l61FwQ==
X-Received: by 2002:a5d:4a04:0:b0:33b:615a:19b7 with SMTP id m4-20020a5d4a04000000b0033b615a19b7mr6889589wrq.22.1707824239404;
        Tue, 13 Feb 2024 03:37:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYwXCX5Zan6qTGfNR6oFZZAnPtvBVbtDkgy46zuE6MWtOG79IXS1Xg9FMxBxaQ7ljLpjj5Ino1dZ5cTTXXzuRaRgAqN7nfmWbWCawfFsjD3OnIU+f1iKFB4NLJPwLZTuCKBi/Hl5A05/yKAyo/xndTcJhSqOrYindSC8FpLWr0mabO7E0cefKm8+Q9hCr0UdrUP3Any7Pb3YlzFxBMjLm5k9P7Slfu3WToV5gVxzRogu1S//5oFy3GHJRaTUp1wuhbbl0XSif73wXn1ehw4DLDyiU7eRD1jXG34FMDTzKKUw==
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fb3fb0b0-c11e-49a8-9a28-f3d3bb0fb6ee@xen.org>
Date: Tue, 13 Feb 2024 11:37:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH net 1/7] net: fill in MODULE_DESCRIPTION()s for
 xen-netback
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, kuba@kernel.org, davem@davemloft.net,
 pabeni@redhat.com, edumazet@google.com, Wei Liu <wei.liu@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 "moderated list:XEN NETWORK BACKEND DRIVER" <xen-devel@lists.xenproject.org>
References: <20240213112122.404045-1-leitao@debian.org>
 <20240213112122.404045-2-leitao@debian.org>
Organization: Xen Project
In-Reply-To: <20240213112122.404045-2-leitao@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/02/2024 11:21, Breno Leitao wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to the Xen backend network module.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>   drivers/net/xen-netback/netback.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Acked-by: Paul Durrant <paul@xen.org>

> diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
> index fab361a250d6..ef76850d9bcd 100644
> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -1778,5 +1778,6 @@ static void __exit netback_fini(void)
>   }
>   module_exit(netback_fini);
>   
> +MODULE_DESCRIPTION("Xen backend network device module");
>   MODULE_LICENSE("Dual BSD/GPL");
>   MODULE_ALIAS("xen-backend:vif");


