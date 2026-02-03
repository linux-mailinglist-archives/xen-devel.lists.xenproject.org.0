Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFxtNyXagWlBLQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 12:21:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12F8D8301
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 12:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219238.1528165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnESF-0000lS-Pd; Tue, 03 Feb 2026 11:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219238.1528165; Tue, 03 Feb 2026 11:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnESF-0000iK-Lz; Tue, 03 Feb 2026 11:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1219238;
 Tue, 03 Feb 2026 11:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnESE-0000iE-9s
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 11:20:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530859b6-00f2-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 12:20:20 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso6846675e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 03:20:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830513730esm59814965e9.14.2026.02.03.03.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 03:20:18 -0800 (PST)
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
X-Inumbo-ID: 530859b6-00f2-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770117619; x=1770722419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wIgETAQY/28mEbGZVq3JZZf4ITKT1IRbgekRfjEdP28=;
        b=PsSjivsAMmQ1rmR0IvhoIVeyBX96+Ne22RXlPcZE8EHvjVHfrm+o7LcRLs2UifKcXL
         AaFrsK5/n5D/LuwnJ1jqypLr8OffdtZaETw1D0D61TrGCUTXLD+/zhEK4+VSJpt7SyFS
         i6yqQYgj57fH+kFM95qEvVzhDcZ4nMSo1GapxD/5O8ZfrKcdd3SvpAOwamLGKktYdp5X
         WqMkoPzPnazoQItdblIvduqtgjkZU2+PX0z4o5vf16l7j/hab8hAPkAoBnu/k+TNUl5f
         PCPeaiXa5jGvHk/T2H1bUxt1FCBS/l6v6NziaKqaJRFxYI5wYyeezRyBoShQ8bJQpIfp
         Q8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117619; x=1770722419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIgETAQY/28mEbGZVq3JZZf4ITKT1IRbgekRfjEdP28=;
        b=hJqzhZ9Jv1gim8SuPqMWVk6AJ5RjUVF06MYaTyHuNQMSqjVKhMBMSNG5DL0oJAzinT
         LQf5pjIqzHpIMznK6zImG6FcH39rCxwIPiXpKXQVIwmnnFLDoLNaF4Pvq6Db2j9lv0BB
         tvJx4p9zwZSbHA5W0qcq2DQN8IFF3s5eLd63Z3oZA585DtRVDvMHJ7u0o8lDaJJp7zqX
         beqFhawm69A+zrQ9N5QB1Go71mIRjVZJ2RMDyGTZo0jS3c8o0ISpSvz4po0+utp6yf+V
         /2njDCNpOpPci885o+Ki+7X3FotGLSuCnuc+tS7jzUUDR8wonAq3ORbeDv94Ayl5GEH9
         7AAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGbfjanErTc4m1WfAqwAyIiO21JSorZdzL1+KfmG4obpLsWnDilXOZ8XQ0+uBqjsdlDE3lxyw2E5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDqMmE4l94fadRPHnz1S3tjZSrjSJf+h90BbpOW0olbCOiC/Kr
	MKx2vOSCe2bUu3YvIfl7X7il4AAO6ckM4yXE4ERc/t6iDU/SNcv1PiTFdId1AgS8PQ==
X-Gm-Gg: AZuq6aLW1IKsteYNHTtgBy9d15brcszXx7a+zWxXDbKaJ8WClEDYwWRIQ5p+04bfsBZ
	1/a5ylCUg07LbY35gPAyfPxygbgoedhRgzzgA63xPz/zXcz8HpcwCmwNjn91EEEbtrCAxFDNPjR
	nfOIRu71RifQMBIFIy3VzEIm5HALyNHwURSuSNsVuDOvyucyewlBZr5jK9Tfvr147NKub4FETfA
	lmWSnrK97Oebhqe4Cot/uc+qEYhHpEks7T+vx3Fymc4UKtSldxTuTAdo6A85NVvLURdTCcVdqU6
	PpTqAAwPuJcJ1AvMGrKUSZhsRmI3SYH+X/J/JXcQ+tX5NU4ocWuX/vFBQVAB/YOsGQzY1uHqCC7
	Pev2LUQ1+8Pp7yftVQysdjfcDB5/XK1RIrgbCjpYn7GZbcF+ED1+TWeZpAcDZRoiTi3lDCRz63D
	erHKYLKKUvzgk5VNPZRJIRv676SagBLicLW0UgjHsSGMnodnpznAcXPbYWBvPGoMGC1DNuD+QKW
	a0=
X-Received: by 2002:a05:600c:8b58:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-48305144dcfmr34987255e9.10.1770117619330;
        Tue, 03 Feb 2026 03:20:19 -0800 (PST)
