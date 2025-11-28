Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AABC91110
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 08:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174514.1499476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtEV-0000aa-JT; Fri, 28 Nov 2025 07:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174514.1499476; Fri, 28 Nov 2025 07:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtEV-0000XT-Ga; Fri, 28 Nov 2025 07:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1174514;
 Fri, 28 Nov 2025 07:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOtEU-0000XN-Cf
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 07:49:34 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a774ca-cc2e-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 08:49:32 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso14627285e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 23:49:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0c3a1dsm140314155e9.10.2025.11.27.23.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 23:49:31 -0800 (PST)
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
X-Inumbo-ID: c6a774ca-cc2e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764316172; x=1764920972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wSS3l+8BtbiRHnyLZ80a43CeTYbtZb0p2rdsoiclJmk=;
        b=QW7aMcFgVNAcujGmpcPkIWEsk6hY6bWds2yV9fGkyQCFWm9al5ldkHxdmhUksjW1GV
         QLr02YhYA1oWCGDztwvpCwQ1KN4DR06WxoPCf/lo+3Bb3IX+bOZ8wUpJJ0x+biu4LEsa
         cSCBXZb+LQTpCFc530z/pnb4iBvVsMFZsqMW2Y7haRjmfFOLBhdKgl7O/c4T+Cb0hMC+
         8VpkfN/Op41Ni+Vs8VbROq8+SjUVTvME/H53ypkjycXfPKNdsteqLvwbf1pRIK4RcTnI
         au2sgPttScv1lu+WwJQsRhMyr3EOoj+BbCA/ZXsRphZTXT2hqzpQP4IOGBpuqiA5UdeD
         T33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764316172; x=1764920972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSS3l+8BtbiRHnyLZ80a43CeTYbtZb0p2rdsoiclJmk=;
        b=welQcLUMpfkhJIYvXtR9PxxucsqdVhubC85MtzMA88ZTM99Ek9X111eDVDIzNNpVw1
         EdXWdFiK8TnEu5fBF1UzO4f9KGCHxXsh3NydJ59hnYx7q+aw1sOLCvEMs2zasTFflDee
         Ka2SFqK9tJzjY3/vBE/SrjzNuwK9oJAN3dX67+9+C9Yrh6qlIflwwPnc15W8kXJJ0BiK
         t8fdsj82PmtnzFTgr8AVgZqwPOFcQjCgbKOwW/XP2r0pcjOx4YiGXeeGEorEjCbgnuJQ
         1uVbBnWB3/LUx7NQEe660+Bly1qhMQuvYuZatgXdGE1EFVRWFjrXbSQJhVYI/GLjcqai
         TkQA==
X-Forwarded-Encrypted: i=1; AJvYcCWQk77d+1YMYoiJNFfP7be96N3lRllulVcFukeaDzjY+/k4G1Ah4fdD/O2d2OxX1Fq/JyOgLE2Q6qI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqMyyTbpV6uhS6xiMYLzk21vSy+5JSrJp1nGUWFJqYJ56COmHD
	KFFbXjCSCrHL0dCsGD8XXh2kcTLI388kJi4CAcAykCdLC1jnoylVsOCEL/S9xGi67A==
X-Gm-Gg: ASbGnct3Q9+Zinj2hSOIM7Hf29Va8VrdPMjoyCV60sbxc2LjuPiGEj0ofmSbxfhe2Ou
	2DjRknLAlkUu1X681EKJcuWOSJoPrHScJLVCKfqrRDky0GA0svHf9igW2b1YRX1ibbgr5FAqqo0
	dMxv7A2yaoydrq57FGFMf246qGZkQ76zhXjzLZDfoW9nDaLQeEIxXLx0kkbKoY3Fha9H6J1xeJa
	sgMojPEBLLsUZs+5Z84nHoJRzynzONiM4Hh14g20cpMo63r5qiUH+ewHzMT++f5eLsuXMdlJjuD
	YiQ9tuwqmNhOjSZACBqOq91eJ30ymbJVn/6MDTUcxEixhlzrnM59hNykFT263N0+GcIWJSloDY2
	mfM4fLBnQ40MJog64A/YzCsczcWbcUFmBi9yqhozurFv5tb9vno8qcjvhVb1++E80p057X/mE7k
	/MZ6cWkZXuTMHwTq1CnqcU5rM9Z7f2jUK8fkrmlM1mScKVkDTndjce5Rn4SEGR7u6BD0esnO5kg
	yA=
