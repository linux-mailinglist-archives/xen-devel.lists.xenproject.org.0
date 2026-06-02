Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKD6AE6mHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:45:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E4762BCC9
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324671.1590158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULgp-00075u-7O; Tue, 02 Jun 2026 09:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324671.1590158; Tue, 02 Jun 2026 09:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULgp-00073P-4m; Tue, 02 Jun 2026 09:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1324671;
 Tue, 02 Jun 2026 09:45:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wULgo-00073J-Bm
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:45:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULgn-00Gal8-Aa
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:45:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea63c-2eae-0a2a0a5409dd-0a2a45049e12-24
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:45:37 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea640-1dec-0a2a45040019-d1558034add3-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:45:37 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso4510285e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:45:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e3431bsm52062725e9.12.2026.06.02.02.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 02:45:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1780393536; x=1780998336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZesFV1engGc0t0pdIvh2bGcIppoqz7QIc50yeD6y2Q=;
        b=Qf3okVinHR57AO1xLdWbpG7OPIydb6nyBEz7SgtqcN5atjf7wzLDlPktK5hWq6xT49
         1cE6gejCql2d55aM+8dzOqfZzVqhi/SAQkA1jg26RAzfwHmlZsn4GL2ELs+fHuX3lWvs
         opdYKhWwFJST5p19Qicy+LeRFDpFZO+GlfFrXZqJ6OPJvxH8tEax6jw9cVEy+nSn6Z+v
         MHA001fhMb1GnMsicPLjs4jOKeZ9QndhYfX/4PZwBnzmc/oD9xTQbsh6mrPc/kadW3kN
         z7R+Cd0bbNk8HCTR5U5Pgndd33zbQAk3mdQK6p7ZtA7zuaClDtqVp0lsCIerbCKw9FkL
         JaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393536; x=1780998336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZesFV1engGc0t0pdIvh2bGcIppoqz7QIc50yeD6y2Q=;
        b=LICzCKsV/Bprw1JWKqPJRrHQIbGePaJpLPFQfG1F7EtfuG4xVZP25b9EveJQQ+0S4Y
         9QHPU6h/e10ozMafcmc8S/4l0qOnxYYkIk2Oafh3SBZI+LZE8bFpDXfYXHsKPrJnTjbg
         EBfGHtYP8eIFa/25KKFMMK4O6paevZq0wGZgQ+Cg8wKMe8Ircvy4NSfOp0O78Cw8vMin
         vzLqkaFg9RTRqgyI2nDSFmS+mJh4ufrQAhzK5FEPRTrX4u1nilIv7EcIgcnCHq98pwBW
         aZ8e9m+/wTk2xsll2qG5CgZaut8lN7EVgLapNq24sf5vFOL5j1XL+eUV3+zSbZV465k5
         XC0w==
X-Forwarded-Encrypted: i=1; AFNElJ+e2O4wC9Bc/zeNCTvbiRXW/ei4UeVaASJwactD+LUrWwZ0oQEP2ENTcNjnYmevKWeFWPtVtgz+a9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPy4/fSHDJmJPun4DVYWEWizTrYLy1F47RvoOkQqeoGg6bxl+I
	DjO0QsCmQcpfP1uWuAv79c6URZbzD6WV6hIvPsmRdiqQ5/sq5zv7qJCDWJhwFb38pA==
X-Gm-Gg: Acq92OHy4DGpUvwWaXMjmwCwfbEq1XuJ2K2sCAqrTgDACaM9aZuQhEastfuZQuiLHVY
	o5UfNXVDDetUr6Wl9SD6Lhk8ZQblNo/74IuFnRwmAgNW+dLceOTAjjiWvC+5J1ahIUgYqzkpJCv
	JHt+kDUZ3GW2iBaV/eaY7vNWLNbArfs9THqo+Hg2/N9xO5QgTJe+4/Y7THvhlZ8X+QqTlT5Va1E
	8jtYbNT8GhFf691QVKBSIbRWMQCzrsLQ/APblhhQ39Kr6K3icYmjXOMxkszTkPkZ0IwkY9Y4jKv
	IpGQ265JUP5w9ezG/qxm6I38fLt2YtDgD2+mByoKvluKSSTI1449Q5GY7OPFIoCTM4su2YPZwAj
	ofo1cIY3Kfw8DxJ4ha165mJVTKckxBQWHrd1umI189LM20pWH3DygHti0FDCYjUZuTINbolFyuI
	PoYDjUwFgcJomr3Yvt/qynjYW0t5mOuzcGqCzNQZMnyRQJUqDv1mGp4Y7z63ICPtvMxaqJKm00P
	HCs7gQ/aMbYW/8lcEqCHr3vrw==
X-Received: by 2002:a05:600d:844a:10b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490a294935bmr202300875e9.22.1780393536576;
        Tue, 02 Jun 2026 02:45:36 -0700 (PDT)
Message-ID: <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
Date: Tue, 2 Jun 2026 11:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
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
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
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
In-Reply-To: <20260531224755.9481-8-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780393537-28D743FF-5EE5A2EE/0/0
X-purgate-type: clean
X-purgate-size: 1194
X-Rspamd-Queue-Id: 66E4762BCC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 01.06.2026 00:47, Hirokazu Takahashi wrote:
> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_CPU_TOPOLOGY_H
> +#define XEN_CPU_TOPOLOGY_H
> +
> +#include <xen/types.h>
> +#include <xen/device_tree.h>
> +
> +struct cpu_topology {
> +    int thread_id;
> +    int core_id;
> +    int cluster_id;
> +    int package_id;

Can any of these go negative? If not, "unsigned int" please. Iirc I said the
same elsewhere on v1. Please apply such comments throughout the series.

> +    cpumask_t thread_sibling;
> +    cpumask_t core_sibling;
> +    cpumask_t cluster_sibling;
> +};
> +
> +
> +#ifdef CONFIG_DT_CPU_TOPOLOGY
> +extern struct cpu_topology cpu_topology[NR_CPUS];

If at all possible, no new NR_CPUS dimensioned arrays please.

> +void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node);
> +void dt_init_cpu_topology(void);
> +
> +#elif CONFIG_DEVICE_TREE_PARSE
> +
> +static inline void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node) {}

No new uses of u32 please. As to use of fixed-width type, please see
./CODING_STYLE.

Jan

