Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLfUC7onzWlkaQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:12:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6837BEAF
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270379.1559059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wIT-0006gf-Qp; Wed, 01 Apr 2026 14:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270379.1559059; Wed, 01 Apr 2026 14:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wIT-0006eP-O8; Wed, 01 Apr 2026 14:11:53 +0000
Received: by outflank-mailman (input) for mailman id 1270379;
 Wed, 01 Apr 2026 14:11:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7wIS-0006eJ-PH
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:11:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wIS-005ki7-1I
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:11:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2797-5cb7-0a2a0a5109dd-0a2a450a961e-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:11:51 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd27a7-ee98-0a2a450a0019-d155dd34ad6f-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:11:51 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so2174582f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:11:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2738sm101692f8f.24.2026.04.01.07.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:11:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1775052711; x=1775657511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3lWGWqEq4HaQ9kSwZTMIzIH7MdC2UvMjfZou9rdJlo=;
        b=cpSjOc9gan8Vm8lQe7YPNzIbtnYqgTG/cYaY/EIc73touPvCT7lfVVK8wUOclChH1h
         m3jrSjAQ/qRuAH74HYY3FFJpkyOsN4Wwr8CbsSrHQIzQfZXw36iST7u2S7k7Z1br1WbS
         I8n/8L28v//VI3TolWYsoqn3TRdxRNjLrkhT+kpr24Z6Qr94T0wId9/Kdo/VSYJuDvcR
         jjL+tDW/KT5WCIacjLa74I4sA/AtNVw6JEfdtQ6CvHwQoDxSxs6VvCJTrX3dP3jiNwYb
         uxtKrYNLExGq9mjj4gu7E9XhtLeSlGjjlB/x/iKp08vl+A23+geQGKWy1NQMZsM+ZDYL
         QANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052711; x=1775657511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3lWGWqEq4HaQ9kSwZTMIzIH7MdC2UvMjfZou9rdJlo=;
        b=YCOX3AYDm0rTfevceG0hHoCkccexMuYx3Y3aWiTZ6c0LRInMtDZAxcFXHEE8g0N9Ph
         odFIV3QSpYNusZt5bCr/IA9q0Ynz3F6WlzB9oZKM1ya90PjUWl6f4d3cFWQboEb7DJrX
         j67Il14otCEoLJyRo1ZYdOnk5YLchQ52euIMOWTNRLOcW8oLkalJVe3QfCF1n7MYpjeW
         fnDiXwwaSGsvvWNdfu5oe48GFX0HNkc1ySlz5rXpcrNNlS0a3c9KxVfY6Lj93+P/KOsS
         e3JPy0e+XvO1CdfB1ZwygIANna2QWljIhreMD68E8cKfhj+YtPlF9blJL9/Bqqu0bicZ
         6ngQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSdujHDL/nI84eBnQYDpviHqP8dlz/NLp8jhVRM5+M9SZcy65OqbLPVFi4cAzMjlprhe8n2qRVR9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziMJ1xO8wVbL8tzg+2Rwulfvrl2/bmENwUqZawD83YDPuKmZ3a
	n6htvKxmb1XzEIi4u5rL/d7JHKT3yvIOkjxnaJcYb6N4GO3b6A1M2PfyCkD9klMMDw==
X-Gm-Gg: ATEYQzzm/G4cOVLmKcS58XYKyCXpRQXsxkVhjgsyRRyFd227ZY2pptEkaX5ztN+gSA8
	4oQDchEZGv0V3k2Fun/a30SkjeQrbNjC7LE7uJ8PTowcMTg4rnRF4Jh1tldkfo5svZXSzKVxABV
	Pse7K6zUxRSJ68XGYEQoKNRyBZxaaWY/ZhRhPUA6OT/d+f2cQZrAHPIpOGHBIYyzxD2VqS8OPun
	Or/7zkwjGrDiHjLj8ETHHBcjrUFT38D2uWAlALEGtFdh16qqxYefrGyMata3nC5Gl4kzqsOidpn
	/Njox7GDjHiFZ/514AZOifFEh+iwieDRN/CdpLsj3ljc05s+srqZjQ9yBs4laEW/n/ZgjmB6EHM
	IOSbXgPDkgwMSUzQwMtlT6mOwGNVmlR+J6+Oi2RpGdHflFUDye1oMGVbOxkL5hJfJrqEIx327Y7
	vq8TQNand3AVqpEs7JYzd7MdwmTLo+8O/wfmoIUhEcZtEV9L0hAimZiUSTyomDcT1aBk7gjP1Rp
	Oeji9bJEj1JbHE=
