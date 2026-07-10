Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sjCYCrqlUGpp2wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:56:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA48738339
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KXyyJC7l;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358851.1612727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi65K-0004nn-DV; Fri, 10 Jul 2026 07:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358851.1612727; Fri, 10 Jul 2026 07:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi65K-0004mP-9h; Fri, 10 Jul 2026 07:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1358851;
 Fri, 10 Jul 2026 07:55:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wi65I-0004mJ-Tw
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 07:55:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi65I-005zAk-Au
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:55:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a50a569-5cb7-0a2a0a5109dd-0a2a4502ab34-22
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:55:39 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a50a57b-64c6-0a2a45020019-d1558035c4f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:55:39 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493bfe9f886so2914695e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:55:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039af67sm65122642f8f.17.2026.07.10.00.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 00:55:38 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783670139; x=1784274939; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYo+OUr24aWVPKoJ8kThKxFCanctH10WQ5vTFg9f6B4=;
        b=KXyyJC7lwPpYAC0s+B6oXurgorhhbgT9LHHKKe52Nr+YBKvRem3j9tbwinE0tYZxwP
         NOCEJYXQ8+d3qqCS0JVtEKmr8NVMP6aBObvY5zmuIReWbcMwckymawd1asjspll35nAi
         q2n6rPBN4v81aKzkWbwFIqrMH43IqWxRFYE7t6K52akhCXYSouokWfZBCR7eo1UfeDbH
         NfS4h88WZoxFxTHTyQKiuKWUg0blmgU5fMIsU+Z6ioYmif8Xv0q1LUHdF2rH7wcAM/qx
         gZ57J0JYpcPiSL0TNMRy6YF7xPS+sOIu7Zbl4v6l4YfcjBU3n3eDGeeUhtCgTcYYM2Ni
         hCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670139; x=1784274939;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYo+OUr24aWVPKoJ8kThKxFCanctH10WQ5vTFg9f6B4=;
        b=Dih/K3LYWxc3k70lJ9caD9v0NmQV0ud5qcUklK3TW0hOwcHTKt0aN1c1lz1x+gND4M
         hJxrHi7hjsy8f22ajS8jH2uluNy7AxRwI+1Wi5rhmvqc8RBZPkMCgC7Xqhpj6t+2QBR2
         tkdIg3LhzryK0uMw9uSLukPftW62nXTvq135Jrjh92Cf4TnNtI0FL1XbBqUvV9bLEm5T
         EHBmAPU5gmTnbN3WiBL3XBnN7uWGpI+QU74Wqbyvqcwk/otXRDhg50hM4UTNGVqeBMK5
         PmAWN635rp4VYiWT/eh1MOuPAHllp0L53tmUJ521wPo4MEBbsTySOLKIKMXePZWHPU/x
         +/qQ==
X-Forwarded-Encrypted: i=1; AHgh+RozHuXT6t8lDaRoPT4SbtkhMp+Wil9gqz7IJCRS3ZbpPyUshlWt4a5Hy0ttVfjlwvaAr9Y4/IX9W8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuPYmNswK+ThudQ0tM+g7znNX1dGaCQq3VaR+Y72vqL7/oNKor
	l+sl1S6xM07gKvYVrhh1QXSRNjBZdyEGzl1tdMSXuRuP0dm7p3rFmPvwJMoVEO95aecFgnHYiKo
	85YBP7w==
X-Gm-Gg: AfdE7cms60wEH1RVZPZt4Z/N0mK7OJBzYELhIeIYOzucDZeQ9YCcWb8WMIpMhxgooOR
	SXRQs8/2OqZbKqCGX/mqrF5oBLLxfB+oVaUQzDfrLHAZehgjySupNiDYCd3qDQ+LIv29DDuo+7X
	CVSQ04cWu8Ft+hkQA+lHNL33lowD/CaSryW2s/8op7vCMmWV/7JHSTlS0cj7bk8gCrubTslx6nY
	mve1TTdjFmGQnGdG6lCDXv7z2uYniSmgWaBbd+qWdFqLzOm9RD1NRlGJtmZ7ygGM31qIH2RhC2o
	t1UTJrnjotRiih4J1Z04rMJo61s0O+r5oPYV+oaKz2Qiq4pPzS9u5w/eYSRrwh7x3d8kuGWF5nE
	/iQeEFhQ9+EfSl2Mr2swejjygaKUa170517GsTlTxRw9EyEQTb9Sg37tGagi2E5hZGttCYatdIo
	+s4E6s5KkRC205ymFxOhh35CzwqOBPwMr0M1t7ESus+4hYAn4MNoMYVLAfgvaFlGv0bPu7eb5/X
	lZo
