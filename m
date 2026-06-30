Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I6lIJhpoQ2oYYAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 08:54:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB56E0E92
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 08:54:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VxAn4HfE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348343.1606136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSLs-0003w5-C3; Tue, 30 Jun 2026 06:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348343.1606136; Tue, 30 Jun 2026 06:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSLs-0003ue-9O; Tue, 30 Jun 2026 06:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1348343;
 Tue, 30 Jun 2026 06:53:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weSLr-0003uI-Ii
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 06:53:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSLq-00GJya-6U
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:53:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4367e7-bab6-0a2a0a5309dd-0a2a4507e54a-30
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:53:41 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4367f5-9c8e-0a2a45070019-d1558035d425-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:53:41 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493b691cb44so8607235e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:53:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8d0bb2fsm47535765e9.14.2026.06.29.23.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 23:53:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1782802421; x=1783407221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gHBXywU6V24hu3xdKy/AE57cckFBfR2xBVX7c1/9bXI=;
        b=VxAn4HfEsy7q+knOQVQl8F3z9j1xc/9ZF2QU4ffj/ztbg0gpWuOsRGyf4M1o+ndHFI
         tcx9PbULcoHErvCUzdBQTUhXpl+jarbVDdKk3xqMhb9F/gLCxfpJIVQFig96YrGpAgUM
         AZtonPkRfhZ9xLJ0BWouWUamu8oI/QQ9Psc6288g7vl+lrZUUbemUl2cJiL9f3w/hyID
         TSL1IojqhuNuN03kpZwXrk/oPGCrbwGKaMTWmGdU2AmpJ+BIbJhT0w9b7f2+aBpZUDZc
         Lrv3dmSls5Svhm6ZY1ZKf7Yyt4NeXneRNKXiJqllisPmZXt9lzaIpQ3YYLXVFu0oC9iE
         2Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802421; x=1783407221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHBXywU6V24hu3xdKy/AE57cckFBfR2xBVX7c1/9bXI=;
        b=nZcXqvwrDnK3iknPuYL1aHmqfu06+HA0gbIqY574KR8s1PUkbLlU54yX98kMgDWJmA
         gdiZplkh2EsauogqSUCOI/MgyYBJqlPQD2Ux2STQCD4NXdwzJW2qNKxfuGyAVVyvx9LY
         z4yzjnvAo2gR1fDqycRDhiOLBy1bOW1AVBETYEC4bV0kEes5l5YYKX3KyA4odwIGpOga
         QMm0GvuQWfFBhjr0oMzk+Qd9FPXg7EDQl8jfThbe0MfkgW5auo5oXHLwrAi7/5yEgKN8
         rfGZ4xpuYah16q7ZiJgCzQKRy3OmLm7HDAI9kZAhKm5lAVlTEFWJF7WuchSKceibIINZ
         3FTw==
X-Forwarded-Encrypted: i=1; AFNElJ/U8tis2X3TIvS7PcfuEEwdK97RoevfaLcQMDvv796wfGZpHrHy2DFfBLO9pZrr+J9K5OPLebgJhhQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAnAySGJPRfin6Bu4RIWYxLdotpZIxF2fM94uU/dNWaOJ8Knl0
	0uhyAvUtT8YWMsqJq3daPMpav67q9la158MtSaHhwoenxiw6gNnFtmOj7CPW8YOmyQ==
X-Gm-Gg: AfdE7cm/UXdLyc4d3fCmUxBbFReUDj0+5UT2Re2J19gtSbrTb+ZqKVLIK6/wrVyaWFd
	XBRJTyzu+DlGGmwSjjV0hNRCSbKELgTNjUHTgBI+DXB6sd6J9McttBtnsyt5BNFY2ifPbx4DSP/
	EomNANUWJ7FFi/mi5lzZHfQ2nfSWztRaJAUNRpiJWG9sdTbMFHAz2ZKaMMntAOIG2yPPa0irDia
	5M5nwG0CMpE82AoS3WvoK9wPz4JBFjreKpUdpsxX4lSBJ8HfA+z+ahQZyFDEsRO2XYvo32n1fq5
	wD0HiQj4GoDqcoGgwvvGSNRnwDmvjSnEA+ftIblzp+dnxKKF3Hx6gUdtCP6VVEAgTqOYbwdd+xQ
	CZ3SGXGWKoYRu6qkAQ8EaUGebcx7kG6V4HpwAlIRzrCcaMP8dcURAXKOy3japV+oRUmvflYGAeL
	a73jHlmjHZQ8o8QDnC62Bvd+iK/6WG7WdtC/2WZuAiO9YP9YXSn57YGqVDeg+fxKue2An1V7nE3
	e3HofMkLND88Nc=
