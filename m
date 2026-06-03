Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rOqTKz3oH2rWsAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:39:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD5635C74
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CwrjiMQu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325883.1591237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUh7o-0008NC-O2; Wed, 03 Jun 2026 08:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325883.1591237; Wed, 03 Jun 2026 08:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUh7o-0008Lp-L3; Wed, 03 Jun 2026 08:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1325883;
 Wed, 03 Jun 2026 08:38:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUh7n-0008Lj-LM
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:38:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUh7n-002NYA-0q
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:38:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fe812-5cb7-0a2a0a5109dd-0a2a4508cddc-34
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:38:54 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fe81e-63b5-0a2a45080019-d1558035ad8e-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:38:54 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15209655e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:38:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b60f6d5asm44650635e9.0.2026.06.03.01.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:38:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1780475934; x=1781080734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hcCK9JJnC51v61UA8MHMucGSOJehRnTT/byGsq/Cb3s=;
        b=CwrjiMQuQsmcKy6SHG/7WifmFoK9eFJlV/fVcfHSiBJLSMB+nxBz/vT3SOY7j34lYk
         nST78JSQzcMAuqNHXkzM7z+1t+Ys40g7OCL230LjEpGgDEHVu3QnRzzRs7utQ1xeSgGK
         n3qpfbmKt0yv3T2s3BBY9Hz/G+ZPFiNr/Hf92oU8e3RtltbJn8kX3rnj/RijDktaOwrx
         9kuZ5TqvRCZbsLDYqMU5HK2sIl7MlL7VyTfk7Bu65Lx+VLQ+tJ/FgnppEtTCBT9+XdMb
         1K6WWbCMj7f9HNzs0SCWM64MTr9ZCtPkPmIMSMZNGW64teY0AXk4zc15nCVMChhu54vd
         KBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475934; x=1781080734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcCK9JJnC51v61UA8MHMucGSOJehRnTT/byGsq/Cb3s=;
        b=HSpWp0fprE1vX7Kpg08XOkawFRWcvodODrFZ6kii2sRaIgvYJLJdga/emnbscrWN2U
         j0/eSqywec2p96EO/sDiWoZN0gMNm30qJbYyXMbZy6kK9mzE1xnjaL4+h/bYLObzSA+i
         +VFiKolHgd2CzksDDydTjvU4K2sLyVBdPL1icJf3ts6c/5YlQmWblDbxEqQ9DPOnmr4B
         6rKvE9+XDBzlewqVEECsIF+H0qRrIG9t3stVhc7bIWCkeg5lFTpkzBW/kSRzetJHUcK0
         MKBhzjhhmgHmPZRln8LKTZXg8KvqfhPexRfF+twioETg/xJN6Vkdm/dbrkoSH7P5I35Q
         vekQ==
X-Forwarded-Encrypted: i=1; AFNElJ8heaixilWxds7ANKqN30B2TUIpQZGVBme/+cLIQkGmDNE6KaKEMcnXRAGMi6L++zGx5WJfHkG8O88=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/+QowVTC2ubyqKn8Ju7ZvvubBFFQrqgNAuZe3n8D1iWH0DGnc
	AVIOJZ4JCiEhofIeWhH8T8VfhFznFco83VMu0KudL1ozD3/TkI47taMYuMCCGC+C6g==
X-Gm-Gg: Acq92OG1z6V8okml5LL2DcRvzbLzmMp+GzWoBVz2kodvODaLzz2TR2ioc/KPNNLiuS1
	U01H5jg/7iLwJUu4GhJHe6XPtsc4EKKiAi2Uiaa1K2LTrJZlxnRbL473TOhgOd64R4n6VNBDY/a
	kN9ucppSjcfC/c4QQon7wu1d+nIUcZolfvtOlyoHcbCSzy+sOu6gfd8yqe3XXfWiXNoJexzR7it
	fvQMIo/moyILOrfhrTYZjw3347Madrj75M9E6A11Ea9kIf662O+97j3u48CkZ2SR+VPdSYcaa6l
	2knGHqs65xcbJ9R4T3v4MeiJx6hdDjL9IP4gYSX+xW29bgmKtX8iUwO7bq3luwFVaLfOFJdFivu
	5OPfaBihMj/zAePWtYPCJAzrz2s69OSPEirpYQP/fLSoU7NxcHHWPZoV0WTw7rwjuu5gwZdYiGA
	kWiF75Qp1M/YqjYiiNXz1OnO32FgCs0bs3+E9By2ZnRU2kPAhvItTVZ64FETKTVHTkDnzm06sUj
	sp7WbKY48qh3A3zBHdX5gMlfQ==
X-Received: by 2002:a05:600c:a09:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-490b5fe6672mr37024155e9.27.1780475934335;
        Wed, 03 Jun 2026 01:38:54 -0700 (PDT)
