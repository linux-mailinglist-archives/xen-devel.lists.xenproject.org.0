Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM1ZA4F6nWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:16:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309F185311
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239738.1541156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupSn-0005IF-4q; Tue, 24 Feb 2026 10:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239738.1541156; Tue, 24 Feb 2026 10:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vupSn-0005GM-2E; Tue, 24 Feb 2026 10:16:21 +0000
Received: by outflank-mailman (input) for mailman id 1239738;
 Tue, 24 Feb 2026 10:16:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vupSl-0005GG-Rh
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:16:19 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db4945d1-1169-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 11:16:17 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4837634de51so23513925e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 02:16:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31efe02sm355976905e9.10.2026.02.24.02.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:16:16 -0800 (PST)
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
X-Inumbo-ID: db4945d1-1169-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771928177; x=1772532977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+sOE4OdP+TTHpj4/9xI/G8cJpS26XtzaF17LlmGSj3g=;
        b=azTQpmHS4PsCCt/4LiCLnDlCxR4WZvZiarPVTh1okWdOXosHUrHDW+WVdXuEjWzEB2
         jSHhmUX/xdBdQ2a6fjyQWS2R0Xp6Zq2RY/RX9/6VSQFVXYfl9Pe5jAinui3qqXJ0NUt0
         J2ag/2onN7oXLWkHOXE8qqWxBjSug0yNT6ClLrpEv3o2ISM4wf+kJNUMWA9pFet9OCvU
         ZaR73voRpUpztS7ahPYo1sOvqETDeo4lJUhJT5IQm370m9unR6tekqGzQi5FQDx8zCDy
         XREJFbfTOQ0hb9BQ1I61isQiyzLGnL5VGzgoj20uiTrmieBv+iPh63/uSYo4zcrn8xmD
         1sGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928177; x=1772532977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sOE4OdP+TTHpj4/9xI/G8cJpS26XtzaF17LlmGSj3g=;
        b=dPG19SCTeOJUAA7Mrxc8WIAq0LCCozRHQxmqCey82Ku8Xgxj+PY/bqFAZMX3v+9uac
         Lj80p2gyeRhw3aFO81bjwecIT77QNdBpQNsr07gHVbfrlPBvSBty1FupzZqq4Q8ZnR1Y
         E4akQ7N3MvEBgdlDlxJ9CvCqpmrVwHg5u99ljaUuKwVzVslA9+oJQM1UG0KBSodIIMnT
         0rPBbG9pL5It2p/12I0VoS2W3p3PXyDG0N9Gj2hGQXK7z9sQuk2COn6u/37AgFvsuUSJ
         yFEZoue8SIGJR7CFYu/tsnFqmML9LqqlzrfeILgb9p1P10vyQFZBJjVQkKwL6obJXy02
         1gYw==
X-Forwarded-Encrypted: i=1; AJvYcCUiF7E+l/vdgBZKPeNHe3wRKJxOhw6zri8X/pNQEkSaMAXORp80XMGFWNoTEzrqdYbEV+rOhGOAbKE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyIxpf9x/ZnNOi+hjMEOLJcfe+7yR1AS+h9qufL2D6zpSzjGew
	6bbmw0HwuNXXPGUpP/81nJoO4Qs4PN3ZEMUTdkNTqYP8yJ9OdOXj52c/he1CGRNObg==
X-Gm-Gg: AZuq6aLvmBil5RlXSeqP5Tp5PPA8QQ+oCxt/LUhP59yyt4ZAKWU0lP1afYVDP2Q4ukb
	UutCe4qOBFjF+ZTYDtiuk35ZpF1Wd00yOvkL/ESdtSU1DPRh7UZLYGVRcJjGbo2y7PpTNFfQP/7
	tmYN6dDgzG7agsm4jH3gm7Pr+bTQZk0nb5RGG7RszK7Zfo3+26Ao4dbalFfCRds9PSRAHWHBV6M
	aN06DauZKCj9oJy5Q1mEysx0+OvM1GnZwsfrcfu1Ue/EWOI83EgTEzoXbPFHEGX5hqBVFN9OvLe
	7PHujSjGpaPiJwXsrexADTd+uswO83T3DRZuUufin6dSIi3k3YHJH6M+C2bKnaQJj3dBjmu+c/o
	NxgaPD97LE5OiQakRxil34X5KpewpXAGwENFPsIRVAzv9g6SnLbiDZjGT5mwSO/BDD9gFF3K1R9
	uEXWcrIdMZbcw1Z+orUy9JgZ7DFzwHjyaVweaEvok32WLk0O7n0msVdcGx1RFMoG5/FBwzstjcV
	fVnvG0ZZxaAbE4=