X-Received: by 2002:a05:6000:26cb:b0:439:c040:cc8a with SMTP id ffacd0b85a97d-43d150b81c3mr6948512f8f.32.1775052709759;
        Wed, 01 Apr 2026 07:11:49 -0700 (PDT)
Message-ID: <7505a281-b481-4f3a-a7df-d8c234f28279@suse.com>
Date: Wed, 1 Apr 2026 16:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/27] xen/riscv: implement make_cpus_node()
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
 <fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775052711-0F1480B1-44076064/0/0
X-purgate-type: clean
X-purgate-size: 4503
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 91B6837BEAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += aplic.o
>  obj-y += cpufeature.o
>  obj-y += domain.o
> +obj-y += domain-build.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += entry.o
>  obj-y += guestcopy.o

Doesn't this belong in patch 02? And then domain-build.init.o?

> --- a/xen/arch/riscv/domain-build.c
> +++ b/xen/arch/riscv/domain-build.c
> @@ -3,8 +3,10 @@
>  #include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/sched.h>
>  
> +#include <asm/cpufeature.h>
>  #include <asm/current.h>
>  #include <asm/guest_access.h>
>  
> @@ -44,3 +46,109 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>  
>      return 0;
>  }
> +
> +int __init make_cpus_node(const struct domain *d, void *fdt)
> +{
> +    int res;
> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> +    unsigned int cpu;
> +    u32 timebase_frequency;

uint32_t please.

> +    bool frequency_valid;
> +    uint32_t *next_phandle = &((struct domain *)d)->arch.next_phandle;

No casting away of const, please.

> +    dt_dprintk("Create cpus node\n");
> +
> +    if ( !cpus )
> +    {
> +        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
> +        return -ENOENT;
> +    }
> +
> +    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
> +                                           &timebase_frequency);
> +
> +    res = fdt_begin_node(fdt, "cpus");
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 1);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 0);
> +    if ( res )
> +        return res;
> +
> +    if ( frequency_valid )
> +        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);

Handing through a property directly makes me wonder how that's going to
fit with migration. I understand migration may not even be a mid-term
goal, but still.

> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
> +    {
> +        char buf[64];
> +        uint32_t reg = cpu_to_fdt32(cpu);
> +
> +        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property(fdt, "reg", &reg, sizeof(reg));
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "status", "okay");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "compatible", "riscv");
> +        if ( res )
> +            return res;
> +
> +        BUILD_BUG_ON((sizeof("riscv,") + sizeof_field(struct gstage_mode_desc, name) + 1) >= sizeof(buf));

Nit: Overlong line. Also, why +1? The name field has to include a nul, or
else ...

> +        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);

... you can't use plain %s here.

> +        res = fdt_property_string(fdt, "mmu-type", buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "riscv,isa", guest_isa_str);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "device_type", "cpu");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_begin_node(fdt, "interrupt-controller");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_u32(fdt, "phandle", (*next_phandle)++);
> +        if ( res )
> +            return res;
> +
> +        /* end of interrupt-controller */
> +        res = fdt_end_node(fdt);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_end_node(fdt);
> +        if ( res )
> +            return res;
> +    }
> +
> +    res = fdt_end_node(fdt);
> +
> +    return res;

Simply "return fdt_end_node(fdt);"?

Jan

