Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D41C8D659
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 09:45:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173568.1498595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXcN-0008PL-82; Thu, 27 Nov 2025 08:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173568.1498595; Thu, 27 Nov 2025 08:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOXcN-0008Nu-4a; Thu, 27 Nov 2025 08:44:47 +0000
Received: by outflank-mailman (input) for mailman id 1173568;
 Thu, 27 Nov 2025 08:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOXcM-0008No-1D
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 08:44:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 520cc846-cb6d-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 09:44:43 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so4449665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 00:44:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca40945sm2155109f8f.30.2025.11.27.00.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 00:44:42 -0800 (PST)
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
X-Inumbo-ID: 520cc846-cb6d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764233083; x=1764837883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zlDszzPGpdiv7N5SBUS3H3WvlmYzKtVtIoxDNaTVOSo=;
        b=QEaI2j7YUPPkegEyK15PexT8Ir5kOsyYsP5siDs1Aw0VBKgzBrU99l1QGoj7clp0zv
         QqKaK9sSLr5ruLPGPZeTp/lZcog3zA/pIzidHOi1Yf7222D9LXx9n55eh4cQbIlvh8AD
         Yx8g9Wmad7O0v5WZinKwll+VhGJ6JtBvO/1jAfz8EQKtavXesMdrYjzl8bzjTD4HkPqn
         qVC8vej74ml/zuCZ0hpk3dDmZVkCCzQWT984u8lW8BTgU47wYCKv0nyCHX2HcsQruIh2
         JCFUxgIkX/U9FavddnyHdlsRDiy01cDcZ5uZb0iVRqB+DBbnIkd8vVArL+GDUXKSJTkw
         S+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764233083; x=1764837883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlDszzPGpdiv7N5SBUS3H3WvlmYzKtVtIoxDNaTVOSo=;
        b=Tr26nRDRygpJfcidV1I8fHpYhoxNuv+w80KyiJC3FuxnzVh15tEbk50XwuIPsK5ARU
         ykGmwEfXrxB7mdHOuJWYMO1hA5OMB/VzyGEGBHrNqW0kFe+I55iNmjSzxLJqTsFWTQhm
         1+vrpR0y9Plq5e0nGxnufCKvEvJz5rokeM1nZchvPLMidz3MPaOIX4OT3MdUMOr+QgtQ
         jah7XPmBvtckKlDBZOBEhkIjwsuRinuRwfBGXWMvz6RUPNnw88sZth9IMEicUWibk8Hr
         RU8EMyKPsEw1FyfQ4381Xl5h/bhQFgFY8IEtDYadJYxQhCWmJ1c99HW4z883pNfs9xM4
         2oNA==
X-Forwarded-Encrypted: i=1; AJvYcCUsCKJJhNoUTh95D3/OJY8QXV2PTmN4bg1/qkcBKfcmfLx1iHKUjxSV8CV0OhDItqavcIA2WQwo57g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySy4Gz1xknHH+PyhC/z+eIIpovmrwjUp0O4/MhV29oV5W/OUWu
	7786D7Kjm3XAL4K6vNcbSnjK2ulyju3E9XF6GbVt+N1wNRTyEHkZJUhq2Ea34B5Vfg==
X-Gm-Gg: ASbGncu1ThjmAQ7xp/uDTPnM2ouqD7hH4CTwNKWu7o0QSBT23Yo4KI+3/zwDQTZVC0W
	UP+gf7TxbZLjPH3J/fotcH7oJBxkkAYt3eZSop+WGseJYRyvxzQdJdjSanvJRmgJS+wUfZ0uTpe
	MuJjUyZ67/+TpofHdjL6NRhgAi11dJ2dZqQ11RvD0eEDjlLM2VLhT75Skimq8k5ifXNB96rtd0+
	qlayssegerIE9atOlQQtKBRH+Ke80OktRSe//0OOAsORwJjf1ayWwhd+Dm8QuBT5BzW+2Hg/iE+
	IuRsfW/54pRXMjCvmU6fgCowOCeqN+IIHY2y5kMqBa7L05XmYoeIq9/i5PXoofkziveAmPNeNFV
	EvQtXkCvLGep3rztaoDOlSDES83URkHaN1gj5phsreE/qzTcymIU7JCeeb6XgOoqN/PKRUJ5Dmr
	DHs1PX+oSORI/pzvoK6E+cBDjXbXF/IAH1yq3NVmXITTZEcgvcwyX/TdSoTUotEfCvCLvqCEh3J
	yia3S9pDE4Hkg==
X-Google-Smtp-Source: AGHT+IFbnqCyj0hm4Ok8LZ8mcQJC5rKlp/dxaxtp8Un4qxlo5JynodV754bm2nDLs3ZdnCSdYyCIBw==
X-Received: by 2002:a05:600c:350e:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477c10e2a64mr199092945e9.13.1764233083134;
        Thu, 27 Nov 2025 00:44:43 -0800 (PST)
Message-ID: <9e8ecbc0-2dd1-4744-878d-9b09d019041e@suse.com>
Date: Thu, 27 Nov 2025 09:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/amd: Drop vestigial PBE logic in init_amd()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
 <20251126171539.890253-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251126171539.890253-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 18:15, Andrew Cooper wrote:
> The comment was adjusted by myself in commit 51bd4bbdfdba ("x86: drop
> X86_FEATURE_3DNOW_ALT"), on the presumption that the underlying logic existed
> for a good reason.
> 
> Having done further archaeology, it turns out to be vestigial technical debt
> from the leadup to Linux 2.4 in November 2000.
> 
> Prior to "Massive cleanup of CPU detection and bug handling",
> c->x86_capability was a single uint32_t containing cpuid(1).edx,
> cpuid(0x80000001).edx, or a synthesis thereof.  X86_FEATURE_AMD3D was defined
> as the top bit this single uint32_t.
> 
> After "Massive cleanup of CPU detection and bug handling",
> c->x86_capability became an array with AMD's extended feature leaf split
> away from Intel's basic feature leaf.
> 
> AMD doc #20734-G states that 3DNow is only enumerated in the extended
> feature leaf, and that other vendors where using this bit too.  i.e. AMD
> never produced a CPU which set bit 31 in the basic leaf, meaning that
> there's nothing to clear out in the first place.
> 
> This logic looks like it was relevant in the pre-"Massive cleanup" world
> but ought to have been dropped when c->x86_capability was properly split.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I think that, along the lines of a comment I made on Matrix, that ...

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1131,13 +1131,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  		wrmsrl(MSR_K8_HWCR, value);
>  	}
>  
> -	/*
> -	 * Some AMD CPUs duplicate the 3DNow bit in base and extended CPUID
> -	 * leaves.  Unfortunately, this aliases PBE on Intel CPUs. Clobber the
> -	 * alias, leaving 3DNow in the extended leaf.
> -	 */
> -	__clear_bit(X86_FEATURE_PBE, c->x86_capability);

... while the justification applies to what the CPUs surface on their own,
the basic leaf masking MSR could (likely) still have undue bits set, and
hence may want pruning in exchange / addition.

Jan

