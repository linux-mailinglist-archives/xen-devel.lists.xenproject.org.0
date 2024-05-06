Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C288BCB3D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717406.1119574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v2b-0001uY-Oc; Mon, 06 May 2024 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717406.1119574; Mon, 06 May 2024 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v2b-0001sD-Kp; Mon, 06 May 2024 09:53:49 +0000
Received: by outflank-mailman (input) for mailman id 717406;
 Mon, 06 May 2024 09:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3v2Z-0001pw-To
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:53:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 875cd8b5-0b8e-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:53:45 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5592so11550755e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:53:45 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b0041bab13cd60sm19278191wmq.3.2024.05.06.02.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:53:44 -0700 (PDT)
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
X-Inumbo-ID: 875cd8b5-0b8e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989225; x=1715594025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3MXBECi884L5d0aW1y4r22YZZuFnhM5zOy+PcayxA4=;
        b=Q2L/085Lg08gqjXmr+TjunWgxPXsSmiv7dDNJYJipR1M/eXGOL8EDmidrBfMPaf7JI
         XCpYM8kk0OS9vZu96XUvcXbnTUOZBXo8/KyOBn0J4qs00lZUL4a9XbdIRyMTCHhhQ/9n
         DZ7GFrEgsYGHmXQP2CxxmQ5VioP4Xs2UK40W7wBPB/ej+xwpk+4WxHS+F4PD/an6rOWy
         rS/Y05ezWjyz9ATC80Q4dNZMeO+iAwRKn20ar4CuLC7rjRcHFGOQgvZMtaGBaJpCSJ1a
         mrCSTbOB4Jx6BAUWxpG9uv4CZvZ2ykVjEYOledOGUatITUa8QgmbWYfpxpINRhdUYnOD
         fHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989225; x=1715594025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3MXBECi884L5d0aW1y4r22YZZuFnhM5zOy+PcayxA4=;
        b=ftMuvtp8z7DEFKRmqIZBHsF/jfrsuriZ/PVJdiezpD2ONtr+gGz5QuI3TLdPfBonJC
         q6AxBqgwUoaCXyRcSA5CyU95UZ8/5X2LERndmq1k5OB79asRHLLGnpG+KmeWCcN8noe7
         woJh96jVMLkjpzKxF0Fd1HskrsVnO+QfgowudLaxU5INFtU+Z080vXlCco+v70ROKQJB
         6tUjsTI0f9//P9t03VTIeRP/hdRxh+CmT2W5Ka5brbjomES+RVKZtkOm07ED+N0GzM8O
         EDoZyiaBRAWlMOXUzwBIoiWDlV4MWyjuIVH6BlpKUskMKq5tVkFdSZrnp8pXzifR/3pL
         G2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRETgCHUdkUyRYdQI6VbwD398m2zirTjjrU2Ix9JUeiSAUpTTk3Yi53ql+TYJUhH02F4pedKgeXDXLknhnks0v6ec41Q/ojFbciAMtWec=
X-Gm-Message-State: AOJu0YySs7d8Q/KGUecCh/Ucy1cXlOQlVH2g9opKNkfhAgTE5GMeoFPq
	53vpg0QrufrR/At3TNS7La9RRPVtT2t8dxDquVS+nsEBKKr/3YzIKiA0u+KsGFU=
X-Google-Smtp-Source: AGHT+IF16S4BEzauRTbWJC0iDOTjOLBHJaJTfN9M9AvFa6XZRi9Sy9mQaph2LBneCeJ++5YUspTtfQ==
X-Received: by 2002:a05:600c:3150:b0:419:f241:633b with SMTP id h16-20020a05600c315000b00419f241633bmr9657877wmo.8.1714989225374;
        Mon, 06 May 2024 02:53:45 -0700 (PDT)
Message-ID: <c42978d2-cc54-413c-bdba-3d0adf1cc6ab@linaro.org>
Date: Mon, 6 May 2024 11:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] xen: mapcache: Refactor xen_map_cache for
 multi-instance
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-5-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-5-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Make xen_map_cache take a MapCache as argument. This is in
> prepaparation to support multiple map caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 35 ++++++++++++++++++-----------------
>   1 file changed, 18 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


