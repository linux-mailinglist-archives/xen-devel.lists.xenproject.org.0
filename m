Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE6A456A1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 08:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896197.1304878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBqA-0004TW-9E; Wed, 26 Feb 2025 07:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896197.1304878; Wed, 26 Feb 2025 07:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBqA-0004RP-5y; Wed, 26 Feb 2025 07:28:22 +0000
Received: by outflank-mailman (input) for mailman id 896197;
 Wed, 26 Feb 2025 07:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnBq8-0004R8-Ia
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 07:28:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40836c0e-f413-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 08:28:19 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso56388045e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 23:28:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cd10sm4693434f8f.37.2025.02.25.23.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 23:28:18 -0800 (PST)
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
X-Inumbo-ID: 40836c0e-f413-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740554899; x=1741159699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zAkCveHaveTl69+khWGx3j3ZodXmmYogQ2lY25O88jY=;
        b=HxdSCABOU30JCyQJj4ud+5t/BNVKN4qNIy3Rz5efmpnVsSn6wcWeAW8EjtZqsfdYuH
         hOFTdDGrX38Mr27InmFv1CpaTIez636fvPPfoTn6L98z5pKAwhcEBg/KUkgLiBMd1tCK
         gtdIuHd4ARKQXMpEB9rS1XNScmGw83eW9R+w/+XsyA8IJVQyVw+hXfn6WxdRndAxulZt
         W5TKe8FXB1qBYJ1CaEoQYvHPQujK+sovJhm2cRkYdDVPUGSEiGDP2QUhL33gJAZ/SUdE
         10uTCIRAwR7FOk7PzQh3Wjtz5+DVORIzfaMYoXCC5ZW4d9/49ZlnSRry2nt/kPRIdhLL
         u49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740554899; x=1741159699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAkCveHaveTl69+khWGx3j3ZodXmmYogQ2lY25O88jY=;
        b=CI/ZwKQZ+3WQ3fatmk6joYiNv7YqCEkc1rEYmHMXVlfL6+J0TsMgUbFMlmz2FdrXk1
         JmVffcCSmOz3Je91/cfdGHgrFeM0gUI/O70IJwjzD9qpm3PTuf6vApsCtnXp4z/ErQMF
         TpcJWmfxHoGFTGFinbtXaF8TMY/2v8b3i2F+NqOJbKdu6yc/kiPuZxPvoXdRznOMRRef
         x0ipWGmHvgsMTzgPe2nY8+4E3C2CNIyE3hBjkiOMWh8MenR4S1mZjHzuEE9fSglUe9rj
         Ihm/12IQ+H2P2LH4HiJDJQh2iuRNQ20VXFDF8JwdCo/kXZIMRtbfxE0t9VLGMYvfwsE2
         vgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcTs77xhLw5Db0Mq2kGX2SgPwVRowzhRXqTkyqTDpS0n2L59J+xzE5+mhDcvoqob+ezpPPERGn+L4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLE6vwmptFLVL7IW5yTbjvnOWDH8u5yAzlSnCUkpcI7Tp1eUWk
	pyK5feEhrYc7IKm0OG+4KrTWbnSTfuB/K+Ri4Dpnfi1d6bzkTtstFSenMymlSA==
X-Gm-Gg: ASbGncswemk+kXx687Kmikj9RhO7je2fR689fPZrhGppsLgYgIIsncaRunx3M2UVEm7
	t7P40vAG1ckKnZeqJLj6xzx9EhY0mEtae9gFg7mMDSVLlFKru6lJ98FVCvuFEVMrASlzT+FKAbW
	e5m/04/cj6o2qRVHFh2OjbTDQixjmrQOEmjrmtGhlLb/uDxK2oiBwuA+Z1M86brz+RBJlS7O1Zn
	tzo9RuK4JVzMsjKPZ7W4LD9XHz9aQzbkqGEdcPB1bqad0Dpk+7iW7c2/pO9pNBIYy6Ls+ZWDUy5
	TcpEXzQiPfwlvywI20/pmJS+R3wplWo6yZpvBtTD3f9qHJNP1eSrapGQxbLhD0I0HCV88YciWZv
	fl3xhj9Zi53c=
X-Google-Smtp-Source: AGHT+IEZTaWw7yM8D8JdDlIstCZxpNFx/HUcU9gCQkVlGuP5mlChWvzXio4UXTb9j+ucFl0stkEIrA==
X-Received: by 2002:a05:600c:4ec8:b0:439:7c0b:13f6 with SMTP id 5b1f17b1804b1-43ab9048304mr17407605e9.31.1740554899133;
        Tue, 25 Feb 2025 23:28:19 -0800 (PST)
Message-ID: <40886b73-a25a-4319-87f4-e63ab98a2be4@suse.com>
Date: Wed, 26 Feb 2025 08:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Move guest_{rd,wr}msr_xen() into msr.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225223250.1185105-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250225223250.1185105-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 23:32, Andrew Cooper wrote:
> They are out of place in traps.c, and only have a single caller each.  Make
> them static inside msr.c.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



