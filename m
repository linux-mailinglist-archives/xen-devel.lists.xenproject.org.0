Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E88BCB4D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717411.1119593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v47-0003TZ-97; Mon, 06 May 2024 09:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717411.1119593; Mon, 06 May 2024 09:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v47-0003Qw-6J; Mon, 06 May 2024 09:55:23 +0000
Received: by outflank-mailman (input) for mailman id 717411;
 Mon, 06 May 2024 09:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3v45-0003QW-Tg
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:55:21 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04305b3-0b8e-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:55:21 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51f71e4970bso1937915e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:55:21 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b0041aa570bcd3sm19284538wmq.35.2024.05.06.02.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:55:20 -0700 (PDT)
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
X-Inumbo-ID: c04305b3-0b8e-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989321; x=1715594121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGt1PH+8XRnS4VKauyPJDcQu8WqGev12CrWRiGOjLZk=;
        b=vWsJqoDYzHgfs3BZezlYsCQ3phJV9Es0FbmG6MtxsR00EZEFupbkq/zpzajyENhubJ
         SlAEe9Q1rJpqlPNdMU6ZgPpmCcjAyp4Lrm2YWA2sNyvFaF5km2cXVcsrk2ztbSDbsrTm
         J3ayzJqwrnrC96V0pkcWfh8oqLEqCdHKi08CjkPFA4JXVo8wwdDlnxrRv6RseYXPiEro
         LFFdhmmkOMJ3q+hFpEr9TYDe8T7I0svRBQNmQQ0vMCqVQk63ZRRr+pRIJEuKH6qt/Qj1
         nQrkErdiUhZPAZNz9lYT1UT8mQgPt9rxex8PFEIGvIbDa4ehjgAIzwZiiXyYTpoMsxJx
         AHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989321; x=1715594121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGt1PH+8XRnS4VKauyPJDcQu8WqGev12CrWRiGOjLZk=;
        b=QMQ0fyNxgtbtyoZzJ7OgdcIV8HYDP7du4zVteWpQlqxQRNCI908dMCm/VdhyDCIIBm
         gw3M07YGlREx47O6xO4XYKd28ymR4q8AnaNpKx5yelF3ibgcB99w8cQvx0coRLW2O4n+
         QmQ/NsMCQ0jlmlmHEaA43iUyFI+9kPK2f5hu/ib/ctf3A4+0IgLKWgPKkb6vbuMB3Mpu
         1erDZF62zZY/j5g/wvAgzbqNZHuQa/9+RpB0wL0JINVtOnQAWaV4auxeQrBAntBSXCY+
         q0Jl3ZxwyFZh2xaB9e0DZbEemo2RiHK4Hi7cX237PuuuNsjOmggOjbtvUxbe66eKCeMx
         phJA==
X-Forwarded-Encrypted: i=1; AJvYcCX4D26d+QOKZMCA9gdktcR2KxXQtNxcRd/omEkKiTXsPLAUzAHI+zfNJYEf12GrDzls8PzbSkeIRyAHEth39scTjLnY66FBO1nUcTHFwB0=
X-Gm-Message-State: AOJu0YzGMJlAdIBe44ma6rqz8+S3CeJgJ9jpZrRNs3YBIkw0Wowp9NO3
	kxG4Thh2u3rCu9/9txz9+h622UIa9y0WgiaGbr1jAdXY6cOLGiI/QVI0Zus/wp8=
X-Google-Smtp-Source: AGHT+IHTsGsHu6hSDWz3r2Lzee35mbjMEuzTmmAqHLkTQ0LClXys4F43/xSUizKz37UX1rL2+ksRSg==
X-Received: by 2002:ac2:488d:0:b0:517:870b:a13d with SMTP id x13-20020ac2488d000000b00517870ba13dmr7623294lfc.37.1714989320691;
        Mon, 06 May 2024 02:55:20 -0700 (PDT)
Message-ID: <560f1ca7-02b2-4305-a7fe-5d1ed59b1d6c@linaro.org>
Date: Mon, 6 May 2024 11:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] xen: mapcache: Refactor
 xen_invalidate_map_cache_entry_unlocked
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-9-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-9-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add MapCache argument to xen_invalidate_map_cache_entry_unlocked.
> This is in preparation for supporting multiple map caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


