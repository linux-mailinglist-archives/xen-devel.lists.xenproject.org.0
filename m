Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC672B053E6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043690.1413699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaa0-00027j-Lg; Tue, 15 Jul 2025 08:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043690.1413699; Tue, 15 Jul 2025 08:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaa0-00025q-IP; Tue, 15 Jul 2025 08:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1043690;
 Tue, 15 Jul 2025 07:59:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubaZz-00025K-Ob
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:59:59 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b352bdaa-6151-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:59:57 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2828890f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:59:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3eb65aa2sm12364096a91.40.2025.07.15.00.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 00:59:56 -0700 (PDT)
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
X-Inumbo-ID: b352bdaa-6151-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752566397; x=1753171197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0yo0rAq1LtImAGA6pApoGSXEuxsSM+2o8qdnxOi6QaI=;
        b=ZSg65K/ed0z0HVyu3k4ZqUo+yMrC9ePsPEfvrPHSwIrAet9jvAret/vuMrvHPLXrsd
         cghygv5aYhVtiY5vZsQ8Z8etfTZxcvGLB7PHOnAQnoO3neEu9WD2OK4V8TAWSGGESnPh
         Kf9B0DkOdplSkzwygg0Uk2avcny+geTMjvylatQDKWEq8lg53Ly4Eu3IJQUTMM7Hz05i
         95GTJKlh9VaR2PxlTShBj3IjV70aFKNp8cOr+QkKoxa6X7048jqU2kX8uhw+5AJLe4l7
         wPOlUFOnq+lD/1qthtcAaNedlDMg4XPNaBTP9Hl6TzhGYbLTDo3tZoIanrQ80Uw1gixG
         VyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566397; x=1753171197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yo0rAq1LtImAGA6pApoGSXEuxsSM+2o8qdnxOi6QaI=;
        b=YmlqRe+c4EUExB5qceAT8+GROUuTYwyPjHXa3fsdxq1C4Sp1fuWbB0IWR2S0UY0+28
         Ab+8jUbVWzgm7Q0bM/tCSsFjkN2by0PUdTKj0YKxi0/flHVO2cMaKp4CPF+gDdGu8xrf
         PtN+5A33hZ60olSUKoU5rX62XcL6vrthH/j2VH/NarBasaLRgFKO9Cuys/7rOIOoNveq
         qIR65gFBqkbVDPMxz8/cX/9+pG3jYgmWq4m1z7zuNdHrxt2M2sifgPXui0pS4LXcu9Af
         9DsLaN4jmZ6NrQC39iX3Tm4U2jb/X2Lmusxg7rycq2aDMkKBZ/ZpQ0ZYU7d3bHKS2vfH
         2u+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvHzf1OhHoIe/MHYwqwW46DE9EVvgl7XT4cirdyXS0ZRog9ntuzFk9sIVc90DMkPlmb3U6Sh8u0lI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyk6Y21u0eb1b4mgmlL9mT42HPZ+M38hFli0lGXbeOvsjTA3Hai
	SZIQEv7CiA4g0BOv/4zon1ti8k/vI+8YciqK8yCRo/hqFJiY7H0V7ieG9Mh2rEfJgw==
X-Gm-Gg: ASbGnctXpqkYOCybawa7wYlwWz9qdGQdwycRGU7msTWM+6YkSr26MS28bVg074mp+Vv
	uaChMyCYfcfdNQ2EyYXlWTgqhkn11NFDes9MnzsapmbvLv6JQOErbU73IXqXDVcVz4DMT9n6RRL
	Unyv2whSwF80LFzVuWw6V/uI8lcPyQ+4cjtFoqtYzk5B8TB0EDWCyacmrDQD1DRKbvD2DkDMynQ
	D3V1nVSxIBPYjp7fqSJKST+87QvV/RRisM2tBX9fY5GOouOYzL1KMcmT6BjDPxuyxbK4e1ilSI1
	rDTXjyxPu8Yrm6HVFlZ7qHlzS18Jb0NiN7rBYvnK1qE2aTFHVDI1kzWy73EddWk73eldS4U138R
	QcxF4KrSvRE7RqTbFgVw60TmAdPD7usB78N7z9BH/OQh0TeqNDjQRePncxtqzjXR6Bxn7i3lomr
	lQLHgRohw=
X-Google-Smtp-Source: AGHT+IGRGESQEzYx9TPVhr/HDGTEVidBpIiNGR/gY65+uY7ZG1dz5PlL72TTlRr3M5vpES+sCK4gjw==
X-Received: by 2002:a05:6000:250d:b0:3b5:e07f:9442 with SMTP id ffacd0b85a97d-3b60953f674mr1941820f8f.19.1752566397194;
        Tue, 15 Jul 2025 00:59:57 -0700 (PDT)
Message-ID: <85729f0c-e924-4e8d-9f57-faaeee9465bb@suse.com>
Date: Tue, 15 Jul 2025 09:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1752531797.git.w1benny@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 00:48, Petr Beneš wrote:
> Petr Beneš (7):
>   xen: Refactor altp2m options into a structured format
>   tools/xl: Add altp2m_count parameter
>   docs/man: Add altp2m_count parameter to the xl.cfg manual
>   xen: Make the maximum number of altp2m views configurable for x86
>   tools/libxl: Activate the altp2m_count feature
>   xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
>     == 0
>   tools/ocaml: Add altp2m_count parameter

Please can you post new versions as applicable to present staging? The first
three of these patches were committed a week ago.

Jan

