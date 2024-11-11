Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B69C3DF0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833636.1248813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATAr-0008AL-BJ; Mon, 11 Nov 2024 12:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833636.1248813; Mon, 11 Nov 2024 12:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATAr-000882-8A; Mon, 11 Nov 2024 12:05:41 +0000
Received: by outflank-mailman (input) for mailman id 833636;
 Mon, 11 Nov 2024 12:05:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tATAp-00087w-Iz
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:05:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42232d75-a025-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 13:05:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so42039005e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:05:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa74abb9sm215336815e9.42.2024.11.11.04.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:05:34 -0800 (PST)
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
X-Inumbo-ID: 42232d75-a025-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyMjMyZDc1LWEwMjUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzI2NzM1Ljc4MTQ4Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731326735; x=1731931535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mvlFj8XUFtk4gPbPkVFrS5U7SLM4iaso9MInD1oBQEc=;
        b=RJjN5/Rlzd4VQhAn55WAYzVRsndOjJppAAItzB+5C4tPcU6Yl5yS2+XFsLjMuMIhxa
         qyVywzUEbaaCJtdGSz8r7f+BlrAFvTEXgBNcg+q+VW60bV30oC75LhPVPOeiEpULgfgu
         FFaBuuqsSI4uT3Uvy2DgqJJtWD5HUhJBLKktQ9gvtVyg/1dTfOSRaiM/uDL2SJHlkop+
         YPcl34naVuye1Z2y7qRNfYYzpDhAUDobHyjfxQ5i7crx2JGsjhM7YXTkiILollsxWGF/
         zCHfWJn4SC8gdgLvxZVXNNrfgAKPm3riXMLqs0GG0zmMJeQjqKw5T6uWTUDIwKdB7z7l
         QQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326735; x=1731931535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvlFj8XUFtk4gPbPkVFrS5U7SLM4iaso9MInD1oBQEc=;
        b=Fp3bMgpIBy9aB/w2ljKQ3YadjBHJgei5kLrhXoQgmQcbQXLLhunhrsYbCqlUb5TBYD
         DMRJgQ8i1scKUR9E9S2ZIcrOmwd/lWRvCUlfsSRwl59s1UAfPiniJg4LBlS3yICUbPNx
         jOstXd9xh6Lc1MGZjlC4avCvXBXoHPIL/FWr+InKu+omVMjcjX1BJMnU5P064VIW3vLG
         eZ8WG/240Ipk5YlkQ6f0pxu1YohvhlWONBRS5Ez/N1jZEfjzBTds3YRPUA1EAkgMf2MI
         Z1e/+HHzPueCUMAcFqv8a9CpdtzBPcRNV8KQIShR3z2Fe5uRMS3jniPZNb/XMtb4e1ll
         C14g==
X-Forwarded-Encrypted: i=1; AJvYcCXVifJn7c+tIzELQeTlw9NcmaO9gqpVlUrrfk6Vw6aRdgWe1iamHXN4v3YNlnRlnF09hepVFVfk69U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyynIYj4l+7k+hbfI5RdcRDIlHxP7FkRh3z6o1tUHDf/pO+PVQY
	3Uq5wRLp2YSvU1T9RG9WKNP15LbWV9GwSpvp5eqU/iB/OzmHflnwidj9GCZk0Q==
X-Google-Smtp-Source: AGHT+IGobLZNgMYCD3IyI54jajPhfbFpJcCZuv3GjIzvHwLoCUn0tYatQ5i7ahER6+EsCjqwlvhkCg==
X-Received: by 2002:a05:600c:3d14:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-432b7507c50mr106727485e9.16.1731326735034;
        Mon, 11 Nov 2024 04:05:35 -0800 (PST)
