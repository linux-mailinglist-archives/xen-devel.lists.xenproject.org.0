Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3AB17419
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065828.1431135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVTZ-0005TO-Bv; Thu, 31 Jul 2025 15:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065828.1431135; Thu, 31 Jul 2025 15:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVTZ-0005R5-8u; Thu, 31 Jul 2025 15:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1065828;
 Thu, 31 Jul 2025 15:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVTY-0005Qz-Ik
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:45:48 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3b8b52-6e25-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:45:47 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so718707f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:45:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbce84sm1966401b3a.71.2025.07.31.08.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:45:42 -0700 (PDT)
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
X-Inumbo-ID: 6d3b8b52-6e25-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753976747; x=1754581547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=37woC95w6jcu6OdTshd7necD+vdMwbo24whLV+oyUa8=;
        b=Jr0XT+oGWXpTAOPZ7cTp8bpPTKd21GffHX5EUdzqjCmvjKXEfSA1JlkK+1oLW0r+hr
         G/ZitGxnesQ66xiLRDcJs3eGelsiqoDws27hUF/uzU0ygaDNXecztJB8kLcGSNAKdHLy
         6hVppGia0g7uAtBU5GqCMVtcTdLxoX7KrkvoaN9dlonhc4HTp6O3tyQZvXVjXG3vWFSM
         msovVO3P9d/WHjTGDtlpsUsEm3wMDbkX1II8/oOgRDsxPlW+iadCpEmYZjkhOfk7i3t/
         6ko8wvFmy0EPJ/P5lrprgKyg3S0ocFlJ8vyLDS9QW0zIZQd8prZLpCkqb8z4iz+4l94Q
         kEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976747; x=1754581547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37woC95w6jcu6OdTshd7necD+vdMwbo24whLV+oyUa8=;
        b=am6KvE1pRllesQBUc/yaIDzbXBVqCuZz0KuCNDTl/E9RKFNnhNxBMjcH0zgWijAAck
         Lgu9CVDE3bAju4X1mp2VQryfa9aN4Lylfm4b68eKRplohBa1Uh0KVdMcTxW133KDHndF
         EfZ/hnLaRPA0y3+5rQo0N1PX+DU0lZa3onLa8ZRUmtoJoJWXshWEpazb2tkTJIFUnnOK
         UeO2fwSiZmLqAwjhUGMd5rTmDMPUcLKflZYJusbyZWEbV2f9hJeFP5dgkClY8CcWiqM9
         Ptqar+SYXoqrLim6D1wy9KN0Mv2FpFAhOGvKRPCkkVbtfayVnXXiiyRc9+oOVUubgupq
         x7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIUpTw0qaKDdMpK49b4ruAnplpVvn/8U8YGCGRofrDPdirImW9fY2eJ2IEjhEjpUOb4Fd7hChrD2Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPyiP9Hih5bQGMzBMwMTUmdjAl31AgezdjjfjZ5fSAmfkwt9ps
	QEXEcnicOfVXfAT0Gxyc8ealNhZtZgd+ursZLP4+g7WVOZFnfKci60Jyq6JkZwvDGw==
X-Gm-Gg: ASbGnct0GOme/qeR2e12Pliy7/9/A+f8ENlPPTfsRGXUPikDdTnuStAyj3wi1fM3+SU
	CwOApV1idfb3Vp0E2iQ4b1zZrqBCKOqeLraYLdGDaOatSTrdb4xaZs+YNRQH96aXKeKRWpEp4wi
	X9lNMLPiLrrC2ZCVYtRtOLfQdHDIMfTGVIZYI3PYek78bb20fqCtJILmHhZ0R2OtDMbSKQ+9sF8
	w8OSxPuVKzLVOgsq0D5o2n08OZ2ZaV2aT1iI0uKXngaxxrHbuhoGJr9B2lFX4mCN9Fn2yN0ghaO
	IYY/2ku08wV0d6b+pTH85YrRltqQv7H/5ebjpAlU6DPDkzQnqhNUFc/zYD3mgOh2driRHAhK3xQ
	B7WfCSifFc8o8tNI8zhhUoaSJApn2j6HUxiBMmZJmV8D7JkdzakZemtjEurCB8ZaP1YqgG90Vcd
	CP2HPWGPA=
X-Google-Smtp-Source: AGHT+IGucdivPcR4bTly6CHZIjfRq2AvqU7XGF3M3ZTZ4VecqkDKdUenYloQBiod9kW/hsjFvkjhNA==
X-Received: by 2002:a05:6000:288a:b0:3b7:9477:f4ad with SMTP id ffacd0b85a97d-3b794fe92c2mr5730958f8f.36.1753976746837;
        Thu, 31 Jul 2025 08:45:46 -0700 (PDT)
Message-ID: <58d578ec-84f7-4103-ba1c-0d5dbb7f44d0@suse.com>
Date: Thu, 31 Jul 2025 17:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] x86/msr: Introduce SYSCFG_MEM_ENCRYPT MSR.
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1747312394.git.teddy.astie@vates.tech>
 <72dca4861d81ca418e244526babd48d511b9baa3.1747312394.git.teddy.astie@vates.tech>
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
In-Reply-To: <72dca4861d81ca418e244526babd48d511b9baa3.1747312394.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 11:31, Teddy Astie wrote:
> From: Andrei Semenov <andrei.semenov@vates.tech>
> 
> SYSCFG_MEM_ENCRYPT is the AMD SME MSR used to enable SME and AMD SEV.
> 
> Signed-off-by: Andrei Semenov <andrei.semenov@vates.tech>

Title and description talk of an entire MSR, yet then ...

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -221,6 +221,7 @@
>  #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
>  #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
>  #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
> +#define  SYSCFG_MEM_ENCRYPT                 (_AC(1, ULL) << 23)

... it's only a single bit. Such an addition is in principle okay to go
in at about any time, but content and description need to match.

Jan

