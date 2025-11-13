Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB77C56861
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160762.1488816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTOm-00077P-Jv; Thu, 13 Nov 2025 09:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160762.1488816; Thu, 13 Nov 2025 09:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTOm-00074o-HI; Thu, 13 Nov 2025 09:13:48 +0000
Received: by outflank-mailman (input) for mailman id 1160762;
 Thu, 13 Nov 2025 09:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJTOl-00074i-BJ
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:13:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e98df83-c071-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 10:13:45 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b728a43e410so85292266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 01:13:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad45afsm123420266b.24.2025.11.13.01.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:13:45 -0800 (PST)
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
X-Inumbo-ID: 0e98df83-c071-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763025225; x=1763630025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQOSH/xsrnviIaxP4tMdhE9UpPXE9h9HanA6W7ECFMw=;
        b=SNTzuSJkpkbIbhTNmItN1goaETsfSeu4hVMPtSOVE2v3vv/w7EL5rZF0sbCtTWdjo3
         YQcl9WI8kClg5JcWkv3us18sIkeJaDnPAKbpcC4UteJwLlxQye3bLTKaAthm05QkCgmg
         DpuLR3uHFDz8gTpi6w4eruoYLFEQZczh7K3jC3q/iOJ0jZirVAasdWCDV0YlxkiuoJW9
         iPe1HGy4yk0DvlCOu2rOebmIZQ1dVh3wnt44fYTwSoxMCp6WZKdLTX9l83xbPWoQ3wIi
         53dKvwQEOsKP7sSVukwOH74ipu1YzMjkidp9aeZJcAQVuUbut9rtEFo7tut57xHA5cRI
         ZlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025225; x=1763630025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQOSH/xsrnviIaxP4tMdhE9UpPXE9h9HanA6W7ECFMw=;
        b=UGk0m1oOQJwgNKAJ4ROnUe9OCfAjzIY+pMUC0u5Ou4nH/YG9X9HVE0AuT2iZc/n9eI
         lB0u2iCxOZPHhj0TK9daYkd/cC2xiKmFFUiWbUlJEUthgSJRsmHbq5rJHqewd01diVms
         5WR6FbcXww+vDBSKun4C4wUgaEQDQRw315XbsjJpwQMl1LcM4COk8mlPTgfjRN/XszgJ
         pjx6kV4p7vABhNp+pgLp/2Ndz/Mt6CChJ5pJzDdDCBuq//3qMO8++R7NkgjeCuSH2YMN
         OrO1X9faypqL5Zq38xAqL0bJfosLJyoxOsNWx5FK77hzOHP+xZcwbwSCnXovA2xIQ6R3
         NzCA==
X-Forwarded-Encrypted: i=1; AJvYcCWpIfA9PS313JZ0B8gkbh9/PfUyu++vDbkQLEUjO3cBOj9o+mJR1M16h2CM8lTEXGHQGK9TYkr7DPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3Wbu0q89EjkCZ7ckiSyHsLQjWKkKZq4lBrEnB8wpo6HmuARYm
	0hwm9Ivoubyn+2IaujmncJNZflHTHNlFsjiRkdu1E/XnCvpllEjDHPsJ9EliNzQN5w==
X-Gm-Gg: ASbGncs58TYEYi+jwr3lgdRAcSPOw5bbQ33UpwWL8mj2074mWBIAoC2onNnnUvVmbwZ
	zDwBt70z/D3effV/kfxDlj8B5mtJWwjVhJFlo/27WY9DsDkCK/pdsLYMq8tDs1vUnag9LlQanJ3
	7wE86r5vKeuffxe79BFxFNHafsPeP1FaBrv8LQz2NaksqOpu+2OJiRnioDBpi9sjklFhORxbpyb
	SWePxjegpcwFXVY92mbSrrHn/dbBemyueLwkQ7BwIWR9euRNfqvpVWm3hLiEhQxzCoU+Lu6gRYf
	7KosqbCyjdb5KtSPtVoXnzT8P6XN/8JgYGX0B3Hced4gMmIV9yyM1SXozLjJUAz0uI+qc8ccrkS
	NHfgdLjkNvkPpfzZs/kmX3fFA3Ei+AC80X8sdCoZD3pe6R1Bpl7WslVonERWHHOXFUDJmciGsot
	nYMdloc1C42nUSd23IHGJABNIqKSwMDs4GCd3KbXmTDexXVHN0VrwexqWEtffXs27sP2UmkA5fT
	3Q=
