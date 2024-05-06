Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB558BCBDF
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717468.1119783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vTB-0002b0-Hr; Mon, 06 May 2024 10:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717468.1119783; Mon, 06 May 2024 10:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vTB-0002Z6-F1; Mon, 06 May 2024 10:21:17 +0000
Received: by outflank-mailman (input) for mailman id 717468;
 Mon, 06 May 2024 10:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3vT9-0002Z0-UO
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:21:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d95d9e6-0b92-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:21:13 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34e663aa217so1434917f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:21:13 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b0034dc2f96ed9sm10310991wrp.89.2024.05.06.03.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 03:21:12 -0700 (PDT)
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
X-Inumbo-ID: 5d95d9e6-0b92-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714990873; x=1715595673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRWhy3FvEBWh75I4fZPH9hqvwRcqSer8jaFzZFu5XCA=;
        b=axXKjUgHBkWOWlI3QhaMBFoqahKJSIjHZ/b7b4d4yHkMnDeC3VqrDP6E3lWSC8uHmh
         S+N0Aw9IwgirmzYskZuiQ1EJDNco1fLwSNP0WBXLvE2ZeKE1+25lrWMoeZ8vBpKaqdnz
         /sOzwx/Ga1jxEk7UXmhct6jukVPlJNiCChyUdNnhANPbhCJUyGjT2fnlZBEbCPc87wVc
         BjPbNq3RPkynvRi1GUOF4DYOnqXqV4hUr10Jvd5mAbLYfaoiG6XD/tR1GY/3bACX/Mau
         Vw7ndu9qKjhUM72JN1/RbQWJpA5Da/SMI3ER3eri6U9/KaXlkEjX28R3aU4VkuLPGrgC
         7Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990873; x=1715595673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRWhy3FvEBWh75I4fZPH9hqvwRcqSer8jaFzZFu5XCA=;
        b=pHq/30A6hVpVsMKBY7ZiY1pDhQOmmyN8Ixkf7BUQqIfN+ytFYbM3+oFC+OJRaFghET
         uaXwN6/9i+msbw+xUFw8v808FivmiXbV7cT/m1p3w8jXcou5nr35tz3W1oeRwgOVfZL1
         Ta9XauutbP0f1Q/qeFSVQaiC4F5Eo30p69SdGAQWJFDRq+tCIaCh4ViTDc8beT2SkCsA
         qeKXD7YN7gRf/WsALZ6EP89xDXcD+WrUdqEBEhsIn1g6G56H//5nuUR77olTQ6lEFOMK
         EVKnhPwTqmThxCo5e5NpCSkrUlRwA4s8o951zdUV/lw6b0vJx/mMML4QWqCc+kO1c/r9
         tiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCViQ4XohFvC+85ul2546CwRus5gdU1ds3D+VBdKjwJVvMoKdOBYy2MO8W453rDV7l12pIntImiXHR2eQoNXOEG0BD6n56E9fxICixHhViM=
X-Gm-Message-State: AOJu0YxaxGq3i9aJ0ey4tHlK4dZngFdmMuv2b6CW6xb0NpBETvgoz9Xh
	d8ExGL/x/crbyPnjaboWJVIviQRpFeWtVw5aAo07suYAif15Q6WD32OuoIbBw8c=
X-Google-Smtp-Source: AGHT+IGt5MWUOqpRv+5GL6b8+MuIpkcuA5UrQZ8tXaEGWG6Fd1RBPPz/jWQxP3k8yGeKShKeyH9v4A==
X-Received: by 2002:a5d:6449:0:b0:34c:97e7:af6c with SMTP id d9-20020a5d6449000000b0034c97e7af6cmr6958400wrw.59.1714990873099;
        Mon, 06 May 2024 03:21:13 -0700 (PDT)
Message-ID: <43dbec7b-1a84-4d7d-a151-65a348277961@linaro.org>
Date: Mon, 6 May 2024 12:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] xen: mapcache: Break out
 xen_invalidate_map_cache_single()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-10-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-10-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out xen_invalidate_map_cache_single().
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


