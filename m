Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7288184DD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 10:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656629.1024933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFWpp-0002PL-F7; Tue, 19 Dec 2023 09:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656629.1024933; Tue, 19 Dec 2023 09:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFWpp-0002MX-CO; Tue, 19 Dec 2023 09:56:21 +0000
Received: by outflank-mailman (input) for mailman id 656629;
 Tue, 19 Dec 2023 09:56:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFWpn-0002MR-R8
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 09:56:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dae24674-9e54-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 10:56:18 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3366827ca79so1885218f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 01:56:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6708000000b00336765e9babsm43412wru.83.2023.12.19.01.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 01:56:17 -0800 (PST)
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
X-Inumbo-ID: dae24674-9e54-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702979778; x=1703584578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNcNVVMU/BvkIRVUs5jjfQ4xAWyi0abxBQcnUigCHVM=;
        b=Aso9p4nwn7sHqxcF4PzLw6jqt0Wpj8xHPbEbEsXzGqC6viAsLBJp6Hs41Ld1O54Tee
         EyK3lXHzo7/hRTa9Dn6F//+mx6Bku82aEyafFnWTRBZ8R7ym6TCnBPxFInVqvxRky+mi
         zYbEmvEo4SDZZg+6y+hmdF12t5UGAdyTyij3lp6fa5w61U/Pn1Bffn/mBKLmCyn7t1Ni
         p+esLP7kKZIA2+gI/1d4Yt5PPyx7hG7+W+9cpoFMryeqV3WfvfVEbECrCJwEx//0ts4N
         ubX2oHdq8L5e/gaxlXJsF7gBRlZrJGOjWaZ+6j2GKHd8SfSCgq5O6nScuJQZfysvsJTR
         nXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702979778; x=1703584578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNcNVVMU/BvkIRVUs5jjfQ4xAWyi0abxBQcnUigCHVM=;
        b=l5jBd3+wJbc0RjV1SYAyKCIuT3qb3r8sVkwgBCyD3GsGz//fgeHpdbip0pZZS7Sd9z
         xBfxbCaoiftO1eFh7MZJq5kY8k1VyczwKuHiVch4GTEBrBAp22fDbFhLeJBtVoTxI2Dn
         CPooGVuuN3ak1FkYXsCBX22KrT6gm5xNtb0N6dKux1dkDYVZsh/0g2apLskTlCnE/tKq
         4sKaigUiMPkUgUHvioyL4GGf0AspRn8Q95xLBjr6CgfRDlQdssJluK7bEy5K0R5kTvc2
         Ue47nKMCiUsvZk4eBXK2XCcSvVpIbaX1hoNO/EF9z4YcrSDG8gTJaCHWa9qUfe36byeE
         0KSQ==
X-Gm-Message-State: AOJu0Yw8HzA3kUA0etvr8Ovye9fp/1xE8pajCzdP9YjvDRhi91eb5L2Q
	U0o3lwjUOYC1bV8aVkGGb6f/
X-Google-Smtp-Source: AGHT+IHbEE+xRk3ouSurXD43KKZHiGBwcA0Mrx0S9uZCr2EzYznk9fq9Mqym81QaOkzi4pemfiJJFw==
X-Received: by 2002:adf:e3c9:0:b0:336:5f4f:4ae1 with SMTP id k9-20020adfe3c9000000b003365f4f4ae1mr2919757wrm.119.1702979777772;
        Tue, 19 Dec 2023 01:56:17 -0800 (PST)
Message-ID: <6e022af1-d383-48be-ab54-6ec254aa1502@suse.com>
Date: Tue, 19 Dec 2023 10:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com> <ZYCARJAxH9hBD0YQ@macbook>
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
In-Reply-To: <ZYCARJAxH9hBD0YQ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 18:24, Roger Pau Monné wrote:
> On Tue, Feb 14, 2023 at 05:12:08PM +0100, Jan Beulich wrote:
>> Since both kernel and user mode run in ring 3, they run in the same
>> "predictor mode".
> 
> That only true when IBRS is enabled, otherwise all CPU modes share the
> same predictor mode?

