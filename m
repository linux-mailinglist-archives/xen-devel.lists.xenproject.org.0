Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNgNIzA/52no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:11:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB0438AA0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288709.1568945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF78C-0007bP-Eq; Tue, 21 Apr 2026 09:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288709.1568945; Tue, 21 Apr 2026 09:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF78C-0007YN-CI; Tue, 21 Apr 2026 09:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1288709;
 Tue, 21 Apr 2026 09:10:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF78A-0007YF-57
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:10:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF789-00AN61-3a
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:10:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73f15-2eae-0a2a0a5409dd-0a2a4507ca0c-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:10:52 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73f1c-229c-0a2a45070019-d155dd36a406-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:10:52 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so2710237f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:10:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc07bbsm38568533f8f.11.2026.04.21.02.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:10:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776762652; x=1777367452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Euiv82u/j4dTnV6Kcv393t9BwDlJM6rvFoaEMwmj2C4=;
        b=LxzbUH4Erb795sRtp9LvNsb0BrQbrdl52klBYjiKXXOTmwGaR+78sunOIR/YY48xAP
         RljheIZw1L3w9e5PVtwT+iKnT5XBhFrSa1uxNoX57oOrrqXW/Yl7ImqlLsLyOd2qO6mo
         Sg7Sw1YnCzQwzy7lURTz6+rD56LwECveUtxZn4m3kpVSaL9YvNqM0KlR8hjnaROmMEBu
         a4wEKedT8cDTDhX/aTWddJ9PXXEDOutTH7zvD+d/g/iQNHoSbSL8LTU+gdV5miIfSixU
         Q6dBjh/dIEDbobKbbaRuZ0foS3OIeEWu5X3g+UCfyQvvwIXFU3sJyDFVmt2jkYu8Un3s
         22ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762652; x=1777367452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Euiv82u/j4dTnV6Kcv393t9BwDlJM6rvFoaEMwmj2C4=;
        b=ptdcZPbP4E+wGXLEt2vF+uR45LUDSA0X3CHo/5+GKDKh3lhc4D7rFcsqYdVhp+Oxwf
         b2sy31YuvkyiY4mwVHkVxdGPCdBRKBkWTfcicuVrqS9w+MtTx0pFcmlhP8KPNKNE1+ww
         DRccZbd64D7Lfqb6UOavwi0hESZwQ9dKAWO8LebwSXhWXx1umt3FVevJVwChnGpDi3ss
         OOyoG3kufE5Qcuin4vvrQvT5bgu6uXm0qSwg4wYdyN20uwZfJVQ9nyJsZ+79G5EWVzZF
         ZqeWdg8LS5my+lb9GrNmVz3eXOdCX8QfnHHFeQLP1Zw9PMCfSDixYU0v584nT4VfQJRV
         afXw==
X-Forwarded-Encrypted: i=1; AFNElJ9hyUednLg/IOu6BzeKQ8JM26knhwKN/orAMh6Z1egqCx6R+6ciCyKrDKIfYcKEIlkvFDERDtOSI7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuHmlT4YaBgQdYGMJcMO6PXL2JLEsGScECOhYYSv5F+N4pLwA4
	OeW39VREC0dCtyj0BbvXTlt7CadSVpOEAhN72Cw5qjtoCTfph0O3m44Tm8yf9wSayQ==
X-Gm-Gg: AeBDiev6iHJ3xKKu3VE4SwOmbRq3gFnEQC9xr7ND7cTrR0KDu5oQc10QSK+Aybu48ph
	FXf5DDopESpXbuPkpVNuBi6ad5QWR/ONlHTUuyTholb9ltZHQ/M51ZG0f1o7Ns9G6ZuXbo614w4
	kxUJtfl1cjtIXIcDQEWD/oB14Xukc7xsnrjmygCa52alMBixCePkJ4RvfQgZmtnsADHHtukVJrw
	92scmChqM6prgdyNEGXC5qYe5lmTihdgfAOdX88JdCdiyP5kffdnPqzzKsWfFjUVU3lm45A4LfY
	rH23lis/Bbq6tIkJSIDj4hZ0Wf7jJeGh56uKmg9nvBdWMA+DlF1PKI/LGXx9qERY+4uqm372oMt
	BU2JO36qKsuoJrJdnfC97VBtTmjL1aa7dCsRLago3VXlfX7KGmBf3VcVWItaBfNklcm3Eh3Hq6A
	egsVg/4whOqTLT1GjnSWdmgoMoJ6h5tKzNzVad0JDABjkfr2P2a83rqI4zKaiNrA4+8yrMhBA+e
	Yhp23S4+Rqg6XeSFbp5KINlBDcfIQXmbGi1