X-Received: by 2002:a05:600c:154b:b0:483:7ae2:1737 with SMTP id 5b1f17b1804b1-483a962e486mr167957685e9.17.1771928176754;
        Tue, 24 Feb 2026 02:16:16 -0800 (PST)
Message-ID: <541a6c57-406c-49e5-8b8b-019e30bf0d89@suse.com>
Date: Tue, 24 Feb 2026 11:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
 <bf8d5b4f-937a-4d6f-86ba-1ab07f53eb51@suse.com>
 <e084cd6f-e76d-40c1-9e30-97e10acae012@gmail.com>
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
In-Reply-To: <e084cd6f-e76d-40c1-9e30-97e10acae012@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.986];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7309F185311
X-Rspamd-Action: no action

On 24.02.2026 10:44, Oleksii Kurochko wrote:
> 
> On 2/24/26 9:07 AM, Jan Beulich wrote:
>> On 20.02.2026 17:18, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -2,9 +2,39 @@
>>>   
>>>   #include <xen/init.h>
>>>   #include <xen/mm.h>
>>> +#include <xen/sections.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/vmap.h>
>>>   
>>> +#include <asm/cpufeature.h>
>>> +#include <asm/csr.h>
>>> +
>>> +struct csr_masks {
>>> +    register_t hedeleg;
>>> +    register_t henvcfg;
>>> +    register_t hideleg;
>>> +    register_t hstateen0;
>>> +};
>>> +
>>> +static struct csr_masks __ro_after_init csr_masks;
>>> +
>>> +void __init init_csr_masks(void)
>>> +{
>>> +#define INIT_CSR_MASK(csr, field) do { \
>>> +    register_t old; \
>>> +    old = csr_read(CSR_##csr); \
>> Can't this be the initializer of the variable? Can't ...
> 
> I agree that this is change is okay to be done but I am not sure about ...
> 
>>
>>> +    csr_set(CSR_##csr, ULONG_MAX); \
>> ... csr_swap() be used here, too?
> 
> ... as after re-reading spec again I am not sure that we can do in this way
> at all.
> 
> Initially I used csr_set() instead of csr_swap() or csr_write() as csr_set() to
> take into account a writability of the bit, so it won't touch a bit if it
> is r/o.

To me the spec isn't quite clear enough in this regard.

> But it seems like this approach won't work with**WLRL or WPRI fields as these
> fields aren't r/o,

In the CSRs presently dealt with, are there any WLRL fields at all? (I don't
think WPRI fields represent much of an issue for the purpose here.)

> but they only support specific value and for example:
> 
> - Implementations are permitted but not required to raise an
>    illegal-instruction exception if an instruction attempts to write a
>    non-supported value to a WLRL field.
> - For these reserved fields, software is required to preserve the existing
>    values when writing to other fields in the same register. Overwriting them
>    with 1s could be considered non-compliant behavior.
> 
> So it seems like we can't just do csr_swap() with all 1s and it is needed
> to pass a mask to INIT_CSR_MASK() which will tell which bits should be
> ignored and don't touched.
> For example, HENVCFG and HSTATEEN0 has WPRI fields.
> 
> reserved_bits_mask = 0x1FFFFFFCFFFFFF00;
> tmp = csr_read(HENVCFG);
> tmp=(~reserved_bits_mask) |(tmp&reserved_bits_mask); csr_set(HENVCFG, tmp);

What I find further concerning is that HSTATEEN0 also may have read-only-1
fields. You don't currently cope with that, I think.

>>> +    csr_masks.field = csr_swap(CSR_##csr, old); \
>>> +} while (0)
>> This whole macro body would also better be indented by one level, to not leave
>> in particular this closing brace as a misleading one.
> 
> Do you mean that it should be:
> 
> +void __init init_csr_masks(void)
> +{
> +#define INIT_CSR_MASK(csr, field) \
>      do {
>           ....
>      } while (0)
> #endif
> 
> I will update it.

Yes, with no #endif of course. The "do {" could also stay where you had it.

>> Happy to make adjustments while committing, provided you agree. With the
>> adjustments (or clarification why any of them shouldn't be done):
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> If what I wrote above make sense then it seems that I have to send a new
> version of this patch.

Not sure there, but the hstateen0 aspect needs dealing with, I think.

Jan