X-Received: by 2002:a05:600c:c1d7:20b0:492:68f5:6b30 with SMTP id 5b1f17b1804b1-493e69de0d0mr80750715e9.17.1783670138816;
        Fri, 10 Jul 2026 00:55:38 -0700 (PDT)
Message-ID: <227bbc38-2d32-47c4-94cd-e80c2574f0b6@suse.com>
Date: Fri, 10 Jul 2026 09:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm/acpi: Parse PPTT to initialize CPU topology
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <20260709220552.646462-5-taka@valinux.co.jp>
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
In-Reply-To: <20260709220552.646462-5-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783670139-B3341A87-28EDA0B2/0/0
X-purgate-type: clean
X-purgate-size: 11784
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CA48738339

On 10.07.2026 00:05, Hirokazu Takahashi wrote:
> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c
> @@ -5,18 +5,90 @@
>  #include <xen/cpumask.h>
>  #include <xen/init.h>
>  
> -/*
> - * TODO: Populate the topology information by scanning the ACPI
> - *       PPTT (Processor Properties Topology Table).
> - */
> -void __init acpi_init_cpu_topology(void)
> +uint32_t map_cpu_acpiid[NR_CPUS] __initdata =
> +         { [0 ... NR_CPUS - 1] = INVALID_ACPIID };
> +uint32_t socket_map[NR_CPUS] __initdata;
> +uint32_t cluster_map[NR_CPUS] __initdata;
> +uint32_t core_map[NR_CPUS] __initdata;
> +uint32_t thread_map[NR_CPUS] __initdata;
> +unsigned int __initdata num_sockets;
> +unsigned int __initdata num_clusters;
> +unsigned int __initdata num_cores;

static for almost all of these? And please place __initdata uniformly,
between type and identifier.

For large NR_CPUS this also looks to be adding quite a bit of data. Is all
of this really needed?

Finally please see ./CODING_STYLE as to the use of fixed-width types.

> +static unsigned int __init get_logical_id(uint32_t phys_offset,
> +                                          uint32_t *map,
> +                                          unsigned int *count)
> +{
> +    unsigned int id;
> +
> +    for ( id = 0; id < *count; id++ )
> +        if ( map[id] == phys_offset )
> +            return id;
> +
> +    map[*count] = phys_offset;
> +    id = *count;
> +    (*count)++;

Imo better as either

    id = (*count)++;

(or yet more simply

    return (*count)++;

) or

    id = *count;
    ++*count;

> +    return id;
> +}
> +
> +static struct acpi_pptt_processor *__init find_pptt_node(
> +       const struct acpi_table_header *table_hdr, unsigned int acpi_id)

Nit: Bad indentation; should be identical to ...

