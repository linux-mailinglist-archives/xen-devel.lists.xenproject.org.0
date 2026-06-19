Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A+qUKnsBNWqslwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:44:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F50E6A4AEB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:44:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EKJOZsCJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341930.1602226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUq0-00041X-4y; Fri, 19 Jun 2026 08:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341930.1602226; Fri, 19 Jun 2026 08:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUq0-0003yn-2C; Fri, 19 Jun 2026 08:44:32 +0000
Received: by outflank-mailman (input) for mailman id 1341930;
 Fri, 19 Jun 2026 08:44:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waUpy-0003yh-KP
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:44:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waUpy-00FtwQ-19
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:44:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a35015c-5cb7-0a2a0a5109dd-0a2a450c94ea-46
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:44:29 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a35016d-94a4-0a2a450c0019-d155dd2de86d-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:44:29 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so1405771f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 01:44:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc426e1sm6240680f8f.29.2026.06.19.01.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 01:44:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1781858669; x=1782463469; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qxSbntXwpMLfQbx9fmhtfIWql5SGnegrtF/i1rnGmZ8=;
        b=EKJOZsCJca3/nIlmlqGtFX59+mq+XFmqYSvtWTTSkosE7abyOsPq2l0hgqejyBk9Ob
         JSGDqsgH6fkBOue27VZieFwRaxgcUlvkMlnqxhdIdDlIHdmwsdp5QC2CAJ2mg7/2B+OP
         U6Pg7kxhX5NYmoXzq/605qWudNnlRGyEOZ3uY/zyiQLYUUxRq2cTChEl0gNGNAacFSYf
         YnUwQC2//ac5ORl3hYkHI9B1FbyPANvT3C4+epbNP6h9CuiTCpZVaa2uewXeEYzDEbDm
         XqxRyNlBUWmHJhGuavtTGzHP0MkBCzrWM9BtKCgn6V3ZRgtfxEJlebZlKqCvh5smkOcc
         tq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858669; x=1782463469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxSbntXwpMLfQbx9fmhtfIWql5SGnegrtF/i1rnGmZ8=;
        b=e03RhNCQpAYgOcpoQPoMII19rvo/3oyvytVk0FsGrL+rwg8lWjVtFxNtx8YPxBlIU7
         gIdBPlRBMxja8S3QuCfTI3E15DSRlnXYfRUVEp7Zl746F+a46/p1bcD0+p1Jhs8fRaGn
         0NjkRJq/RWhWKKkc1FmXVYXHJYGCA4Y4ySrnulQonU5VMMao2Jk/ua+tposnf8/QVY+S
         5hOjZR3IwrvmJzvdIkoORtsnrG4X/MdLOLVhMwM5zU1043DNk9ZdmCX32VX6iERET+0P
         WhMoZN/SN56H8uU2IMGF7bvkfF1Z3xwTPZb+3ubeWKvXP8+vhQy18wvzQli4okCTuBt0
         94zg==
X-Forwarded-Encrypted: i=1; AFNElJ+2RJotlvxPGtXf82bRiX8M9uXIUsnW7C9GssJm07KIvgmfnfsEF2gYIyKw+7Q4UsofaEVOTTeOqRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfkdZjOT59E06isetJKhRQvlvism3mA0W01mOuD7tfcmzIG8y9
	6tCnDuO+lOyxgYMi7ogfunoqRV0bC+RkcmoPu5rz9ZUNKCqPkLD98DG32L+3Bw1ObA==
