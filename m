Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67374A981DC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 09:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964066.1354939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Uwy-0002YM-2Z; Wed, 23 Apr 2025 07:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964066.1354939; Wed, 23 Apr 2025 07:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Uwx-0002VE-VF; Wed, 23 Apr 2025 07:55:19 +0000
Received: by outflank-mailman (input) for mailman id 964066;
 Wed, 23 Apr 2025 07:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Uww-0002Ur-FW
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 07:55:18 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aa16109-2018-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 09:55:15 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso3686619f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 00:55:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092db2a5dsm16089245e9.25.2025.04.23.00.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 00:55:14 -0700 (PDT)
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
X-Inumbo-ID: 4aa16109-2018-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745394915; x=1745999715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t4ZCuxQDRrbdVsQp22J/Ijjbwj5SVIATjwuGtImoXqA=;
        b=eCMi25ghi/0alNXKNKNjPtxMo99ziE9BvLetb7hoVQICgBQxbSClKHQFxNiwOWrWVV
         QUai3dBbC1OUfDWJNsNr26GF5no/tPB85aH/O7aasrjH6YNZiGeoXW2LAVHwKK8C2SWt
         KQ55h0zv9yuc9kTcDvFk+2IqWypJb+iCRlUXu3MeFxm7iHJojSVytMX8RqmuveC6W1HU
         r7BlBgzRdjkAQCvj5t1aJ7CawOijbBtB1CrfM2vr7cHcfguQRZnj2nXFboIp3zw4KxLh
         7ou8INMzmzUh4QFu7uC7B1lhvSTPPgb7wEY6KOnxu44FOnWZAY1WEBidr+2R9UNBLByf
         mk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394915; x=1745999715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4ZCuxQDRrbdVsQp22J/Ijjbwj5SVIATjwuGtImoXqA=;
        b=dD4S5iyzTEeo4M6S0raZHkalau3pLTLeFZCewiH8wVLgiTbsk0hUiNiC6tcedQ6iT3
         eKqmNr+Cy0T6e6FBqX8UnVpgVfdl8hE9xhGrOrxUyeu0kUqSDobYZUNQ7b0GYWkJlPgy
         8IGYCQPZHpN+n6vFPjyUcZC0XC8Q5D09zLinMzNWyPMeOB5joQMjlJkqyUV4zfP32cLR
         K267kcQJkUfUjoU5vB27XeK+IZGXHSytiJClGYPGSXUHOKdezpztusrWqxgwyx4iPS3K
         36gDisgSXMSree0OxvCcerVUL//wo1rasX807PYwkwUSf86Z8M/b9VqNdow/1J9frfnL
         MuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu3BuLo9mrYFv0kl6gkn08r5W7CSUPBelkx8grsrIeKsLO9luOB1lM5cSte4RFYv0wtMra5vIH4rU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu1ev/mqDd4SpUv6g8wCUSS2BlGMZFpbptNdh9h8Tz+77ylh5Z
	hhb5CxwgYbRxhLYd4y6YSb6MZ5omJ1DGZyxbb6Hmz+ybxTdeApJICRJCoYyHQQ==
X-Gm-Gg: ASbGncstHO3kNtT2Eeh0BlIZzs+FO0mAIHI0u2wXE3KQzteoSpEMHyNANnZUrtgjN9N
	M/huVSMuGFYvhEdz4iXhJW883ODUhJIdeU9vNncsFBE56fUTCOU8rAJOmNDjRoDtOtVPCdqdC8T
	EwpEqLX1h873nqA9/KLrRtEAWvd53RV7SqWP7nL9Ojmi39IP1JRvwaRv2Gh4hlxMrk4rUuOkBps
	rG/h0KYmgcg+/iGvI9k7eh/1cXNkYQ7uX6EjghVU5M4VjPmp5uuTWiUVCecUsqdDOrTSnSHWuBU
	9OvA1AVNcAhT7iuVqtccwcxK8fENrjPzHszlt62Zv9Ge9yR6fLDow6Fp9m5VTBN2hBDuOS+MTlg
	iot3rDDxO5Ai/rHqi0anKG5IlhQ==
X-Google-Smtp-Source: AGHT+IHAJZh8hqH5z631ZY6VmyO864FHgBK//ePIg8Z8Prcq7xubsWRHHihyJ6YtU4oPKK3i0c5Tdg==
X-Received: by 2002:a05:6000:4021:b0:39c:1a86:e473 with SMTP id ffacd0b85a97d-39efbb22a85mr13974294f8f.56.1745394914821;
        Wed, 23 Apr 2025 00:55:14 -0700 (PDT)
Message-ID: <7968d149-1577-483e-a020-40e61e741e40@suse.com>
Date: Wed, 23 Apr 2025 09:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] x86/altcall: Split alternative-call.h out of
 alternative.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250423010237.1528582-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 03:02, Andrew Cooper wrote:
> ... in preparation for changing how they're implemented.
> 
> Update the MISRA deviations with the new path.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



