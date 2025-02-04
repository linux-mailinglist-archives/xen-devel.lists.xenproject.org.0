Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843FA2755B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 16:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881677.1291837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKWW-0007BA-5M; Tue, 04 Feb 2025 15:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881677.1291837; Tue, 04 Feb 2025 15:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKWW-00079a-24; Tue, 04 Feb 2025 15:07:36 +0000
Received: by outflank-mailman (input) for mailman id 881677;
 Tue, 04 Feb 2025 15:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfKWU-00079U-MG
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 15:07:34 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e473fb-e309-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 16:07:32 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5dccc90a4f1so1177371a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 07:07:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcd3156ec7sm476838a12.67.2025.02.04.07.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:07:30 -0800 (PST)
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
X-Inumbo-ID: c1e473fb-e309-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738681651; x=1739286451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7A2qzFrTRxecRAB0/ggoUA0ui5P1oO9sih50GdLQyvs=;
        b=JkOCdSYlyeeIENDCBeMfEHrb4jUBcrw0p61XG+P9zpBh0TES3sBlCrwQLdyeFgmMbl
         WURQHJGM0+MDe/NVxzS5RYUeXH6nBiphHt/SDZf1YIEf8sBcFuZmwgT44jZ64et8WMEZ
         ULoubK/0RlzSt6HE17vdEtDozZw4VjhYWAhvhb16pb4t18tclgzTTGurCE8Ivuad0CKz
         QV5JP0jeV1KQTtvT1tFMAkZxbBuKv/ZzY3matgzcWsO3Blh+znPiE1u9n1Jvfvfz+yLq
         3kXzxFvdq0p5u5lOmXnSWsjpKGCueua06/GUW4tE39JxGlAz/6XePqHJZS81rb7Vq9ha
         CNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681651; x=1739286451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A2qzFrTRxecRAB0/ggoUA0ui5P1oO9sih50GdLQyvs=;
        b=wF7kMSlWZT5ZT7+r0eHLGbRtmCB2ehs6FLgnvjAGTX8DWCmSg0M8Dy8KAxbxYIdNoH
         6cviAYIIbcfa7FMTSL4RRvkQ4ZJflA88QJ0Ua+BzABVNJqvv/ZUprUYZvy8pF+jwnYY2
         0rgYtfccVtvyKrM2iPHI/sKyLGrdU4EJJCMMgVPP1PWWwYktYNX1+HWqTEMRbyO32d6g
         hLD+sHy06KwdipW2VRbxzjv+/EWxwpXNSMxhxRlYZ0D81eG7g/MS0V4pBG90LwUR9mNn
         sJGxYfF+BHAjde5bhIiDERaosX+ZIRydX+lAP03NaO11KIqBzEMLSc2RMgaWGqCoZxGb
         RpqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTRGflsIM5bh2HDky6oUELr6ot2Drj/ygG+CY3JKYbcTQFxmX/tajfZrS99IQ4HB3xVoZi+NRtwTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywnb4qgndf4Neo6oyzYHb9FVC/6ceu50JEvTG/udRCSqjFkUvBN
	9Yq4rRZUhA6fjMlL8vQt6ZJseh1WPvojlVTIeu82i3aqomNEpaIje4i1z8VuYYtVeksVC2uDzSA
	=
X-Gm-Gg: ASbGncst5gn9xA0EZ4MCzuxa+dc+wKLRKQ4zu31yliFzU7obCrVnWIHLiI7QxuaIVRg
	XHuLd2uX3t1IE3GU21conQDfPlP6gWEh/9zGFpgu1MGv31ZMlcS52Yvba56UfRQ3CuW/LMi8ho4
	UKInUBtISMFqTx33/xc8tOJDMLt9voNCtHBzpvunD2NSqC22JJEcJcxvlKFjzxAlrQ1ntsfB7qt
	48Jv+dV6q6IgttAtC4J1Z5CvItJeB124vsRrDDcuvlYpbiJkcgAaLP/UL3+oEmv/lOAxrXkAJ0x
	UwczBFmGrvAoKCDRvjezDGmFIpTLT32d+IritmHSCqFzDJNmuUQhL3m269dgZLqnXc7jXPwQ8gb
	V
X-Google-Smtp-Source: AGHT+IEhEvWS+O+u7AohAvRPdk5Goe402RdOFCIQVoA7nHd8qJiDzvXeiWuacgvPcvWq3Dx7RrvZkA==
X-Received: by 2002:a05:6402:d09:b0:5db:fc7c:be43 with SMTP id 4fb4d7f45d1cf-5dc5effb6b1mr28148716a12.32.1738681651207;
        Tue, 04 Feb 2025 07:07:31 -0800 (PST)
Message-ID: <84c8d20e-b9f1-4593-b5df-86cc00ff33b5@suse.com>
Date: Tue, 4 Feb 2025 16:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tools/hvmloader: Replace LAPIC_ID() with
 cpu_to_apicid[]
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
 <20250204144542.7399-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250204144542.7399-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 15:45, Alejandro Vallejo wrote:
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -48,8 +48,9 @@ extern uint8_t ioapic_version;
>  
>  #define IOAPIC_ID           0x01
>  
> +extern uint32_t *cpu_to_apicid;

Strictly speaking this ought to be part of the earlier patch. If hvmloader
was Misra-checked, this would be a (transient) violation.

config.h is also somewhat odd a place to put this declaration, yet then I
can't really suggest anything better.

Jan


