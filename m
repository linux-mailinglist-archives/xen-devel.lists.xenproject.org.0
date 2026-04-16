Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KdYKe3h4GlhnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:19:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F040EAC9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283457.1565679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMcu-0001nJ-CU; Thu, 16 Apr 2026 13:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283457.1565679; Thu, 16 Apr 2026 13:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMcu-0001lT-9c; Thu, 16 Apr 2026 13:19:24 +0000
Received: by outflank-mailman (input) for mailman id 1283457;
 Thu, 16 Apr 2026 13:19:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDMct-0001lN-Cb
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:19:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMcs-00GuqK-Lg
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:19:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0e1d0-5cb7-0a2a0a5109dd-0a2a4503929e-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:19:22 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0e1da-672d-0a2a45030019-d155dd2eb99d-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:19:22 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d7605ec91so4105872f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 06:19:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d65asm13631868f8f.4.2026.04.16.06.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 06:19:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1776345562; x=1776950362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IxcODoIkQA3TUCT0RAhFK0C7/Zce95cYCusS/fgNfBU=;
        b=Rp9qztql+AzFwMD8fbQrBv+T2Cde0qsuBVxRGAEtWMWfR3rwQc0JhQgPsaETXiShZK
         gqevnGYoTIbXSCrwdPlK8rpYfSpV9zPmzIbe5NYKZ2i2KuZ5kSPhcLDtXq/eA+GMh0Eh
         52/IDJQx24UkCOivLmXVLK2qnD3TCv5Dl9b4+9j0kEMXwqgVnvfU+pXLK6koBJe5nwcl
         P7u7Ru9D77hgVw0JTOx4RSgvrctsy4RGXYomXAs66uuOGU6jx1iFLocopSgxgT/1s4zk
         qNiqJOSk0NPJySdGGRnLUyNv4qYVv84UOI4iYxa7d/87TAF64G11mCFPg7FS+dUl3L2b
         iovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345562; x=1776950362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxcODoIkQA3TUCT0RAhFK0C7/Zce95cYCusS/fgNfBU=;
        b=LzC1X0EoNP9u28kDPrTqHSnNxGdAN/Lkv71ehf62jqvROibHum2ggcA3HE3diB//sr
         d00i2hsgF966Cvw1lB7585ZC7CWnqStSvZMuDKApRMVNtizpkOMe1Oxl33xmkOlU11Ee
         EFud7x80X5rATWMRkDNYs/R0dTAJjzxc7SqUEUIEeYua7KneR6eDGALgsmsvDfbiZCKq
         lvWjZ8YGxXQjmipqed4rbmfJvyDR5CuyCtTMah2dC/UFtM1sjQJlMvCQ/TgwZqVFt8is
         sgaCj5Hbxb4mDeD83IjisfEKVmn058GGla4lq+W8dIhrfDQ/bhjAa90cuPNz8tzZrmFS
         UjSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FUwpBvIvLzBKcfCr3RVz8ovojRhOayXkbHEtjIIAQUscS8g18AqrWxLZ9fkrxqTYfxckpmK/H83E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLFdtpuSAGysJlDB56PbnWXN3utvrS4IB0W6sXZLt3YgxLk3lS
	52/hVv1NZ+PBiNfQUY/b84g6GWWMyv/8fvKVP1nEPRajc+FTCPhAoWC4vIPLPgyHzg==
X-Gm-Gg: AeBDievnS0dFlWVqc/8SB5Ml0zPTcFXCIbKBJ5QNUFo5uJtJwkPIhASOOmmnzr2COPd
	e2aitZk64fNVoJuVc6iB56ovy1H/FZSxOYqcB1iwrl4G3LbpTXd1mQ6X0CKxOcNYWC4i4rIbeVF
	IDV7N/68HVNoPwNsrCe/XVBhiVVfo8Q3StdnEmDTX44xPUOyovT2mXKPsK6kkE7Y2f18pHBltxi
	Zdwsb1z9M34FMeVTh/rc2f6mnjAlg4/DD50ERKjlXpTfPZ8WDph9Iz6AKh9ZeBTKgTefgGzqOS5
	Jj5G7PBwnzJEL1Q3L3u0ZyjNkY802S5REqwhOGXZqKb8rK65gZV3gA8eqrlYLCUQXKOxkQg9nuP
	Ieh+eLZA4UIgBK5Pz0Y2VuuhljCYMWTdHrmMgOAy6MpP2qy6nTjuKsRSkBriuNY++BjPs+Ez7Eo
	sjJjDl7CD/u4PPGPfYjiN1Y3qrFcfRXoKRuErf3//NxTF6bMlEkZ3qSK4w+Vdjyp4ctBfU+DFvI
	CH+reqQmutsxbFOs9vEmzhjqQ==
