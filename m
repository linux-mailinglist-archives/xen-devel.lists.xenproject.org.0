Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95318B5E00
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714276.1115444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TDv-0005fb-83; Mon, 29 Apr 2024 15:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714276.1115444; Mon, 29 Apr 2024 15:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TDv-0005cP-5I; Mon, 29 Apr 2024 15:47:23 +0000
Received: by outflank-mailman (input) for mailman id 714276;
 Mon, 29 Apr 2024 15:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1TDu-0005b0-AY
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:47:22 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3728c22-063f-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:47:20 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51abf1a9332so6333671e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:47:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v12-20020a5d610c000000b0034ca96ecd1dsm6292056wrt.12.2024.04.29.08.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:47:19 -0700 (PDT)
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
X-Inumbo-ID: c3728c22-063f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714405640; x=1715010440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6HGRVKrXp4LJdMfnSBryF/V7adpyCEWMClggeSBLrq4=;
        b=SGl9Jbyuk6W5py3tg3pmC01b2616itYSelNmt67p9vQ8XOvOpo+fqYXkrDAZWVVsih
         7r/iQskMHWYodeioZ1EStZcF84755F7c9d5eb9j8N+0EORTOTonQHjsnXGNuhWd1sVXL
         2QBEQ5YCUZNK0jQflyZKBF/2EBCqqKxVfgvVsp7al5/p5SKbAA9tezvWuLo3cXoCMVm9
         0tvmWNKwJyqAftXEHlpf+TaHohnNGEeaXlcFeu/4WRZEu6xCDdBB/LeRTerVl+/Xthlc
         EQS6iUPYPnN+3Rr0K8iL6j7hL5EbBCm/uvtpPP7L8r5TL4iR71yByPH2ke9z2yQ8CoNQ
         8ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714405640; x=1715010440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HGRVKrXp4LJdMfnSBryF/V7adpyCEWMClggeSBLrq4=;
        b=peX59VSSEViNWCF6by6l8u1Z/pwVpigL26o9D0lxr4nbbchLa/TzytopNjRQPgH99R
         aqzGm8QTp7NUrP10wZ5gS2Wf6pBMCTUAj5VnaAy1tn1/jl2o78s4RXq+FvYUz0eefSFR
         y6kurZw7brGYtLHxS6MBqJ7U+SafPYmP7w3FnnvCyWUzF1yHY+GZLuroRLxLBj+eN9Vy
         5SxwrO4Es4Ur8r6SmC/iiblIiyzyckfwbVil4PFNC9YR+uuyLmzZp8qo/My2zrzYq+U5
         YUd/a0eSirHG0wETnoxf+FjYK+h3zWy0FwwJmJB6GiNLgPhl0NLDTDjovK9WLoo4+Hiq
         N2kg==
X-Gm-Message-State: AOJu0YyvkrUaoGXH4W/v4hA6Kq4KIr/SEYct59dRXUIcdFrYs1RH/6xg
	uJd5ZwU81bk3nXgjGWGzNP44ct/twEVVaOnrYcBiAmAoO4y/GiedVQBWBjyS2Q==
X-Google-Smtp-Source: AGHT+IFYS0fm3w9IeiDbqe4Y5BdCfaDBvvY0tfwmIUCehDiqiATBo31D0DPr7hhtrKgn1AtBnc9bQw==
X-Received: by 2002:ac2:4ed9:0:b0:518:f697:fac with SMTP id p25-20020ac24ed9000000b00518f6970facmr6703254lfr.18.1714405639852;
        Mon, 29 Apr 2024 08:47:19 -0700 (PDT)
Message-ID: <df585cfa-3566-4899-bb6d-51e083e35fa3@suse.com>
Date: Mon, 29 Apr 2024 17:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 6/7] x86/MCE: guard call to Intel-specific
 intel_get_extended_msrs()
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <6769d564725912245cb83aaf7543933b4b5fb80d.1713860310.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2404261614290.3940@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404261614290.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.04.2024 01:14, Stefano Stabellini wrote:
> On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
>> Add check for CONFIG_INTEL build option to conditional call of this routine,
>> so that if Intel support is disabled the call would be eliminated.
>>
>> No functional change intended.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Aiui this doesn't depend on earlier patches and hence could go in right
away.

Jan