X-Gm-Gg: AfdE7cn/TTCXEkWHDo3DB7Gb1/7GfCqq4fIPLb4tsy1s3gTM2zDmkjiADzABbq6nhMq
	v2c/quZnQOz4mI7Q0KAwIyCXZDX9YG62qiM1CuJKrURPIVBxazltzrLB+O2rYW/WfOdUMqXGhej
	so5GDo/rYRlFey0m6czvBOs/PYkbEOpRhPYMm2rtfwBhxiB3hcY1TrdgCsDrMk3OZPuL4Ex13pX
	FP4gJvaRJRmx0bpvgjXyFAWTI/30GI11l9eRoPRLoCKN02lsr4AzbpqdPdGjXJlBfgMAEOjR4NX
	VHVZr/VsV01gdhxvu3ZuEEoQvqyVaTNvkZGj5pItBPQr6mOlmERx2IW/QFXEUNMjxlRWVoupt9+
	qD93c6R4uGDVbVlgj6WBdTk+7s9dOy1oZ+rHnvgiAgTDOxNJdiRDCn+p6pCRseO2ka0aFirq6U5
	OtV8IDvW+xVvYiOCD98b4ZSqFFPAIs5QvlRSwARo/qP3WCZ04UBEo3oTBN6fMmAxIxhtpMNzi4E
	xOB
X-Received: by 2002:a05:6000:2489:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-465078b56d0mr5163481f8f.14.1781858669148;
        Fri, 19 Jun 2026 01:44:29 -0700 (PDT)
Message-ID: <926d2a7a-e278-4c3a-b168-aad003da6652@suse.com>
Date: Fri, 19 Jun 2026 10:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from
 Device Tree 'distance-map'
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-8-taka@valinux.co.jp>
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
In-Reply-To: <20260619075011.377116-8-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781858669-DB5E0ABF-52B5A1AB/0/0
X-purgate-type: clean
X-purgate-size: 6497
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 0F50E6A4AEB

On 19.06.2026 09:49, Hirokazu Takahashi wrote:
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -375,6 +375,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>          device_tree_flattened = NULL;
>      }
>  
> +#ifdef CONFIG_NUMA
> +    numa_distance_table_init();
> +#endif /* CONFIG_NUMA */

Generally we prefer to avoid such #ifdef-ary in main source code by providing stub
(inline) functions in headers. Yet then I'm not an Arm maintainer ...

> --- a/xen/common/device-tree/numa.c
> +++ b/xen/common/device-tree/numa.c
> @@ -1,4 +1,80 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Linux kernel 7.0's $drivers/of/of_numa.c
> + * Parse 'distance-map'
> + */
> +
> +#include <xen/bootinfo.h>
> +#include <xen/device_tree.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/bootfdt.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
> +
> +#define LOCAL_DISTANCE      10
> +#define REMOTE_DISTANCE     20
> +
> +/*
> + * Parse the '/distance-map' node from the flattened device tree
> + * and extract the 3-tuple triplets <from, to, distance>.
> + */
> +static void __init dt_numa_parse_distance_map(void)
> +{
> +    const void *fdt = device_tree_flattened;
> +    const struct fdt_property *prop;
> +    const __be32 *matrix;
> +    int entry_count;
> +    int node;
> +    int len;
> +    int i;

Nit: Plain int only when values can actually go negative, or when not-yet-
tidied-up code elsewhere (e.g. libfdt here) makes this necessary.

> +    node = fdt_path_offset(fdt, "/distance-map");
> +    if ( node < 0 )
> +        return;
> +
> +    if ( fdt_node_check_compatible(fdt, node, "numa-distance-map-v1") )
> +        return;
> +
> +    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
> +    if ( !prop )
> +        return;
> +
> +    matrix = (const __be32*)prop->data;

Nit: Blank before * please.

> +    entry_count = len / sizeof(__be32);

Nit: Better sizeof(<expression>).

> +    if ( (entry_count <= 0) || (entry_count % 3) )
> +        return;
> +
> +    for ( i = 0; i + 2 < entry_count; i += 3 )
> +    {
> +        uint32_t nodea, nodeb, distance;

Again, no apparent need for a fixed-width type here.

> +        nodea = dt_next_cell(1, &matrix);
> +        nodeb = dt_next_cell(1, &matrix);
> +        distance = dt_next_cell(1, &matrix);
> +
> +        if ( (nodea == nodeb && distance != LOCAL_DISTANCE) ||
> +             (nodea != nodeb && distance <= LOCAL_DISTANCE) )
> +        {
> +            printk(XENLOG_WARNING "Invalid distance[node%d -> node%d] = %d\n",
> +                   nodea, nodeb, distance);

Nit: %u please with unsigned quantities (applies, like all such comments,
also elsewhere).

> +            continue;
> +        }
> +
> +        numa_set_distance(nodea, nodeb, distance);
> +
> +        /* Set default distance of node B->A same as A->B */
> +        if ( nodeb > nodea )
> +            numa_set_distance(nodeb, nodea, distance);
> +    }
> +}
> +
> +void __init dt_numa_distance_table_init(void)
> +{
> +    dt_numa_parse_distance_map();
> +}

