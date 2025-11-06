Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856AC398C4
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 09:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156551.1485605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGvBi-00006x-5q; Thu, 06 Nov 2025 08:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156551.1485605; Thu, 06 Nov 2025 08:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGvBi-00005S-2k; Thu, 06 Nov 2025 08:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1156551;
 Thu, 06 Nov 2025 08:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGvBh-00005M-7K
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 08:17:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11718856-bae9-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 09:17:43 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b714b1290aeso51990066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 00:17:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72893cc6c5sm153641466b.31.2025.11.06.00.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 00:17:42 -0800 (PST)
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
X-Inumbo-ID: 11718856-bae9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762417063; x=1763021863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71SB90NfEIoCPmTxGQuDlOuROF3EtSSAcP3iCmm2lwk=;
        b=DdUaDwk+5bNXsB/v4JpzYLG1/oPERLjr1910i5CgDRxROtF3bACFvx6K6BG2ZCcMJL
         F0iFrEINS+cKqJUCxJkac0H6QrjB01QJWRTiHbzt2cLGbS8h6eeZOKKghSPA/3OkPy0V
         RgRBbwYjrtmWxfeb1oz4AlRmMLKgF36nnM9pIBPIpAcq+yMge8t2BZSjJJk+w5B5OaPN
         oEr1sLQgvoY2j7wu/S0iYQRcYowhrOtVcOFl0fCYXSvm2rXv5VEYNAEoXZqBFQYHuyOW
         EfdQmIdNAxUuvzxIyfSSQaldR3oCiFZRITpJ6slSkQ6/kn/Usv0bHAdMYKT/Na3e0K68
         b6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762417063; x=1763021863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71SB90NfEIoCPmTxGQuDlOuROF3EtSSAcP3iCmm2lwk=;
        b=DeEwkQLQtnSkuzvdZIhnhOV8s20oenK0iry9esjsZKRADZcRt07IjgTyxAcvzjODkH
         BNj1MrV9MHOc8SgW/pCep36C0QeZ/nEWbhNEls1zguHKrrlWpyRDlDMucTSXJgSPz5IZ
         qGXJiNtug58b/qBhfPoMtpEudQQPVjXKby/kxGpvtXI86Wrua25gnixtr0Q6857sT0bo
         ksb1BguonVOZCCwlnf/xo7YpzsnnbvYBezbz9zw+fhMnf4zBxpPHFQNRqVRdLO4UrzFO
         YqZc1EQfMBBsR7PMBvj4q0jDE4a8HO4zCabn9p1CwegwV4bLdvELa1UchK+03QUU5UzD
         G0xg==
X-Forwarded-Encrypted: i=1; AJvYcCUPlA/xAj9N3JqvG90suVtA1365o0x3a/Fc4IUQt52zFC8tw3I6uIYsqi3yTraTN56Z2wySRs3HoHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXzGss55hErg4OEIuloulwnjm9aXUdELDN4fIonvALBrLjJ2rL
	ztFWuVnsOrLQwiaz4sTyCLTz4Ebp8oUiZW1uwlw7bVDxV5f3w4r9FRjOZOfHc4M8nQ==
X-Gm-Gg: ASbGncsYMjyaz0brUtxz/v95nRD5MgDzrb8gSB8iuOdIOmMrZCAZKwCcDb/z+OanmIU
	ivi4Opnbm6hTYhRqyusugV3kMKIvGOaORfRuYGbdkzRxUCylLYTZOBBz9IUK4i5hw6UGU0Ib7Zj
	n6yRtpQlXmbiQQJuq7DqCyF9cVpF/lCTsOWNm5STVoRySPYnCcTzx12ZCcVlXSPN4Vjjrjaym1P
	T75vFVaQeOCuWeZfX+zxkZJTMc9vXP53aumUwf04gmCBoABkzMxah8en2ZcOCBDtzfAG2KerhP3
	+jBUabca0dalvUTbQkpre49eSHqShJrHkaBOJsIVdhRSQt9tRY9fkUYjArhoYjMBpgBnBHPc3TM
	3LvUaaOQ+QciU1i9WIH4pBAVNsywbp9FGSr54KwaIsfsNmx3EY9gn8LkoiI4KHwjenqdzWCA9nj
	nEgLZ/+DR4X+l1bY5yFOrcDsQ2kkQ56OfmjRK0/XdB1VDaNYJfPAT0eZiqsNtw
X-Google-Smtp-Source: AGHT+IHerp5AOUCSGsxUXcidAvHeqCzoD3J0SNoABGlouC6QcO6aZ7TdxCWNb2F7zKT+8ZxmM7mC9A==
X-Received: by 2002:a17:907:6096:b0:b6d:73f8:3168 with SMTP id a640c23a62f3a-b7265155843mr765808366b.3.1762417062676;
        Thu, 06 Nov 2025 00:17:42 -0800 (PST)
Message-ID: <d6efc21d-9943-4130-bad6-bee36149dbd4@suse.com>
Date: Thu, 6 Nov 2025 09:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
 <fa9a7720-5a90-41bd-8ebb-5fc5d4065d38@suse.com>
 <5f62bd09-5e3f-4db7-901e-eb8c8a3763f5@vates.tech>
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
In-Reply-To: <5f62bd09-5e3f-4db7-901e-eb8c8a3763f5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2025 15:33, Teddy Astie wrote:
> Le 30/10/2025 à 08:56, Jan Beulich a écrit :
>> On 29.10.2025 19:26, Teddy Astie wrote:
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
>>>       if ( !has_vlapic(v->domain) )
>>>           return X86EMUL_EXCEPTION;
>>>   
>>> +    if ( has_force_x2apic(v->domain) )
>>> +    {
>>> +        /*
>>> +        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STATUS:
>>> +        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
>>> +        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
>>> +        */
>>
>> The MSR aspect should be implemented by using the MSR. Beyond that imo our treatment
>> shouldn't be different from that when firmware pre-enables x2APIC: While not
>> advisable, aiui OSes could still switch back to xAPIC mode. At which point the guest
>> config level control may also want calling "pre-enable", not "force".
>>
> 
> One advantage of forcing x2APIC enabled is that it simplifies the 
> support for LAPIC IDs over 255.
> 
> While that could be a alternative to just pre-enable x2apic (in cases we 
> don't want the OS to use xAPIC because it is there), things still gets 
> tricky for supporting more vCPUs. We would need to clarify the behavior 
> of enabling xAPIC on a vCPU that has LAPIC_ID > 254, Intel and AMD 
> specification don't define anything aside for Intel :
>> If a BIOS transfers control to OS in xAPIC mode, then the BIOS must ensure that only logical processors with
>> CPUID.0BH.EDX value less than 255 are enabled.

Well, this falls into the much wider topic of making more than 128 vCPU-s
available for HVM / PVH, doesn't it?

Jan

