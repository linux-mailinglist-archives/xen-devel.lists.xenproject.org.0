Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71CB500AB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 17:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117147.1463342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvzyN-0005eU-WA; Tue, 09 Sep 2025 15:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117147.1463342; Tue, 09 Sep 2025 15:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvzyN-0005bu-Sp; Tue, 09 Sep 2025 15:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1117147;
 Tue, 09 Sep 2025 15:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvzyM-0005bn-5g
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 15:09:30 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb353283-8d8e-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 17:09:29 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aff0775410eso202213466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 08:09:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783049ee4sm6044366b.18.2025.09.09.08.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 08:09:27 -0700 (PDT)
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
X-Inumbo-ID: fb353283-8d8e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757430568; x=1758035368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9UHydMwrSBctP1oJVoY6Mbc86Lfti206VpuVxs6VsZ8=;
        b=dFacP/XiEFCXIDLSW2Yc7/Y3MNpZXuPn8FNmMsas2R4JL1m8qetzd0unL1MykbJgkk
         V517tDYBRI9R2mdwv/5dFgnI/3FSTuw9oyXqffMYhLkpyfSbPM4Lh0c9IwG0N7PimK8t
         sTisa7f4ikYsNv9dgkN459qG5j8T1ulzvuohA3O0PEv5d6wxbibVyZkOzAaLQpnfBeLS
         jErJVBqCdTsIu0Pwt6i3NB2lfxRym4qs901RvCLM0qTnE7qn+bwkUCkBLtmd4FeCgh3T
         RM0bBu7EW3HkDQFziSO1XNFe3eJidTT3aHX12Izohg53qpLBhiKTmBozP/kQgZ28S0DY
         xrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430568; x=1758035368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UHydMwrSBctP1oJVoY6Mbc86Lfti206VpuVxs6VsZ8=;
        b=UASuSHvA12O4J8tZ0WF+S1yFAwV0/ghSTQIwRu0BeIzPf45lulzzVmlT4aj+urKJva
         rqgoFNws8ubY1U2xcxEfIAnM5Pg8Smjqe41KHa7oJV39jAHD0mmXYpNT/SMi48McuVr8
         yQ1z9IURJhzqf8g4khmgkXXHtiTGVplY2Qc9P+Zpn88Qx9x4My1tCNO5KwjpY9sE2JAE
         hEt6Fs8C25mq9diDAkkZrdUNNRg9olJvU0lmmmoqWhn/FiskqWdPakkEFd68kvL1MUNu
         4hgoCKT13NugaO9MFM6p0Ly9+oSh6zuwuKfI/m4XmiHNqRQs1jCcD2qfhClcZHGg85MR
         uqGQ==
X-Gm-Message-State: AOJu0Yzi/2usPEXYb6gJ1GgnIvBFJNsRKEcw/diJxXj6GG5S103S3Q9F
	D1l9jP1Kr+3fMUy47iJSHv3BWC5OzJaznkMBgAW1RPqq+FnuV3j3X9pxF+JTRJ5bOw==
X-Gm-Gg: ASbGncsBTOvQcP0oRGlEcswGrUP3JcuLQ6pREJNiztd63CE0c5VjAA29CfoYP0vwTO3
	t3DPIZXCQdwkgwzxfKsc6mTQc1XrhiBsNELVaLHvc+PG2ZEyjlRBYKIMfcqrMR1yjcmKoBIQSaT
	uiR8Y2/mE4gbxhKBR/63roclxGtFkrQiL0CLW4F6q1Q/gnSBrdr5WrFyjXVmHOCZ+JrolDnJFiu
	5YVj+Wa/1+6rWRNYYyY6Qhpt6zcXJN5k0uWoueQyf5vjhqCFZNHilH4Jx0kJjSqHnnTTqyvBliZ
	2AV8grP+2GrCtmkuSlhhDEnGDwVKzRhmtVeSrSW2iT891fu1hwnRTQxnDH+CnfN6KqoSNTNTktv
	iAVsqzWVudTD5vq7aXqcFHLbffw/XPpFT3c2mJsDvsd2isrO2da3KkCpZh5fE9T+mhxzM/0y7Jz
	PygNtRFQtbJFRCkE8cieXiYd/J/Gjr
X-Google-Smtp-Source: AGHT+IEOw7rjG/+rECJURORF2MIBSQkwJaJF1/blN8ejW75ahbjZh+QMJDNdITr7z3wE/mN+rdy77g==
X-Received: by 2002:a17:907:7f87:b0:b04:38f2:9060 with SMTP id a640c23a62f3a-b04b1f0d32emr1199078966b.18.1757430568091;
        Tue, 09 Sep 2025 08:09:28 -0700 (PDT)
Message-ID: <f14b3b9c-5646-4517-b3c5-b1eaffddaa0f@suse.com>
Date: Tue, 9 Sep 2025 17:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] efi: Support Shim LoadImage
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
References: <cover.1757421999.git.gerald.elder-vass@cloud.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <cover.1757421999.git.gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2025 16:52, Gerald Elder-Vass wrote:
> Support Shim LoadImage protocol but keep Shim Lock for compatibility
> 
> https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2029800410
> - Saw known unrelated debian-12-x86_64 issue
> 
> Gerald Elder-Vass (1):
>   efi: Support using Shim's LoadImage protocol
> 
> Ross Lagerwall (1):
>   efi: Add a function to check if Secure Boot mode is enabled

You realize that both patches have gone in already, so adjustments need to
be incremental patches now?

Jan