X-Received: by 2002:a5d:5d12:0:b0:439:ae2a:755e with SMTP id ffacd0b85a97d-43d642c4f2dmr41210582f8f.23.1776345561738;
        Thu, 16 Apr 2026 06:19:21 -0700 (PDT)
Message-ID: <910f0720-1e83-4b0d-a1bd-09799d6f8264@suse.com>
Date: Thu, 16 Apr 2026 15:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/27] xen/riscv: emulate guest writes to virtual APLIC
 MMIO
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <e29eace5006929e61da347814b9759896d179e28.1773157782.git.oleksii.kurochko@gmail.com>
 <2bff40f5-2eef-4e72-8191-b3442607e0e4@suse.com>
 <76ea5954-89cd-47a4-872a-239bbc08b785@gmail.com>
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
In-Reply-To: <76ea5954-89cd-47a4-872a-239bbc08b785@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776345562-28D73938-A21EBDAF/0/0
X-purgate-type: clean
X-purgate-size: 8861
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: DB2F040EAC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 18:04, Oleksii Kurochko wrote:
> On 4/2/26 4:18 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> @@ -127,6 +137,164 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>       return 0;
>>>   }
>>>   
>>> +static void vaplic_dm_update_target(const unsigned long hart_id, uint32_t *iprio)
>>> +{
>>> +    *iprio &= APLIC_TARGET_IPRIO_MASK;
>>> +    *iprio |= (hart_id << APLIC_TARGET_HART_IDX_SHIFT);
>>> +}
>>> +
>>> +static void vaplic_update_target(const struct imsic_config *imsic,
>>> +                                 const int guest_id,
>>> +                                 const unsigned long hart_id, uint32_t *value)
>>> +{
>>> +    unsigned long group_index;
>>> +    unsigned int hhxw = imsic->group_index_bits;
>>> +    unsigned int lhxw = imsic->hart_index_bits;
>>> +    unsigned int hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>>> +    unsigned long base_ppn = imsic->msi[hart_id].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>>> +
>>> +    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);
>>
>> And there's no constant available to make this literal 12 more descriptive?
> 
> As it was used in aplic_set_irq_affinity() - IMSIC_MMIO_PAGE_SHIFT could 
> be used here.
> 
>>
>>> +    *value &= APLIC_TARGET_EIID_MASK;
>>> +    *value |= guest_id << APLIC_TARGET_GUEST_IDX_SHIFT;
>>> +    *value |= hart_id << APLIC_TARGET_HART_IDX_SHIFT;
>>> +    *value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
>>> +}
>>
>> Both functions returning void right now, why would they need to return their
>> result via indirection?
> 
> No specific reason. Do you think it would be better just to return value 
> instead? I am okay to rework that.

Rule of thumb is: Use return value in preference to indirection when the
returned value isn't needed for some other purpose.

>>> +#define CALC_REG_VALUE(base) \
>>> +{ \
>>> +    uint32_t index; \
>>> +    uint32_t tmp_val; \
>>
>> Combine these two, or have the variables have initializers?
>>
>>> +    index = regval_to_irqn(offset - base); \
>>
>> There's no "offset" declared or passed into here, nor ...
>>
>>> +    tmp_val = APLIC_REG_GET(priv->regs, aplic_addr) & ~auth_irq_bmp[index]; \
>>
>> ... "priv", nor ...
>>
>>> +    value &= auth_irq_bmp[index]; \
>>> +    value |= tmp_val; \
>>
>> ... "value". It may remain like this, but then it wants putting inside the
>> sole function that uses it, and be #undef-ed at the end of the function.
>>
>>> +}
>>
>> Please wrap in do/while(0), for use sites to be required to have semicolons
>> (and hence look like normal statements). Or make it a statement expression
>> properly returning the calculated value.
> 
> I will put the following inside the function + undef at the end:
> 
> #define CALC_REG_VALUE(base) do {                               \ 
>                                    \

Nit: Why this extra line?

