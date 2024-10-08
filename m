Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F4993EB1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812655.1225440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3is-0000Vt-6C; Tue, 08 Oct 2024 06:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812655.1225440; Tue, 08 Oct 2024 06:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3is-0000UE-3P; Tue, 08 Oct 2024 06:29:30 +0000
Received: by outflank-mailman (input) for mailman id 812655;
 Tue, 08 Oct 2024 06:29:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy3ir-0000U8-71
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:29:29 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa827ac3-853e-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 08:29:26 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9953bdc341so227736366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 23:29:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994ba82d1esm305693266b.137.2024.10.07.23.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 23:29:23 -0700 (PDT)
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
X-Inumbo-ID: aa827ac3-853e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728368966; x=1728973766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZGsrB7RxqXhb1LInJv8XhWEKztqKZAHC2j1jEUY9Dg=;
        b=EkaDKgpLjEpTs60IWAJ4RbrJ4BOGsUcJlTg1pp1PlaAOG82A4W8yGzxuE6e3X9Co8B
         uQsEDkhbjP9kiKZezGX1hw0eKp2Z43rRL2W+dXBMc1/nnPZNCTr7r1rHdtPg4uLEUSlZ
         puM8UQZUJ2Hx8QQbpKB5//+Dd40xvZx2dQDdiNCq1beX0ltaiWOeu6+gYTKSnIhZ5Sn5
         hPUUuZOPISgqHk1of1cFHe+B8YWD+okfdJWahPndwjcpN7GUwuA3baFPxsFu3khYr7rd
         nKhOVnP8liMLSRH+aQGDe9CuzAPXwP/ZPhDlSra8uFRnk9n0Y/llx0H44HvKNPBPu2cl
         R3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728368966; x=1728973766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZGsrB7RxqXhb1LInJv8XhWEKztqKZAHC2j1jEUY9Dg=;
        b=nSlhOqj/Mt7K/5RnrKKsgNCkZiSOsCOF07INTUz4DW33PjCYg94BCuJTlA9C0ZOBJp
         f7Eh1t+duMgncXXu8vF/16k/B8T0GaA0ljcMfEBBcFCPwrMp1FaB82X8qluyt7TQsuH4
         08Rcbc8cO7GSJNaQGd+29rdEzeI+r/VHTw0ugNFuGV5M8Z3IBeZ5wlgz58zwaS2oIvuX
         e2m8iOvgKnjz2dNLY7ujwDKMoJlbPJiPEAvtrOpeArH42i9/aZGEB+1c/Da3lLFKIVHj
         RDlt8QBNdF5S16DQ+HYH4QrrZG2FP75rBqUrKksmW6T/BbjISKaEW/jloKlwRbU9GcCd
         umjw==
X-Gm-Message-State: AOJu0YzEFl4cy6EG+S1pCZNAOLC37DgLikglt69Ovw8X/R0YjJ4WeSa0
	VNH84EmS+xx7YopQWG235pKIeiN1eSg1KcBGSRZmhyV/d1CINlA9UdXDYomB3g==
X-Google-Smtp-Source: AGHT+IG53OSdCTonVjQy60gOROoY68vLtEdccPJgADV6Jf0pU/Vw8vcLgIkU4cyA/B6hi8lniVcS/A==
X-Received: by 2002:a17:907:7208:b0:a99:442c:a694 with SMTP id a640c23a62f3a-a99442ca75fmr1086375166b.22.1728368964314;
        Mon, 07 Oct 2024 23:29:24 -0700 (PDT)
Message-ID: <2e70a742-e996-4748-a716-b88e998af215@suse.com>
Date: Tue, 8 Oct 2024 08:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msr: add log messages to MSR state load error paths
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241007140317.67478-1-roger.pau@citrix.com>
 <765f0d29-8be8-4f53-90df-c9fbeb1eca68@citrix.com>
 <ZwP_EZttiZ78DKPT@macbook.local>
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
In-Reply-To: <ZwP_EZttiZ78DKPT@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.10.2024 17:32, Roger Pau Monné wrote:
> On Mon, Oct 07, 2024 at 03:16:47PM +0100, Andrew Cooper wrote:
>> On 07/10/2024 3:03 pm, Roger Pau Monne wrote:
>>> Some error paths in the MSR state loading logic don't contain error messages,
>>> which makes debugging them quite hard without adding extra patches to print the
>>> information.
>>>
>>> Add two new log messages to the MSR state load path that print information
>>> about the entry that failed to load.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/hvm/hvm.c | 9 +++++++++
>>
>> Can we fix the PV side at the same time too?
> 
> Sure, I think that would be XEN_DOMCTL_set_vcpu_msrs?
> 
> I've noticed that such hypercall doesn't return an error if the MSR is
> not handled by Xen (there's no default case returning an error in the
> switch that processes the entries to load).

I see

                ret = -EINVAL;
                ...
                switch ( msr.index )
                {
                    ...
                    if ( guest_wrmsr(v, msr.index, msr.value) != X86EMUL_OKAY )
                        break;
                    continue;
                }
                break;

which to me means we'll return -EINVAL both when handling an MSR fails (1st
"break") and when encountering an unhandled MSR (2nd "break").

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -1598,10 +1598,19 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
>>>              rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
>>>  
>>>              if ( rc != X86EMUL_OKAY )
>>> +            {
>>> +                printk(XENLOG_G_ERR
>>> +                       "HVM%d.%d load MSR %#x with value %#lx failed: %d\n",
>>> +                       d->domain_id, vcpuid, ctxt->msr[i].index,
>>> +                       ctxt->msr[i].val, rc);
>>
>> Just %pv please.  I don't want to propagate the (occasionally ambiguous)
>> HVM%d form.
> 
> I also wanted to use %pv here, but it will get out of sync
> (style-wise) with the rest of messages of the HVM context loading
> logic?  IOW: my preference would be to switch all in one go.

I deliberately started using %pv when touching hvm_save() somewhat recently.
So there is some inconsistency right now anyway, and I guess we'll want to
move to the new form as we touch code in this area.

Jan

