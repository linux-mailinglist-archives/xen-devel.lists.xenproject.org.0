Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39247AA5026
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973706.1361768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9IP-00008C-GI; Wed, 30 Apr 2025 15:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973706.1361768; Wed, 30 Apr 2025 15:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9IP-00006Z-Cv; Wed, 30 Apr 2025 15:24:25 +0000
Received: by outflank-mailman (input) for mailman id 973706;
 Wed, 30 Apr 2025 15:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9IN-00006T-J1
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:24:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30bdeaad-25d7-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:24:21 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-acb415dd8faso1048394766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:24:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41bbf4sm930600166b.36.2025.04.30.08.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:24:20 -0700 (PDT)
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
X-Inumbo-ID: 30bdeaad-25d7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746026661; x=1746631461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ofXC0J8PYk8Sb9HCDI3i5FycK7giNC5O7tgldLDNhc=;
        b=DaAQOzfzEKEKb3L1tnuwDKPnn2GIjVyHuPwyh1/DspHh1S1VjgZsbM9exjLqeLpJ/2
         jiP13JBKin9o48KRDN0AMi+v07Zthy4iFzE12blaqGGKEs6WUUYWHAXZPDmWpiCvJQZa
         qsmTI35oLMseFcxEM6lvvZnhmVsmkQpDqZSqaAvGBAeigfZCaAFfspOtahvShPsLwMQp
         /jxEsQQd6gqZKs6Xj3GAB98+WHCdr4ZJhTO1RS4W4PjdAIu93LuQd91AtSqJpnM6CDMV
         1RZ5pkT3H1uk57DJUG27Lo0tWUeIg0H+5GOcPuRepXaN0Qv4vaNmGViJ71mKVSCUSW4Y
         NweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026661; x=1746631461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ofXC0J8PYk8Sb9HCDI3i5FycK7giNC5O7tgldLDNhc=;
        b=NIwICVnKE66mVmsEpgVAe7zeX2WbqUYTW6ioJZ3vIP565gesY+AGko3L3AdT+bquXD
         PDSPjx6SC9+y/bMbcAcGK5e+oVnBQo64AQlC2u9abTKtMsWyUO2367cM7bLVhdaJS5/M
         f3yh9ob3Dzjo3QtUdaojR/YyEH7KLemrle+HwdFfB1z5mZOlxsnKmiYyGDUEtSWvVN/y
         7Tg1UblU94Tc5Ok3qoJEi9kOcBr41hLbuTzO3VnVTELAgOQr/TwMpeT3vcaWN5pJ/oAl
         p1484+9TBi27R2Qbb9UhizMUrnrPdBnrbL+hJU9clRGuuOZhVaDZOsO16gOkzSiVvPmC
         6/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWEpWU6Zeo9LuLJ1WNxGKHgwXFz+SP9sovValy/tLB8LuidtbbDq3amOWj0k4u/pS5HtNfxX/5Mcd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg2cV7KmEOLLrhNMgYVcVlhQl1cdPePeOTzhslGW7P0gwp1ecb
	OrbBwOztRtKx7Ws9gDKOFiqb9HWG235o8jLcFjcncTyWvyinP8eJHLDBPHSoWg==
X-Gm-Gg: ASbGncvf1veO+2/3BQCZ4/MLX2KfswO2YYt9ZdNeL+Ta7YVPMaLoR8Pd/gvLPTYxb2K
	TiargU12PIjjhZL3Yro5Ip3ixqUBiyAQc2loQN9e9qS0qruSzcvs35YjDqNqG3kYILe/Cuc6AxQ
	IdOMZtBR604xUqteSB3H2mZHDzmWrF/Al1UHdj/orwECjTU9hyNikJk8yccq8tnOeG9utD9dbUX
	W75r1226aPfM1OIMi4VS6lVw1w4xT/CP+cfwbC1T6DWMszqjmT16PEok9oXiQdZEKoM95cnH7QX
	2y8sSM6ASgLfPP+AePHv7tlSCtcvvefUcF38f/Y4mHsWQ2YIvtK44Rqqm33Ns3ikpvjurRgYXWn
	g02e+g58CNAHTkXrlo57G4+7D5Q==
X-Google-Smtp-Source: AGHT+IHYHzifWVxLPJgMk+GXbMQ6gZhu4IbTz8P/7WB23cTk1UTvrZNtGD0w9XvHNflYqQAimODWoQ==
X-Received: by 2002:a17:906:f5a3:b0:acb:32c5:43ff with SMTP id a640c23a62f3a-acedc04363dmr420506066b.0.1746026661091;
        Wed, 30 Apr 2025 08:24:21 -0700 (PDT)
Message-ID: <8202d9c5-7a7c-472d-becd-1b788e31e081@suse.com>
Date: Wed, 30 Apr 2025 17:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] xen/pmstat: consolidate code into pmstat.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250421073723.3863060-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 09:37, Penny Zheng wrote:
> We move the following functions into drivers/acpi/pmstat.c, as they
> are all designed for performance statistic:
> - cpufreq_residency_update
> - cpufreq_statistic_reset
> - cpufreq_statistic_update
> - cpufreq_statistic_init
> - cpufreq_statistic_exit
> Consequently, variable "cpufreq_statistic_data" and "cpufreq_statistic_lock"
> shall become static.
> We also move out acpi_set_pdc_bits(), as it is the handler for sub-hypercall
> XEN_PM_PDC, and shall stay with the other handlers together in
> drivers/cpufreq/cpufreq.c.
> 
> Various style corrections shall be applied at the same time while moving these
> functions, including:
> - brace for if() and for() shall live at a seperate line
> - add extra space before and after bracket of if() and for()
> - use array notation
> - convert uint32_t into unsigned int
> - convert u32 into uint32_t
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

This again looks like it might be independent of earlier patches, and hence
might be able to go in right away. Please may I remind you to clarify such
aspects while submitting?

Jan

