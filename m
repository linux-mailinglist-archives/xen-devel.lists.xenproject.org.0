Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87248C57C83
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161613.1489525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXio-0002pa-HB; Thu, 13 Nov 2025 13:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161613.1489525; Thu, 13 Nov 2025 13:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXio-0002mW-E4; Thu, 13 Nov 2025 13:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1161613;
 Thu, 13 Nov 2025 13:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXim-0002mQ-FD
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:50:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf62823e-c097-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:50:43 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b727f452fffso313236566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:50:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa812a3sm170869166b.8.2025.11.13.05.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:50:42 -0800 (PST)
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
X-Inumbo-ID: bf62823e-c097-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763041843; x=1763646643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+xBESS9IJ6pA4wD0WSdVGAVC6FPHQN7vpy3PvXdxZY4=;
        b=c4XFT/an1brDOhl8nUr8tj1wq5ge0Kwbm2uLNh0q9xzFRAV4HiZ+zeZ1WW0T7fIj7W
         /WJvQAXp2tU4aqcF23w7deC29q5phIA14A+QSEWlM3GAyVY1TaNwh39eCq9Vn9bXPEyo
         pdW4vfaidLHNzLgy1Omcca63W+hFOCtoWr0I5E4ZBzZ8XvFaM14DBkmh3PeK8fJ2ly7p
         L0TYZvRCnxVyfFe9QCxtj81xZWNnKMHrMlmpQIV4/3itTBToC6R62AXFkbFOkPjhl2iS
         5fDMlSewiMzCQrq9aXSmMgpb3KXCK5J+3uf7A9jZikrbNqZYH8B0zAXtgF0+k6PAxsy1
         bJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041843; x=1763646643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xBESS9IJ6pA4wD0WSdVGAVC6FPHQN7vpy3PvXdxZY4=;
        b=Z3wR1oVAVgXr7ae2uAepGQy3bY4yVMwN0nfztKRd7lSGZT8ADAs8oxNq8yWmvOGYvh
         gAi+H0QMbr7M5x0cnL8E0A0oc68UJ3caIOdfRIRTGzto043BMfI2k1bcJdxO6m0nPqcY
         3/C3QwCu/6azESS1Q/T2lpoyV9ZEpwSDFHkN/UZj12abT7ENdB/nEyDDoMoPDWbAujZM
         VJtFx35pcmYu/eFPiBbF+Snb7cAlzuuMTNnoGd/29heBAV+7LNtNaYqBnR+UeYeNnDWE
         Yt5Nl5OzpSZLdB7USpPFOQhAp5c2api6EXEGBkT+4i30HKdFHloDo1PNu51WM2Oz8xsb
         7skA==
X-Forwarded-Encrypted: i=1; AJvYcCVDwXT55B6cnw25YugFckTsy88XU67KPNHGre0XkeroJE7+GwQcB4m4yzDoyqDksKK0UqtRgPEFq1o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxcox4dwDhXYzJ/RVGyWD5T1WOu0LuVxUR5lhokJzdCVHdNCKS6
	V/Y4XatTTuq+1UfCcJxwrQe3QTB/gkpCxReIHh2GeoGejp7kbAAyJo7JC0TzgHhwyA==
X-Gm-Gg: ASbGncs5HDkFbzasOwM3SSSGOP2I5iPmRr0Zt6EpK03vD+bGxYa7O4/uAh+pxlVGsav
	32jjP8zwwccnU4EFz4KUv73woKtJnIYtagPevruR4RSKhaDTa/hOssxJd7ew1fa33EkEZZvucO9
	bjHzk3T4wYBqVrT4tDNdmNvzt145cMVvVM2J3wEjbFdES1BVPA+di/ry+vAlPD2j+IwvsZDD5QT
	ansnQsrDBlwkMesIhNI8Ht5ev+lZ4/BDYHvm2nD2Qximy9eU5qo9vlm1KCNwAShhK9b+JGBTLX/
	W2omwiFvf6VdnFmP8Ah+/DxN3oj7WXw2Kh+YouyDaVHL7OE6nWh3kISjd9OAmqJDdYs8TSBMGgh
	vAXFHnLo72DuTlbpc1KPvujafBWFqFaHL3Kp0P5WjSx5JCcFl+CAq15zTdTmozso/L/j40sdio8
	9TIWfHdX5HGiPqgx350Tz++xtuhiWJo9cjQyZi0+HOUC9bGhn+4xgkRrE1QFJglFp5
X-Google-Smtp-Source: AGHT+IFceF58qKnk8aNNb1W6/0rY/MKEusc3pV6bpPIhwGp2GK50sr8/geb/VxqPrpiF8FdWnXiezQ==
X-Received: by 2002:a17:907:7216:b0:b3f:331a:a982 with SMTP id a640c23a62f3a-b7348056d86mr305417566b.6.1763041842753;
        Thu, 13 Nov 2025 05:50:42 -0800 (PST)
Message-ID: <e16c5302-3ea8-4ce2-97de-4b891bca68a0@suse.com>
Date: Thu, 13 Nov 2025 14:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 4/5] x86: pvh: allow to disable 32-bit interface
 support
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-5-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111175413.3540690-5-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 18:54, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -2,7 +2,6 @@ menuconfig HVM
>  	bool "HVM support"
>  	depends on !PV_SHIM_EXCLUSIVE
>  	default !PV_SHIM
> -	select COMPAT
>  	select IOREQ_SERVER
>  	select MEM_ACCESS_ALWAYS_ON
>  	help
> @@ -70,4 +69,22 @@ config MEM_PAGING
>  config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  
> +config HVM_COMPAT
> +    bool "HVM 32-bit interface support on 64-bit Xen" if EXPERT

x86 Xen is always 64-bit, so I don't view it necessary to say so explicitly.

Imo the whole construct will want to move up, perhaps ahead of HVM_FEP.

Jan

