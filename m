Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70240B0796A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045344.1415455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3uK-0006ee-Nj; Wed, 16 Jul 2025 15:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045344.1415455; Wed, 16 Jul 2025 15:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3uK-0006dD-KN; Wed, 16 Jul 2025 15:18:56 +0000
Received: by outflank-mailman (input) for mailman id 1045344;
 Wed, 16 Jul 2025 15:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3uJ-0006d7-56
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:18:55 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e89cf76-6258-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:18:52 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a528243636so3855515f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:18:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f115cc9sm1589472a91.0.2025.07.16.08.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:18:51 -0700 (PDT)
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
X-Inumbo-ID: 2e89cf76-6258-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752679132; x=1753283932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eVfpt9hUszJJgRULtKsNYJPNndjJ7V5TvHV2gKnGTg8=;
        b=TJALFkt1Nv8Wpt7u7sOdadEbPEm/N7ZgjB12Ei25bioTm/ABTMh/ksjVhTNGwRfoCB
         T0QdCYl8GQpMuaAwI4PiStztZfFq73GjfCqQwGWl866DY0hgWQhhAaNpzLW+dn445N8D
         YZV+48g5mjwvSH6t+sz0qInLNEd9N+OIuaI2N/8RKUw/k/6PuejtN61QuHdfBuUPlMJH
         RF6eMYt4l9ma3XRQt/SCuSjem3vJx6VZvXJkxxpPvftce42AYoleFP91WgRlQ4m+nS56
         Y7aqZAnt8pGYxkpgNhEARFamj24Ao27lkjA5KPRo7oh4+Ebw5fxHtsSNd23U8Xss6ZsJ
         2xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679132; x=1753283932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVfpt9hUszJJgRULtKsNYJPNndjJ7V5TvHV2gKnGTg8=;
        b=SwxFSV/TkKbLpVzvDtEZCQTwfkICCQQxWj1YqrgOb5Y632CliGwJ5B4fQLQGHTnu+5
         HSboNmCItDT5cUqlgsG6IjV7gsguGHvtNX1rzy5bg0BdPxGAtghggrVXkhWJ5PFWcyHA
         QvOza7rdBP1f95Qe70MBnAYEAWj/JQ8qSdJHl4G+1obcv8FyveTTnLAm2hHa3LduvD0A
         n7QJN54bLwvJJbzx0vjKiscJfkqnt0FbcAxtPsLa6mjip322LJMUDniaNdl5xAjMiepc
         1p/4w12ogiAguzc+R6PAl3ZEXyR0qvTv7BQ1BNlU8SNWde/zAAzKLTuOqgUEjhpe4+hr
         WmAA==
X-Forwarded-Encrypted: i=1; AJvYcCUjecharLHWaacW8PJwHdzzCpwgBQ7deO9nmRDUV9z+BLIPU2SycB7gSgmp4qkqO0WU2PsWLbeyFrI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgGICnBNQtiKYevI3wEGB8n8i8K80qAj9YcRj8TJCcH+EKiozF
	6pwvZ+nsQw2HAFLOHhv076UoH6bfb+h0nlkGXYMPQf2v7G90nAW/kGaMfRqig6d+Gg==
X-Gm-Gg: ASbGnctzXK612RUITPhKJPfNeqsA59EqSGwsZv8HbVy/9bNZSDmRqhre0xlMrJBOMaF
	lAva1g6GW4A06zJTkIgH100oxWkMvlfRlzMf6mwHVD0GSOVVzJDZ1Mcd1cACrx2esSfZ7yryK4D
	a9x0Q0Js4SGqZaff6oDLaRBvXxn9FZ9T9fvZoeP/6ZxK5AOlln4g3W45sKubeZPnWwbNlx97Qcl
	7j29waRTmSn2+PM8ZqRQTNymF09Ue20AiTo94j8TyeFdHhOX/YNAFsrk7eBp5KxRzZV86zpQdC2
	DDUGtH6bnI94sUtynjsRR78Wvx3Zw2IlMicdObymRXCHZk9EjPnBJKs+BEIjkamQTALUUat6oYN
	WZRNGEmP7Nw2xcHTB7+WnAUG1WLgmR4Bm4Msy4EcId7Z/rmt7AzP8YIgq+G9GNO1c75ze0tZbu3
	dCk/d0sWs=
X-Google-Smtp-Source: AGHT+IE5JYx78vD09cXobccWxk/MyD+n9pnCXI/W7fDssGP3w0nc+n2Rw/YXn3OiFn8uENq4gHtYCw==
X-Received: by 2002:adf:9ccb:0:b0:3a5:39d7:3f17 with SMTP id ffacd0b85a97d-3b60dd898c7mr2214363f8f.47.1752679132090;
        Wed, 16 Jul 2025 08:18:52 -0700 (PDT)
Message-ID: <0033e953-93ad-40f5-b5d7-a68f18069b24@suse.com>
Date: Wed, 16 Jul 2025 17:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/19] xen/cpufreq: rename cppc preset name to
 "XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> "ondemand" is more suitable to describe a preset in which epp value is set
> with medium(CPPC_ENERGY_PERF_BALANCE), showing no preference over performance or
> powersave, minimum with lowest and maximum with highest.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


