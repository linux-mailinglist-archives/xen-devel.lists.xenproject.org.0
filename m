Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D634A9D5C1
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968755.1358230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Rkg-0007lR-FW; Fri, 25 Apr 2025 22:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968755.1358230; Fri, 25 Apr 2025 22:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Rkg-0007it-CQ; Fri, 25 Apr 2025 22:42:34 +0000
Received: by outflank-mailman (input) for mailman id 968755;
 Fri, 25 Apr 2025 22:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dbVn=XL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1u8Rke-0007ik-26
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:42:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916b6eb1-2226-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 00:42:29 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so21179765e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 15:42:29 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5219sm3545086f8f.27.2025.04.25.15.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:42:28 -0700 (PDT)
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
X-Inumbo-ID: 916b6eb1-2226-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745620949; x=1746225749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2rbLStzN02M5iQRntjfJCOmskoQoKr2a9tppL9dGyE0=;
        b=N3f5oZA5ZwFUu3WyIMpUXUhi47xX9q3L+m066y5p7okRWm2vS8bW275K7CLD4OMEwz
         bjXL0n6FjmSu00fQilNIuFO8m15EF7l0btuqAKVWZqSVJvODPScZPPTegddU1MR5fw3d
         WnDKM9pzt4hSMc2LCTagRk4B1+IZwRMEwQ7ok5SvPiojZ17aKZQhwaRjJ51dw2PbAECt
         U62BLdyDYZnnIdmS+XQal/g6sGrMl7sabJx7EfqHt37L7cVE2OjAevx6caN43Nh2vWRO
         fsJbJjHJQLefIrShgq/GOj76xa1ifXtjMtPcx/BcLjCB2T8sI8o1sz8yHfJVY5a+5Ak0
         wZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745620949; x=1746225749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rbLStzN02M5iQRntjfJCOmskoQoKr2a9tppL9dGyE0=;
        b=VzJ43oLstgPZPDc1C3kRKOWQEm3Mb9u3fYGkNdJLpMRX9hWllNr7k0xjUicA2OHp99
         /jdrYNbEbcFOD74SLBhauYLGgMs31qms4aBvD3RAMiwuO2M7P7zAHvpa+xZ7eB1Aft0o
         b2Jyb44dc81aTeiwTMmIX6inIZS++WmZAhpIpbtNMOjwpc9dhyY4t3xLKEcm6FCzUUIH
         jr8UW/Q66BVZHKmOAhQWm7/3zs8QKlXWPsu7tP5OsH09AHgXrnPv2OCkVoj+wp9t0Zqh
         AsPcxfaAjbQt+Rr4xbhqk1wqrBuwdyl15d1SsH+LcdoNUxNPNgYX0FhaVp8dFIftJP4z
         gSGA==
X-Forwarded-Encrypted: i=1; AJvYcCWHOYh3s/ejvolVlJnFCBAYXehkpxVRjZySLSGbekjg8JczNuiOrbqbKGAH1nBrEJ47AX9x3CSMxBg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUI1YAYGagrpTFL5I4hJPmFNuTzxwkPsSALTsgOqhZeVCzO/w5
	ZQ13G6T0IemwvfJAEKcAbx5pHfcmz1i0Ym6iq6n7gD1J+v8aJytl0wAmpr7irhw=
X-Gm-Gg: ASbGncuDz1oO4NghCh7HiNcmhbdNxAo7SCJ/02iwMrwWcFta5IIgzQXoTo1vGYKUwcC
	ANwyHvUEdgkI8oNusgVvXAds2kkG5l1d6FnfbuDJVwcqwOYnX+xq7Atj6ABfV4yQUyqrK1vYXcX
	zSMVFnF/Ixq1qV5WSR67DxXckqCjB+yoGtnbI0m/Szj7LgHjilA3DMrmMtjauRth+w2FHqmMWck
	mmP5joKhgmVLppWI7+8qo8mbA+4tSlSMaUgWwnNll6OlC+Ry0UJ7Ylx4Wy9iGhjU3YRKfpL3Ez9
	Z4uq7yxTIP7GH/LXLcFEmZtNKRgnvgSNxpCn7mtYJOz6QKiNsdc0onQNaf5h1ksG553Dokw0q4W
	I2ZioFaTnyDxCj/3YlDo=
X-Google-Smtp-Source: AGHT+IHoi60J8kGJuJ4heN3is2CD0TZDRV+KjV20m/nS1r41fnVm46rDJa8MdeTOb/RHs7hxCM5gJg==
X-Received: by 2002:a05:6000:178f:b0:39e:cbf2:e23f with SMTP id ffacd0b85a97d-3a074d8f101mr3552075f8f.0.1745620949191;
        Fri, 25 Apr 2025 15:42:29 -0700 (PDT)
Message-ID: <8a93af10-e921-47b2-a051-e2df03929fe7@linaro.org>
Date: Sat, 26 Apr 2025 00:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] xen: mapcache: Split mapcache_grants by ro and rw
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
References: <20250425143156.204452-1-edgar.iglesias@gmail.com>
 <20250425143156.204452-2-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425143156.204452-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/4/25 16:31, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Today, we don't track write-abiliy in the cache, if a user
> requests a readable mapping followed by a writeable mapping
> on the same page, the second lookup will incorrectly hit
> the readable entry.
> 
> Split mapcache_grants by ro and rw access. Grants will now
> have separate ways in the cache depending on writeability.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


