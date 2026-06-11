Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRGAOd3AKmr0wAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:06:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED5672901
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:06:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=WZz3Y2Ph;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335586.1597775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXg2q-0006zo-2v; Thu, 11 Jun 2026 14:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335586.1597775; Thu, 11 Jun 2026 14:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXg2p-0006xM-WE; Thu, 11 Jun 2026 14:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1335586;
 Thu, 11 Jun 2026 14:06:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXg2p-0006xG-0Y
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:06:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXg2o-00D42t-Cc
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:06:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac0c8-bab6-0a2a0a5309dd-0a2a4501dcc0-30
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:06:06 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac0cd-c1f2-0a2a45010019-d1558035e95b-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:06:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so44904195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:06:05 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm81282110f8f.20.2026.06.11.07.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:06:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1781186765; x=1781791565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LI4nS8srKhuYqm7gnQBScxw87fY4Y5TJ3oOg//bJqSo=;
        b=WZz3Y2PhMzQRVIEdmVuZJ1dgCn67lQRxWmzTdwaLhmc1u7c69rM+cSkA9KRfEj2bxC
         W+UbYX2B6GNTPIhTBnjiCaBACvMJaGixpY9nFP/duIauxX+CBaJjb2+zEFeTnKuNwa3c
         3n2b/o1Sm80ob1GtH+To09efb8NiWpDJHoOGswY5eDppm8krEDohT9tSXuuqK6XjjTSf
         MK+1fFMnQzD16/G2WT12qbVqHosikJ3V3j37dmQ0oKSZGJSf6SPFPueqpNwVHm2yK4Rx
         rCdJ3X6yXvEN23DrheslG5Yntn7M2/73Y/KFmlldParZqPVk4cX/GprCRj7qaY/59kQj
         DkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186765; x=1781791565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI4nS8srKhuYqm7gnQBScxw87fY4Y5TJ3oOg//bJqSo=;
        b=f9X189Suc1wCAI1vecR1liARRjMQuBXmXQVMWdCOMy4MmN8r5yU+ciGetlG3cdpVlr
         GNoNVp2aUEWGqwHTRzu3ELmDcNk1NXqzszct+WnT/k1BpOh39royhpS7kVLV5G38TeXf
         zz25+4ISrL0jgQDZFCbG9yWahI1EuEgnIU8gZ3KtQXYNOkaJ5wxw+0/5v7alfMRK7ZEf
         wvSQxKeBY36LcsONGRC86Dznl82Pl/8CssNMayvww6nCga98xhkt/V74qAnH4ML2wjsJ
         nUqTtSmsxndDHTqNRN1nwqzfm7LmEwKGrRPrN6dRialcwYyB6Yf5wFvSdVzT4Q6zBFuU
         oKag==
X-Forwarded-Encrypted: i=1; AFNElJ/NxIDrh6WSUtKNnm4saxFIWqevGy4ui0cZRvdpSDZect5GA/ude3vhYOqzZOG97c0kUarfbxPW+OI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLrzSGQymDKgn0uPFnpXQJPWkWfvT7R8Re5mTUA87oo2P8/X0K
	jUbVTmU+BvnyxSSotOP04jwMK+9T9EkCTUynmfqhTkj2PSrZX1BrUIsDKtBlGHLg/A==
X-Gm-Gg: Acq92OF38W8F2JDw9YrjsvEfz/g+vUoGJRcql97y43YLsE41xOvnaSi7S/ppQHBDI4q
	hXSUZs0bMf7Dgd1nEkciiHaDXIPtGc0tGy1+gxCuv8EI1OQChuD+mYZ9ZdrJy/FIXuAkKEB1jCs
	qxCYs0D3F3LT1OwMuZrOZPW5IQbRW3LhPRzBUDF/1jS/T8sqzT7SjQGyIFL+4135z36AFqMfTrO
	rvIsfkru48X5m7t6t6mutCf6kp6SxY95iQORn7uLYixWF/5AjYB3XqjFr1XEZxCgThpoHN5P+tf
	ZR8PuqAnA6TRoEAxaPpwWXQJMEjwjhOHl2c2N3XDNX/G6ShvPms/v9YZkgCbpT5Z8cpcqq6m+F7
	UXEaN52xNTFRmeiFamEqAFYJfS9G8MUywNxN4SVnYbkRReyNPLLCLY1tdATZITz9jIFxkmhQmwJ
	MudoC/cT+ZWRNHb3ArAVFJ96i8PjQKNVauYbGa54zcl/GE+4rfxnBmWDRrgA/klHbfVxgp9CJHF
	YHDeMeZRk9xmyyCAulfpn9FmDJhckfOZuUufjflp18LIy9Sr7Xr8KIJmwXK3r9dqXGWd3eP4qKM
	pwIYQw==
X-Received: by 2002:a05:600c:1d12:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490e55ef48fmr37069365e9.15.1781186765335;
        Thu, 11 Jun 2026 07:06:05 -0700 (PDT)
Message-ID: <25065ffe-4bfa-450d-87ff-982ec37a77b3@suse.com>
Date: Thu, 11 Jun 2026 16:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
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
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-2-taka@valinux.co.jp>
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
In-Reply-To: <20260610111320.133784-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781186765-AEB5EFF4-09E900DE/0/0
X-purgate-type: clean
X-purgate-size: 898
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50ED5672901

On 10.06.2026 13:13, Hirokazu Takahashi wrote:
> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h

The name of the new file does not in any way ...

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

... express this is all about DT stuff. Is this intentional? Else it
may want adjusting.

> +#elif CONFIG_DEVICE_TREE_PARSE

DYM "#elif defined(CONFIG_DEVICE_TREE_PARSE)"?

Jan

