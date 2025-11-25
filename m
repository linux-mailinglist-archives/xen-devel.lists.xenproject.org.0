Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A25C859C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 16:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171986.1497061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuY0-0001LT-BE; Tue, 25 Nov 2025 15:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171986.1497061; Tue, 25 Nov 2025 15:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuY0-0001Ju-8M; Tue, 25 Nov 2025 15:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1171986;
 Tue, 25 Nov 2025 15:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNuXy-0001Gz-VH
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:01:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37f10b3-ca0f-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 16:01:36 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso42188515e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 07:01:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f363e4sm35344657f8f.12.2025.11.25.07.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:01:35 -0800 (PST)
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
X-Inumbo-ID: a37f10b3-ca0f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764082896; x=1764687696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=plOaXaLf+LQ/Hn3OZU9Kf3fRydw3SIPd1Z7mf+G1RYM=;
        b=alSt+m9mKkhpii0k30R57albQAUUoIqGlwRCVrztWMwP8WVi6zCco6l5ZbrUV5qBCK
         KyLa+xma77zczmOPgBuRHygxSHETyi87/01oQbcGmD3BqAbc/0BE/x3UQ5bmJe7cpefl
         YGFXrRJwNAp7cpns8jdauxW+Nh8ddjCguJOh04mgTjh9nny9rtoDN5LY6C4IstRM/sA1
         2jh9wC4mOTMTKHD41e3JId9CtPvCB9gLw8pFwKKELx3ujJBUaMsrh5JXhf+5SX5iv2Jn
         f1yTqiGPw+yvDD+16SxAj/8t1sBPYmCHk32yr0zxkGiocyj5cF4H5l0DzK0k5XxDaA7h
         z3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082896; x=1764687696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plOaXaLf+LQ/Hn3OZU9Kf3fRydw3SIPd1Z7mf+G1RYM=;
        b=GZWRcYEBO/Cu6KJWo2lZSFcNi+9FftbHbgWC//JnqnFjYd0fK2djZrQ6gApawA8BC/
         HxDkOI5nf4UIUftCF/DBKCb8OGn7ZYZfh5fFFo71CXXBAUxPrn+nwnERGB/VLPAn0lcU
         pF8o5WguD1xHbVVb28MB7G4AVpNlWkZlYxFLrKBg/pkSp7RK79xS0kLv1ci9v7Hf8K24
         RI232PnhxXv6cHRyCj82amxTTDW6qb3HZbyvBMAJpokeNqsOuGcnRGKR88arP7kLSZx2
         Fwc01fIJtRYjJyQRgWNxC20I63cA8jqxSuo2n1jAYClgFu+FEJ+zyIXpVAOtNr6UELCJ
         6nJA==
X-Forwarded-Encrypted: i=1; AJvYcCUzCx/cV3GfuFZ6m/YZRHJ/MK3Kg9aon2e6+xETMxAU15M+5ELDRmbqVzjKUcdUCgNDG7I5h9LQkFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwFhZwooukNBVLwoLVhZpvLS55y0ucNCtOoBz9Qb7NADYdj4Fz
	U2cqy1Mit1Zaagg93Op7t5vZl6SGuSxcyNr9PgvjJnP9vlb7/rnsoEu4ZCtFgIQ71g==
X-Gm-Gg: ASbGncsk8T9CReGD6capEf5Hy6FhiJ29Cc5gSfZ/uqQOjlunqmL5zb071TWoxjW5X72
	2Vl4CO0ktPAe/BpW6CfRO6CEmUJImNhjZqbT+pvg4rnVkhORE5irATYKHDJEl+IFX8pGdyRcA31
	VLfIrRn/jb8jrfMcJxsE7wdid1heaAQObwkhh0qqijs28RlR/8v/6rTrl8Guy1Zi9ZPbCfsf+/l
	6GXASjTa1UZcKF3DOx9/PAXSs8cCGpyHnrLYLQtWHaLGOFjOCp8ysGKjoBcFdDvdH6pdoB51oJY
	RQ6IfTH4DPSsPQA/JZPeUrZUmqHXSPyj3aPZekaO5xJlPGUD806ck0puZ6gRvvN14wRh0t69MRN
	5YWcf9SI9qkf44QPyIc3CkjZqV5jDuu/V8cvP96PNeP1hgrU0An8WBvKFaKuOOSmdeflLKAPVIF
	Xz1MRoYyJfGDD7ZcrL/ZmSFnxMJ7SMin328aJU/w8xUb0z7xVQFmyVmYIx4i2xyWA8l4twMzf3G
	3k=
X-Google-Smtp-Source: AGHT+IE5l2n359TQYnAd8C9RZdeikIarmO9J3gJpN9BOA421oq7n/HTh69rNwePIbxwzTUlHqtpKcA==
X-Received: by 2002:a05:6000:2f86:b0:425:86da:325f with SMTP id ffacd0b85a97d-42cc1390f07mr19540314f8f.27.1764082895809;
        Tue, 25 Nov 2025 07:01:35 -0800 (PST)
Message-ID: <04644f55-457a-407d-9895-ca73f508fb5c@suse.com>
Date: Tue, 25 Nov 2025 16:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
 <20251121091554.1003315-3-Penny.Zheng@amd.com>
 <d441c5b1-7ab0-4b28-b00a-67b8d6869fbf@apertussolutions.com>
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
In-Reply-To: <d441c5b1-7ab0-4b28-b00a-67b8d6869fbf@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2025 15:57, Daniel P. Smith wrote:
> On 11/21/25 4:15 AM, Penny Zheng wrote:
>> Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
>> it shall be wrapped with it, otherwiae it will become unreachable when
> 
> otherwiae --> otherwise (maybe committer is willing to fix on commit?)

Sure.

Jan

