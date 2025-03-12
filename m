Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90618A5D898
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 09:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910099.1316873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHmI-0003xH-FA; Wed, 12 Mar 2025 08:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910099.1316873; Wed, 12 Mar 2025 08:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHmI-0003vp-CT; Wed, 12 Mar 2025 08:49:26 +0000
Received: by outflank-mailman (input) for mailman id 910099;
 Wed, 12 Mar 2025 08:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsHmH-0003vj-CW
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 08:49:25 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5cdbb85-ff1e-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 09:49:24 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso1437385e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 01:49:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcfbsm19922695f8f.28.2025.03.12.01.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:49:23 -0700 (PDT)
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
X-Inumbo-ID: e5cdbb85-ff1e-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741769364; x=1742374164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8rsxSW6RfkBU/qhCqIRhOPnN5q7fpagLRTqNVArWdo=;
        b=bktyYoZtxuJxcjwyVs0+8HpoemhYB4WaRcv704WykUHXl5bc8ehrB7HcXwGJYlfxru
         a3lEj3Ig6aZNOoTOTVR4/O8D8fHAMMBWSA5F8lHh/zNRlmO2B95fKNYnXHgbvHL8rGL+
         C44qNwrIYCB3Ufd5Ri8paI0/dHvSNlASPgEWjgw0rv5tWDeoxhIKDrfHiZXF40mD80Yq
         Dt4l8o/cYBjyWHc3AWTaeXtpQzCbXW+P2dM7hSzG2lTVTUHXOgdBdhKz30JeGcfNfyyq
         Q3LfYo66XKQBIUbZX+IS6jVB4Ra5nRa8LrIgGNfywjYpeTVFd/q6bQgL9UgwndHXk8Dy
         0n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741769364; x=1742374164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8rsxSW6RfkBU/qhCqIRhOPnN5q7fpagLRTqNVArWdo=;
        b=xS9cukZzvfJywX4AIzXYhAQqke1ABxFFRYzGEQGIeSltmuBDXHBGnN1SwkbMV16Hzo
         jbhNDcPy/SgjwrDj5Hc+xOoQm29Ewd+CKQzZzIj2KS/dFhFCX25RZam0VivQwNVDxfkM
         JH221FURMbku8PKUhS+VWBAAs0vYjPSfTIqTCKxzKVPivirTcFZ02vM8ouN5EqIYHHSE
         2YJkaSc7J0ujRP3kLQVwWAZac4D/+N79WnHPD+n+dk9BJYvrVclRrk7JS0slQ7/PJGvI
         qqUiNwKlkkqxxksZHRwNb00sDnZ09+BIm02LjxOw4cwkYYSlhRvmiiJWvwQsrOnFbA0Y
         emVA==
X-Forwarded-Encrypted: i=1; AJvYcCWsObFvKuU1zde4A7eYe7Ohs/k7iWdnmyZMI8lS20MEeLWfeJ7mL9F1Se1Z4l8iPqWvy19w5CMYNSI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcYVUo1lmnecUvsdjJ/8A9tOhkIArQ6OIgj2jyrHQQRupyP4de
	o3NfKNmfhHjm/cPgXzk2UDkKW0EiJgukiP1M2xT/nHkgbDzvJRsN5pT3hzYTRg==
X-Gm-Gg: ASbGncuPX+5t9UyV+3eGPsbSH98bh7KPbwLKIR4IMuuLrA3bpbvOdx7pFZ1CF1SCSoN
	qWmgNfnyGqqMb9ByuW5STwH7WNRQCn/56gtb8EL8m4FivW7IxpwiiGNoQJTzW42lFrWidIw9ZVd
	jWxFsex/agZEHkG00fdM2toMjeNWdr0oSKiZtXzyKA6l1poMYlBD59JEdjXhzQvfVrYRItL1OQN
	6kjP9lMKOEzHyUkxfInBULIZE7Mqc8U8VfxtTcx4xLTYKe/e8+rW2jo1+lxjGp6dvEfldGUfuYE
	FUtAtn7rqTYHOVZFhmrhu72ltaTifgc59ulleCxWxP/hEiW8Aoh8g/G229BU+rWxfwk6L39I2cv
	SPmASShU0Hwhzsz+YOIzAF/9WBMHEUw==
X-Google-Smtp-Source: AGHT+IGfpqQrXsMVR2fjr1OH8YzpmyrJUccUqQb0HFKMYx5Qff6uD0l+RnBeXTKk54YnxWXHVuhW8w==
X-Received: by 2002:a05:600c:1d26:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-43cf597d965mr91561365e9.27.1741769363653;
        Wed, 12 Mar 2025 01:49:23 -0700 (PDT)
Message-ID: <cb7f086a-8a6d-4284-b85a-be88749757e0@suse.com>
Date: Wed, 12 Mar 2025 09:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
 <cdae37d8-a01d-412c-a48b-f4e27d7d898e@citrix.com>
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
In-Reply-To: <cdae37d8-a01d-412c-a48b-f4e27d7d898e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:27, Andrew Cooper wrote:
> On 11/03/2025 9:22 pm, Andrew Cooper wrote:
>> When PV is enabled, entry_int80 needs to be DPL3, not DPL0.
>>
>> This causes the XSA-259 PoC to fail with:
>>
>>   --- Xen Test Framework ---
>>   Environment: PV 64bit (Long mode 4 levels)
>>   XSA-259 PoC
>>   Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
>>   Test result: ERROR
>>
>> (Clearly I have a bug in XTF's rendering of the error code too.)
> 
> Fixes: 3da2149cf4dc ("x86/IDT: Generate bsp_idt[] at build time")

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


