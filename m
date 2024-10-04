Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5E990481
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810431.1223143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swiS4-0006k0-Mt; Fri, 04 Oct 2024 13:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810431.1223143; Fri, 04 Oct 2024 13:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swiS4-0006hy-K4; Fri, 04 Oct 2024 13:34:36 +0000
Received: by outflank-mailman (input) for mailman id 810431;
 Fri, 04 Oct 2024 13:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swiS2-0006hs-Qv
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:34:34 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 644d5c24-8255-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 15:34:34 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso357134966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 06:34:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b4c0csm225584466b.114.2024.10.04.06.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 06:34:33 -0700 (PDT)
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
X-Inumbo-ID: 644d5c24-8255-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728048873; x=1728653673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IeMxcbEkS7+KfiSTkuKAogJUERKH4sdwcH+Y/f2ruEY=;
        b=BKhGmXW65FZ4UkJWPzQUiUUaGF75BW0wcc3VR6qHfC0hc9JWXcEhaS30umUVeGSvva
         Pa5sdmZjhwmbyvPSZBXSomRK0zlGKrEyaz3KCYw58CgFxRTifcMLqEEOgltEOf69ZK+9
         kGTaMscySutghjLldng+GI9cgt85TWYKvkNMIG6grRfQg2HbH3+vhKhjL/beRI4lGltv
         sMvYwIL4TaW5u7zc9gRidb5AGIdm4ujZCmrliDh7j/x65k4MFbN3EmUEKQ3+nZVVr1Cv
         i/22G8YpJUScF9V6RpuwVCF0RHYcBIH1x5inOPvzQHgPIP/dkO4lf2Jw061R/uRG+Y6F
         0ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048873; x=1728653673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeMxcbEkS7+KfiSTkuKAogJUERKH4sdwcH+Y/f2ruEY=;
        b=SsX4MZN2vIlGh7Y/O5YdfHo5SORKNzxA3IJStFAICwSOnUqOgA+R0rPC4U9MJeGmi1
         nlyzWRi2ZAIpY4uE0i9H/JrvTOmz53FK0DeIU+Z4sAD1BiTjLADAHVpNPrCHY0LNN2hX
         3GTe02WU/RfX9e8IWWk7a8ztl3gi1gvBXG+W0HWfGecAV83UVj+Qb5Ps2y0J+t4f9HR1
         6/k7yS1Q5YAqrCsoJsbhNR+YxuiHAitfaIQZ8Zh+c96l5/Kc+pu4D7lnXdYuKgADw4Rz
         Waanfy3U51QY3SO7ttg0FFh/VWMXkemXPp6PG4OrcTzWCJ05sjGCLmjA4UQqtndXjGon
         khwg==
X-Forwarded-Encrypted: i=1; AJvYcCVV9GZHYzrSdO0OJcD4oWimCoCQA0lkkU4OfRLQxBXCeDZtl6mWcn3uoDK3GIOLfBn/r3k1zInwmCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQQ161OjadHThDvbtLbdLLcxqbA5MTIsny2LQB9VYOI2A/PdSg
	TIK7q4UBVGdr6YabwXR+1iM2IFZozLcbv4dbuV6Q2acsb+tacm+B342ZmROfXA==
X-Google-Smtp-Source: AGHT+IHZ2I51+F1WUIazBiBuNQSa0LIv3+D9LAceOM0tuk/m9CYj5/cKY4qs0FTsV9dCvmJuq93rbQ==
X-Received: by 2002:a17:907:e696:b0:a8d:7046:a1bd with SMTP id a640c23a62f3a-a991bd46719mr253368466b.28.1728048873369;
        Fri, 04 Oct 2024 06:34:33 -0700 (PDT)
Message-ID: <53eca6cb-5c46-4cc8-bbd3-d6b355acee43@suse.com>
Date: Fri, 4 Oct 2024 15:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/3] x86/hvm: introduce config option for stdvga
 emulation
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2024 11:33, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -147,6 +147,9 @@ config INTEL_VMX
>  config X86_PMTIMER
>  	def_bool HVM
>  
> +config X86_STDVGA
> +	def_bool HVM

For both if these I'd also question the naming: They way they're named now,
I for one would infer they're about Xen support for respective hardware. I
think they both want to be X86_HVM_... to indicate they're about support for
HVM guests. The same concern then applies to the menu title in patch 3.

Jan

