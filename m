Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E484AA0C8A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972580.1360873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kZb-0005Bx-Qd; Tue, 29 Apr 2025 13:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972580.1360873; Tue, 29 Apr 2025 13:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kZb-00059F-O4; Tue, 29 Apr 2025 13:00:31 +0000
Received: by outflank-mailman (input) for mailman id 972580;
 Tue, 29 Apr 2025 13:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9kZa-000599-98
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:00:30 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea8dd027-24f9-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 15:00:25 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f62ef3c383so11111950a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:00:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f701400565sm7503921a12.26.2025.04.29.06.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:00:24 -0700 (PDT)
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
X-Inumbo-ID: ea8dd027-24f9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745931625; x=1746536425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xfou+qyZv4NtEDASI5ojF0dRYalGofxQacaTzt+4o58=;
        b=VcpkCKfEoVtYVicyP7+oU1yJUZ6BFq+OwrDq+H7u87QbbLGBlECbbs9IvpCkvvlsR4
         YgUrQToR2d2DCOZlTvakGvtuXAIziqWTkvYV3zo5POvwqzkcnhx2ddd5L61nibM3bZMX
         1bc2l7vz26o+8/Efl+2tTioavMSVVFDcoTadLVVfOBtVO2tezpGrxNcMMMrPpKILd0fF
         P+vR7tWgYfTpRUZ6ah8e2sZ2vQN0bNGgEflVBQruHm1eSfFEksEj+s9gg9XXd04uhihh
         9SgZOEg0lpH/VAStF0eXx018zJSkpdD1uOPUb/oxlN/fDzrF4UrM14T1hajKAqu4vR+J
         Tp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745931625; x=1746536425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfou+qyZv4NtEDASI5ojF0dRYalGofxQacaTzt+4o58=;
        b=SVcVQReMwnH1QJ0/Qaq2wgBHN+Ezk84CYaEFbYJRZls9Dss2N7Rz0W4OiIqUEFr1NF
         suXaEmR/HpZ88SjP5Bfp9D8UGrsB1pGlRXKVMPacVihuOPgSJcg9861NtzW7aF9ulPiV
         qaK4w7VgsyoVUVpTJMYLY7qIFq0eiJwfLbk7w/zFPqL2cnTK7sVbtoibKWC72mwzOanR
         Z2U0z9ZJWUcyDzLHqyrHwVaRxOt6EGGS9M6rZgmsx6t1jq3Xrw9453KrxmuqzkZ7KvG8
         B7FBaIuUuMnSqevrSM3OZ/c5FPcEWzJhCtSqvsLGVtrZcvpHJrRGNgXPUOqb4c9oaSKN
         Py2w==
X-Forwarded-Encrypted: i=1; AJvYcCXTtEJL/DAzjnTXnomRMvc/QoWDj5s1fLY4YmMubZW5j6xXZMmF57ooql96aDCwD/LbMnpyQB25r9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybwomUbGVypETAMrfIZ3cVYVh0ZXHeBCES7NiUhWYtOcC6KrOS
	9yX4m66InU5BEEM10ddzBVJcqLNFWdpp6FOwLZFc5rswGjixtIZAqOTMCvjdxA==
X-Gm-Gg: ASbGncuNLcjG1LA4SIY2PFBb5PxtGPJ2GttjoZvI4fuQ0S4vBWoc93PGidtqcohzrKh
	LZa+HIFyskbEXeuilD5+MK7b1ZENp4ySOENqQqRpqTsK5ILplNvmH9o69X9FzETxNIXhsRMLwLM
	g0+SmaejUR0wLBMHX5mMvkLM/r4r1n1I/2XAR51LqHmJBdRH8G00ql+JWnobVzJbKlX2m1xXrtA
	P3Ao7sc70vnBnfqCVeoSNuq57bI/djJo2SN30XwmlM8MDdA7NMFNSvlLORdBFrhhICAdUSnH3+J
	QwSTRTewj2AjIXZTEQNla72hb7HP+DLE4/ootHI/mzHmvHhOcm1cP7rTnkPTNJ/Ea1IbkGIAFHx
	zcjCwuYVSIXWNXuCxx2TxLdF5jQ==
X-Google-Smtp-Source: AGHT+IFv/7NSMNCRuPswxiN/444MKknfqLgZjhmbi2VVUMOwCQG+7/l0SQXCd1wzNTm4RB3x7kkCBg==
X-Received: by 2002:a05:6402:5112:b0:5ed:2762:727a with SMTP id 4fb4d7f45d1cf-5f7395f1b6amr11592191a12.11.1745931625289;
        Tue, 29 Apr 2025 06:00:25 -0700 (PDT)
Message-ID: <418c4232-dfed-4aef-8b9c-7bfad2b30de0@suse.com>
Date: Tue, 29 Apr 2025 15:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] Hyperlaunch device tree for dom0
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
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
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 14:36, Alejandro Vallejo wrote:
> Not very many changes here. Just:
> 
> v5->v6:
>   * Denis' suggestion to rename a few helpers to fdt_*
>   * Change to last patch to only pass CDF_iommu to domains with
>     DOMAIN_CAPS_HARDWARE.
> 
> I _think_ this addresses all feedback I got so far and I don't expect
> anything major remaining before commit.

That's optimistic. I for one didn't even get around looking at v5.

Jan

