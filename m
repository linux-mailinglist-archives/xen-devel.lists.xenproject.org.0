Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3yeYKgd7zmnBnwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:19:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2638A60E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271988.1559926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Isq-0004HP-K3; Thu, 02 Apr 2026 14:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271988.1559926; Thu, 02 Apr 2026 14:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Isq-0004FK-H4; Thu, 02 Apr 2026 14:18:56 +0000
Received: by outflank-mailman (input) for mailman id 1271988;
 Thu, 02 Apr 2026 14:18:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Isp-0004FE-52
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:18:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Iso-006i0p-HZ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:18:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce7ab5-2eae-0a2a0a5409dd-0a2a450bebea-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:18:54 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce7ace-bca8-0a2a450b0019-d155802fa845-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:18:54 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso22003065e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 07:18:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c91f0casm68395145e9.35.2026.04.02.07.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 07:18:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1775139534; x=1775744334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SrEYNmGCkRbsJ5OZAB5kHulUugfhQtUS60EntDDH4+A=;
        b=Ft4Ry5YlQhyEKi60HTx3aTfieNLvJ2WugwvQrIkZzXbxxaMtqDwuWVsSQdyJwBH1RP
         tsqRbNbngGxRKVAMaj6ArGo9aXYVIFJGaAgr+pYGXxLtFlODAzzNOiXTHYIQ33QfkCzK
         kRIpSoayJERkqx3AOVVcUvwQlEblPmubtcRVfz9kMhpPw1+z0GN6c3KkAfvSVTDHclNu
         mvUiheMP5htsWYHC2MpjETwO7u/vIdf5DZUC4XYLVNKm7HZnQca9noy14hokQ4OGXqWV
         R/+hJlTc9HnnRL41fQ0iXAue4IZUH/JBlMQk6vnfkEWX+V/FO0LdqVXaPhLemtJ5X1do
         EhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139534; x=1775744334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrEYNmGCkRbsJ5OZAB5kHulUugfhQtUS60EntDDH4+A=;
        b=nVDlj30ymzEyiUE4zQC2YCCwcE/McwvBRPdtrwyB5CzX9+/FkbQMMXr9tgnmR4Yjp5
         +1NLIGyuu088HMdYDg1HHec7jblwHz51sawhW2OCtEnutjshQyDIiK2HqsZKA5rRo8WA
         xPG6yei+K6NGiL5z3oqfuM2N8623h2rVn5eRSMQOGAGeUl300ETdYF+FIhOpAnCsBFTB
         xdJUfmlq87rsJo3G6Aq3j+6cZsMF+i2iVKvNHIjaxK8p0SCKNMWRoL8vqBsm3p55c5Xa
         3R+9mODtSRY82PLLNGOkqmuvhFmfJ9lezyU/TL6Co6594IN9ykSQwSUk+2OzA09eL8wf
         aXHw==
X-Forwarded-Encrypted: i=1; AJvYcCUmMhXxgY2E35lmssTkjzf8A3pVzKeL3MRInRe2bDdH6qwPOSOVf0WnD8hNt1xAFiGAIdOwTfc3fjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK4kk+IsoFMiSfQJewCFCxKR3IWtaMmkzur18P3IqW1A8CKPDy
	6uJzel/ooJWMP2p/V6FYBP7LsflMLUVY4NHIPipt/aQCimaOKKnTe4YKZoC82xW4Qg==
X-Gm-Gg: ATEYQzxOSLDo//9yJNLWEBQ5w52/ZHYtcf5P8nIav0iDpKXWYmZaJ8sd8seGfjFmIzD
	WZAdz+UpC9YRHSZgSJxbWLjkEJMlrEbaJLzXwEtUfka9+0DKgU4ivvdlK83hf/buWOsXMr6S1IL
	8lJyIvWVeishxIUP4ADbIzX8CesdWyLTvxvZqKiYV6SpGRqFhb99qqGYcQyjRgCNNTCH6pzW/6l
	h+0gyaIkt2Mx9ElJ84ZbOmKm2E077h/12Dg9cCE5N5NNlyKf22iTfjFYwKPxD2RB2C0VWaIwyDo
	0EEZotaRrPxf+TUGv2ilkcWEb7idn5ZLsPvUY3HIVw/cW/Spec1OQGfORZSV076BJfYuvdu5SQT
	xMCkqflMbyTRvqALl+8gIlkTJdbMj7ErPkpYIb8jV4IdNSNf8EGyr/pgxheuX9mKEJlRvN/hG9j
	9ZocWuWoKyhbr2VRWDiYjHA4uG+rkG5i1nSG4aWMUfOpJulJp3saRA+4kUz3BQ1IZK+outj6mum
	N1tTxXxEtS+HXk=