X-Google-Smtp-Source: AGHT+IFLdyltBls2Zc3flTeMOJCRlcmvRpa6+xUfrYynpSRcOCO+cwkKc0UVDonEp3n9STRI780Igg==
X-Received: by 2002:a17:907:d644:b0:b72:b7e1:5c90 with SMTP id a640c23a62f3a-b7331a838e7mr597080866b.34.1763025225266;
        Thu, 13 Nov 2025 01:13:45 -0800 (PST)
Message-ID: <8c74b068-ba9a-4867-8d39-31c77f3cc339@suse.com>
Date: Thu, 13 Nov 2025 10:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] xen/vm_event: introduce vm_event_is_enabled()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> Function vm_event_is_enabled() is introduced to check if vm event is enabled,
> and also make the checking conditional upon CONFIG_VM_EVENT, which could help
> DCE a lot unreachable calls/codes, such as hvm_monitor_io(), etc, when having
> VM_EVENT=n.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v2 -> v3:
> - move assignment (to ev) past the check.
> - remove redundant check
> - make "may_defer" & with vm_event_is_enabled() and have assertion back
> - add vm_event_is_enabled() for hvm_monitor_xxx() in svm.c/vmx.c/mem_sharing.c, then later there is no need to add stubs for them
> ---
> v3 -> v4:
> - move "may_defer" & with vm_event_is_enabled() to the very top of the function
> - use ?: to avoid introducing a new local variable
> - fix the wrong order
> - use pointer-to-const when possible
> - use IS_ENABLED(xxx) instead of #ifdef-block

This is irritating, as the subject (bogusly) says v1.

> ---
>  xen/arch/x86/hvm/emulate.c          |  9 +++--
>  xen/arch/x86/hvm/hvm.c              | 24 ++++++++---
>  xen/arch/x86/hvm/svm/intr.c         |  2 +-
>  xen/arch/x86/hvm/svm/svm.c          | 54 +++++++++++++++----------
>  xen/arch/x86/hvm/vmx/intr.c         |  2 +-
>  xen/arch/x86/hvm/vmx/vmx.c          | 63 +++++++++++++++++------------
>  xen/arch/x86/include/asm/vm_event.h |  8 ++++
>  xen/arch/x86/mm/mem_sharing.c       |  3 ++
>  8 files changed, 106 insertions(+), 59 deletions(-)

As before - why's there no "x86" in the subject prefix?

> @@ -3860,9 +3870,11 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
>  
> -    if ( currd->arch.monitor.descriptor_access_enabled )
> +    if ( vm_event_is_enabled(curr) &&
> +         currd->arch.monitor.descriptor_access_enabled )
>      {
>          ASSERT(curr->arch.vm_event);
> +
>          hvm_monitor_descriptor_access(exit_info, vmx_exit_qualification,
>                                        descriptor, is_write);

Stray (and not really necessary) addition of a blank line? Did you perhaps
rather mean to remove the now pointless ASSERT()?

> @@ -2907,16 +2914,19 @@ void asmlinkage svm_vmexit_handler(void)
>  
>      case VMEXIT_IOIO:
>      {
> -        int rc;
> +        if ( vm_event_is_enabled(v) )
> +        {
> +            int rc;

With this the outer figure braces introduced by patch 1 can also go away again.

> @@ -4703,16 +4711,20 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>              };
>          } io_qual;
>          unsigned int bytes;
> -        int rc;
>  
>          __vmread(EXIT_QUALIFICATION, &io_qual.raw);
>          bytes = io_qual.size + 1;
>  
> -        rc = hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str);
> -        if ( rc < 0 )
> -            goto exit_and_crash;
> -        if ( rc )
> -            break;
> +        if ( vm_event_is_enabled(v) )
> +        {
> +            int rc;
> +
> +            rc = hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str);

Make this the initializer of the variable?

> --- a/xen/arch/x86/include/asm/vm_event.h
> +++ b/xen/arch/x86/include/asm/vm_event.h
> @@ -45,4 +45,12 @@ void vm_event_sync_event(struct vcpu *v, bool value);
>  
>  void vm_event_reset_vmtrace(struct vcpu *v);
>  
> +static inline bool vm_event_is_enabled(const struct vcpu *v)
> +{
> +    if ( IS_ENABLED(CONFIG_VM_EVENT) )
> +        return v->arch.vm_event != NULL;
> +
> +    return false;
> +}

Simply

    return IS_ENABLED(CONFIG_VM_EVENT) && v->arch.vm_event != NULL;

?

I guess I might as well do the adjustments while committing, even if it's quite
a few of them. In any event, with the adjustments
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