Message-ID: <2b1df2c6-ccbb-402c-b65a-7f3beefdeb0d@suse.com>
Date: Wed, 3 Jun 2026 10:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 4/5] tests/numa: add unit tests for NUMA setup
 logic
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-5-roger.pau@citrix.com>
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
In-Reply-To: <20260601154332.30797-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780475934-BFD7BDB1-E80332EF/0/0
X-purgate-type: clean
X-purgate-size: 3790
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01BD5635C74

On 01.06.2026 17:43, Roger Pau Monne wrote:
> --- /dev/null
> +++ b/tools/tests/numa/.gitignore
> @@ -0,0 +1,2 @@
> +/numa.h
> +/test-numa

Why the leading slashes?

> --- /dev/null
> +++ b/tools/tests/numa/Makefile
> @@ -0,0 +1,47 @@
> +XEN_ROOT=$(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGETS := test-numa
> +
> +.PHONY: all
> +all: $(TARGETS)
> +
> +.PHONY: run
> +run: $(TARGETS)
> +ifeq ($(CC),$(HOSTCC))
> +	set -e;             \
> +	for test in $? ; do \
> +		./$$test ;  \
> +	done
> +else
> +	$(warning HOSTCC != CC, will not run test)
> +endif
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -- *.o $(TARGETS) $(DEPS_RM) numa.h
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~

I see we remove *~ elsewhere, but not everywhere. I don't, however, know
why we have that, and hence I wonder whether it really wants replicating.

> --- /dev/null
> +++ b/tools/tests/numa/harness.h
> @@ -0,0 +1,184 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for NUMA setup.
> + *
> + * Copyright (C) 2026 Cloud Software Group
> + */
> +
> +#ifndef _TEST_HARNESS_
> +#define _TEST_HARNESS_
> +
> +#include <assert.h>
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <xen-tools/bitops.h>
> +#include <xen-tools/common-macros.h>
> +
> +#define CONFIG_DEBUG
> +#define CONFIG_NUMA
> +#define CONFIG_NR_NUMA_NODES 64
> +#define NR_CPUS 256
> +#define MAX_RANGES 128
> +#define PADDR_BITS 52
> +
> +#define __init
> +#define __initdata
> +#define __ro_after_init
> +#define __read_mostly
> +
> +#define printk printf
> +#define XENLOG_INFO ""
> +#define XENLOG_DEBUG ""
> +#define XENLOG_WARNING ""
> +#define KERN_INFO ""
> +#define KERN_ERR ""
> +#define KERN_WARNING ""
> +#define KERN_DEBUG ""
> +
> +#define PAGE_SHIFT    12
> +/* Some libcs define PAGE_SIZE in limits.h. */
> +#undef  PAGE_SIZE
> +#define PAGE_SIZE     (1L << PAGE_SHIFT)
> +#define MAX_ORDER     18 /* 2 * PAGETABLE_ORDER (9) */
> +
> +#define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
> +#define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
> +
> +#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> +#define mfn_to_pdx(mfn)   (mfn)
> +#define paddr_to_pdx(pa)  ((pa) >> PAGE_SHIFT)
> +#define mfn_to_maddr(mfn) ((mfn) << PAGE_SHIFT)
> +
> +#define ASSERT assert
> +#define ASSERT_UNREACHABLE() assert(0)
> +
> +/* For the purposes of the testing assume arch NID == Xen NID. */
> +#define numa_node_to_arch_nid(n) (n)
> +
> +typedef uint64_t paddr_t;
> +#define PRIpaddr "016" PRIx64
> +
> +typedef unsigned long mfn_t;
> +typedef uint8_t nodeid_t;
> +
> +#define __set_bit set_bit
> +#define __clear_bit clear_bit
> +
> +static inline unsigned int find_next_bit(
> +    const unsigned long *addr, unsigned int size, unsigned int off)
> +{
> +    unsigned int i;
> +
> +    ASSERT(size <= BITS_PER_LONG);
> +
> +    for ( i = off; i < size; i++ )
> +        if ( !!(*addr & (1UL << i)) )

Why the !! ?

> +            return i;
> +
> +    return size;
> +}
> +
> +#define find_first_bit(b, s) find_next_bit(b, s, 0)
> +
> +/* Minimal cpumask support. */
> +typedef struct cpumask{ DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
> +
> +#define cpumask_clear_cpu(c, m) clear_bit((c), (m)->bits)
> +
> +/* Define the nodemask helpers used. */
> +typedef struct nodemask{ DECLARE_BITMAP(bits, CONFIG_NR_NUMA_NODES); } nodemask_t;
> +
> +#define node_set(node, dst) set_bit((node), (dst).bits)

To aid readability, omit the parentheses around "node"? (More similar cases
further down.)

Jan

