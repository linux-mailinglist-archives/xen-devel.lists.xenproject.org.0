Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD888B5A04
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714066.1115050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1R5j-0003yr-E6; Mon, 29 Apr 2024 13:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714066.1115050; Mon, 29 Apr 2024 13:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1R5j-0003wp-A6; Mon, 29 Apr 2024 13:30:47 +0000
Received: by outflank-mailman (input) for mailman id 714066;
 Mon, 29 Apr 2024 13:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1R5h-0003wj-DZ
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:30:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adcea4de-062c-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 15:30:43 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so4795188f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:30:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cg3-20020a5d5cc3000000b00349bd105089sm29377409wrb.47.2024.04.29.06.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 06:30:43 -0700 (PDT)
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
X-Inumbo-ID: adcea4de-062c-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714397443; x=1715002243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEl5SX90lT6ATuQBWsSuBAraCZE6UPsz8QOfZAzW5YE=;
        b=OZF2qzSgngtrHeJ3PIo/oznnuqE+W3XXH8DzGa2u1FAONxX7IY5+q4UcJBwav/aS3e
         T7mVBxXDzmRmPf9Cgglll9C1KlU0axU9Ilp1ooS6n9vGSRF1q9tHcAw70Ie95P1Ez/bo
         D+c9w+uDy56aohlC7UTfx//iBvasomc4oko+JasC8xh7qnFUEHHuzcA/6J5hkKNhHlPl
         6SjLPUkj/Pq0v70Jrtg/WZKunpadyHoH0JEafEoGnWmX7WIOZH3/4l7b7psORFQVfK4X
         RCfVWn86k7g8WYEDd3aXPivzTWksN5xKgEaAWt11Qg+6v4pcEXqYyURYKunDC6wzELMu
         pdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714397443; x=1715002243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEl5SX90lT6ATuQBWsSuBAraCZE6UPsz8QOfZAzW5YE=;
        b=YXHEGJcvsoh3wCGmyjJOc09O4Av/v68TIMoTGWoAP6knONnbAhLpnqkSZpBu0i24KM
         Fcefk4ekfshzuiWE6tZufY1YRtXxWm98d/EM2uMn9SNWm/zuaqRi34TGc5buZ6yrATZu
         ZbGUGM4Knb9bJ19F11uJJwuibawHrFpAXRU797IlQFL4khKuHYKn7rQAAjjlf7DKDft3
         4C+1ZlaHyvxPy5YccpPGypF12VikfBQDBlcPDq4yoicwhKJRF0Wl99NSE6T2qOZAORiI
         G/LAhJOkmdwNXtE3Bf9bSc6qCiqcyJ3SjeTXIfqix08UXbD+1/5QtQ17FuZHaH4sbk5s
         5CEg==
X-Forwarded-Encrypted: i=1; AJvYcCVO/Ga+Vy+xvUcTnZDihK1IVELK0zdQ6pW2dJ6M4nqFDvk13B9fdxjPQU/Drl7/1tsny7H5noMnvNJOSxXl3CwYuKA0LOJDsPi0FzaD5qk=
X-Gm-Message-State: AOJu0YyQlRB5/ZJlqU0HDMe8/8ekqRrma65rh5y+k3CV05y9aVrAdGeh
	H9lJllVhksDft9QF0oeJCni68/DJPnE9rTd+1+aTTSk4sE4clZgqpEkF5TqhXw==
X-Google-Smtp-Source: AGHT+IFdv607PeM41nHnZFh1o7wMVv8fdiUq8cmPumRQGsE0B7SdRBszsijm8iC0WeEvTR6tlCG+wA==
X-Received: by 2002:a5d:6d83:0:b0:34c:d9f5:c5e0 with SMTP id l3-20020a5d6d83000000b0034cd9f5c5e0mr4786167wrs.53.1714397443233;
        Mon, 29 Apr 2024 06:30:43 -0700 (PDT)
Message-ID: <7ffd4293-e0fb-4ba1-b538-7ad44a2897ce@suse.com>
Date: Mon, 29 Apr 2024 15:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: improve check-extension() macro
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <6f37ce6b115b682118a8332b2a81b49358c88587.1714144943.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6f37ce6b115b682118a8332b2a81b49358c88587.1714144943.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 17:23, Oleksii Kurochko wrote:
> Now, the check-extension() macro has 1 argument instead of 2.
> This change helps to reduce redundancy around usage of extensions
> name (in the case of the zbb extension, the name was used 3 times).
> 
> To implement this, a new variable was introduced:
>   <extension name>-insn
> which represents the instruction support that is being checked.
> 
> Additionally, zbb-insn is updated to use $(comma) instead of ",".

Which is merely just-in-case, I suppose, but not strictly necessary
anymore?

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just as a remark: Tags want to be put in chronological order.

Jan

