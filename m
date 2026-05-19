Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJGCDij9C2qrTAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 08:03:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF26577B21
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 08:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312399.1582501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPDX6-0006f7-3X; Tue, 19 May 2026 06:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312399.1582501; Tue, 19 May 2026 06:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPDX6-0006cr-0d; Tue, 19 May 2026 06:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1312399;
 Tue, 19 May 2026 06:02:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPDX4-0006cl-0g
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 06:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPDX1-00Bx6e-VH
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:02:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0bfceb-bab6-0a2a0a5309dd-0a2a450adbc6-6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:02:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0bfceb-56b3-0a2a450a0019-d1558033bdc2-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:02:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488b0046078so27696835e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:02:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm42690385f8f.12.2026.05.18.23.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 23:02:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1779170539; x=1779775339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p/DK0s7v7U+RPrJSx81Zz5ELjYkahZDDMXmyqQaWpqQ=;
        b=QCc0drcnK08BLCHmCgEZLj3k696z34hb8LoxIGCyYSEQ7qM4lY7xJyLKm1SkmH04zb
         tunFCtDXbKrR/mRtNmi1s1l/9GpZgSJRCreQj5zv0q5Coiqu+6kyEgFKzP/npW2qp7fq
         w4/kDwg25yEYYj3RvvvAqKarn8JcGRXuXtR0klizajL6+AlIqMqhfMdaaRslIJk3e0XZ
         KnyYW/J02Cgh+JTQZ1McN7a8SRxwKM2fbcIrfw4BWkemN1/p+PyrtgVsmVgfiZKv7nM8
         /YMutYN3B5fGUtW8Nwm82lSBW+HISczHGZATdF0WYe0kGi6vHXmRJ909R805xEyFW4Ub
         e1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779170539; x=1779775339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/DK0s7v7U+RPrJSx81Zz5ELjYkahZDDMXmyqQaWpqQ=;
        b=RL2qHqWkRgQ94b2QvjVZyFFPi1Oh2ry48PPhX2B/gR5GiRwEGoAy26R5KaBiJQqIHq
         7W5t92QI5s89kOrbdQuBmb6wCzv0JngDBreCyvbJh16WJYDIO2kXvkhyxspqYRGg3A0N
         l0rLVR5RyHBI2ptxIEfWA8pgsezKPcmr2w+5a7gCKC21Snaw6tKp70DCQ/10X/rKV25Q
         Kpq77UoHMAxZfs6kOseuVcSmBoFpV+NQAO6LXMloLah93P6orXaxf6SSPNuduOIX2E/O
         n8lGuK319JnPeeKgIi9u613oK1nGnhHIfIRNRXvCqUvejAB2Tctm9Dggv6ZzvRpwl7pn
         mBkw==
X-Forwarded-Encrypted: i=1; AFNElJ+bKy7JZzDGydYCBNklV13DcawhhFbtTLyEP4ThW0w+EBMJ3I4mW2me4e9S1J7NmdIbEWq3tGlQJHI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOrH9pP6OSWRlHJpIgAbs9U55v38Le2nAMMENoFfkwoconG4yG
	Df8LBeFzohe2XGorvVehJPetTur8drQRj8qhkl4cViqYZAHOuX6ZSyDjXNJ7SHKPxQ==
X-Gm-Gg: Acq92OHklrQV/MRzuqsNl/XpHjp3xeySqHXgE2RA2CMHMj20Iuh9AzNxD5JsRnCgBKV
	4GMZPmgFDIl3rnvsgES5Ob/NtJE7vRkEy8jTG/ocwdth/YkDI6HuWizjbFL6qGjE0YJ5P1SVeqY
	LMaAXoVio6kUpTbMJYEZevZFgJNyS8Ak9QM4TRwVoNll5DcpA0Dk80ZxCNGlD8m3pN454a3Vg1E
	pJ2AVXqE75t1ipEEhw+SZPn6EW8DK12f4YekP8dlM5ZATml9orNhX8erZ9k+rlB4GJM7sGb0ytj
	IdoviQeWpHAnvKjKC/ekYEHsDk1KctT8v1AhWyt2wMjFHPHfxGbQaHJQ1E7hcfwKdRHWqc23IVc
	zNkSzopllHztLEi26lYgq1d5SWyyF8TIKG93Kv+UfXUMUkKfjedMyqgnarUm0v073uA5zchfwiE
	JqhLKJ3a6+eO6CqP8YllabRldXrRrl7TEabO3ZkepJDuCw2mVDGryEaDxZTIdv6Ab4eZE5QlBNv
	ImOdDG5qJ4yD7U=
X-Received: by 2002:a05:600c:1d0d:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48fe5fcdf50mr265359825e9.1.1779170539149;
        Mon, 18 May 2026 23:02:19 -0700 (PDT)