X-Received: by 2002:a05:600c:8708:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4888e064a89mr46414935e9.7.1775139533530;
        Thu, 02 Apr 2026 07:18:53 -0700 (PDT)
Message-ID: <2bff40f5-2eef-4e72-8191-b3442607e0e4@suse.com>
Date: Thu, 2 Apr 2026 16:18:52 +0200
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
In-Reply-To: <e29eace5006929e61da347814b9759896d179e28.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775139534-F4BCA2A1-0F354E63/0/0
X-purgate-type: clean
X-purgate-size: 8616
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: D7F2638A60E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -20,6 +20,16 @@
>  
>  #include "aplic-priv.h"
>  
> +#define APLIC_REG_GET(addr, offset) \
> +    readl((void *)((vaddr_t)(addr) + offset))
> +#define APLIC_REG_SET(addr, offset, value) \
> +    writel(value, (void *)((vaddr_t)(addr) + offset))

Why is addr properly parenthesized, but offset isn't?

> +#define AUTH_IRQ_BIT(irqnum) (auth_irq_bmp[(irqnum) / APLIC_NUM_REGS] & \
> +                              BIT((irqnum) % APLIC_NUM_REGS, U))
> +
> +#define regval_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))

I'm trying to make sense of the division here, but I think the main issue
is with naming: It's not a "register value" which is passed into here, but
a register index (offset from a range's base register).

> @@ -127,6 +137,164 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>      return 0;
>  }
>  
> +static void vaplic_dm_update_target(const unsigned long hart_id, uint32_t *iprio)
> +{
> +    *iprio &= APLIC_TARGET_IPRIO_MASK;
> +    *iprio |= (hart_id << APLIC_TARGET_HART_IDX_SHIFT);
> +}
> +
> +static void vaplic_update_target(const struct imsic_config *imsic,
> +                                 const int guest_id,
> +                                 const unsigned long hart_id, uint32_t *value)
> +{
> +    unsigned long group_index;
> +    unsigned int hhxw = imsic->group_index_bits;
> +    unsigned int lhxw = imsic->hart_index_bits;
> +    unsigned int hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
> +    unsigned long base_ppn = imsic->msi[hart_id].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
> +
> +    group_index = (base_ppn >> (hhxs + 12)) & (BIT(hhxw, UL) - 1);

And there's no constant available to make this literal 12 more descriptive?

> +    *value &= APLIC_TARGET_EIID_MASK;
> +    *value |= guest_id << APLIC_TARGET_GUEST_IDX_SHIFT;
> +    *value |= hart_id << APLIC_TARGET_HART_IDX_SHIFT;
> +    *value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT) ;
> +}

Both functions returning void right now, why would they need to return their
result via indirection?

> +#define CALC_REG_VALUE(base) \
> +{ \
> +    uint32_t index; \
> +    uint32_t tmp_val; \

Combine these two, or have the variables have initializers?

> +    index = regval_to_irqn(offset - base); \

There's no "offset" declared or passed into here, nor ...

> +    tmp_val = APLIC_REG_GET(priv->regs, aplic_addr) & ~auth_irq_bmp[index]; \

... "priv", nor ...

> +    value &= auth_irq_bmp[index]; \
> +    value |= tmp_val; \

... "value". It may remain like this, but then it wants putting inside the
sole function that uses it, and be #undef-ed at the end of the function.

> +}

Please wrap in do/while(0), for use sites to be required to have semicolons
(and hence look like normal statements). Or make it a statement expression
properly returning the calculated value.

> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
> +                                         unsigned long addr, uint32_t value)
> +{
> +    struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
> +    struct aplic_priv *priv = vaplic->base.info->private;
> +    uint32_t offset = addr & APLIC_REG_OFFSET_MASK;

See ./CODING_STYLE as to uses of fixed-width types.

> +    unsigned long aplic_addr = addr - priv->paddr_start;
> +    const uint32_t *auth_irq_bmp = vcpu->domain->arch.vintc->private;
> +
> +    switch ( offset )
> +    {
> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:

And (taking this just as example) any misaligned accesses falling in this range
are fine?

> +        CALC_REG_VALUE(APLIC_SETIP_BASE);
> +        break;
> +
> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
> +        CALC_REG_VALUE(APLIC_CLRIP_BASE);
> +        break;
> +
> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
> +        CALC_REG_VALUE(APLIC_SETIE_BASE);
> +        break;
> +
> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> +        CALC_REG_VALUE(APLIC_CLRIE_BASE);
> +        break;
> +
> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
> +        /* We don't suppert delagation, so bit10 if sourcecfg should be 0 */
> +        ASSERT(!(value & BIT(10, U)));

And that bit doesn't have a proper #define?

> +        /*
> +         * As sourcecfg register starts from 1:
> +         *   0x0000 domaincfg
> +         *   0x0004 sourcecfg[1]
> +         *   0x0008 sourcecfg[2]
> +         *    ...
> +         *   0x0FFC sourcecfg[1023]
> +         * It is necessary to calculate an interrupt number by substracting

Nit: subtracting

> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
> +         */
> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_DOMAINCFG)) )
> +            /* interrupt not enabled, ignore it */

Throughout the series: Please adhere to ./CODING_STYLE.

> +            return 0;
> +
> +        break;

And any value is okay to write?

> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
> +        struct vcpu *target_vcpu = NULL;
> +
> +        /*
> +         * Look at vaplic_emulate_load() for explanation why
> +         * APLIC_GENMSI is substracted.
> +         */

There's no vaplic_emulate_load() - how can I go look there?

Also same typo again as above.

> +        if ( !AUTH_IRQ_BIT(regval_to_irqn(offset - APLIC_GENMSI)) )
> +            /* interrupt not enabled, ignore it */
> +            return 0;
> +
> +        for ( int i = 0; i < vcpu->domain->max_vcpus; i++ )

unsigned int

> +        {
> +            struct vcpu *v = vcpu->domain->vcpu[i];
> +
> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
> +            {
> +                target_vcpu = v;
> +                break;
> +            }
> +        }
> +
> +        ASSERT(target_vcpu);

What guarantees the pointer to be non-NULL? The incoming value can be
arbitrary, afaict.

> +        if ( !(vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM) )
> +        {
> +            vaplic_dm_update_target(cpuid_to_hartid(target_vcpu->processor),
> +                                    &value);
> +        }
> +        else
> +            vaplic_update_target(priv->imsic_cfg,
> +                                 vcpu_guest_file_id(target_vcpu),
> +                                 cpuid_to_hartid(target_vcpu->processor),
> +                                 &value);

I'm struggling with the naming here: When DM is clear, a function with "dm"
in the name is called.

For the latter one, unless other uses are intended speaking against that,
instead of the middle two arguments simply pass target_vcpu?

Also please omit the braces consistently from both branches.

> +        break;
> +
> +    case APLIC_SETIPNUM:
> +    case APLIC_SETIPNUM_LE:

What about APLIC_SETIPNUM_BE?

> +    case APLIC_CLRIPNUM:
> +    case APLIC_SETIENUM:
> +    case APLIC_CLRIENUM:
> +        if ( AUTH_IRQ_BIT(value) )
> +            break;

Aren't you easily overrunning auth_irq_bmp[] here?

> +        return 0;
> +
> +    case APLIC_DOMAINCFG:
> +        /*
> +         * TODO:
> +         * The domaincfg register has this format:
> +         * bits 31:24 read-only 0x80
> +         * bit 8      IE
> +         * bit 7      read-only 0
> +         * bit 2      DM (WARL)
> +         * bit 0      BE (WARL)
> +         *
> +         * The most interesting bit for us is IE(Interrupt Enable) bit.
> +         * At the moment, at least, Linux doesn't use domaincfg.IE bit to
> +         * disable interrupts globally, but if one day someone will use it
> +         * then extra actions should be done.
> +         */
> +
> +        printk_once("%s: Nothing to do, domaincfg is set by aplic during "
> +                    "initialization in Xen\n", __func__);

As per the comment it's not "nothing to do", but your choice to ignore writes
even if they may be relevant.

> +        return 0;
> +
> +    default:
> +        panic("%s: unsupported register offset: %#x\n", __func__, offset);

Crashing the host for the guest doing something odd? It's odd that the function
only ever returns 0 anyway - it could simply return an error here (if the
itention is to not ignore such writes).

As it's not clear what values other than zero such a function may return, I
also can't comment on its (and the hook's) return type (may want to be bool
instead of int).

Jan

