Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DE90C845
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 13:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742983.1149870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWc1-0002DI-Pn; Tue, 18 Jun 2024 11:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742983.1149870; Tue, 18 Jun 2024 11:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWc1-0002A8-Mx; Tue, 18 Jun 2024 11:02:53 +0000
Received: by outflank-mailman (input) for mailman id 742983;
 Tue, 18 Jun 2024 11:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ol3=NU=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sJWc0-0002A2-0k
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 11:02:52 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de4933f-2d62-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 13:02:51 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so623618366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 04:02:51 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed357asm610564366b.125.2024.06.18.04.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:02:49 -0700 (PDT)
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
X-Inumbo-ID: 4de4933f-2d62-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708570; x=1719313370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcgha9EMwGFy4GfTwIT+dAmK/I6ZbD/6U8eKBQbvJxE=;
        b=euCUT5BA+n/shshXZwJCKoSPPnSu5EqXscw/0sSa4PLyzQ94cW5qvBtyPdW1t7iBHH
         zI3iy0Pjf/tnB5si9H7r3HajUQ/h435MThHb0Myw771A6v78ZERdPLsHfuTDlElzd+1Y
         tQqkIQp5EAV0XD2whPlrSgt9k5B8lztpyTHLR5MX6S9WPXeWSxqwGyHLkbAfORCgJEGC
         4vf+iyaG0U+nzrtq1RpcKXkvYF+wv+0YNoiMmjRsqCcdv/88MascGo/QF8fQpWi62kwF
         y6jUjpJpoTdmmHWNyE5f002/LfBtkqfUENDE66kFk2HQG5XpeXMtE/vsLh3jcXD9bQIV
         KMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708570; x=1719313370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcgha9EMwGFy4GfTwIT+dAmK/I6ZbD/6U8eKBQbvJxE=;
        b=cbjLi1mAiZoMqP6QBD4whB3Nrq6rosooN1MoCs7dF303lepg95VCX8O9vQm/WHlnwZ
         Ow0P4dgNYBqnj9rHwFqdMZEYIBu/GWr8Zk4sqrrUGQxwKA4C9Ho9sNyW69Cw5yL6w6dB
         5pER7z/wBVSR9Gjnfwj0oF2AswVphFg2BAr7B6Oj2wZH3tpT6YEDPdXfvOcuiQeoB4Dk
         DM2MuiI1o9cSdykIt2QbPMGVtNs/XnV5cb6Ua6fEpWjW1J0xThQFhvQp+fI8m+QBLl30
         Y1P2mj4z00RYisPGPD+EpWHfM6w57WMRARFxVceyBTFEso7mgFnt9CP9zaMdIC/AC8D/
         Cabg==
X-Forwarded-Encrypted: i=1; AJvYcCW+bd1TuSFLOCayp5YCE3hTWyXvDu0BHiIt+BBCSqJxrXQ8c6XjGYYn6GC1o07dQJxc0WOyevUUAHFjpNymxyAl0/3fDIJF3RfDalDcGtg=
X-Gm-Message-State: AOJu0YwrdyOldv65iZukQmZVS0LJRrkWalG2wYYQn6MrQ8oQ6YTzgRSK
	uFaDi/TOptG+GCHCshdxYVDc01guU3A3+qV2BXlkNvBveUkAKgsNK3uf7tgYKOM=
X-Google-Smtp-Source: AGHT+IGZiB4TOusLWVX3ERf9zLJVoY4WNAK84tTxY7ZKm/36Wvr4gkTfJHbEnLonioHVYesTa7/8zw==
X-Received: by 2002:a17:907:c283:b0:a6f:815f:16d8 with SMTP id a640c23a62f3a-a6f815f17ccmr459067366b.7.1718708570402;
        Tue, 18 Jun 2024 04:02:50 -0700 (PDT)
Message-ID: <aba83790-fec2-498d-a0b6-4ea01a1893fb@linaro.org>
Date: Tue, 18 Jun 2024 13:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ui+display: rename is_placeholder() ->
 surface_is_placeholder()
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony@xenproject.org>
References: <20240605131444.797896-1-kraxel@redhat.com>
 <20240605131444.797896-3-kraxel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240605131444.797896-3-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/24 15:14, Gerd Hoffmann wrote:
> No functional change.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/ui/surface.h | 2 +-
>   ui/console.c         | 2 +-
>   ui/sdl2-2d.c         | 2 +-
>   ui/sdl2-gl.c         | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


