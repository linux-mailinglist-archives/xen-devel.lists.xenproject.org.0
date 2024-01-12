Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80882BED8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666809.1037694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFL3-0004k6-Nn; Fri, 12 Jan 2024 11:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666809.1037694; Fri, 12 Jan 2024 11:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFL3-0004iX-Ko; Fri, 12 Jan 2024 11:04:37 +0000
Received: by outflank-mailman (input) for mailman id 666809;
 Fri, 12 Jan 2024 11:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOFL2-0004i3-DZ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:04:36 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e6d384f-b13a-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 12:04:34 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd0f4797aaso69402131fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 03:04:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m6-20020a0566380ac600b0046993034c91sm830667jab.77.2024.01.12.03.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 03:04:33 -0800 (PST)
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
X-Inumbo-ID: 5e6d384f-b13a-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705057474; x=1705662274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/lKaL3NoHZ96NAbSyFV4LhVOU5rBsgz5d+bVpr/DHs=;
        b=LOAu9p1KtDMTxFcVr5x7RzqnBrQytF8bMF1vKGuUTF0xlA1DwgE0bdoF4DXhs2w3i7
         8PdYoBfq/vk+nR0A2rsrP5jTUEfaEEH66TtBu0Gbip38xCzbzu7fwStjgGRfxz5sfsrW
         TlFC93+8wbh7s7QjmbGZ80AJp4CPTvZThOAkIWK90HMpiNwu6MFnodyfC9qg2cEicwjJ
         mMrIgA/dDg9B5pKMZ0eSZbyv/3oZG3uyOzh9mzCkS+iptVB+FK58ThqGhZOmWfxs9SEs
         CnqfmwEILk3XHKMrZ3RlCLYunDpfeYhvai6ZxiMSqDQDArE0nIyjCw9ltOY98TUCrJEF
         YHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705057474; x=1705662274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/lKaL3NoHZ96NAbSyFV4LhVOU5rBsgz5d+bVpr/DHs=;
        b=K0xmHeUnBDVkxdpRG9wwRvQlM/7qWhSwRlXP4B5QImIt+oENon6SVnta2waybTTSTE
         +WbJMN9dh2MKpAqN6sG3CcNX2ddBPtLmxyNPr6zfWO6Igzoeuz9OpE0lSH+b4vRIZ35P
         z3Vue6O9Xfe2dlzlsVSPatWRNl5kQ2S9R40FceuN46XbJKgEaneE/DMarLRmuf3I6TVh
         WXBJotveYBLcqR8l4aZ0w5K5c3XpFyKk5tzD/18xhnkzEKZ6NwIky9hEh3A/jKp0TXpi
         TShPj4UIq2cmSeFB7xSv1B8PO4iCbyPziLA4eUV3cetBklwMDWboMLKsK3Dxz21dPViO
         8CLQ==
X-Gm-Message-State: AOJu0YzyHtJat+M3kjl74DccmBy/e8+sKkO70sian1yorzSTqsbmtVUu
	CRTjbdB//OJlf/sGLcKm7hxIDa8PPWFV
X-Google-Smtp-Source: AGHT+IH+l4fHfaC0FgxryHhOY46cy4PiwudoxB+no+NdzEr5gGMTHvpsqw6zUwdUaYBil0GGh5j7cA==
X-Received: by 2002:a2e:80cc:0:b0:2cd:122a:7ee1 with SMTP id r12-20020a2e80cc000000b002cd122a7ee1mr591336ljg.36.1705057474127;
        Fri, 12 Jan 2024 03:04:34 -0800 (PST)
Message-ID: <b25c0ff6-b2da-4e5b-b6b9-dca7843816d2@suse.com>
Date: Fri, 12 Jan 2024 12:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/vmx: Disallow the use of inactivity states
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
 <20240111231323.4043461-4-andrew.cooper3@citrix.com>
 <d9d9ee2b-ff95-4d5e-bb81-b1722681a4a5@suse.com>
 <8225cfd3-73d6-4a93-92b4-185399ab0ad3@citrix.com>
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
In-Reply-To: <8225cfd3-73d6-4a93-92b4-185399ab0ad3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2024 11:43, Andrew Cooper wrote:
> On 12/01/2024 10:37 am, Jan Beulich wrote:
>> On 12.01.2024 00:13, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -1551,7 +1551,10 @@ static void cf_check vmx_set_nonreg_state(struct vcpu *v,
>>>  {
>>>      vmx_vmcs_enter(v);
>>>  
>>> -    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
>>> +    if ( nrs->vmx.activity_state )
>>> +        domain_crash(v->domain, "Attempt to set activity_state %#lx\n",
>>> +                     nrs->vmx.activity_state);
>> Might be useful to log the offending vCPU here?
> 
> Already covered.  the innards of __domain_crash() does:
> 
>     else if ( d == current->domain )
>     {
>         printk("Domain %d (vcpu#%d) crashed on cpu#%d:\n",
>         ...

Except that afaict v != current here at all times (at least as far as
current use of the function goes).

Jan