Message-ID: <6430026d-dfa9-4006-86cd-e228625a1914@suse.com>
Date: Tue, 19 May 2026 08:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] RFC: pci: Migrate pci_mmcfg_{read,write} to pci.c
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117765.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@vates.tech>
 <7ac53569-acca-44f7-a129-99b5dcb97500@citrix.com>
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
In-Reply-To: <7ac53569-acca-44f7-a129-99b5dcb97500@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779170539-7CE7B8B7-51AB3EEE/0/0
X-purgate-type: clean
X-purgate-size: 4300
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BF26577B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 19:35, Andrew Cooper wrote:
> On 18/05/2026 4:21 pm, Teddy Astie wrote:
>> --- a/xen/arch/x86/x86_64/mmconfig_64.c
>> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
>> @@ -133,6 +46,25 @@ static void __iomem *mcfg_ioremap(const struct acpi_mcfg_allocation *cfg,
>>      return (void __iomem *) virt;
>>  }
>>  
>> +char __iomem *pci_mmcfg_base(unsigned int seg, unsigned int *bus)
>> +{
>> +    struct acpi_mcfg_allocation *cfg;
>> +    int cfg_num;
>> +
>> +    for (cfg_num = 0; cfg_num < pci_mmcfg_config_num; cfg_num++) {
>> +        cfg = pci_mmcfg_virt[cfg_num].cfg;
>> +        if (cfg->pci_segment == seg &&
>> +            (cfg->start_bus_number <= *bus) &&
>> +            (cfg->end_bus_number >= *bus)) {
>> +            *bus -= cfg->start_bus_number;
>> +            return pci_mmcfg_virt[cfg_num].virt;
>> +        }
>> +    }
>> +
>> +    /* Fall back to type 0 */
>> +    return NULL;
>> +}
> 
> This is a horrid function.  Accessing and modifying bus like that causes
> poor code generation, and by now having this in a separate translation
> unit, the optimiser can't fold it into it's single caller and undo the
> poor decisions which went into writing this function.
> 
> Instead, you want:
> 
> void __iomem *pci_mmcfg_base(pci_sbdf_t sbdf)
> {
>     ...
> }
> 
> base which takes care of the bus adjustment internally.

If the updated bus number need passing back to the caller, what do you
mean by this? With two values to pass back, and without resorting to
returning a larger struct by value, one pointer parameter is going to
be needed, isn't it?

>> diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
>> index 8d33429103..c37e3edade 100644
>> --- a/xen/arch/x86/x86_64/pci.c
>> +++ b/xen/arch/x86/x86_64/pci.c
>> @@ -11,13 +11,123 @@
>>  #define PCI_CONF_ADDRESS(sbdf, reg) \
>>      (0x80000000U | ((sbdf).bdf << 8) | ((reg) & ~3))
>>  
>> +/*
>> + * AMD Fam10h CPUs are buggy, and cannot access MMIO config space
>> + * on their northbrige except through the * %eax register. As such, you MUST
>> + * NOT use normal IOMEM accesses, you need to only use the magic mmio-config
>> + * accessor functions.
>> + * In fact just use pci_config_*, nothing else please.
> 
> I know you're just copying an existing comment, but it's mostly an
> opinion and not terribly helpful in place.
> 
> "AMD Fam10h CPUs can only make MMCFG accesses via MOV %eax/%ax/%al",
> would be better, except...
> 
> ... this claim cannot be true.  It's been made since the K8 RevF BKWG
> and exists even into the latest PPRs, but that's simply not how
> load/store ops work in the pipeline.

How do you know what special casing there exists (or has existed), or
what (e.g.) bogus(?) SMM intercepts there may be? I'm pretty sure the
Linux change was in response to things indeed not working otherwise.

>> +static inline
>> +int pci_mmcfg_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len, u32 *value)
>> +{
>> +    char __iomem *addr;
>> +
>> +    /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
>> +    if (unlikely(reg > 4095)) {
>> +err:        *value = -1;

Nit: Style. Yet as the comment suggests: Perhaps time to drop or replace
by ASSERT() / BUG_ON()?

>> +        return -EINVAL;
>> +    }
>> +
>> +    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
>> +    if (!addr)
>> +        goto err;
>> +
>> +    switch (len) {
>> +    case 1:
>> +        *value = mmio_config_readb(addr + reg);
>> +        break;
>> +    case 2:
>> +        *value = mmio_config_readw(addr + reg);
>> +        break;
>> +    case 4:
>> +        *value = mmio_config_readl(addr + reg);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
> 
> Again, for this patch or a later cleanup, drop the output-by-pointer and
> return value directly.  The optimiser is hopefully doing this already
> but it also makes the function simpler.
> 
> At best, we want ASSERT_UNREACHBLE()'s in the error paths (including no
> mapping), and to consistently return -1.  Returning 0 for a bad length
> is bogus.

This looks to contradict the earlier paragraph: Do you want to return the
value, or do you want to return a success indicator?

Jan