X-Received: by 2002:a05:600c:3486:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-493b82c2a7dmr35302215e9.33.1782802418725;
        Mon, 29 Jun 2026 23:53:38 -0700 (PDT)
Message-ID: <97dd9fd5-c0de-4125-a40a-b7f6e1aed27d@suse.com>
Date: Tue, 30 Jun 2026 08:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-2-taka@valinux.co.jp>
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
In-Reply-To: <20260629215806.11610-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782802421-FD32F25E-FFC56824/0/0
X-purgate-type: clean
X-purgate-size: 9393
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3DB56E0E92

On 29.06.2026 23:58, Hirokazu Takahashi wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -101,6 +101,16 @@ endchoice
>  
>  source "arch/Kconfig"
>  
> +config ARM_CPU_TOPOLOGY
> +	bool "CPU topology support (UNSUPPORTED)" if UNSUPPORTED
> +	select CPU_TOPOLOGY
> +	help
> +	  Retrieve CPU topology information from the device tree to optimize
> +	  virtual CPU scheduling.
> +
> +	  Note: Implementation for parsing CPU topology from the ACPI PPTT
> +	  is currently missing.

This option isn't itself used anywhere; it exists solely for its "select"
effect. Since topology is an arch-independent concept, I'd suggest
CPU_TOPOLOGY to have the prompt and help text, and there being a per-arch
HAS_CPU_TOPOLOGY (or maybe HAS_GENERIC_CPU_TOPOLOGY, to avoid the false
impression that x86 doesn't deal with topology) which CPU_TOPOLOGY then
depends on.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -188,6 +188,14 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config DT_CPU_TOPOLOGY
> +	bool
> +
> +config CPU_TOPOLOGY
> +	bool
> +	select DT_CPU_TOPOLOGY if DEVICE_TREE_PARSE
> +	select ACPI_CPU_TOPOLOGY if ACPI

As per part of what I said above, this may also want to be GENERIC_CPU_TOPOLOGY
or some such. Other maintainers' input may be wanted here.

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
>  obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
> +obj-$(CONFIG_CPU_TOPOLOGY) += cpu-topology.o

As least for now this may want to be

obj-bin-$(CONFIG_CPU_TOPOLOGY) += cpu-topology.init.o

seeing that ...

> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +
> +static void __init free_topology_table(void)
> +{
> +    unsigned int cpu;
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        free_cpumask_var(cpu_topology[cpu].thread_sibling);
> +        free_cpumask_var(cpu_topology[cpu].core_sibling);
> +        free_cpumask_var(cpu_topology[cpu].cluster_sibling);
> +    }
> +
> +    XFREE(cpu_topology);
> +}
> +
> +void __init init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +
> +    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpu_ids);
> +    if ( !cpu_topology )
> +    {
> +        printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");
> +        return;
> +    }
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
> +        {
> +            free_topology_table();
> +            printk(XENLOG_ERR "Failed to allocate memory for cpu_topology table\n");
> +            return;
> +        }
> +    }
> +
> +    if ( acpi_disabled )
> +        dt_init_cpu_topology();
> +    else
> +        acpi_init_cpu_topology();
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

... there are only __init functions here.

> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += bootfdt.init.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
> +obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.o

Same here, albeit requiring ...

> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,352 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
> + * Parse cpu topology information.
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/numa.h>
> +#include <xen/xvmalloc.h>
> +
> +struct cpu_map {
> +    unsigned int thread_id;
> +    unsigned int core_id;
> +    unsigned int cluster_id;
> +    unsigned int package_id;
> +};
> +
> +struct cpu_topology *cpu_topology;

... this (which ought to be __ro_after_init anyway) to be moved elsewhere.

> +static const unsigned int __initdata invalid_topo_id = (~0U);

Nit: What use are the parentheses here? This may want to be a #define (with
the identifier all uppercase), in which case the parentheses need keeping.

