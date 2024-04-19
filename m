Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084F8AA8B1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708773.1107865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxi8v-0005NL-B5; Fri, 19 Apr 2024 06:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708773.1107865; Fri, 19 Apr 2024 06:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxi8v-0005LV-7u; Fri, 19 Apr 2024 06:54:41 +0000
Received: by outflank-mailman (input) for mailman id 708773;
 Fri, 19 Apr 2024 06:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxi8u-0005LP-3s
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:54:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afcf9ab3-fe19-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 08:54:37 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4199332c1dcso369645e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 23:54:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041638a085d3sm9110549wmq.15.2024.04.18.23.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 23:54:36 -0700 (PDT)
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
X-Inumbo-ID: afcf9ab3-fe19-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713509677; x=1714114477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yaryZ0Hy0Swi174XIBwSMA2FcjPb7t9zdCJxibR77Sc=;
        b=JND2rzZG3rYkrNfy8zHkawPY0NCeC2ZAFwrBDUwg20V1ZC/HilmJyyzGc71k0MKLqV
         XHPlcYCvQGQyfqjGEt99jc6u3E/wA6w/WLFACjYd2w1qsTj/tY3WaIBVmXFQVPGiUQxM
         o2HBlgEl6DvuP6qB2aN8mxSSFiDWjq4tFtBFzmYiqWEjHzVYzQou5KVgLaRnLaNQQvm1
         CYl1x/gBUzyDJkbFWMYoGZZ724broh1c1Egd6HPKLQYAGYXG7KCsYtEAC5gJMRB1Rm8P
         /YIg+uWImMks1YvZPEG8Jf/C8TRlsrCPsDntPhLIqOy8eLhKsj9dABhxI6w5VPAiP7Vn
         1yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713509677; x=1714114477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaryZ0Hy0Swi174XIBwSMA2FcjPb7t9zdCJxibR77Sc=;
        b=h51mM5crGK7o7Vlr8vEG9Y2dsutpBwOJIrusJqlAaXkq4sFO5el6PzlH7NZugd+OKe
         V9mVk5u3uvZL51PzOMTY5H6S2HzMwzNtPf9qRCmXcD6TNkOY0a7nDN6DUB70znCUnz+N
         mU+9UirxlsYUbHipQC+zJI2gMFqBJYkCfq9GNcU9aAn1xVBbYQoiy840j0XbWbnoJhED
         lcj62FluczcGTB9PdxU2VIe4gKaXjVGe79SueOwp7E2/X4XFCflqHvcO0qU9FuqUlSP+
         ht9VQalo+tFzWeSsQwNad43BydFsMzaI3e4TOXJ9/ZMgZRPSp0mf6dAK5oCplK9TJI4E
         bxWw==
X-Forwarded-Encrypted: i=1; AJvYcCXplGLlguucwfFMAfGIlwH3uw1m6v2xiT9IOraj7xhvFqEDKuF3Yb86l0Xi8mNfENbJWpfkGKEJV0U7oM8iFKvUs2ZtbujahqfE+leUo68=
X-Gm-Message-State: AOJu0Yym5yrxJ+Sjn93peL8MID6D1NCCI+InL+mZcDWa2ALVlaNbOzya
	VLmYkukIHZkJgp/I4/ljihtynYG3Stv6oghKjy0Ngw4ukzO/5FpP+KiS6HUHiQ==
X-Google-Smtp-Source: AGHT+IFiz5sWc43svqfX+qiyva47idLmNBXVHCEKZ3PzggykP6ELLO10InPl1f2Lm8b8C/CSA0eweQ==
X-Received: by 2002:a05:600c:45c8:b0:416:4973:4d59 with SMTP id s8-20020a05600c45c800b0041649734d59mr780448wmo.12.1713509676760;
        Thu, 18 Apr 2024 23:54:36 -0700 (PDT)
Message-ID: <97cd8a74-46e2-4b57-8505-bd3ea58772b8@suse.com>
Date: Fri, 19 Apr 2024 08:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: Use unsigned int for dom0 e820 index
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240418160713.27101-1-jason.andryuk@amd.com>
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
In-Reply-To: <20240418160713.27101-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 18:07, Jason Andryuk wrote:
> Switch to unsigned int for the dom0 e820 index.  This eliminates the
> potential for array underflows, and the compiler might be able to
> generate better code.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



