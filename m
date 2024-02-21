Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C985D13A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683850.1063484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgww-0005ub-IG; Wed, 21 Feb 2024 07:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683850.1063484; Wed, 21 Feb 2024 07:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcgww-0005t5-FI; Wed, 21 Feb 2024 07:23:26 +0000
Received: by outflank-mailman (input) for mailman id 683850;
 Wed, 21 Feb 2024 07:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcgwv-0005sx-7R
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:23:25 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19142fc8-d08a-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 08:23:24 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3e8be8a7ddso369668766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:23:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h11-20020a17090634cb00b00a3d7bcfb9a1sm4685554ejb.128.2024.02.20.23.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 23:23:23 -0800 (PST)
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
X-Inumbo-ID: 19142fc8-d08a-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708500203; x=1709105003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhERbpoE4VXwROCKxrt3FxWiUBFTqvpBx+V/ORx+9Ys=;
        b=Pd82sxdVc6MHqAdk06Nl24YtqbMsx9BNwbca3O+/QcQxV9Dtm5ftjJYTkcja0ZSFYx
         g5Mi4FN4cevHj/MI8FmaO0onhADsD28YLXnWwtyGZpV++Tq5kn6NlPKtI3kpuqPNFXhK
         yk52mWe1NHwF9RQ2xfKCVVVbFseXrhXwY6HtkVTZn9XeGQa7nLY9CpmTC7uCHHG5GeZJ
         rTXkL/rnrzKadt+rPyLrdGsD1IMKFWjAZazm4nrnSHl4n72PREJOsImsUmSmnmq2DW0P
         ADc0ATvg98ISaUfp1aXNXUJ2WXKNbUMKJk0+brChAjrZmMh3Fx+iCowW+Z/XHltPa2Nf
         ghJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500203; x=1709105003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhERbpoE4VXwROCKxrt3FxWiUBFTqvpBx+V/ORx+9Ys=;
        b=E5LCRkrw5r3K/hpm2h+CKchrVdj2L8f5fn7EwzURw4MdJJ1RMn52VLulgfo98IBZm/
         dc4H+8e4ovU+PWEpZLeiJQ12kwHVWem/Io2REBX0/3vUp1wqrlroXu+i2X+K6rNPMsuX
         nXvC+wfwFS2tdNyNsr/1pt+/84F6cliU9Y1wlqiwk/0NGefJqSlmg4g1CzCckX02olKv
         YBVCIm9SpVabpQN7tWDLIQJmIPZ65wLTYr+RixCMlvAsmSNqd+/r9wwQKfJg6zkT07Oc
         tHK9oh/+Ug42N8xnFshAciY6hDSDooe7MWwMuKoYcORdVxaPYmK92qYInjTUh/u+S9yI
         eBdw==
X-Forwarded-Encrypted: i=1; AJvYcCWFdJIWmZ1Hpw5qv20rKWqdKHnq3ijSsDcHdoj2RkaotDJcjzxPDhIZjWA96NgEsTmcZrbW4m9Tl4u55jEf0o6vcA6s0JqZ0kObA1OB3fo=
X-Gm-Message-State: AOJu0YyfpOliJEnvO0deRplnJVvN0iIvrOD6Kf6Y9qWRdINneszkfYhU
	+B49MdosMMYpDaycnWfgsrcs22WsjN6xGQqzrgL65RlSbHsQ8XrLnk+WEN8F1w==
X-Google-Smtp-Source: AGHT+IHa7NVEZplEZ3l18DhGyDV51nw+mgUNhbkMoTobZvdJOC76JwEjs0du3eMCGQuvan/wb5F/ag==
X-Received: by 2002:a17:906:d043:b0:a3d:a63f:2db0 with SMTP id bo3-20020a170906d04300b00a3da63f2db0mr11037432ejb.28.1708500203681;
        Tue, 20 Feb 2024 23:23:23 -0800 (PST)
Message-ID: <088414f7-c5f3-4776-80a2-c9c3da618c22@suse.com>
Date: Wed, 21 Feb 2024 08:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/hvm: Convert hap_capabilities into a bitfield
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-2-george.dunlap@cloud.com>
 <66962dfc-db89-40bc-8411-9b92f9458b16@suse.com>
 <CA+zSX=ZwUT4Wf7eY3DFyp=Bf_MndExoKCZBVGEhF-ByaOEH7tw@mail.gmail.com>
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
In-Reply-To: <CA+zSX=ZwUT4Wf7eY3DFyp=Bf_MndExoKCZBVGEhF-ByaOEH7tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.02.2024 08:02, George Dunlap wrote:
> On Mon, Feb 19, 2024 at 9:36 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.02.2024 02:20, George Dunlap wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -113,8 +113,8 @@ static int cf_check parse_ept_param_runtime(const char *s)
>>>      int val;
>>>
>>>      if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
>>> -         !(hvm_funcs.hap_capabilities &
>>> -           (HVM_HAP_SUPERPAGE_2MB | HVM_HAP_SUPERPAGE_1GB)) )
>>> +         !(hvm_funcs.caps.hap_superpage_2mb ||
>>> +           hvm_funcs.caps.hap_superpage_1gb) )
>>>      {
>>>          printk("VMX: EPT not available, or not in use - ignoring\n");
>>
>> Just to mention it: The conditional and the log message don't really
>> fit together. (I was first wondering what the 2mb/1gb checks had to
>> do here at all, but that's immediately clear when seeing that the
>> only sub-option here is "exec-sp".)
> 
> So you mean basically that the checks & error message are poorly
> factored, because there's only a single sub-option?  (i.e., if there
> were options which didn't rely on superpages, the check would be
> incorrect?)

Right.

> Let me know if there's something concrete you'd like me to do here.

Nothing. I meant to express this by starting with "Just to mention it".
If you were eager, you might deal with this right away, but there's no
expectation to this effect. If and when it becomes a problem, it'll
then need sorting. And the message being potentially misleading is,
well, just an annoyance - as with many other things, finding it confusing
will likely lead to looking up where it's issued, then realizing that
what it says isn't what it means.

Jan