Message-ID: <ab85c39d-9561-45b9-8df9-a2f80e16c4af@suse.com>
Date: Tue, 3 Feb 2026 12:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <54a015e0e47ea311471bad7f13fbf21e14389ef3.1768293759.git.mykyta_poturai@epam.com>
 <00e17b41-f31e-4121-80c8-d4ea2bb02f34@suse.com>
 <17a56445-0c5b-48ef-9adc-3544d06abe3b@epam.com>
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
In-Reply-To: <17a56445-0c5b-48ef-9adc-3544d06abe3b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E12F8D8301
X-Rspamd-Action: no action

On 03.02.2026 11:30, Mykyta Poturai wrote:
> On 14.01.26 11:49, Jan Beulich wrote:
>> On 13.01.2026 09:45, Mykyta Poturai wrote:
>>> Move XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} handlers to common code to
>>> allow for enabling/disabling CPU cores in runtime on Arm64.
>>>
>>> SMT-disable enforcement check is moved into a separate
>>> architecture-specific function.
>>>
>>> For now this operations only support Arm64. For proper Arm32 support,
>>> there needs to be a mechanism to free per-cpu page tables, allocated in
>>> init_domheap_mappings.  Also, hotplug is not supported if ITS, FFA, or
>>> TEE is enabled, as they use non-static IRQ actions.
>>
>> For all of these "not supported" cases, what if a user nevertheless tries?
>> Wouldn't the request better be outright denied, rather leaving the system in
>> a questionable state? Hmm, I see you ...
>>
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -7,6 +7,7 @@ config ARM_64
>>>   	def_bool y
>>>   	depends on !ARM_32
>>>   	select 64BIT
>>> +	select CPU_HOTPLUG if !TEE && !FFA && !HAS_ITS
>>
>> ... make the select conditional. But do TEE, FFA, and HAS_ITS each mean the
>> feature is actually in use when the hypervisor runs?
>>
> The way interrupts are requested in these modules causes Xen to crash 
> when trying to offline a cpu. It’s a fairly simple fix and I plan to 
> send them eventually. I’ve decided to omit them now and do these fixes 
> only for supported code to keep the series from ballooning with too many 
> patches.

I disagree with such an approach, but it'll be the Arm maintainers to judge here.

>>> +    int ret = cpu_up(cpu);
>>> +
>>> +    /* Have one more go on EBUSY. */
>>> +    if ( ret == -EBUSY )
>>> +        ret = cpu_up(cpu);
>>> +
>>> +    if ( !ret && arch_smt_cpu_disable(cpu) )
>>
>> As you validly note in a comment in do_sysctl(), SMT is an arch-specific concept
>> and perhaps even an arch-specific term. Hence using it in the name of an arch
>> hook feels inappropriate. Plus - the hook could be used for other purposes. What
>> the arch needs to indicate is whether the CPU that was brought up may actually
>> stay online. That more generic purpose is what imo the name wants to cover.
> 
> Would arch_cpu_online_allowed() be okay, or maybe you have something 
> more specific in mind?

The name is already much better, just that it gives the impression that it perhaps
rather would want using ahead of calling cpu_up().

>>> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:
>>> +            /* Use arch specific handlers as SMT is very arch-dependent */
>>> +            ret = arch_do_sysctl(op, u_sysctl);
>>> +            copyback = 0;
>>> +            goto out;
>>
>> I wonder if it wouldn't be neater for this and actually also ...
>>
>>> +        default:
>>> +            ret = -EOPNOTSUPP;
>>> +            break;
>>
>> ... this to fall through to ...
>>
>>> +        }
>>> +
>>> +        if ( !ret )
>>> +            ret = plug ? xsm_resource_plug_core(XSM_HOOK)
>>> +                       : xsm_resource_unplug_core(XSM_HOOK);
>>> +
>>> +        if ( !ret )
>>> +            ret = continue_hypercall_on_cpu(0, fn, hcpu);
>>> +        break;
>>> +    }
>>> +#endif
>>> +
>>>       default:
>>>           ret = arch_do_sysctl(op, u_sysctl);
>>
>> ... here. (Minimally the earlier default case wants uniformly forwarding to
>> the arch handler, or else arch-specific additions would always require
>> adjustment here.)
> 
> Would it be okay to mix goto and switch like this, or is it too convoluted?

I'm not a fan of using goto, but maybe it would be acceptable here. By ...

>          case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
>              plug = false;
>              fn = cpu_down_helper;
>              hcpu = _p(cpu);
>              break;
> 
>          default:
>              goto outer_default;
>          }
> 
>          if ( !ret )
>              ret = plug ? xsm_resource_plug_core(XSM_HOOK)
>                         : xsm_resource_unplug_core(XSM_HOOK);
> 
>          if ( !ret )
>              ret = continue_hypercall_on_cpu(0, fn, hcpu);
>          break;

... wrapping everything past the switch() block in "if ( fn )" you'd already
get what is wanted.

>      }
> #endif
> 
>      default:
> outer_default:

Nit: See ./CODING_STYLE.

Jan

>          ret = arch_do_sysctl(op, u_sysctl);
>          copyback = 0;
>          break;
>      }
> 
> 
> 


