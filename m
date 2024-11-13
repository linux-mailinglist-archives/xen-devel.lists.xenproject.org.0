Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A989C6D19
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835327.1251191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBArI-0005bm-B5; Wed, 13 Nov 2024 10:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835327.1251191; Wed, 13 Nov 2024 10:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBArI-0005Zg-7J; Wed, 13 Nov 2024 10:44:24 +0000
Received: by outflank-mailman (input) for mailman id 835327;
 Wed, 13 Nov 2024 10:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBArG-0005Za-Dq
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:44:22 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c6d4add-a1ac-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:44:19 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so58874191fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:44:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f5235sm19974535e9.10.2024.11.13.02.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 02:44:18 -0800 (PST)
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
X-Inumbo-ID: 3c6d4add-a1ac-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNjNmQ0YWRkLWExYWMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk0NjU5LjQ3NjI2NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731494659; x=1732099459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xybZc8YA9sDO8JN7cLkx/LFPepApPRZxKT6ttuqW1A0=;
        b=FY5LvWjNy8Ra/xZIhJr7ZrBVvGo6e44GtJ3M7bSB8/d+KERkTCFdgeH6hV1mERAxzi
         11ZHdukAQotlq1dd/3xyQbNIX/twL05vrjIohYX9MPrWvLytK7Maz+LtBrWRAntCwdov
         TsV4HZajKuLFA31RVcpleRjGWmEP/aS8pqLxSc0IMQ619x+VRTHCRNri0yQqb2ZiZPYI
         Odatl4GFbEmGQIRmhk1m0K1DdQb3l7Me6ATVAeFdpibq8ExJawidtrNaoVDEqQaddaPl
         6v1Mzyu+tPH30vvj9zKyLMbX0e+u8uKoOdhdlgpdKv7dInDpRHD09SJil+Ws1m9dNrFS
         kFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494659; x=1732099459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xybZc8YA9sDO8JN7cLkx/LFPepApPRZxKT6ttuqW1A0=;
        b=IY8FS68aHdDzM0lBo9xseted04O5xft8IBlKIwV6zFVf/+uC11fI096iZHTLBeBS/V
         g1jB940dGh89quwwJaTMOFZge8xraNY7e3xl9BAwLZko5w8RA84BoKep8RZDjvswGGnF
         oFnXJk87PtXjq0RA/vDR3JxXBcDmY7XnkWJbyMJmQ0MI4YHngIOkQWdGOURP1Y0b2Q/r
         4BvEsScKkWzgKUyXC3oJMsPiJXTJ+Ga55gGzp7xjFlH2dLQmRur3Be7lda50rhAYXmTj
         iDDkK2mA4EpwfAquhmgl/YPJoxR9/awTF3VIqlu1NGGMX/6ZgGtklKYU2ju5gDr+jE5r
         s6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVb3JH+sT718el6h+UimPjQJcrDtURoQY6sfbgCA38Khx2j7U/8woGSi6DkkPJugHJmVqi7xH8MwCI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiGWU/s25Mhs6BRZoacW6V6k6V7du5RzjCp6ouj7eg40KhxjJh
	bGAUi0wXecf6qsVFWAfRfCcW1tkwLLwhY09PctoHkahbljYN5UYz4e2M4o0rNQ==
X-Google-Smtp-Source: AGHT+IFrxrxRFG8lwlgvI2DfpQZGVM2frPfQ17vMiVvm5MJqD0TFcH9z2P7zcZpNIQ0RyJoIfBYdHQ==
X-Received: by 2002:a05:651c:554:b0:2fb:527a:815b with SMTP id 38308e7fff4ca-2ff202e1263mr107775941fa.28.1731494658608;
        Wed, 13 Nov 2024 02:44:18 -0800 (PST)
Message-ID: <7ba6e67a-1470-4734-a065-4d4045f8422a@suse.com>
Date: Wed, 13 Nov 2024 11:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add deviations for MISRA C 2012 Rule R5.4
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <255ae80cc8b95f33daa7534c9552c571391cf689.1731490650.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <255ae80cc8b95f33daa7534c9552c571391cf689.1731490650.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 10:38, Alessandro Zucchelli wrote:
> This addresses violations of MISRA C:2012 Rule 5.4 which states as
> following: Macro identifiers shall be distinct.
> 
> This deviation aims to address violations of Rule 5.4 regarding
> identifiers XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list and
> XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list, and identifiers
> declared in header file include/asm/guest/hyperv-tlfs.h.

Please can you provide enough context? The two identifiers are quite
obviously distinct. Just not in the first 40 characters. A limit I had
to actually go look up, because it's entirely arbitrary.

Plus - what are we going to do if further such identifiers appear?
Exclude them one by one? That wouldn't really scale. Can we perhaps
make a wider exception, e.g. at least for all XLAT_*_HDNL_* ones? Then
again part of the problem here is that hvm_altp2m_set_mem_access_multi
is already excessively long, alone taking up 31 characters.

Jan