> +void __init map_cpuid_to_node(unsigned int cpuid,
> +                              struct dt_device_node *cpu_node)
> +{
> +    if ( cpuid < NR_CPUS )

Better use ARRAY_SIZE() when ...

> +        dt_cpu_table[cpuid] = cpu_node;

... an array access is guarded.

Just for my own understanding: It is deliberate for cpuid >= NR_CPUS to go
entirely silently here?

As to "cpuid" - please can this be "cpu", as you have it elsewhere. "cpuid"
is a misleading term here when x86 comes into play.

> +static unsigned int __init cpu_node_to_id(struct dt_device_node *cpu_node)
> +{
> +    unsigned int cpu;
> +    bool found = false;

Pointless initializer; in fact ...

> +    for_each_possible_cpu(cpu)
> +    {
> +        found = (cpu_node == dt_cpu_table[cpu]);

... the declaration could move here, or - better yet - could be omitted
altogether, as the variable is used ...

> +        if ( found )

... exacly once.

> +/*
> + * This function returns the logic cpu number of the node.

Nit: "logical"? Also "of the node" is misleading (towards NUMA), "of the DT
node" would be unambiguous.

> + */
> +static unsigned int __init get_cpu_for_node(struct dt_device_node *node)

Pointer-to-const?

> +{
> +    struct dt_device_node *cpu_node = dt_parse_phandle(node, "cpu", 0);

Again? Generally everywhere that it is possible and sensible.

> +    if ( !cpu_node )
> +        return invalid_topo_id;
> +
> +    return cpu_node_to_id(cpu_node);
> +}
> +
> +static int __init parse_core(struct dt_device_node *core,
> +                             unsigned int package_id,
> +                             unsigned int cluster_id,
> +                             unsigned int core_id)
> +{
> +    char name[20];

Move to the more narrow scope it's used in? (Again please take as a
general remark.)

> +    bool leaf = true;
> +    unsigned int i = 0;
> +    unsigned int cpu;
> +
> +    do {
> +        struct dt_device_node *t;
> +
> +        snprintf(name, sizeof(name), "thread%u", i);
> +        t = dt_find_child_node_by_name(core, name);
> +
> +        if ( !t )
> +            break;
> +
> +        leaf = false;
> +        cpu = get_cpu_for_node(t);
> +        if ( cpu != invalid_topo_id )
> +        {
> +            cpu_map[cpu].package_id = package_id;
> +            cpu_map[cpu].cluster_id = cluster_id;
> +            cpu_map[cpu].core_id = core_id;
> +            cpu_map[cpu].thread_id = i;
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for thread\n", t);

I don't think we support %pOF (just yet).

> --- a/xen/drivers/acpi/Makefile
> +++ b/xen/drivers/acpi/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_PM_OP) += pm-op.o
>  
>  obj-$(CONFIG_X86) += hwregs.o
>  obj-$(CONFIG_X86) += reboot.o
> +
> +obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.o

See earlier remarks as to object containing only __init code. Also this may
better be appended (without a blank line) to the earlier block of objects.

> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_CPU_TOPOLOGY_H
> +#define XEN_CPU_TOPOLOGY_H
> +
> +#include <xen/dt-cpu-topology.h>
> +
> +struct cpu_topology {
> +    cpumask_var_t thread_sibling;
> +    cpumask_var_t core_sibling;
> +    cpumask_var_t cluster_sibling;

For these to compile independent of what #include-s occurred earlier in the
top-level .c file, don't you need to also "#include <xen/cpumask.h>"? Otoh
I can't quite spot why you #include xen/dt-cpu-topology.h here.

Further shouldn't this move ...

> +};
> +
> +#ifdef CONFIG_CPU_TOPOLOGY

... here?

> +extern struct cpu_topology *cpu_topology;
> +void init_cpu_topology(void);
> +
> +#else /* CONFIG_CPU_TOPOLOGY */
> +
> +#define cpu_topology ((struct cpu_topology *)NULL)

Why exactly is this needed? It very much looks as if its presence may hide
bugs.

> --- /dev/null
> +++ b/xen/include/xen/dt-cpu-topology.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_DT_CPU_TOPOLOGY_H
> +#define XEN_DT_CPU_TOPOLOGY_H
> +
> +#include <xen/device_tree.h>

Again I can't quite see why this would be needed. You need a forward-decl
of ...

> +#ifdef CONFIG_DT_CPU_TOPOLOGY
> +
> +void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);

... struct dt_device_node, yes, but that's all.

Jan

