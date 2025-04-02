Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC396A78BD2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935578.1336955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvC3-0007fG-Ip; Wed, 02 Apr 2025 10:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935578.1336955; Wed, 02 Apr 2025 10:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvC3-0007dD-GA; Wed, 02 Apr 2025 10:19:35 +0000
Received: by outflank-mailman (input) for mailman id 935578;
 Wed, 02 Apr 2025 10:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzvC2-0007Ao-RH
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:19:34 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f891cef5-0fab-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 12:19:33 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so47666665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 03:19:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5eb1d18sm16311355e9.0.2025.04.02.03.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:19:32 -0700 (PDT)
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
X-Inumbo-ID: f891cef5-0fab-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743589173; x=1744193973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ulg30UhRTzM62UfYP0ygnXk7G0G30vo2YuPvJQXX204=;
        b=s5ZWxE34BH0miCxufa62EmLktlX/BtPcMRZQZ2twaxY48S0s506ELQvPA4LePscclx
         ddSskoMjXhhENR+BjLgpP6/2U+j/dFM6yy89JbHUgLH4s8nDCAWEMFg3rtpKHhl4Q7Ho
         9zTjJX54kfrBEwwmI/rbHRlptoh6Xb053SV/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589173; x=1744193973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulg30UhRTzM62UfYP0ygnXk7G0G30vo2YuPvJQXX204=;
        b=OAtZM+kn75LbVIarCCkVwgxT/L7cAmBRQh6h2xnUgPbXPHwQiuKWcj0kw0qugLhVJ5
         46fpE1FiRO5Y5895aw2Q4BAdBQEuHumcW/RSDuWwyUhqX0zAYGCKcUObldZ+zZI/vext
         k1CXQAzroJOs7mGyN7qMVALsxCM/SV+vet9HMQKKfQApBD5fViHj7Ycm8cw3MHha+sWH
         dBdFXc5rXtPqDMTKdXDKoemEq9U+0zXCKkSHO+7V81icpFEi61JFiQjAi1D20dJlTar/
         MzIQuzepJ6O8FvjoHzRy1wjn4ukpdNq0rbhOrTxuN9NpmXj3wg3tWfFhyj/YF+SvmXDU
         bhcg==
X-Forwarded-Encrypted: i=1; AJvYcCWIHHqkP7apetrVS5W2z3F3Ju44VzElrmJjIeiBVAjy7OkH+PpBDqzUeTwrBQ5lDguz8fP2wSV4f+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu4dp2rXAvte/8rVGxfOUKysLg1KKRUdz2hSwvhIOvp/JQDPmF
	hWJe93lMk/naclVsfD3/Vg6eOYlhbX/MRYz6lD9YrkzN68A1GSOjoNY6HYIsKpc=
X-Gm-Gg: ASbGncujAYEZVep5kZtbs8LVv23R3QhAJ+EG2sr01Yycg8nVwQ6sN6QZFrHnV45d+Br
	jb18QX5aTTdpevL7jP40qmw3MdlAIkIqj5cpVgQVRkJONsTzZAl0xJVzsohihwHa3p2g7/75as6
	vt7DTBuS5pBL/YdFSIrD7LE8BvsD1wjZ1MLo+2NBKhvoPUVqsf25EhQDOrSZBCEQN9Z4wgR++mA
	mAcLxxS38Lzhv6nBMbubx1XkIhyp0UwQjKdkvz8Zf8/BNFbXadOPWBiE2EsKkGTiVvqGfnOC0Zc
	DaJdSeHqsIgp/BovTIHztwPtHQUsoidJkWrACBh0bIJ6CcQ879J47rv/m9dNUEQ7Jef+dp5Or+8
	YzuG97WnBPg==
X-Google-Smtp-Source: AGHT+IERsyIDDfCxT9SIRQbk9RPjRIe9HQ+Meiw9KR/qFjUijQlvc1q/VD4LGK8JFhKp+di6yhwANg==
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43db61b52e5mr172264565e9.2.1743589172800;
        Wed, 02 Apr 2025 03:19:32 -0700 (PDT)
Message-ID: <89f85f1a-3e09-42cb-babb-b8faff687a73@citrix.com>
Date: Wed, 2 Apr 2025 11:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Include xen/vmap.h in mm.c
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250402101013.220310-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250402101013.220310-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 11:10 am, Michal Orzel wrote:
> As reported by ECLAIR scan, MISRA requires declaration to be visible
> (R8.4). This is not the case for ioremap().
>
> Fixes: 2cd02c27d327 ("arm/mpu: Implement stubs for ioremap_attr on MPU")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