X-Received: by 2002:a05:6000:2d8a:b0:439:adc3:f0e7 with SMTP id ffacd0b85a97d-43fe4043f54mr17293659f8f.9.1776762652295;
        Tue, 21 Apr 2026 02:10:52 -0700 (PDT)
Message-ID: <306c8133-0bee-4d07-be34-5d201a232b04@suse.com>
Date: Tue, 21 Apr 2026 11:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <5285075f24cd2a2c5566b2a7724198d34aab51c5.1776354739.git.oleksii.kurochko@gmail.com>
 <405b5653-4df9-4ee0-b6e2-ba7c4a5efbba@suse.com>
 <a64c0c52-fe42-42bb-b93c-470ab9c25413@gmail.com>
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
In-Reply-To: <a64c0c52-fe42-42bb-b93c-470ab9c25413@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1776762652-ADB68C48-3717CC09/0/0
X-purgate-type: clean
X-purgate-size: 3707
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E0CB0438AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 11:01, Oleksii Kurochko wrote:
> On 4/20/26 9:56 AM, Jan Beulich wrote:
>> On 17.04.2026 09:24, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/csr.h
>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>> @@ -32,6 +32,20 @@
>>>                              : "memory" );                        \
>>>   })
>>>   
>>> +#ifdef CONFIG_RISCV_32
>>> +# define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)

In my reply I followed this. If this compiled, then ...

>>> +#else
>>> +# define __csr_write32h(csr, val) ((void)(csr), (void)(val))
>>
>> In order to be able to spot issues in 64-bit builds, how about
>>
>> # define __csr_write32h(csr, val) ((void)csr ## H, (void)(val))
>>
>> ?

... aiui this would compile as well. Looks like the RV32 case then is in
need of adjustment as well.

> But this will cause a build issue in 64-bit builds.
> 
> csr_write64(CSR_STIMECMP, ...)
>    └─ __csr_write32h(csr, _v)   ← csr is NOT ##-adjacent here
>                                    so preprocessor expands it FIRST
>                                    CSR_STIMECMP → 0x14D
>         └─ (void)csr ## H       ← csr is already 0x14D here
>                                    0x14D ## H → 0x14DH  ERROR
> 
> Probably, it would be better to do in the following way:
> 
> #ifdef CONFIG_RISCV_32
> #define csr_write64(csr, val)       \
> ({                                  \
>      uint64_t v_ = (val);            \
>      csr_write(csr, v_);             \
>      csr_write(csr ## H, v_ >> 32);  \
> })
> #else
> #define csr_write64(csr, val)       \
> ({                                  \
>      uint64_t v_ = (val);            \
>      csr_write(csr, v_);             \
> })
> #endif

E.g. like this, albeit in the RV64 case the local v_ isn't needed. Instead,
again to be able to spot issues in RV64 builds, (void)csr ## H may want
adding.

A clear downside to all of this is that this helper can only be used with
CSR_* constants, not with runtime-calculated CSR numbers.

>>> @@ -279,8 +299,6 @@ static int cf_check sbi_set_timer_v01(uint64_t stime_value)
>>>       return sbi_err_map_xen_errno(ret.error);
>>>   }
>>>   
>>> -int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
>>> -
>>>   int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>>>                             size_t size)
>>>   {
>>> @@ -360,10 +378,9 @@ int __init sbi_init(void)
>>>           }
>>>   
>>>           if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
>>> -        {
>>> -            sbi_set_timer = sbi_set_timer_v02;
>>> -            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
>>> -        }
>>> +            set_xen_timer = sbi_set_timer_v02;
>>> +        else
>>> +            set_xen_timer = sbi_set_timer_v01;
>>>       }
>>
>> Sadly this isn't quite equivalent to sbi_set_timer having had an initializer.
>> I would have wanted to suggest to use a constructor function, but we call
>> init_constructors() even later than do_initcalls() on both Arm and x86 (we
>> don't call the latter at all on RISC-V so far). Might it be necessary to
>> introduce sbi_early_init(), called very early during boot? Else how do you
>> guarantee no accidental use of the variable before it is first set?
> 
> I thought about an introduction of sbi_early_init() but then decided 
> that set_xen_timer() won't be used earlier than at lest timer_init() + 
> local_irq_enable().
> Also, sbi_init() is executed pretty early.

Many more additions to setup.c are to be expected. Are you sure hardly any will
go ahead of the call to sbi_init()?

Jan

