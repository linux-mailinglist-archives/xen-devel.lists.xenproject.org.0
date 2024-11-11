Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D19C3E37
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833676.1248863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATJP-0003u8-3T; Mon, 11 Nov 2024 12:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833676.1248863; Mon, 11 Nov 2024 12:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATJO-0003s0-Vv; Mon, 11 Nov 2024 12:14:30 +0000
Received: by outflank-mailman (input) for mailman id 833676;
 Mon, 11 Nov 2024 12:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tATJO-0003ru-8N
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:14:30 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f45cc4d-a026-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:14:27 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso3360001f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:14:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea6b5sm12922430f8f.84.2024.11.11.04.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:14:26 -0800 (PST)
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
X-Inumbo-ID: 7f45cc4d-a026-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdmNDVjYzRkLWEwMjYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI3MjY3LjgyNDg3NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731327267; x=1731932067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6RCqVszOuC4gGwkt3ZvqqSukGVwmrwfAbKpDhDbKyOo=;
        b=EYbick+ar1CzA8Mq6PLyDQ0hLPDrmLuRHLnAXqsjbLk4vy3ONV5PFadlLAW3AcuLh2
         m1byGOEuHUmsqrhlqJtseNX9CDbEKjncH6V9GR2BLbsnKlmY7tQTKaTkfGSo5TCjmkP6
         0LwVnc3KIiF1PqC1u2XZD512IRz/N8N5wi4v6k705m6zw7hCaTygB+9eQ957hbuuLO3R
         97LTsGXHE1Sy3USY9r0QhUWiN6+G39NdTlcGwSjUXU5FAws9WmALo0yNJ8N9B2eq/8MP
         Vi9T3fS47zfGM0NtfvN8kOopLdvcGaSrCyBajECXHME0Xo9eYrIbyMofNYKzy/wM7E3S
         hqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731327267; x=1731932067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RCqVszOuC4gGwkt3ZvqqSukGVwmrwfAbKpDhDbKyOo=;
        b=dVPf46LYiBZtamrFv6sVwOtGbSDL4QGGRQk6hoXkPpfuQIWARrBvYVjM11by46mXiH
         LPm9PmZZU7sJv23WRFu8bowlf2+zJk9+iAjbsUUE8Tb6WkNbch1PgawJmbOxQJNwpMj8
         dKbSNc6HTf71F5fgzzGHla2syHGbepk8qczDYWSJa9j/z44cZb8pcge3YNZmoE+3/tEA
         k8YfCaOlQZ2e8FBmnjDdrwonNYN8NEJ9H6VBrVioZto2nJUccAqWV4vI0BThZm0Wv//r
         OhTzzdyy4PYDI8nkSbXfIS+DyxRlalwYWbO5Vn29rbmZ7Wg1eP3lIhEWLBfKX7Qz+c4K
         TbAA==
X-Forwarded-Encrypted: i=1; AJvYcCVCSg3Qep4NeTPCoeLlccmw6In4P0BkNLKRca18De0gI5xRxIJUNQK5v2J+S08Dl3cdcpCIrq21rnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzug5XTZbETHkD7HNgWpPxl4Iw1Y6H0HQuhS4hh2I59RS7bJGEq
	cKgW/48pbXYDV0NGFLi0sbhnjTnFZGcUkJAyIH0CuP/uRiBAdsSQUjXXq6H8qofQoefQZXZ9wms
	=
X-Google-Smtp-Source: AGHT+IELRPqzt+KBurlSrrJGCWAVMERhQ3I0fRpWBpsfUOUqtZ60caKXtkayg9GUcC2TTbbRDoOjOw==
X-Received: by 2002:a05:6000:21c7:b0:381:f443:21df with SMTP id ffacd0b85a97d-381f4432553mr6230115f8f.1.1731327267224;
        Mon, 11 Nov 2024 04:14:27 -0800 (PST)
Message-ID: <a6a51e09-6c1d-472c-8bd1-0fad956e8be4@suse.com>
Date: Mon, 11 Nov 2024 13:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/trampoline: Change type of trampoline_phys to
 uint32_t
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241111104902.985611-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241111104902.985611-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 11:49, Andrew Cooper wrote:
> As now documented, this variable holds a page aligned value less than 1M.
> 
> However, head.S fills it using 4-byte stores, and reloc_trampoline() is
> compiled for both 32bit and 64bit, where unsigned long is a different size.
> 
> This happens to work because of the range of the value, but switch to uint32_t
> to make it explicit.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
noting that ...

> --- a/xen/arch/x86/boot/reloc-trampoline.c
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -15,7 +15,7 @@ void reloc_trampoline64(void)
>  #error Unknown architecture
>  #endif
>  {
> -    unsigned long phys = trampoline_phys;
> +    uint32_t phys = trampoline_phys;
>      const int32_t *trampoline_ptr;

... this change shouldn't really be needed (but is okay-ish to have).

Jan

