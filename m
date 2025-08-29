Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36BB3B430
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100694.1454030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtRx-0001QW-Ta; Fri, 29 Aug 2025 07:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100694.1454030; Fri, 29 Aug 2025 07:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtRx-0001Nh-Q5; Fri, 29 Aug 2025 07:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1100694;
 Fri, 29 Aug 2025 07:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urtRw-0001GS-Dr
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:23:04 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0047072a-84a9-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:23:03 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afec56519c8so289487266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:23:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefca0a955sm136840666b.29.2025.08.29.00.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 00:23:02 -0700 (PDT)
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
X-Inumbo-ID: 0047072a-84a9-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756452183; x=1757056983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HPfEhoVXuDmTY6g/Mf2Jqa/OUiIaMAv+gkyCYcMvu7Q=;
        b=bp5ZeINIJYnLtpnAMAZFT99LJ1FMYRvyyBemGMwcbJ+5laAZfA893/DcDqbejaUy/p
         f2aTEfe+oBmPt7bqL6i9nY18LCqsGfIbmheVEXABJ0fsvZu3KK8NQ5lIIMl0/iUkR3S7
         i3rGjBHkG8sG04v5hKtHn/9gS0QQTP7GH1HttapmMYOWGa+DupDYu2uNbYulc1xVXwZH
         z6Pc8/7UkpBfgTwwWFouH/0FEmS6jaczCeIiONQsCFvnVbMZaiYOIhS49GjwE13tMu/K
         38gojtz9Xzs5Otvg/yMwN/E+RNchcB//+TMklZPgmSpTIWgP4bunvvWmBxIpPM5xr0ly
         +Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756452183; x=1757056983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPfEhoVXuDmTY6g/Mf2Jqa/OUiIaMAv+gkyCYcMvu7Q=;
        b=rMutYEYUBq5SLovDyMJ+qh8UBgyiEPW6xfm66o4Yv0eAvVerXBrWr92uwYMLtd3Quv
         xQltO4INoAhJj/1B28hYnrPtnWrZx1LoJj/OmEkYiAOuzRaSkRZWyPcN1nu/eLiUnvju
         T+IV7eYyC94vLWVyCak8OPDOBXGryHZIutFRjZcjpkl4PJVjdisb+at/Slb/g1rnZLk4
         fRYnBMuQeznQ/Erl9AyidQ8hX/ND4Q7NZkocWYYbym8VVA6ZvD8gXJkih0t9HV+KgHxb
         eq11jhbtbB87ZRz+9oV9kj7xkLeh5bSbLL334UJvCRSoYQzocHd6glh3xuy4hU1ug1x5
         CVFA==
X-Forwarded-Encrypted: i=1; AJvYcCXxqkkYKKsPBOTfrdlWOC76d+TdOs7aF745XLaOxd4my35DeFdeHVe7gxsHrp04NAfvV75sKBie2ic=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPOpp1R98hHeE4K3XwqoQK3avXPMRPk3f2826nyMNkfpgVEvik
	2uOPnZbxjfvxTbFrD+wYlv+zOP+385tGitQd7uDVM2UN4C0vBiooRmGGGb8z82v2SA==
X-Gm-Gg: ASbGncsM8StP9pfC0P7m+kuJhSyjiZJZYFLrq0+uBqx+6EgkAfI+a2qJ+frv8fjjUQH
	2k5ByFXBD5BfmbArrW6IlO+wVcVE+FiUh4WY4eg2SRKeD4TdequbOKQMBre7VQkhANv+iHsdnYG
	hZHaXDvarTlQOVpFyPYU16GeFT4s596BthydjzEcM+9UNXnVDfkGTPYK6Q5sDrMQ3QQ+W4PuTEO
	3QTJPxz4Sz3BA6IGC13QLOc9/+6uhcvOoy+yU43PIc97klPMau+fsoiS8dN+8HGHhAWAOMk3hNQ
	cVb8cU/y1SkEQQ61zqgBu4wC6NCtmRPyAGBguhLyR+vTC2FtnLeneCdjCzntowBUJYeQmIzyn+N
	pSptjeFk5OaeJPcdsYfd2oxIZAv62AVkxppZ98fRKX/fufJMVsEOw+HblqrcTJQQ6fp5IbO7FR/
	wDqO00J+Y=
X-Google-Smtp-Source: AGHT+IGY0AHaAZil/WPpfwjVrB68cElB3kTAurYDW2rkdxXsZ9cCsAKyi3OMMR+lWd+sT8SnCE3gtg==
X-Received: by 2002:a17:907:9443:b0:aff:a36:e6e with SMTP id a640c23a62f3a-aff0a361006mr68442766b.57.1756452183144;
        Fri, 29 Aug 2025 00:23:03 -0700 (PDT)
Message-ID: <4b554221-336b-444d-a2d5-849017f3b943@suse.com>
Date: Fri, 29 Aug 2025 09:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 18:40, Oleksii Moisieiev wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1097,6 +1097,15 @@ affinities to prefer but be not limited to the specified node(s).
>  
>  Pin dom0 vcpus to their respective pcpus
>  
> +### scmi-smc-passthrough (ARM)
> +> `= <boolean>`
> +
> +The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows to
> +enable SCMI SMC single agent interface for any, but only one guest domain,
> +which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
> +SCMI nodes removed from Dom0/hwdom device tree.
> +(for example, thin Dom0 with Driver domain use-case).
> +
>  ### dtuart (ARM)
>  > `= path [:options]`

On what basis did you pick where to put the new option? It clearly doesn't
fit between dom0_vcpus_pin and dtuart, but wants to go far further down.

Jan

