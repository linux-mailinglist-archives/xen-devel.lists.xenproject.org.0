Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B9C85DA6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 17:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172072.1497156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNvSS-0004ZV-0A; Tue, 25 Nov 2025 16:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172072.1497156; Tue, 25 Nov 2025 15:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNvSR-0004Xx-Te; Tue, 25 Nov 2025 15:59:59 +0000
Received: by outflank-mailman (input) for mailman id 1172072;
 Tue, 25 Nov 2025 15:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNvSQ-0004Xr-PL
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:59:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c97e7bf1-ca17-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 16:59:56 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42bb288c219so4880831f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 07:59:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fba201sm35048338f8f.32.2025.11.25.07.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:59:55 -0800 (PST)
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
X-Inumbo-ID: c97e7bf1-ca17-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764086396; x=1764691196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GO0G09FMVly027z5BysMjAWwAxwGMJFGrF0Wgwf69MQ=;
        b=ZLXYwaPBtxqUXgFgryxgaBQiPFqnTP484H98M0ZjnoHQDKV/q+O0q3ione65wkd2Mv
         afoo5kv3TQQwB96/+vySd/HbWGUJQr+lfr3nv0fopa7xjGSgjBUtrDdn8IVtxqmcDu3F
         jbaUERRqb9SLjJ6Osj1udPRIdXTOafeO0M6ooyWdS6OAPtGpHgz5T37detq6ijUZhpVu
         3BpH3Ym1ffoNzXX4CFQ0VXjOjSK2q8YDOMIKLFrvJBkHQkvmAfrmzUOsxs3u/qxnrlaQ
         wfh4LYv7BqlIljkVTcUriegD+ILFF5kJMZa+PMnilay+rAOWxdEqWS0dGaLq2UsuhnSa
         917A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764086396; x=1764691196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO0G09FMVly027z5BysMjAWwAxwGMJFGrF0Wgwf69MQ=;
        b=t9dCK1sdO0qKFK8G41IPu0p8hvdt90XkKyBWHLw+3bM8ruiIrXY87koF526jmYHIXW
         +HgGeIODDOGHFbQEz4maVPUe257qZQgm5hb6nj02dTNFYaG1K8S1FGFRNzrZn2o1kvkh
         0ZUDB2nKJuvCGmnLJ7UPJRZngWnPHzbPrCtmByEDogXjek5y68SAjgyL82GNjT1SiS3m
         UWG+jxxfM+u4Q5X559wc1vRlcEJXpKn/DbYBfMK+CTpefXWs1UfE3RL4CBqdMLlp9q82
         ejg2QLX86YPocdnQw0tIpS//H3ZYhIjSQApjdu5KauwAs82bX/eiV5w800guGRdWcbhT
         u97Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3TAWvVk/i7Ao2PLR1ne0gjuejhRRJ6LVwdsGdD9FB0cnW+ZH9gBIEYNiqx03puUzsFOfP4tnwpOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC8EybSG3NcMnLe8KVLYAq/SRzzpoULuZO6F1K4qSzsa3BJmOK
	Rke7nIZdFl7Ln3HdYNAGE7rajGTEpFYepyiXygl0YuT9rQCs65JYmCjgJEDWmwmF8A==
X-Gm-Gg: ASbGncuDgz3SukprQRkbYAbSQTWajGl+ztPBelCHascIDsKWW/94Yg66weRQ683aCVu
	RX92A68IxSEXMlxTROcJSjeLfUdB4ahLjMYyLcGViN5bNvLDMkpPMFTsj5H/EgKuUTu6OtJxozq
	8/gr8sr3jVhz/x8YI1F7/QXeItf7EIqIZ+YyJLQkr+YDXBlx34SI9JHnB95Bv6kluYUdicrbIOT
	IbNUDOy09k9sMg+RWAlmm7w/U6FjJva44G5m10hk8XSNyT7GfeOGWH9C9oDcnXg94/IHzN6+zm9
	6whOBWEl9rnvohePcWNlwlatdT7O0oNQSPJIHKj9Q2tD/ZENJ2/VdQlU+tJvl9mqXVRBADDg6jg
	tJxnIQL2Mr+OxqvvtaV7NOIQVCNg/+uVdlAC2D3m7DyMFIqtIuJyx7Pg4WzDaUi+cjjKsaoCUTv
	PaNPYUpctdlJSrz68uwLWg7sffB9GzqWKHdg5ldKVo2MpCaNCjPHRd22fVjmAbQwbD
X-Google-Smtp-Source: AGHT+IESJoVQJC2bWFnCW3UiQzZ1ELuIjmvAhI5SYOI0n5EUR5CyCm9aNd2DLvsPZpn5LDwr1f4rWg==
X-Received: by 2002:a05:6000:2484:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42cc1d0cf34mr16581757f8f.30.1764086395765;
        Tue, 25 Nov 2025 07:59:55 -0800 (PST)
Message-ID: <13cded84-19b7-432d-a9b1-2b9ad9f83283@suse.com>
Date: Tue, 25 Nov 2025 16:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/24] xen/domctl: wrap hvm_save{,load} with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-20-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-20-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> The following functions have been referenced in places which is either guarded
> with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
> - arch_hvm_save
> - arch_hvm_check
> - arch_hvm_load
> - hvm_save_size
> - hvm_save
> - hvm_load
> While CONFIG_MEM_SHARING is also dependent on CONFIG_MGMT_HYPERCALLS.
> So they shall be wrapped under MGMT_HYPERCALLS, otherwise they will become
> unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
> We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
> nearer to the left functions, to avoid scattered #ifdef-wrapping.

Why would you move things? What is in this source file that is of any use when
MGMT_HYPERCALLS=n? The only caller of hvm_save_one() lives in x86/domctl.c. With
that also removed, hvm_sr_handlers[] is only ever written to afaict, which means
that's an effectively dead array then too.

The final few functions ...

> @@ -390,6 +391,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>  
>      /* Not reached */
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  int _hvm_init_entry(struct hvm_domain_context *h, uint16_t tc, uint16_t inst,
>                      uint32_t len)

... here and below are only helpers for the save/restore machinery, i.e. that
_all_ is also usable only when MGMT_HYPERCALLS=y. Yes, that's a lot of further
work, but what do you do? You'll then have quite a bit more code removed from
the set that as per coverage analysis is never reached.

Jan

