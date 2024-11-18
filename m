Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938C9D0B3A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839154.1254969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxV1-0005Rw-QX; Mon, 18 Nov 2024 08:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839154.1254969; Mon, 18 Nov 2024 08:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxV1-0005QG-Nh; Mon, 18 Nov 2024 08:52:47 +0000
Received: by outflank-mailman (input) for mailman id 839154;
 Mon, 18 Nov 2024 08:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tCxV0-0005QA-KD
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:52:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 798455cb-a58a-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 09:52:43 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-432d9bb168cso21812825e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 00:52:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da265f28sm152169985e9.17.2024.11.18.00.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 00:52:42 -0800 (PST)
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
X-Inumbo-ID: 798455cb-a58a-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5ODQ1NWNiLWE1OGEtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTE5OTYzLjY0MzM0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731919963; x=1732524763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XZk+bWx9T7B8AmhurcwVX9EBFu/eX9nrjXsCVUFCAHE=;
        b=ShHf3PUTaf7tkkYMMVMi2hv4pHJBSi9KcreMIYRZG2qHAOpz5kChSUlkebUiNY1Wlx
         D6xcNCLu3QAte0dQO9yK+pBrz5w9Ik0WIBTPm8WwNCfZIYKyvsOB9ydi7fHYT4pSHAdG
         qEXX08rNvFGeyolYkW3LQ/HfpoStE+QtUBEV/y19jVzroDnIIpWWysKaz1Bvxhtkv48a
         D+6FQ9HKtHhdORcYiM6T9X+S/MS3HjE5WIkq11oordo7h5sbGOvSMvxt8tc3jMwSy9ov
         X/lcRh7qaVQlLMDDqfxEfwPjFiGWoyIV9vMtCBOPQwO2TFkSEsdH+3Bi5zeqxThts58S
         SfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731919963; x=1732524763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZk+bWx9T7B8AmhurcwVX9EBFu/eX9nrjXsCVUFCAHE=;
        b=nDf1rWCNhvbQiRcNFj8o768asame+813+CIfmEgJiJxCnXjnJb1hDRMNCl4vMibPYz
         wdPI2jtEtwXuItczNqqfHvfPYI/32YGeKYXxMEwc4AN0YLlJEWqOVvOAF6Kx69rCVVPy
         lzLeDT1ZtxZqCLxw9Dtp8InNfxW/fUz/tyr3+SBqoFQvZ7au0jZFVqJ7CSFmYNu7VO1z
         3eRcVrce8QfvRr6O76yWvvAOwVH2eYlIFlQaJP/jzJZMHhq2oOdmvfbAOp4EEsJuNlub
         1UGFVuZXJBqeM7yklqDl0/w2WKIksGeZi86jisi7J+fMAs54MYFMVT68F0XCCesYrEtO
         OkkQ==
X-Gm-Message-State: AOJu0YxbSx5cQ7xyUjSob+kDodnCRnjABqElagm6Azsc5VcBkYPbQCIW
	2Nmr3YHQitrebHQRtCvFq4mg/8Lx4clcfz9zoN7UHhEsfW0qjLxlt1BqqKj15ssOdoGiUDmwxiw
	=
X-Google-Smtp-Source: AGHT+IGi3yH+l3f+ub5Efrvmv61A8KIohaidsHlXvVX2/4BF65KV9UgUmhVTugTF0o9q/F2bObfmTA==
X-Received: by 2002:a05:600c:1d1d:b0:431:3b80:6ca7 with SMTP id 5b1f17b1804b1-432d9767819mr143916025e9.13.1731919963071;
        Mon, 18 Nov 2024 00:52:43 -0800 (PST)
Message-ID: <7706bd63-8f26-4eb8-8dc0-67b302597e3b@suse.com>
Date: Mon, 18 Nov 2024 09:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Virtualize architectural LBRs
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> From: Tu Dinh <ngoc-tu.dinh@vates.tech>
> 
> Intel model-specific last branch records (LBRs) were replaced by
> architectural LBRs (see Chapter 20 of Intel SDM volume 3B). This
> patchset implements virtual LBRs for HVM guests using Intel's "load
> guest IA32_LBR_CTL" and "clear IA32_LBR_CTL" VMX controls.
> 
> Add the necessary CPUID and VMX feature checks into Xen. Note that in
> this patchset, MSR_IA32_LASTBRANCH_DEPTH is only allowed to be equal to
> that of the host's.
> 
> Tu Dinh (4):
>   x86: Add Intel architectural LBR featureset bits
>   x86: Add architectural LBR declarations
>   x86: Adjust arch LBR CPU policy
>   x86/vmx: Virtualize architectural LBRs
> 
>  tools/libs/guest/xg_cpuid_x86.c             |   2 +-
>  tools/misc/xen-cpuid.c                      |   3 +
>  xen/arch/x86/cpu-policy.c                   |  39 +++
>  xen/arch/x86/cpu/common.c                   |   7 +
>  xen/arch/x86/hvm/vmx/vmcs.c                 |  11 +-
>  xen/arch/x86/hvm/vmx/vmx.c                  | 269 ++++++++++++++------
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h     |   8 +
>  xen/arch/x86/include/asm/msr-index.h        |  11 +
>  xen/include/public/arch-x86/cpufeatureset.h |  28 +-
>  xen/include/xen/lib/x86/cpu-policy.h        |  38 ++-
>  xen/lib/x86/cpuid.c                         |   6 +
>  11 files changed, 339 insertions(+), 83 deletions(-)

Looking over just the files touched: No change to XSAVE logic at all?

Jan