> +{
> +    const struct acpi_subtable_header *entry;
> +    unsigned long table_end;
> +    const char *ptr;

... that of function-scope local variables.

> +    if ( !table_hdr )
> +        return NULL;

Isn't this dead code?

> +    table_end = (unsigned long)table_hdr + table_hdr->length;
> +
> +    ptr = (const char *)table_hdr + sizeof(struct acpi_table_pptt);

There's way too much casting and other type-unsafe code in the function. For
example, if the caller passed the full const struct acpi_table_pptt * into
here, the above (ptr being const void *) could become

    ptr = pptt + 1;

> +    while ( (unsigned long)ptr + sizeof(struct acpi_subtable_header)
> +            <= table_end )
> +    {
> +        entry = (const struct acpi_subtable_header *)ptr;

Then no cast would be needed here either.

> +        if ( entry->length == 0 )
> +        {
> +            printk(XENLOG_ERR
> +                   "ACPI: PPTT has an invalid zero-length subtable.\n");
> +            break;
> +        }
> +
> +        if ( (unsigned long)ptr + entry->length > table_end )
> +        {
> +            printk(XENLOG_ERR
> +                   "ACPI: PPTT subtable extends beyond table end.\n");
> +            break;
> +        }
> +
> +        if ( entry->type == ACPI_PPTT_TYPE_PROCESSOR )
> +            if ( entry->length >= sizeof(struct acpi_pptt_processor) )

Please fold two if()s like these ones. Then again - isn't there an "else"
wanted for the inner if()? It doesn't look appropriate to continue the
loop when the length doesn't fit the type.

> +            {
> +                struct acpi_pptt_processor *proc =
> +                       (struct acpi_pptt_processor *)entry;

Please use container_of(). That'll (I think) also avoid you casting away
const-ness (which Misra objects to for a good reason).

> @@ -30,6 +102,148 @@ void __init acpi_init_cpu_topology(void)
>      }
>  }
>  
> +/*
> + * Populate the topology information by scanning the ACPI PPTT
> + * (Processor Properties Topology Table).
> + */
> +void __init acpi_init_cpu_topology(void)
> +{
> +    acpi_status status;
> +    struct acpi_table_header *header;
> +    const struct acpi_table_pptt *pptt;
> +    unsigned int cpu;
> +
> +    status = acpi_get_table(ACPI_SIG_PPTT, 0, &header);
> +    if ( ACPI_FAILURE(status) )
> +    {
> +        printk(XENLOG_WARNING
> +               "ACPI: PPTT table not found. Topology fallback will be used.\n");
> +        setup_fake_topology();
> +        return;
> +    }
> +
> +    pptt = (struct acpi_table_pptt *)header;

Again container_of() please.

> +    for_each_possible_cpu(cpu)
> +    {
> +        unsigned int acpi_id = map_cpu_acpiid[cpu];
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +        const struct acpi_pptt_processor *proc;
> +        unsigned int level = 0;
> +        uint32_t thread_offset = 0;
> +        uint32_t core_offset = 0;
> +        uint32_t cluster_offset = 0;
> +        uint32_t socket_offset = 0;
> +        bool threading = true;
> +
> +        proc = find_pptt_node(&pptt->header, acpi_id);
> +        if ( !proc )
> +        {
> +            printk(XENLOG_WARNING
> +                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID 0x%u)\n",
> +                   cpu, acpi_id);
> +            continue;
> +        }
> +
> +        while ( proc )
> +        {
> +            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE )
> +            {
> +                socket_offset = (char *)proc - (char *)pptt;
> +                break;
> +            }
> +            else if ( level == 0 )
> +                /*
> +                 * ACPI_PPTT_PROCESSOR_IS_THREAD is supported in PPTT
> +                 * revision 2 and later.
> +                 */
> +                if ( proc->flags & ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD )
> +                    thread_offset = (char *)proc - (char *)pptt;

This variable is only ever set, never read.

Also I think casts to const void * are to be preferred for code like this
(if such offset calculations are needed in the first place). Or casts to
unsigned long.

> +                else
> +                {
> +                    /* Assume no threading support when PPTT revision is 1. */
> +                    threading = false;
> +                    core_offset = (char *)proc - (char *)pptt;
> +                }
> +            else if ( level == 1 )
> +                if ( threading )
> +                    core_offset = (char *)proc - (char *)pptt;
> +                else
> +                    cluster_offset = (char *)proc - (char *)pptt;
> +            else if ( level == 2 )
> +                if ( threading )
> +                    cluster_offset = (char *)proc - (char *)pptt;

PLease add braces to separate inner if/else from outer ones.

> +            if ( proc->parent )
> +            {
> +                proc = (const struct acpi_pptt_processor *)
> +                       ((char *)pptt + proc->parent);
> +                level++;
> +            }
> +            else
> +                break;
> +        }
> +
> +        topo->phys_socket_id =
> +            get_logical_id(socket_offset, socket_map, &num_sockets);
> +        topo->phys_cluster_id =
> +            get_logical_id(cluster_offset, cluster_map, &num_clusters);
> +        topo->phys_core_id =
> +            get_logical_id(core_offset, core_map, &num_cores);

What if any of the ..._offset is still 0?

> +        /* Fall back to socket ID if PPTT lacks cluster information. */
> +        if ( topo->phys_cluster_id == 0 )
> +            topo->phys_cluster_id = topo->phys_socket_id;

Why would 0 indicate the absence of cluster information? Isn't it
cluster_offset being 0 which does so?

> +    }
> +
> +    for_each_possible_cpu(cpu)
> +    {
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +        unsigned int tcpu;
> +
> +        for_each_possible_cpu(tcpu)
> +        {
> +            struct cpu_topology *ttopo = &cpu_topology[tcpu];
> +
> +            if ( cpu > tcpu )
> +                continue;
> +
> +            if ( topo->phys_core_id == ttopo->phys_core_id )
> +            {
> +                cpumask_set_cpu(tcpu, topo->thread_sibling);
> +                cpumask_set_cpu(cpu, ttopo->thread_sibling);
> +            }
> +
> +            if ( topo->phys_cluster_id == ttopo->phys_cluster_id )
> +            {
> +                cpumask_set_cpu(tcpu, topo->cluster_sibling);
> +                cpumask_set_cpu(cpu, ttopo->cluster_sibling);
> +            }
> +
> +            if ( topo->phys_socket_id == ttopo->phys_socket_id )
> +            {
> +                cpumask_set_cpu(tcpu, topo->core_sibling);
> +                cpumask_set_cpu(cpu, ttopo->core_sibling);
> +            }
> +        }
> +
> +        topo->num_siblings = cpumask_weight(topo->thread_sibling);
> +    }
> +
> +    for_each_possible_cpu(cpu)
> +    {
> +        const struct cpu_topology *topo = &cpu_topology[cpu];
> +
> +        printk(XENLOG_DEBUG
> +               "ACPI: acpi_id[%u] CPU-%u Socket-%u Cluster-%u Core-%u\n",
> +               map_cpu_acpiid[cpu],
> +               cpu,
> +               topo->phys_socket_id,
> +               topo->phys_cluster_id,
> +               topo->phys_core_id);
> +    }