>>> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
>>> +                                         unsigned long addr, uint32_t value)
>>> +{
>>> +    struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>>> +    struct aplic_priv *priv = vaplic->base.info->private;
>>> +    uint32_t offset = addr & APLIC_REG_OFFSET_MASK;
>>
>> See ./CODING_STYLE as to uses of fixed-width types.
>>
>>> +    unsigned long aplic_addr = addr - priv->paddr_start;
>>> +    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
>>> +
>>> +    switch ( offset )
>>> +    {
>>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>>
>> And (taking this just as example) any misaligned accesses falling in this range
>> are fine?
> 
> Do you mean something like 0x1C02 instead of 0x1C00 or 0x1C04?

Yes.

>>> +        /*
>>> +         * As sourcecfg register starts from 1:
>>> +         *   0x0000 domaincfg
>>> +         *   0x0004 sourcecfg[1]
>>> +         *   0x0008 sourcecfg[2]
>>> +         *    ...
>>> +         *   0x0FFC sourcecfg[1023]
>>> +         * It is necessary to calculate an interrupt number by substracting
>>
>> Nit: subtracting
>>
>>> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>>> +         */
>>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_DOMAINCFG)) )
>>> +            /* interrupt not enabled, ignore it */
>>
>> Throughout the series: Please adhere to ./CODING_STYLE.
>>
>>> +            return 0;
>>> +
>>> +        break;
>>
>> And any value is okay to write?
> 
> No, it should be in a range 
> [APLIC_SOURCECFG_SM_INACTIVE,APLIC_SOURCECFG_SM_LEVEL_LOW].
> 
> I will add the check before break:
>          if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
>          {
>              gdprintk(XENLOG_WARNING,
>                       "value(%u) is incorrect for sourcecfg register\n", 
> value);
>              value = APLIC_SOURCECFG_SM_INACTIVE;
>          }

And why would writing APLIC_SOURCECFG_SM_INACTIVE be any better, when
that's not what the guest wanted? Simply ignore such writes, unless the
spec mandates specific behavior for out-of-range avlues?

>>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>>> +        struct vcpu *target_vcpu = NULL;
>>> +
>>> +        /*
>>> +         * Look at vaplic_emulate_load() for explanation why
>>> +         * APLIC_GENMSI is substracted.
>>> +         */
>>
>> There's no vaplic_emulate_load() - how can I go look there?
> 
> It is introduced in the next patch.

As before - it should be possible to review patch series strictly
sequentially. Further, what if this patch gets committed, and the other
gets delayed by several months?

>>> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_GENMSI)) )
>>> +            /* interrupt not enabled, ignore it */
>>> +            return 0;
>>> +
>>> +        for ( int i = 0; i < vcpu->domain->max_vcpus; i++ )
>>
>> unsigned int
>>
>>> +        {
>>> +            struct vcpu *v = vcpu->domain->vcpu[i];
>>> +
>>> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
>>> +            {
>>> +                target_vcpu = v;
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        ASSERT(target_vcpu);
>>
>> What guarantees the pointer to be non-NULL? The incoming value can be
>> arbitrary, afaict.
> 
> I didn't understand your point. It is just checking that target_vcpu has 
> been found. If after for() loop the value of target_vcpu is still NULL 
> then something wrong in Xen.

If that's true, then the assertion is fine to have. I can't help the
impression though that a guest could pick a value such that you can't
possibly find the target vCPU. Asserting on guest controlled input is
not okay, as was said several times before.

>>> +        if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM) )
>>> +        {
>>> +            vaplic_dm_update_target(cpuid_to_hartid(target_vcpu->processor),
>>> +                                    &value);
>>> +        }
>>> +        else
>>> +            vaplic_update_target(priv->imsic_cfg,
>>> +                                 vcpu_guest_file_id(target_vcpu),
>>> +                                 cpuid_to_hartid(target_vcpu->processor),
>>> +                                 &value);
>>
>> I'm struggling with the naming here: When DM is clear, a function with "dm"
>> in the name is called.
> 
> it means direct (delivery) mode. Maybe it is better to put dm at the end 
> of the function name? Or it is just better to change it to something else?

Without a better understanding of what is wanted, all I can say is that
calling something with "dm" in its name when the condition says it's not
"dm" is confusing.

>>> +    default:
>>> +        panic("%s: unsupported register offset: %#x\n", __func__, offset);
>>
>> Crashing the host for the guest doing something odd? It's odd that the function
>> only ever returns 0 anyway - it could simply return an error here (if the
>> itention is to not ignore such writes).
> 
> But maybe it is a legal offset and we really want to support it?

Still not a reason to crash the entire host?

> Even if I will return just error then a caller site will want to do 
> something with this error -> for example, kill domain or panic() again. 
> Maybe panic is to much and just domain should be crashed here:
> 
> default:
>      gdprintk(XENLOG_WARNING,
>               "Unhandled APLIC write at offset %#x (value %#x)\n",
>               offset, value);
>      domain_crash(vcpu->domain);
>      return 0;
> ?

This would already be better. You shouldn't use gdprintk() with
domain_crash() though. Please take a look at domain_crash()'s
definition - you'll then see what to do, I suppose.

Jan

