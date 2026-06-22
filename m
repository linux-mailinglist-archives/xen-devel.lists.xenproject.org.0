Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0XgCA0kOWqOnQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 14:01:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C246AF430
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 14:01:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dTGcuM8M;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343686.1602927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbdKZ-0004KS-Of; Mon, 22 Jun 2026 12:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343686.1602927; Mon, 22 Jun 2026 12:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbdKZ-0004Hy-Lj; Mon, 22 Jun 2026 12:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1343686;
 Mon, 22 Jun 2026 12:00:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbdKX-0004Hs-QP
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 12:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbdKX-007g0R-1h
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:00:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3923e3-2eae-0a2a0a5409dd-0a2a4504de1a-44
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 14:00:44 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3923ec-5f9f-0a2a45040019-d1558032d01c-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 14:00:44 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso64726135e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 05:00:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd30078sm289617145e9.7.2026.06.22.05.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 05:00:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1782129644; x=1782734444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ACWgBZRqTCSZfU+qtZ6V/WImZt+PSoRJaKj4/pnok+E=;
        b=dTGcuM8Me+qPaC0yiobRdnFvhhjhFWH5PkAqd3Xd+DonRFlsbpaF4uXreDR1uksctq
         tScGcgTde1FQam1PQhbKnhgErZqGad5qtx/982n7NUDjcpeE2ppZAcY6NqOhGQXKgXQL
         UZ5Od5PwZOXGXtz0u0PFQojR7mIYkEpbs1t2eMPq/LBygqE0EUq8bNN8YhLsLzCQJ0PL
         yeG5QDfLmUCH3jdm7TjxHdbh6OxI4Y4d1OcVjXMgjYfoG8iPuvrhzZGuGco+QUhGxwmH
         3EXH0SHygor/TFJ2nG65Xp38C7sV2JuYx30qK1wovHEu9ICzzcc8YKTrAPJxZl5jygyW
         DTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129644; x=1782734444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACWgBZRqTCSZfU+qtZ6V/WImZt+PSoRJaKj4/pnok+E=;
        b=QZ4nf9RRMOyBSoyQPYKfvh6k3+8ZrtLt+6rwY91A8UeqTwg2c8hhxnIxve/7pxfJLa
         cDQqtaU/mXRjFJqLXpceM4vbrj9aFQ+AJlPhe6zc9CwOscKPsMGyAclxhg6Pd0oTFN28
         ie7EVoK64Fk9EmdQdsYbQFzlparWiBE1kGvNixZrG/a8RfdmtYX74umS0WbHS0GMv28j
         IYpJUsmhckAMXNyQho8QBIjgVWGInsFzAsptkN/dYBB3jxm7zx4gwz8963+eHLaQnnN1
         dJ/rbMmhBItZFU4BsB6jwjASvaRegEjesS53j1Uv7DIy7BAhyTKcfxEHzuh7DUZ7I6Rx
         nNsg==
X-Forwarded-Encrypted: i=1; AFNElJ/DoG+qs+zJ75LAkhksw/xL40UgMalE2pcULuWduDDyD5pFc/dCkCPOv66J2KJIH2d9iUf9qFlDPgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjCa6euCnNrg+4kMP2xhbS9G3oBQUd+ld37MV/NmG3LxCwqA/H
	dEpVTXEUz6YbfIbjG+b3L939zmiK3hZ/TmK9AXRtJpja7KnhRcj/O0IREpFsrWB13A==
X-Gm-Gg: AfdE7ckX5uikZ+iaeIc9oDxPcpOI8dSgKhwp18/k1oK/rGuecg6AktzTZAEsImKlzF9
	ebvqBKHjdtHWh+6rK+NSZW8D6XbdiZIrlUBtCWl9OtP7HdmW00BJHFGltIDnbiIzLYBjt3D0RHW
	O4xmRWkrqHleoq9dPsgzYm572tILfEQT90vNHHbgL8iKtMwnYHrAVu/oPuHefV81DYsxfXXJj28
	XtGJbtE+kVSec29LZ0GBBDoyh3Ictx2OCTNLpQE5mCKmXhlonuWC07nPMW3nLKpaG7Ou030AuEU
	bQwhpgcCCl7r7MY1/GT80CkgZE28MrlT7RXDDkFw3WL2OCRJeermFVzTO4Pq/UzqMYWvLyT6wSt
	EbT44aThdOIrfSOtDa5fdsDvzzW9cT3GwrNW+7HHJJ58yywr4/gV6/VKrtvbKeuhL0VxmqQ2jN1
	exiydS6rUScn0tiZIa7OTDt4TKP5ohg2wOCOGiK7X2AAkty1ttAOzMdBXB6HxUC9fOjKccQ1bK0
	2sE
X-Received: by 2002:a05:600c:5020:b0:490:d946:47cf with SMTP id 5b1f17b1804b1-4923ef47d08mr232214485e9.4.1782129644165;
        Mon, 22 Jun 2026 05:00:44 -0700 (PDT)
