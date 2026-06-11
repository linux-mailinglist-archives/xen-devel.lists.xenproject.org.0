Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TsujBWA4K2rv4QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:36:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B138C675A6A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=Salw7uwn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1336206.1598084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXo0F-0001e7-Ja; Thu, 11 Jun 2026 22:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336206.1598084; Thu, 11 Jun 2026 22:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXo0F-0001c2-Gy; Thu, 11 Jun 2026 22:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1336206;
 Thu, 11 Jun 2026 22:35:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wXo0E-0001bw-8o
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 22:35:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXo0D-004yEE-27;
 Thu, 11 Jun 2026 22:35:57 +0000
Received: from [2a02:8012:3a1:0:51e8:2886:7874:ff19]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXo0C-002F0p-2O;
 Thu, 11 Jun 2026 22:35:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jKqZWKSWhuwFs1BvT3Cg1v2Y+Lus+9VNtqAZFBTDQQ4=; b=Salw7uwndukWdl8/cJG5ikLgUw
	C6REl2eEZ97TSgHh9bikFjquy9e1BdbnbQRVgNmu/yUfngFi9LifJSHjb7klQQxjFC2ao1mcYPDDm
	V9h08irCvmHEyymxPYlNZMjwbHIjqNnlHQV+d749uoHVDqXFv3KfzzuJxKHJxk86Y64M=;
Message-ID: <8d8b8bcc-7c59-4ea7-bafd-6469643f8aaa@xen.org>
Date: Thu, 11 Jun 2026 23:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Content-Language: en-GB
To: Hirokazu Takahashi <taka@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-2-taka@valinux.co.jp>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260610111320.133784-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,valinux.co.jp:email,xen.org:dkim,xen.org:mid,xen.org:from_mime];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B138C675A6A

Hi,

On 10/06/2026 12:13, Hirokazu Takahashi wrote:
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 9036e455d6..38bc5d5306 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,6 +1,7 @@
>   obj-y += bootfdt.init.o
>   obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
>   obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
> +obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.o
>   obj-y += device-tree.o
>   obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>   obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
> diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
> new file mode 100644
> index 0000000000..bbdf0d1fe8
> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,342 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
> + * Parse cpu topology information.
> + *
> + * Copyright (c) 2026 VA Linux Systems Japan K.K.
> + * Author: Hirokazu Takahashi <taka@valinux.co.jp>

We don't commonly have copyright header in the tree and instead use the 
commit message to keep track of Copyright. That said, if you want to 
keep it, I think you ought to keep the copyright from Linux because your 
code is based on it.

> + */
> +
> +#include <xen/cpu.h>
> +#include <xen/cpumask.h>
> +#include <xen/delay.h>
> +#include <xen/device_tree.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/numa.h>
> +#include <xen/domain_page.h>
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

Looking at the use in the other patch, you seem to unconditionally use 
cpu_topology when CONFIG_DT_CPU_TOPOLOGY. However, you don't seem to 
fill it when the system is using ACPI.

So I think this either needs to be moved to common code and filled by 
ACPI or we need to make clear in the name that this is DT specific.

[...]

> +void __init dt_init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +    const unsigned int nr_cpus = cpumask_last(&cpu_possible_map) + 1U;
> +
> +    cpu_topology = xzalloc_array(struct cpu_topology, nr_cpus);
> +    if ( !cpu_topology )
> +        panic("Failed to allocate memory for cpu_topology array\n");
> +
> +    if (parse_dt_topology())

Style: AFAICT, this is following Xen style. So it wants to be:

if ( ... )

> +        fixup_topology();
> +
> +    for_each_possible_cpu( cpu )
> +        setup_siblings_masks(cpu);
> +}
> diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
> new file mode 100644
> index 0000000000..1c03f4deaa
> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_CPU_TOPOLOGY_H
> +#define XEN_CPU_TOPOLOGY_H
> +
> +#include <xen/types.h>
> +#include <xen/device_tree.h>
> +
> +struct cpu_topology {
> +    cpumask_t thread_sibling;
> +    cpumask_t core_sibling;
> +    cpumask_t cluster_sibling;
> +};
> +
> +
> +#ifdef CONFIG_DT_CPU_TOPOLOGY
> +
> +extern struct cpu_topology *cpu_topology;
> +void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);
> +void dt_init_cpu_topology(void);
> +
> +#elif CONFIG_DEVICE_TREE_PARSE
> +
> +static inline void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node) {}
> +static inline void dt_init_cpu_topology(void) {}
> +
> +#endif /* CONFIG_DEVICE_TREE_PARSE */
> +
> +#endif /* XEN_CPU_TOPOLOGY_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

-- 
Julien Grall


