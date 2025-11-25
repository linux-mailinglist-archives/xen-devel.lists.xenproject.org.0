Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF8C85D09
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 16:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172057.1497146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNvBE-0002Kb-Fj; Tue, 25 Nov 2025 15:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172057.1497146; Tue, 25 Nov 2025 15:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNvBE-0002Ij-D5; Tue, 25 Nov 2025 15:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1172057;
 Tue, 25 Nov 2025 15:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNvBC-0002Bp-TK
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:42:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d5fbc95-ca15-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 16:42:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so38805465e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 07:42:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47906cb9715sm16727775e9.2.2025.11.25.07.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:42:08 -0800 (PST)
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
X-Inumbo-ID: 4d5fbc95-ca15-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764085328; x=1764690128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lNldLJF1+tuierFsg4r+g67xA1Ykc+it8mYmMDrCimk=;
        b=aamMn8puGUDRWKlBHXHA+dShVGcSy48JyfTwF3AJUuw3MIMaDMkioku/T2f7K9kuDZ
         /VhuEAv4gIxksnPG8kchny3m0RcNPlUweOPevxu+CK91nQfTXFEeb4JOaaPlwIf8jqin
         qn+mDpseZnJckm4SlHIBbHMYgjAVoa+hhhRsS3j1r33U8OoCf1kMn9KYCebF1wSHzHvv
         Nvxqw5+9fKp8qsybwP5PU6l5W/Dbm/D4A9WEHJLMJES6GmdSNKR3clBy1DPxENhC64O6
         xr8EVKUWRQnrMvovxj16QbwAbn2LuSnKfn4+KB0XpXzZgeN61bDcOC0fcFkMI+2GxAnY
         Oqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764085328; x=1764690128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNldLJF1+tuierFsg4r+g67xA1Ykc+it8mYmMDrCimk=;
        b=mh7AP5OrsnVpJIEiBh5ot8utRTs1qyJ2UjZnr+CFoxBJtk6Q/VSEo1yNHz9UfS42kD
         vaom/AmrHuVHSxT+OPyE805gPYwYeiO6RL+hpuxgiHIiqeKfZogAa7aR4FgzJmmQR7M5
         IAxVaQ24Sd6zIjKD/FmakrivigPRiQjANb9eCE0VZ7qPbooN2xe3lveTQjYFBuRS5Cpt
         t8tNhyWdi81Ux36oh+fC/6gj8C3+a+pnyBWI+LXnvv+T6bzBz4NqWZD4tmJi8ABhSwzg
         FOncjLsQ42338VZ123oeGQcZ/uePlpzVuOObos/bIGqvCbCXJTuyaJJydqNik0p3Cwvk
         Xfbw==
X-Forwarded-Encrypted: i=1; AJvYcCV81KbpfhsB5mHc/F/LQDU+hhx91Yq4LyfcRH7ytQo/zjpI+qjZ4RBrF6pDd2vAxcUZRDjg4scAu/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc95z7v6oEaA/fSHXG5paQzGk0lQnjw+GB914IyebqoFH2vTMJ
	7zbrQeNiWi3UCS1yDipfGWuszst4RcfheEDv6x3m6ZxHlgQfB4yTMsEgn69e1hAKEw==
X-Gm-Gg: ASbGnct2EXPPGV48BtSXz8WFETKzuOdLIbA6QmclHteTWVA8A5ma6KK1TRWZuB21uZB
	JmuMPYwjMEiZNj+2SWaGKPm4pg4X4/DT3/7sqdGo7vggoo8rytV5jwTlDMabnAWzimJC1asgeeo
	j/Nx4iS2dLJF/a8lwiYXQn/VGamtoJe0uNoPPME8lnCT7/dWHZ0Gu4opjqXV175blBDzTUuRXOY
	weKW3Bu0RNs6eB05kubQyjSF8QEqDZrifAEb23B0fYqCZVBLjCrb8BlTaHhxTz+xah1fny4x/wL
	hDQvP1Sgx/iv+tBa+L9wTuEoHEAB+G7cu4DZCDLZcj02KSeVWirE0YZNjEuou3oy26GOhNYM7bt
	wOHr3YRzyVb1q/NcZd6joX9dRMTgDCXZGTLTX6Q+15Vrsnu5cr3zmE1TXxMniBFz8xGkgkk4boD
	962EE3iLGRTYK99jJVCAoFTM2fqvYwu2ZsejEgeRW1tO2SaoFC1zE8pZ/Q/Ws37r86
X-Google-Smtp-Source: AGHT+IHpSOu7Xn8IC2IfClRckWITgkJyIa++97PAe6Fkx0f0gMtM29ud6TXxHSVA7XKDCoD7QIyIQQ==
X-Received: by 2002:a05:600c:204b:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-477b9ee4fd0mr148359275e9.12.1764085328483;
        Tue, 25 Nov 2025 07:42:08 -0800 (PST)
Message-ID: <bc60f6b1-fbb3-4e8d-8d88-10ed73581623@suse.com>
Date: Tue, 25 Nov 2025 16:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/24] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-17-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-17-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Otherwise it will become unreachable when MGMT_HYPERCALLS=n, and hence
> violating Misra rule 2.1
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - new commit
> ---
> Commit "xen/domctl: wrap pci-subset iommu-related domctl op with
> CONFIG_MGMT_HYPERCALLS" and "xen/domctl: wrap device-tree-subset iommu-related
> domctl op with CONFIG_MGMT_HYPERCALLS" are the prereq commit.

You state the normal thing here: The general assumption is that later patches
in a series depend on earlier ones. What you want to state is when this general
rule doesn't apply, i.e. when patches can move ahead (some or entirely), and
hence can be committed when they alone are ready, without having other
dependencies (or with having only some).

> ---
>  xen/drivers/passthrough/iommu.c | 2 ++
>  1 file changed, 2 insertions(+)

The latest here xen/iommu.h also needs touching, as just said in reply to
patch 14. Unused hooks shall stay around.

Jan

