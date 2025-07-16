Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771ABB06E6B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044854.1414883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubw9e-0001pU-4w; Wed, 16 Jul 2025 07:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044854.1414883; Wed, 16 Jul 2025 07:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubw9e-0001mb-1v; Wed, 16 Jul 2025 07:02:14 +0000
Received: by outflank-mailman (input) for mailman id 1044854;
 Wed, 16 Jul 2025 07:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubw9c-0001mV-9e
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:02:12 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf01d63-6212-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:02:10 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4689688f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 00:02:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f2a2549sm811747a91.42.2025.07.16.00.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 00:02:09 -0700 (PDT)
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
X-Inumbo-ID: caf01d63-6212-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752649330; x=1753254130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5TKArfb607cXs268gasBSZ38f4IEot460N/YWEr+Vng=;
        b=GYDVwRwqm0d2vPSq2YIcH5T0XicLRwp/BjrxolpOpc98UstIwAo0UF5OSPCisE8ufP
         BVL6CV17FlhaZQ6HW6+Tag5e/XEL4FWfNVmibq3BKjrdJOPvcoJzrVa1peZ3EFpUese3
         7EwpSZw1gYGXEWc8dW8R8VfZIxGmo9PoKo+bwU4ZenSRL2SSB2N/QJuNWbwwrbdMWoLz
         4NyyNRinKf18UrAuWG4ELLO9+ZKXF/uCE1N403NhIVTaS9v5R1sNzRpCAtRLnE71cCE8
         i3Bv2x5TsCjcn6ehhkg3pDD9CmzFDQADKSfgyu3FCsICquVFhXsjAFCQoU2Y+hfvAsgg
         kt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752649330; x=1753254130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TKArfb607cXs268gasBSZ38f4IEot460N/YWEr+Vng=;
        b=IBdcYf0o1I5i87iLujaewG8ViqibLHWmMuGWQsunq94AKbMa0ps86ZcAM6zHvIIXoS
         PwRJF/P+bo4bNg0bG+8YeV6ELCd12d1dPEPwShkFIwdoPUGXR8UfclyPfuWoFPBzGF3j
         Sn0woW1+8EJ66xhqrB2dBiOBPIGcfil/6YtHrDkHr2RMSX3vhsVJmbMkONj0f/jhrXbe
         3uxYeUScohuxGlISW4/lhLNrWfnpZSPL+racBHYK07OwNUxrZLCabNrwD0FQOkZvLoc9
         ojgcseExRDtl6MkzH9hCGvw0XGEs7iuKNzYZchWCrC2914AtadYOXNCwAzTN3O54qZmo
         ZtIg==
X-Gm-Message-State: AOJu0Yzrhs9zy37TM+lhlSDpI+RlSqa7DyUFSdAVSohD7YYj8sFrgEQ/
	dZEpT4wLwGJBj6qW0FX98wy5SgIyefNMEQ63L2M6wxFK5o8Q0s78Klhfn9d2lmXAkg==
X-Gm-Gg: ASbGncsRu8DzXo3+mePwfek5Fkk18wG63ZC53ie2fW0B0vN0NaotPqjceX3Mlgygfu/
	r69E0rUb8W5VJQ1G4gugMDbA86iOs3W0Ie6BPYRShKc1D9yoH88uZ0Uh85zEeV4zFjPLwK8o7n2
	nr9oVXVzuhlPkJRAPQvITTveFiUru1Rt8oxmQaAMih7wwME9W5VfcI65nSVix+jVM6kCTgmCgrs
	M5FwqNtTHWVPZtkVDIvT/Mxnu/xvjAjaPhre1XEhuFjD9GAGCpEZHMGUOYkrzmi3GOqXRU6eYS0
	rjbCNOJT/vxG+eGi71ckLB6ecF3DdsTjXmaRl3lGAO8Vm7VIKlJcUr9H+lOJsqxHTHapQpmY6l2
	jTRujIdqMhhpM4+ndpzIvRnkSJilcSreVLVOLzRR5OK1Yj7qCRr92aDG22bZm1twuGKQRs3+B1N
	lhYWXmpcU=
X-Google-Smtp-Source: AGHT+IFhwY9g7bwUaVfePAU3FOfbGN9SkysZFKpuw80jNZH4RS1IERHlXq54FFYFFpZgz1sAQj/8Mw==
X-Received: by 2002:a05:6000:4619:b0:3a4:fc07:f453 with SMTP id ffacd0b85a97d-3b60e4b8592mr813624f8f.8.1752649329872;
        Wed, 16 Jul 2025 00:02:09 -0700 (PDT)
Message-ID: <4df052eb-1757-488c-ae8a-3a9cc2c38a49@suse.com>
Date: Wed, 16 Jul 2025 09:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] xen: introduce CONFIG_SYSCTL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2507151823170.15546@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507151823170.15546@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 03:24, Stefano Stabellini wrote:
> Heads up, I intend to commit this series shortly as it has been
> thoroughly reviewed by multiple people and has been on the list for a
> long time now.

I would have already committed it if it had all necessary acks. XSM ones
in particular are missing.

Jan