Is this meant to stay? It can be a lot of output with many CPUs.

> --- a/xen/include/acpi/actbl3.h
> +++ b/xen/include/acpi/actbl3.h
> @@ -72,6 +72,7 @@
>  
>  #define ACPI_SIG_S3PT           "S3PT"	/* S3 Performance (sub)Table */
>  #define ACPI_SIG_PCCS           "PCC"	/* PCC Shared Memory Region */
> +#define ACPI_SIG_PPTT           "PPTT"	/* Processor Properties Topology Table */
>  
>  /* Reserved table signatures */
>  
> @@ -637,6 +638,35 @@ struct acpi_table_stao {
>  	u8 ignore_uart;
>  };
>  
> +/*******************************************************************************
> + *
> + * PPTT - Processor Properties Topology Table - ACPI 6.3
> + *        Version 1
> + *
> + ******************************************************************************/
> +struct acpi_table_pptt {
> +    struct acpi_table_header header;
> +};
> +
> +#define ACPI_PPTT_TYPE_PROCESSOR            0
> +#define ACPI_PPTT_TYPE_CACHE                1
> +#define ACPI_PPTT_TYPE_ID                   2
> +
> +struct acpi_pptt_processor {
> +    struct acpi_subtable_header header;
> +    u16 reserved;
> +    u32 flags;
> +    u32 parent;
> +    u32 acpi_processor_id;
> +    u32 number_of_priv_resources;
> +};
> +
> +#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
> +#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1 << 1)
> +#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1 << 2)  /* ACPI 6.3 */
> +#define ACPI_PPTT_ACPI_LEAF_NODE            (1 << 3)  /* ACPI 6.3 */
> +#define ACPI_PPTT_ACPI_IDENTICAL            (1 << 4)  /* ACPI 6.3 */
> +
>  /* Reset to default packing */
>  
>  #pragma pack()

Linux, which presumably still takes it from ACPI CA, has this in actbl2.h.
Please match placement as closely as possible. Ideally take (as a separate,
prereq patch) the Linux commit(s) adding the definitions. See
docs/process/sending-patches.pandoc for formal aspects of doing so.

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -139,8 +139,16 @@ static inline int acpi_boot_table_init(void)
>  
>  void acpi_init_cpu_topology(void);
>  
> +extern uint32_t map_cpu_acpiid[NR_CPUS];

Since this is __initdata, imo ...

> +static inline void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id)

... this would better be annotated __init as well, even if for an inline
function that's unlikely to take any effect. Other than the important one
here: Documentation.

Jan