I assume there are going to be further additions to this function?

> --- a/xen/common/numa-distance-map.c
> +++ b/xen/common/numa-distance-map.c
> @@ -1,19 +1,62 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Linux kernel 7.0's $mm/numa_memblks.c
> + */
>  
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> +#include <xen/acpi.h>
> +
>  
>  #define LOCAL_DISTANCE      10

Nit: No double blank lines please.

>  #define REMOTE_DISTANCE     20
>  
> +uint8_t * __ro_after_init numa_distance;

Nit: Excess blank after *.

>  /*
>   * Get the distance between node 'from' and node 'to'.
>   */
>  uint8_t numa_node_distance(unsigned int from, unsigned int to)
>  {
> -    if ( from != to )
> -        return REMOTE_DISTANCE;
> -    return LOCAL_DISTANCE;

Why did you introduce the function as a fallback when now you remove the
fallback logic entirely? Can't you introduce the function right here,
omitting the earlier patch?

> +    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
> +
> +    if ( from >= nr_nodes || to >= nr_nodes )
> +        return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;

What if either node is NUMA_NO_NODE?

> +    return numa_distance[from * nr_nodes + to];
> +}
> +
> +void __init numa_set_distance(unsigned int from, unsigned int to,
> +                                     unsigned int distance)

Nit: Indentation.

> +{
> +    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
> +
> +    if ( (uint8_t)distance != distance || from >= nr_nodes || to >= nr_nodes )
> +        printk(XENLOG_WARNING "Invalid distance[node%d -> node%d] = %d\n",
> +               from, to, distance);
> +    else
> +        numa_distance[from * nr_nodes + to] = distance;
> +}
> +
> +void __init numa_distance_table_init(void)
> +{
> +    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
> +    unsigned int i, j;
> +
> +    numa_distance = xzalloc_array(uint8_t, nr_nodes * nr_nodes);

xvzalloc*() family of functions in new code, please.

Further there's an at least abstract risk of the multiplication overflowing.
See how xvmalloc_array() allows for multiple dimensions to be passed.

> +    if ( !numa_distance )
> +        panic("Failed to allocate memory for numa distance-map array\n");
> +
> +    /* fill with the default distances */

Nit: Comment style.

> +    for ( i = 0U; i < nr_nodes; i++ )
> +        for ( j = 0U; j < nr_nodes; j++ )

Why the U suffixes?

> +            numa_distance[i * nr_nodes + j] = i == j ?
> +                LOCAL_DISTANCE : REMOTE_DISTANCE;

While binary operators really want to go at the end of wrapped lines, for
the conditional operator we would generally prefer e.g.

            numa_distance[i * nr_nodes + j] = i == j
                ? LOCAL_DISTANCE : REMOTE_DISTANCE;

while specifically here it might be yet better as

            numa_distance[i * nr_nodes + j] =
                i == j ? LOCAL_DISTANCE : REMOTE_DISTANCE;

You fill the entire array here. Why do you then use the zero-filling form
of the allocation function?

Jan