But here we only care about ring 3 anyway?

>> @@ -753,7 +755,9 @@ static inline void pv_inject_sw_interrup
>>   * but we can't make such requests fail all of the sudden.
>>   */
>>  #define PV64_VM_ASSIST_MASK (PV32_VM_ASSIST_MASK                      | \
>> -                             (1UL << VMASST_TYPE_m2p_strict))
>> +                             (1UL << VMASST_TYPE_m2p_strict)          | \
>> +                             ((opt_ibpb_mode_switch + 0UL) <<           \
>> +                              VMASST_TYPE_mode_switch_no_ibpb))
> 
> I'm wondering that it's kind of weird to offer the option to PV domUs
> if opt_ibpb_entry_pv is set, as then the guest mode switch will always
> (implicitly) do a IBPB as requiring an hypercall and thus take an
> entry point into Xen.
> 
> I guess it's worth having it just as a way to signal to Xen that the
> hypervisor does perform an IBPB, even if the guest cannot disable it.

I'm afraid I'm confused by your reply. Not only, but also because the
latter sentence looks partly backwards / non-logical to me.

>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
>>  void toggle_guest_mode(struct vcpu *v)
>>  {
>>      const struct domain *d = v->domain;
>> +    struct cpu_info *cpu_info = get_cpu_info();
>>      unsigned long gs_base;
>>  
>>      ASSERT(!is_pv_32bit_vcpu(v));
>> @@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
>>      if ( v->arch.flags & TF_kernel_mode )
>>          v->arch.pv.gs_base_kernel = gs_base;
>>      else
>> +    {
>>          v->arch.pv.gs_base_user = gs_base;
>> +
>> +        if ( opt_ibpb_mode_switch &&
>> +             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
>> +             !VM_ASSIST(d, mode_switch_no_ibpb) )
>> +            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;
> 
> Likewise similar to the remarks I've made before, if doing an IBPB on
> entry is enough to cover for the case here, it must also be fine to
> issue the IBPB right here, instead of deferring to return to guest
> context?
> 
> The only concern would be (as you mentioned before) to avoid clearing
> valid Xen predictions, but I would rather see some figures about what
> effect the delaying to return to guest has vs issuing it right here.

Part of the reason (aiui) to do things on the exit path was to
consolidate the context switch induced one and the user->kernel switch
one into the same place and mechanism.

>> --- a/xen/include/public/xen.h
>> +++ b/xen/include/public/xen.h
>> @@ -554,6 +554,16 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>>   */
>>  #define VMASST_TYPE_m2p_strict           32
>>  
>> +/*
>> + * x86-64 guests: Suppress IBPB on guest-user to guest-kernel mode switch.
> 
> I think this needs to be more vague, as it's not true that the IBPB
> will be suppressed if Xen is unconditionally issuing one on all guest
> entry points.
> 
> Maybe adding:
> 
> "Setting the assist signals Xen that the IBPB can be avoided from a
> guest perspective, however Xen might still issue one for other
> reasons."

I've done s/Suppress/Permit skipping/. I wouldn't want to go further,
as that then becomes related to implementation details imo. IOW of
course Xen may issue IBPB whenever it thinks there's a possible need.

>> + *
>> + * By default (on affected and capable hardware) as a safety measure Xen,
>> + * to cover for the fact that guest-kernel and guest-user modes are both
>> + * running in ring 3 (and hence share prediction context), would issue a
>> + * barrier for user->kernel mode switches of PV guests.
>> + */
>> +#define VMASST_TYPE_mode_switch_no_ibpb  33
> 
> Would it be possible to define the assist as
> VMASST_TYPE_mode_switch_ibpb and have it on when enabled?  So that the
> guest would disable it if unneeded?  IMO negated options are in
> general harder to understand.

Negative options aren't nice, yes, but VM assists start out as all
clear. The guest needs to change a "false" to a "true", and thus it
cannot be a positive option here, as we want the default (off) to be
safe/secure.

Jan

