Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E79C568AD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160776.1488827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTT3-0007kR-6k; Thu, 13 Nov 2025 09:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160776.1488827; Thu, 13 Nov 2025 09:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTT3-0007iH-4F; Thu, 13 Nov 2025 09:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1160776;
 Thu, 13 Nov 2025 09:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJTT1-0007iB-Kb
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:18:11 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abcba1c5-c071-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 10:18:09 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so1030376a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 01:18:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a497ffdsm1016727a12.21.2025.11.13.01.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:18:08 -0800 (PST)
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
X-Inumbo-ID: abcba1c5-c071-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763025489; x=1763630289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SV8Y/QsOuXLF5oLXrwfPXc6plXQC0djuVsHcadHB8tA=;
        b=Kvc8GeWsAVSiA8K34xRqdJ6MfOJQsURPY8lSAoQuwYoY5UzSpmkSI0v6ptDODrO2wi
         Xly4OzospuEu/O5dNNf3/IN1j15UU3x76BSrAfe3h6hcLWqXphaJrTJ8+oscvaDUiSkx
         m1zZfcLj+XkPQTDsN/7Ra/SszD7+MA23iUiSS7cakIim0ZaPTlBA/n1lzOLwv3YqB3aD
         IqckX/l4cgg9Aq2kTK/DE8mMGsyKGugIRwxIuTKCd5EPaz538mhAfCZFiQaUqS2WMbQv
         gjTSQP006uniP1foJGXBaYJMRG6otVQW35Hb1o3LADuRD+xRZaZwDlK9r4sf0ztyrJP/
         AmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025489; x=1763630289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV8Y/QsOuXLF5oLXrwfPXc6plXQC0djuVsHcadHB8tA=;
        b=BGQcsjSeWeYgQDW9XpEM1Z7g2KCXXAlHHlghnenZFozhpNGFtXlMnrP2QdAKMdYCFR
         fUR8pLfMjlnvXPtwJEsleYDg3n7PBTZ9+5ECtAphvD82UYFbfK7d4ILRUKfjO+YbMFk6
         4oDY5y3fiCftRhMK2TIznchOmM9hgwMu3I1sDKSd5T1vrUygZm69oK4i8lPXIwmncwr7
         6ts9RrZmWq98XTaiZFFpj2c4eLpI+4YqnrtvZKBRtdY1gK1fCw6r+Bv4JkNvYhZvpfR2
         yk9UbvgsdntrfviWZ1cs1k4x93WnkrM4pUMKM7BwHf0uA1q4F9wKBmOwlKn9zg9jnUva
         YCLw==
X-Forwarded-Encrypted: i=1; AJvYcCVfvUvUmBFPteneylNbJZw8JjvLM4UATre7pQkq0KF/nuygYXGBd19MxNZSFg6+Tt/NTObu0giozOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzklfzzB+dftgM2fUrYZvK2O042mbn23ZxM2EYKswKlA3TubSf9
	4YVlCz0ovXt0Uzn/cbdZ0HcNeZhUUud0nCKDZb5cg3AMh7/V7YSmeHW8k/QSOxH+iw==
X-Gm-Gg: ASbGncsbpHZGRQteI1Z8Pf1Wx9Sjd+dC83Fc37GjDxw//ya2f/QFXrMtNw7w9/Kg6jv
	MJcNmucx5/C6r5w8bUR1JgD2fE/4371VFI11KHwlkrXX8TIxP1KHebOvW4wDYDnRXtAy17Bpj1L
	obQSBtxy4a9TMtKl9SkzRXHUShyYifu6DfN2ZX+qZBJY8lYmfxSQlvEK6sk2tJA/hTjmtoM9lJS
	wIC33Zr6WODAW+G4KIi+ChA6NsfGYQ3g10JT3/3DEcsKjQa1ScufuQ5SHIqk1gD0H1ekKpkBSR8
	VjXyR3KlSVZRhE7DYWdlYi/XYB6GpI4AZH+0cuzyaSZ3aCftJ2IrtsJ6TqamW3eLKWhAbr0vdrb
	RIgRb72PBePjTXEdLIsdVNDFc9seco8th/eGSCyaE8E37wBhx1TvjcLpxHgmyi672chaiSSHLpb
	oJRhVAsgDeRgid5+K1ffK1uDKCckMZKTEBBkBjjMsBYFAB0suhJfRtq4dbA1B+wa6YZLWWk0zGP
	/c=
X-Google-Smtp-Source: AGHT+IHfj8KwgMeyLIbHR87rzTVNwKv5Gq8srGMKk+ANr/RbrDmg7w1eZa0fYmBaM4lT33+lMFwweQ==
X-Received: by 2002:a05:6402:2106:b0:643:e03:daed with SMTP id 4fb4d7f45d1cf-6431a49e91dmr5103948a12.1.1763025488974;
        Thu, 13 Nov 2025 01:18:08 -0800 (PST)
Message-ID: <e443bbe9-e2ac-42c7-803f-2017848c4f58@suse.com>
Date: Thu, 13 Nov 2025 10:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] xen/monitor: wrap monitor_op under CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> Feature monitor_op is based on vm event subsystem, so monitor.o shall be
> wrapped under CONFIG_VM_EVENT.
> The following functions are only invoked by monitor-op, so they all shall be
> wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=n):
> - hvm_enable_msr_interception
>   - hvm_function_table.enable_msr_interception
> - hvm_has_set_descriptor_access_existing
>   - hvm_function_table.set_descriptor_access_existi
> - arch_monitor_get_capabilities
> Function monitored_msr() still needs a stub to pass compilation when
> VM_EVENT=n.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - a new commit split from previous "xen/vm_event: consolidate CONFIG_VM_EVENT"
> - Another blank line ahead of the #ifdef
> - Move hvm_enable_msr_interception() up into the earlier #ifdef
> - only arch_monitor_get_capabilities() needs wrapping, as this static inline
> function calls hvm_has_set_descriptor_access_exiting(), which is declared only
> when VM_EVENT=y
> ---
>  xen/arch/x86/hvm/Makefile          |  2 +-
>  xen/arch/x86/hvm/svm/svm.c         |  8 +++++++-
>  xen/arch/x86/hvm/vmx/vmx.c         | 10 ++++++++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 18 +++++++++++-------
>  xen/arch/x86/include/asm/monitor.h |  9 +++++++++
>  5 files changed, 38 insertions(+), 9 deletions(-)

Same remark as for patch 2 regarding the subject prefix. Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