X-Google-Smtp-Source: AGHT+IGfwZ2Wnso0uN/sn5jA3I3M3KICADkZjpKWd5MKu+pT+aTRvlJA8kJd1vOZSIeGh0RKt1ro1w==
X-Received: by 2002:a05:600c:1c1f:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-477c04c2011mr317117285e9.2.1764316171713;
        Thu, 27 Nov 2025 23:49:31 -0800 (PST)
Message-ID: <a00502ed-d3dd-43cb-a092-06208e416beb@suse.com>
Date: Fri, 28 Nov 2025 08:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.9 3/3] x86/amd: Fix race editing DE_CFG
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-4-andrew.cooper3@citrix.com>
 <20251127171843.943378-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251127171843.943378-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 18:18, Andrew Cooper wrote:
> We have two different functions explaining that DE_CFG is Core-scoped and that
> writes are racy but happen to be safe.  This is only true when there's one of
> them.
> 
> Introduce amd_init_de_cfg() to be the singular function which writes to
> DE_CFG, modelled after the logic we already have for BP_CFG.
> 
> While reworking amd_check_zenbleed() into a simple predicate used by
> amd_init_de_cfg(), fix the microcode table.  The 'good_rev' was specific to an
> individual stepping and not valid to be matched by model, let alone a range.
> The only CPUs incorrectly matched that I can locate appear to be
> pre-production, and probably didn't get Zenbleed microcode.
> 
> Rework amd_init_lfence() to be amd_init_lfence_dispatch() with only the
> purpose of configuring X86_FEATURE_LFENCE_DISPATCH in the case that it needs
> synthesising.  Run it on the BSP only and use setup_force_cpu_cap() to prevent
> the bit disappearing on a subseuqent CPUID rescan.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one more request towards commentary:

> +void amd_init_de_cfg(const struct cpuinfo_x86 *c)
> +{
> +    uint64_t val, new = 0;
> +
> +    /*
> +     * The MSR doesn't exist on Fam 0xf/0x11.  If virtualised, we won't have
> +     * mutable access even if we can read it.
> +     */
> +    if ( c->family == 0xf || c->family == 0x11 || cpu_has_hypervisor )
> +        return;
> +
> +    /*
> +     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
> +     * serialising, and is enumerated in CPUID.
> +     *
> +     * On older systems, LFENCE is unconditionally dispatch serialising (when
> +     * the MSR doesn't exist), or can be made so by setting this bit.
> +     */
> +    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
> +        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
> +
> +    /*
> +     * If vulnerable to Zenbleed and not mitigated in microcode, use the
> +     * bigger hammer.
> +     */
> +    if ( zenbleed_use_chickenbit() )
> +        new |= (1 << 9);
> +
> +    if ( !new )
> +        return;
> +
> +    val = rdmsr(MSR_AMD64_DE_CFG);
> +
> +    if ( (val & new) == new )
> +        return;
> +
> +    /*
> +     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
> +     * threads calculate the new value from state which expected to be
> +     * consistent across CPUs and unrelated to the old value, so the result
> +     * should be consistent.
> +     */
> +    wrmsr(MSR_AMD64_DE_CFG, val | new);

The reason this isn't at risk of faulting when potentially trying to set a
reserved bit would better be at least briefly mentioned here, I think. Yes,
logic above tries to eliminate all cases where either bit may be reserved,
but we're still on somewhat thin ice here.

Jan

