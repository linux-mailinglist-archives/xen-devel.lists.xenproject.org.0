Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A717EB08637
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046250.1416528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIlQ-0007xB-LV; Thu, 17 Jul 2025 07:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046250.1416528; Thu, 17 Jul 2025 07:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIlQ-0007vO-Hi; Thu, 17 Jul 2025 07:10:44 +0000
Received: by outflank-mailman (input) for mailman id 1046250;
 Thu, 17 Jul 2025 07:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucIlO-0007vG-Qt
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:10:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25da9229-62dd-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 09:10:41 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4561514c7f0so5965905e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 00:10:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435c238sm138490125ad.234.2025.07.17.00.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 00:10:40 -0700 (PDT)
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
X-Inumbo-ID: 25da9229-62dd-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752736240; x=1753341040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9d8pQdKsD2b/iqpI1rE6T9MtPoPkBwTiNq4dbrcGM1M=;
        b=INHjtXRTicwGFihTBLGjqZVIHi0uGvDc9CziJpLfrbGZKmq4yREAz1mLwdzrQ1M20s
         f3QAtlr07iaYk6cfoiOWTgnsR95PySZO8klb3emjvbNEe1tycBT3DE4P/0vDxMn7q5rK
         II1Uc8MW09mkZpyKMxVGKxJkzBOev4zrZS3Yv0pN4IeuyGArHLisdVZl0DKHTTKw+S/J
         7pbyx+ucyspbTjtUZxZef+TKVPgTQz+vSGDOq2M1lENm+k6C3E0gfZNWTRjtutN5/rdB
         WqMuaM9EeWMahJxaUUaPko17wkZJw8SXy1voUrW2vZk32wOGddxTadwL6Nl49rZrr+5J
         Iw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752736240; x=1753341040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d8pQdKsD2b/iqpI1rE6T9MtPoPkBwTiNq4dbrcGM1M=;
        b=VWUsvCiUjJ/Ot0u6N6h3y6Q5LTgfDFRvRulrM2GGVy6OiyvM3o3IlvZJ29CEdxz4TS
         UUQEjG1d2nOEmZKAoItmXtKUHpvlI+UVwx9DjMgP0PdRJagJdUhnY/gyS62zLYsKXntt
         fIrTxAmDkmYJN6zRbySeuUyS06dm4G653Nh70JdwQZKwXvAgqM/NNMgZX9eT0l6qlk9F
         nUeTSZdd9aBmzkJ9fuugrFigqjO2wlDp8RErrw5p6oXOgVefSAnFXhwWoPbI9VN7z0yN
         jmVhwjXiNpR95xI3FkrbyRWFiB67fI8fYJycqTg+9MAY7MCI4gVrnkReWrifJ2OKBrce
         pyeA==
X-Forwarded-Encrypted: i=1; AJvYcCVM7i0XC8wCX5YGKWNdG/f2DMDPRhHe88M7IJXkV/zrxh/7M+qPmuXW5o3sLitSA5sVroPFgL0bDs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6J1k+7JJ+o31FPMYnAFF8URoUAl1HQLhfWuY1BkpJ1ineK09x
	U6j8zrHl7zoB5ZauAz04JUffodRxzoGclAAKMvhhLLkLdi3IUBg89KuelfLfNSG9dA==
X-Gm-Gg: ASbGnctdIPd/5Q3M5k+dyjrFFrvwZVqi+m3zp752S5tbGB6HtUQviHWhQBZuTIxRfVO
	Y7PwpAw6ACfvSU450dmTeuSK/DBgRZS+tT5NCjqWhpUCqCUAet8aKVyjb+qR37oWsG9cEen1Y8q
	gSS+Hd4WxA06CxYm4TumwqCWts6oSWf5m6XkMMSuwpNaDXly312tJOz6LVkmq8sGa/17/YSkMfB
	xYWbNXlGbF0v7jHGo5GZg83Mm6GX9Qd3PMr7qA69A9AhU8sr6aVJaEMAHQMYrlVJt9m0zWUwib9
	PYJ/QxwsJamEsa5IrcpPC4ZFPF8DGmcvmNfxeXKE/dukqBA+wKNZpgvvnYxVjTm+ynBHY2EXc9l
	UP/5YEaEhnMw9F/EFOktYcyU6CU9kfsKcczdbzBOzr4x6KmMiQqY4p4WbfOABqmCV9ME9DLv7/6
	DPDVMwJn4=
X-Google-Smtp-Source: AGHT+IF+gOPHGMkG5i/DE7fgH/ZOYxTnR01MhvsyPeV76b4U7Vxipn3b51XhfCE5uy+rA5olGmwJZg==
X-Received: by 2002:a5d:5d0c:0:b0:3b6:463:d886 with SMTP id ffacd0b85a97d-3b60e4ccea6mr4952092f8f.20.1752736240562;
        Thu, 17 Jul 2025 00:10:40 -0700 (PDT)
Message-ID: <fcd4e2da-7d34-45f6-8d3a-0c60010a5da1@suse.com>
Date: Thu, 17 Jul 2025 09:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> In intel.c, drop asm/mwait.h and asm/uaccess.h, neither of which are used.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


