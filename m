Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029BBB3452A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093355.1448878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYn8-00019t-4D; Mon, 25 Aug 2025 15:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093355.1448878; Mon, 25 Aug 2025 15:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYn8-00018R-1M; Mon, 25 Aug 2025 15:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1093355;
 Mon, 25 Aug 2025 15:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYn7-00018K-0Y
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:07:25 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3431bd9b-81c5-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:07:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso675233266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:07:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8725112bsm164706766b.36.2025.08.25.08.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:07:22 -0700 (PDT)
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
X-Inumbo-ID: 3431bd9b-81c5-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756134443; x=1756739243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XanhjzqMfpHTUvWOEzZsq3gEhwn6iVPBu858vWV/9XA=;
        b=aZOWc66rvFZzpcMsaOcz6G4oiF9ZY8JD8k1VzBSi1V5Ywz30iNNYhyZs9qgNpUYddB
         2DvpjqHzgo5YjnrNHuuXf6+jzbp+SrNVc23R4D+Y4i3f0LWe/x3GCt4nRdcTcFmxmOoy
         2Qoag18TKZYr4gESm96sZnOwyTfOHneUDCaw9oxm2XhWL1U2YrYgqssTDThWhWNUlnQs
         FB4F/GUuI5cej0ebGLvkIJmyLtOnRHzZgRRQZkY4oq9J197Nps1fEvV+mH5mCvc0LC0y
         luphxOV0hXkR7oYRXZOCmia5AS26YNS5Xi7ALRl/tSV1zDezdVjCNhBZAbt5M5FkhwHu
         CGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134443; x=1756739243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XanhjzqMfpHTUvWOEzZsq3gEhwn6iVPBu858vWV/9XA=;
        b=EdFWlsX4k4a1szi3vn6ccwTpgFEhNRPrwA1U98xSj4/dOKKGugMqdKAhhmX4RYlIAv
         bbjRRFW+83fYkJqkFBdP72n4fx7D8Z2vOqfikL6R5MYMKsWllTquDT+shckb3h5v72K5
         HCxc4LgHNETL15b1+Az1e8IeCFYfjXA0QIN7IdqXvgctmwVTzFt2RfGc1GXzcFRGzbue
         7FQaGu8FeAq7lw/2RJisCoQKmGK0tDqjI0fBiiZH3g2zQ8HWIuMTcwSjoF/iGo2tsbV2
         6ve947uzYPCDPJ5d5YeaZ+cL1Jsw1D018lsVeJ5arpzE9yptrwXQHDTlrkumoTNnK9RE
         BkFw==
X-Forwarded-Encrypted: i=1; AJvYcCXcRC9DfgaHS3+KPCiK8/9tLhD9axy4CyJnotIMR/Lo4E44B8CgVkndPwJpMwFTIEKNP8181yR3rEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJLUMdqvn8cBxm9XcfJ0aV8XYvd9BIoBNehbnrfY2wbW+bLLQ4
	ZSK9vk64TqdegXnUh98auqbk6TbwgwvwaBfQbvgBLsm4TbCCkN/BUk6YonnhTBGpRw==
X-Gm-Gg: ASbGncu1ufCb9wA8vxbQwUWMgV2KHgtAJpQiPb3/y5fjgpIuZAnlEDWG6txTdxJV7sI
	stB/+R+moaZQYtFWIp3YU6nipY5LTRPulXRN37XZA4YJnJDDhLBWjOVKHElhYJkq+tFUh8Yaw9p
	sOFZgHz1C1l6+WU2CWBVN3H2vutnCGm4gVoqGsL9MLj5fpubK5jrj2CUHUn5/Rszs9mWVVOH+vb
	KYXcQ0DQgqV0+F+/cMA7hD0ru1ctkoVuhdYw16lFIZsUwFjXS2bdc/VZcK8Pn2lbIwaMFcMaeSK
	YRseN4eWI3X1H3Y7pjBTH3mgZRIO9xk1KA0bnHl0PemstpffJFzH1vHCuEWJOQs87GmNsRYDmRR
	r+jhgXY68yYMFy3tRLl/z1uHWqwlG/k4RVYLG11LHoFRBMS4papXInI+/qcWPvgvPK97dGrFPz9
	u2Lxj0b7M=
X-Google-Smtp-Source: AGHT+IF1kwDZdzUJ+uA8hid8GGFPjWsPA2VRUNY7F8cdnaiX3WwSC8vNpG0ViZnSI9QYQq5tetqctg==
X-Received: by 2002:a17:906:478d:b0:afc:d5a3:90c1 with SMTP id a640c23a62f3a-afe29693f42mr1079024466b.55.1756134442749;
        Mon, 25 Aug 2025 08:07:22 -0700 (PDT)
Message-ID: <0fe3f9e4-9984-478b-ac81-8c237e05a34c@suse.com>
Date: Mon, 25 Aug 2025 17:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/13] xen/cpufreq: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -131,12 +131,13 @@ static int __init cf_check cpufreq_driver_init(void)
>  
>      if ( cpufreq_controller == FREQCTL_xen )
>      {
> +        unsigned int i;
>          ret = -ENOENT;

Blank line between declaration(s) and statement(s) please.

Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

