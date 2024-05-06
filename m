Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448708BCCBC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717565.1119903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wOP-0000x3-Cg; Mon, 06 May 2024 11:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717565.1119903; Mon, 06 May 2024 11:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wOP-0000vV-9j; Mon, 06 May 2024 11:20:25 +0000
Received: by outflank-mailman (input) for mailman id 717565;
 Mon, 06 May 2024 11:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3wON-0000vJ-HN
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:20:23 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1093097-0b9a-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 13:20:22 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51fb14816f6so2114688e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:20:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b0041b086d664fsm15745352wms.6.2024.05.06.04.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:20:21 -0700 (PDT)
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
X-Inumbo-ID: a1093097-0b9a-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714994422; x=1715599222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xk6skj+2N00M6JOjJM3GFYM/7DpvW5dXFYBY/ROTOiM=;
        b=SKl59TnNFR8IOrG+IY+29KvO6l4nLwCWSL0x5jkUcVPWe2LigHviZrlozYn/zXFNZ/
         r6wc0QQO3RuAu6QZNReW7tYYuLR1radYEIkFfTGyxKAWl63mXODyllUj3XdtVocaywfq
         5Lm7v91g/qjcLwycX/kkC2mtwXsd/BlmdIyKUAkPvPlY8WO8083aux7ckXsvS3ARhS1q
         9lydPJXkNIO/IjMJ9ehpvw8QggDGD+7J+y9UlvA0ZMc3fJMCjsyRje2ALXUlh/f0TlCY
         lE1/vBNBbdBBkTRb09/wz+XEEZedJ8MkmAclR2Px2PPhO0cDjMA2gmfZzl1eWOeMx7Gk
         4WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994422; x=1715599222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk6skj+2N00M6JOjJM3GFYM/7DpvW5dXFYBY/ROTOiM=;
        b=hVgS+FO5V22wlZH86iH+Rd6b1i6G3B5aWzSFQ6pt46ayBueDkXq02vn+Qhvd5AzC1I
         DMMpCMiaUnTyI8NYLz3owmkBrLbQvTfM/HGvVkbYfTLE/AJl4nKR8H+yQNElpWOMpeUR
         896w9LSzT92E+AJU1T+mfEru0BliMcLON9nAZMfPdVCYiPKQoDlgJH1ouYykf/gQ17g6
         gxE62yru08sx7molyVy1jBen7soctkx1qpPV4o+VYSpll1SX3HvBa7CRvAVwjMlcC8lZ
         X2hKIT4LOjE3v24BvGaO47L91K9dOQYf/ik9eBfrwBnJoGjMjE+IrAu+xpm2us/uY+Nb
         wrFw==
X-Forwarded-Encrypted: i=1; AJvYcCVmYrgaj5BArTCnS3PdQot4MI6SCnakNSTqqO8BisPl1/MMmgNC81d9rvyIRFk3CwNSS8lI0m0hz0sT25MYL0QTbmwXolerLexjb25jXmw=
X-Gm-Message-State: AOJu0Yxkfm8ms0f60bq8STe1bAjWqp35VG//f3JGYV8fskX0M4yjwzbG
	V3WMh0GQ6KU4TX5jLWGromvrb7QO4/Cn5cOo5rTozVM3bGk7t0hKvJYT0Wq/Wg==
X-Google-Smtp-Source: AGHT+IEQ+BuYF/yKwkkQIm5qZ5Cm2Frm+wwIbJdt2J2D3MNQ8TGmyM1AuRGRFP0yJnLSw7IdCZEqrg==
X-Received: by 2002:a05:6512:1256:b0:51d:4c0a:a512 with SMTP id fb22-20020a056512125600b0051d4c0aa512mr8054779lfb.68.1714994422158;
        Mon, 06 May 2024 04:20:22 -0700 (PDT)
Message-ID: <4de79253-158e-4aff-a3f0-54a1fc131ec1@suse.com>
Date: Mon, 6 May 2024 13:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/5] x86/MCE: guard access to Intel/AMD-specific
 MCA MSRs
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <725b477a688ad17e5fa2a8bac78f4905170523c8.1714640459.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <725b477a688ad17e5fa2a8bac78f4905170523c8.1714640459.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 11:16, Sergiy Kibrik wrote:
> Add build-time checks for newly introduced INTEL/AMD config options when
> calling vmce_{intel/amd}_{rdmsr/wrmsr}() routines.
> This way a platform-specific code can be omitted in vmce code, if this
> platform is disabled in config.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

With the same remark and the same constraint as on patch 1:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


