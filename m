Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CB686FBF6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:34:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688205.1072124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3l4-0000se-Eq; Mon, 04 Mar 2024 08:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688205.1072124; Mon, 04 Mar 2024 08:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3l4-0000r7-Al; Mon, 04 Mar 2024 08:33:14 +0000
Received: by outflank-mailman (input) for mailman id 688205;
 Mon, 04 Mar 2024 08:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh3l3-0000r1-6f
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:33:13 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5ade12d-da01-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 09:33:11 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so5686677a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:33:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u11-20020aa7d54b000000b005676dc74568sm22766edr.92.2024.03.04.00.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:33:10 -0800 (PST)
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
X-Inumbo-ID: d5ade12d-da01-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709541190; x=1710145990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ut64ZgYtVOtqepmTe4ahlByQcsflnD3AE8O5tiYr2uM=;
        b=P6xjlcv4OnXIJRWyUZG1VXDG3YJ6cZrpkya+3gVkt26M+BZ7sEhEEAxlth5eKMWFcy
         y3E0isxwxFB2nOT68k0nE0iGBzT4Jbwx+j3SG+OqoX9sqs44txKI0Rhg90ZzGPlrSJ5K
         iAHUXFuxFk+zbKZumbRyE9V54xH3PBbZByZguebJF81UnVzzodjK9E1SZHjaz2UxgoUv
         iJ1TRuCmIVMmLDfsVBODn621N+jwl7wWDvfDhurlsQ6w3GBrEJv4fbGlIafEr4vtdSx4
         xs4AbAsYcAQGz1twkpiD6VwRqeIYQoJchbuDJ63ibNPa3rHZsSMbXeDcxFWmDtxyj3x8
         BVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709541190; x=1710145990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut64ZgYtVOtqepmTe4ahlByQcsflnD3AE8O5tiYr2uM=;
        b=dPVUfe3xIB58XytqLDwPpvmMCIDGrHwo/7qnxo+/+0bmROBbQAWkDd4p1XwfuEjtOL
         v9o/G352CCOq12m14kv998MG44nnqAZtKS6ML0WTww/DHL5kRToPFiCvo9jIdrxundku
         Vkuz4dJZ4585D/QFXg4OTRvnKQFk93H1c0M45FT+vvDDf0RJvn/xc6uGX3JeCDD7zD6v
         yZa8FYmlycCKcv1kOzknrdSdQKUyWJKWqzKLYIo+iGGJyobZGLN7T7t4QLMP2x6Cnpcx
         WETfmefs8eUMBEfF5cGEyFYfBeTD6dA7jyUHtPCsgblI+Edm6O7d/SVEQ/OAlL/PS5WY
         IewQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPW4FAgjD9/RDBF8H2fy26thIaHXBnwNacoH/DIUkhR+29RKRZp0bttLmXeFW0djNp0zjkEPvf7x4zZmC9gucj75mtW4x7yMIYqzMiZYc=
X-Gm-Message-State: AOJu0Yy+DRTeSL9YovxuwZJSyIy6pPR+JYc9BBc27vgLiMdg4nih1d1D
	IQlS3PuNFnlDIhAVp8PVkUUGUNDSc3B1bxKX68FgYDD5ITEaETHeW3R8UthASw==
X-Google-Smtp-Source: AGHT+IE5pkF2L5/EFj3QzEpp2TA7uLEF/c3/IsKsebGorzXzi1O0vADGmo+fTiEiD9Yav40TLLx2GQ==
X-Received: by 2002:a50:8dc7:0:b0:566:131a:26ee with SMTP id s7-20020a508dc7000000b00566131a26eemr5275332edh.35.1709541190462;
        Mon, 04 Mar 2024 00:33:10 -0800 (PST)
Message-ID: <da6bb1e7-fa8f-4aca-8ba1-36f49f41d38b@suse.com>
Date: Mon, 4 Mar 2024 09:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Hide x2APIC from PV guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229221448.2593171-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240229221448.2593171-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 23:14, Andrew Cooper wrote:
> PV guests can't write to MSR_APIC_BASE (in order to set EXTD), nor can they
> access any of the x2APIC MSR range.  Therefore they mustn't see the x2APIC
> CPUID bit saying that they can.

This argumentation could then be used equally for the APIC bit. Why is it
correct to hide x2APIC, but not APIC?

> Right now, the host x2APIC flag filters into PV guests, meaning that PV guests
> generally see x2APIC except on Zen1-and-older AMD systems.
> 
> Linux works around this by explicitly hiding the bit itself, and filtering
> EXTD out of MSR_APIC_BASE reads.  NetBSD behaves more in the spirit of PV
> guests, and entirely ignores the APIC when built as a PV guest.
> 
> Change the annotation from !A to !S.  This has a consequence of stripping it
> out of both PV featuremasks.  However, as existing guests may have seen the
> bit, set it back into the PV Max policy; a VM which saw the bit and is alive
> enough to migrate will have ignored it one way or another.
> 
> Hiding x2APIC does also change the contents of leaf 0xb, but as the
> information is nonsense to begin with, this is likely an improvement on the
> status quo.  The blind reporting of APIC_ID = vCPU_ID * 2 isn't interlinked
> with the host's topology structure, and the APIC_IDs are useless without an
> MADT to start with.  Dom0 is the only PV VM to get an MADT but it's the host
> one, meaning the two sets of APIC_IDs are from different address spaces.

Aiui the field will now be seen as zero on all CPUs. Is all CPUs having the
same APIC ID there really better than them all having different ones?

Also while I agree that logically CPUID leaf 0xb EDX is tied to x2APIC being
available as a feature, nothing is said in this regard in the documentation
of that leaf. This in particular leaves open whether on a system with x2APIC
disabled in/by firmware the value would actually be zero. Yet that case could
be considered somewhat similar to the PV case here.

Jan