Message-ID: <c565ae31-26a3-405a-b4a3-191be95b38ce@suse.com>
Date: Mon, 11 Nov 2024 13:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
 <34a2d071-59a8-46eb-a9fd-516cce801343@suse.com>
 <505e0790-10b9-4468-994b-1a3890eaef46@epam.com>
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
In-Reply-To: <505e0790-10b9-4468-994b-1a3890eaef46@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.11.2024 12:01, Sergiy Kibrik wrote:
> 11.11.24 11:51, Jan Beulich:
>> On 06.11.2024 11:14, Sergiy Kibrik wrote:
>>> Introduce config option X86_HVM_PMTIMER and make pmtimer emulation driver
>>> configurable and possible to disable on systems that don't need it.
>>> Option X86_X86_HVM_PMTIMER depends on HVM option, because this driver is part
>>> of HVM support code.
>>>
>>> Introduced additional check of domain's emulation flags, to cover the case
>>> when user explicitly states the requirement of emulated devices that are
>>> disabled in the build. HVM always require these devices to be present so domains
>>> of this type can't be created when pmtimer or any other emulated device are
>>> disabled.
>>>
>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> What exactly was it that Roger suggested? I don't think it was what the patch
>> does overall, but just _how_ it is being done? That makes quite a bit of a
>> difference, as the former could be read as kind of an implicit ack to what is
>> being done here (and also in the other patch). Issue is: I remain unconvinced
>> that this conditionalizing is actually something we really want/need.
> 
> about a half of this patch is what Roger suggested. These changes were 
> in a separate patch, which Roger suggested to be merged into other 
> patches. What tag should be put in this case then?

The tag itself is fine, but could do with clarifying by way of attaching
"# <brief>", like we also permit for R-b and A-b. Alternatively a post-
commit-message remark would help during review (but notably not once the
change would have been committed, e.g. for archaeologists).

>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -144,6 +144,19 @@ config INTEL_VMX
>>>   	  If your system includes a processor with Intel VT-x support, say Y.
>>>   	  If in doubt, say Y.
>>>   
>>> +menu "Emulated HVM devices support"
>>> +       visible if EXPERT
>>> +       depends on HVM
>>> +
>>> +config X86_HVM_PMTIMER
>>> +	bool "ACPI PM timer emulation support"
>>> +	default y
>>> +	help
>>> +	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
>>
>> Does this really affect PVH guests? Isn't the whole point of the change
>> that in a PVH-only environment this wouldn't be needed in Xen?
> 
> PVH guest may (depending on its configuration) still use PM timer, so 
> I'd say the point is in a PVH-only environment this driver becomes optional.

Hmm, the way I look at emulation_flags_ok() it doesn't look to permit this
as optional. The PVH case is "emflags == X86_EMU_LAPIC".

>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -742,11 +742,16 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>   
>>>   static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>>   {
>>> -#ifdef CONFIG_HVM
>>> +    const uint32_t disabled_emu_mask = X86_EMU_PM;
>>> +
>>> +#if defined(CONFIG_X86_HVM_PMTIMER)
>>>       /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>>>       BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>>>   #endif
>>>   
>>> +    if ( emflags & disabled_emu_mask )
>>> +        return false;
>>> +
>>>       if ( is_hvm_domain(d) )
>>>       {
>>>           if ( is_hardware_domain(d) &&
>>
>> While you commented on this hunk, it didn't become clear what exactly the
>> resulting new hunk would be. I question in particular the change to the
>> #ifdef: If that's changed and the BUILD_BUG_ON() kept as is, the comment
>> also needs adjusting. Yet it would perhaps be better of the BUILD_BUG_ON()
>> was split accordingly.
>>
> 
> This #ifdef definitely wants nicer change. How would you suggest 
> BUILD_BUG_ON() be split?

#ifdef CONFIG_HVM
       BUILD_BUG_ON(X86_EMU_ALL & ~X86_EMU_PM !=
                    XEN_X86_EMU_ALL & ~XEN_X86_EMU_PM);
#endif
#ifdef CONFIG_X86_HVM_PMTIMER
       BUILD_BUG_ON(X86_EMU_PM != XEN_X86_EMU_PM);
#endif

Jan