Message-ID: <0c37c031-cc21-44d2-9ef6-4baf6f24d74b@suse.com>
Date: Mon, 22 Jun 2026 14:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-2-taka@valinux.co.jp>
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
In-Reply-To: <20260617071206.265599-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782129644-4D197141-72580229/0/0
X-purgate-type: clean
X-purgate-size: 5693
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
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75C246AF430

On 17.06.2026 09:12, Hirokazu Takahashi wrote:
> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/cpumask.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/init.h>
> +#include <xen/acpi.h>
> +
> +void __init init_cpu_topology(void)
> +{
> +    const unsigned int nr_cpus = cpumask_last(&cpu_possible_map) + 1U;
> +
> +    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpus);

cpu_topology exists as a global variable only when DT is in use. I think the
definition needs to move here (from common/device-tree/cpu-topology.c).

As to the size of the array, it's not quite clear to me whether by doing it
this way (instead of using nr_cpu_ids) we're not setting ourselves up for
trouble.

> +    if ( !cpu_topology )
> +        panic("Failed to allocate memory for cpu_topology array\n");

I question such uses of panic(): Surely we can do without any NUMA info,
it's only performance which is going to suffer.

> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,343 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
> + * Parse cpu topology information.
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/device_tree.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/numa.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +
> +struct cpu_map {
> +    unsigned int thread_id;
> +    unsigned int core_id;
> +    unsigned int cluster_id;
> +    unsigned int package_id;
> +};
> +
> +struct cpu_topology *cpu_topology;
> +static const unsigned int __initdata invalid_topo_id = (~0U);
> +static struct cpu_map __initdata cpu_map[NR_CPUS] = {
> +    [0 ... NR_CPUS-1] = {invalid_topo_id, invalid_topo_id, invalid_topo_id, 0U}
> +};
> +static struct dt_device_node * __initdata dt_cpu_table[NR_CPUS];
> +
> +static void __init setup_siblings_masks(unsigned int cpuid)
> +{
> +    struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> +    struct cpu_map *cpuid_map = &cpu_map[cpuid];
> +    unsigned int cpu;
> +
> +    /* Update core and thread sibling masks */
> +    for_each_possible_cpu(cpu)
> +    {
> +        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
> +        struct cpu_map *map = &cpu_map[cpu];
> +
> +        if ( cpuid_map->package_id != map->package_id )
> +            continue;
> +
> +        cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> +        cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
> +
> +        if ( cpuid_map->cluster_id != map->cluster_id )
> +            continue;
> +
> +        if ( cpuid_map->cluster_id != invalid_topo_id )
> +        {
> +            cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
> +            cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
> +        }
> +
> +        if ( cpuid_map->core_id != map->core_id )
> +            continue;
> +
> +        cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
> +        cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
> +    }
> +}
> +
> +static struct dt_device_node * __init dt_find_child_node_by_name(struct dt_device_node *from, const char *name)

Nit: Overlong line here, and ...

> +static int __init parse_core(struct dt_device_node *core,
> +                unsigned int package_id, unsigned int cluster_id,
> +                unsigned int core_id)

... bogus indentation e.g. here. Please go though yourself to check style.

> --- /dev/null
> +++ b/xen/drivers/acpi/topology.c
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/cpumask.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/init.h>
> +#include <xen/acpi.h>
> +
> +/*
> + * ToDo: Populate the topology information by scanning the ACPI
> + *       PPTT (Processor Properties Topology Table).

Please can this be spelled "TODO:", to stand out more and to be a hit also
with case sensitive grep for "TODO"?

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -101,6 +101,8 @@ void acpi_table_print (struct acpi_table_header *header, unsigned long phys_addr
>  void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
>  void acpi_table_print_srat_entry (struct acpi_subtable_header *srat);
>  
> +void acpi_init_cpu_topology(void);
> +
>  /* the following four functions are architecture-dependent */
>  void acpi_numa_slit_init (struct acpi_table_slit *slit);
>  void acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *);
> @@ -133,6 +135,8 @@ static inline int acpi_boot_table_init(void)
>  	return 0;
>  }
>  
> +static inline void acpi_init_cpu_topology(void) {}

This shouldn't be needed. When ACPI=y, acpi_disabled is compile-time true,
and hence the compiler can and will DCE the call. All it needs to see is a
declaration, which therefore wants to move outside of the CONFIG_ACPI
conditional.

> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_CPU_TOPOLOGY_H
> +#define XEN_CPU_TOPOLOGY_H
> +
> +#include <xen/types.h>
> +#include <xen/dt-cpu-topology.h>
> +
> +struct cpu_topology {
> +    cpumask_t thread_sibling;
> +    cpumask_t core_sibling;
> +    cpumask_t cluster_sibling;
> +};

With huge NR_CPUS this can be pretty large a struct (of which in init_cpu_topology()
you allocate an array). Imo you want to use cpumask_var_t here, with allocation added
as needed.

> +
> +

Nit: No double blank lines please.

Jan

