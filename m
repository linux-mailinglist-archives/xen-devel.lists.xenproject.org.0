Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPBTCfHUcWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:42:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB0629BB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210423.1522091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipKZ-0002dx-Gc; Thu, 22 Jan 2026 07:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210423.1522091; Thu, 22 Jan 2026 07:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vipKZ-0002cv-DI; Thu, 22 Jan 2026 07:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1210423;
 Thu, 22 Jan 2026 07:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vipKX-0002cp-SC
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 07:42:13 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc38d6d1-f765-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 08:42:10 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so4758705e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 23:42:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470474cbsm46588095e9.8.2026.01.21.23.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 23:42:09 -0800 (PST)
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
X-Inumbo-ID: dc38d6d1-f765-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769067730; x=1769672530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3E5sqRuBQgolxN7FI5gsTKtcwWCuLAPbpvFnWDfRTUE=;
        b=UY4udsxmaBGNbhY7GdxR7HM4/bKLp339jJfR3DDEoSwLiTRJV3yKAcbZIa12ICP10X
         fRJdlUK7TClT1giSmAoKPN10/+SUaWkxY8VqlLZb5cVAcUk/vaqCCm97pihK34hsmQL3
         JE1iPhMYx/7p3x/0EbRcA6ZMfOhqPYHovLoLvPKekDBJ25ZDUSGdaFyPahxtPTAvGhYt
         2D8NAqXX7kjNFhpbNmV3jk65JnjiFOBZA8TAD08eppAQtIzZ05fFWfc+o72hLmfWI/Cx
         h7s5UyL1WUg70q1PNNtdOAuCgKqJjg9NKxe5rvZ89//PxLhHUOTwWnL1nC5I/R97N8Rr
         sqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067730; x=1769672530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E5sqRuBQgolxN7FI5gsTKtcwWCuLAPbpvFnWDfRTUE=;
        b=lijF8l0RPfIYKl7z4HfLJkf+kQl3+MTqLO5S1K7czZqFUykcHM1Qm01vPEgi18M86u
         KOspzadaOJvQiddUkpT4OHQA0PIIIKYjzaQjhbk3Uk0/K/PPHCMRpM/FrtHiPdkxeDQM
         waxBOjrOv9rItSa9bW2TopGiwfv4Fx4K8iUknxJ+EemPjzbT22nwprl9bzxFAKnweHIj
         MNTjx373eRaIJp1wbrH/R7ri0z6BKujPiDr2QviYtpIjeh8hLmDAx5ChaVd1P5ucqH24
         +V9kt3g85fCe9XolhzAR6NLk8NRC1E/hiOXe131z3PBUp28H2B3pLxjOdRlkkDVcKNjd
         RDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzLKEfO7qViGf4KlZHreKg79S5oG3mJ7F46IQ5ZwhqzO1BvNDUVTsEX9od5EQt+zJ6gRSk2CNsQh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvnF+xBRUJFwGC1jTxS0VbgZfO8vwyABTx+jHC2JaQkR5M0lku
	SVk+7hjkfNkPYJ5ES/6mEUI0EZdE0Da6SikOrrErj/Wgsj1Fc8FqSZTPe6Tq9qq/Ow==
X-Gm-Gg: AZuq6aIEQTQ/2kjBRvi2zdi6/DloahgTxMdBGllRzC2r/qJogbqbbZuOG8HzGFYzIt5
	fBh0vNIisJRVv0/xMBsumpEXq6qOCBYRNPyol0tDXt0anNQ3rBqE5Bvpn09Onr818PJjJrcxWP+
	oALHZsJqx95vcLY33GPLmUBl9BRSL729xjgQHo8+W9yd0NMXhaCk4VBOEwbwBr7gI3m2qecrog9
	pzIHSxScD8tYAlUd3ZL2mw61/PnSwy+D/usI/GgPehUWmsAUsVDAJj9m3BraB0iLFGIpI0INdB5
	/qcLl2CT6Kd3frvnlbDazMokAJ4zIqZUDsoAZkFsO5gjy7K9rilPCMHjn48HirrpTCmLxhS7iOf
	CnEPUm8xTv3PHFHTBNp8nmGY2eFw1FB6ah9XAIN5uNdmcgcML2xnOn1IHSf66qoKOE/jg+RxqNt
	b27P2S/Oh3iQfEF0+4XiN8BUew/9iNswGMhJ0KEp/CHaLoG0wwTH50PWIwVF0pPohjtH87c0VFH
	JM=
X-Received: by 2002:a05:600c:3107:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-4801eab9e76mr257829385e9.5.1769067730120;
        Wed, 21 Jan 2026 23:42:10 -0800 (PST)
Message-ID: <313181b8-d204-4073-9726-1009644ccf8b@suse.com>
Date: Thu, 22 Jan 2026 08:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
 <07fded74c7bc375a4e77596866072b65a546f8e6.1769020872.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <07fded74c7bc375a4e77596866072b65a546f8e6.1769020872.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 88AB0629BB
X-Rspamd-Action: no action

On 21.01.2026 19:43, Oleksii Moisieiev wrote:
> This commit introduces two helper functions, `memcpy-fromio` and
> `memcpy-toio`, to provide a robust mechanism for copying data between
> standard memory and memory-mapped I/O (MMIO) space for the ARM
> architecture.

No helpers of this name are being introduced, as what's spelled out above aren't
even identifiers. Also instead of the quoting we've been trying to uniformly
identify functions in descriptions by adding parentheses: memcpy_fromio(). Plus,
nit: Please don't use "This commit ..." or alike in descriptions.

> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -10,6 +10,7 @@ endif
>  obj-y += firmware/
>  obj-$(CONFIG_TEE) += tee/
>  obj-$(CONFIG_HAS_VPCI) += vpci.o
> +obj-y += lib/

Yes, sorting in this section was already screwed. But why make the problem worse?

> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -2,6 +2,7 @@
>  # arm-specific definitions
>  
>  ARCH_LIBS-y += arch/arm/$(ARCH)/lib/lib.a
> +ALL_LIBS-y += arch/arm/lib/lib.a

Conceivable generic helpers of the same names could be introduced. In that case
this choice of yours would lead to them being used, instead of the Arm ones. IOW
I think you want to add to ARCH_LIBS here.

> --- /dev/null
> +++ b/xen/arch/arm/lib/memcpy-fromio.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/io.h>
> +#include <xen/lib/io.h>

Preferably the other way around, and with a blank line between them. (But see below
as to the header being generic; if it wasn't, this remark wouldn't apply anymore.)

> --- /dev/null
> +++ b/xen/include/xen/lib/io.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic I/O memory copy function prototypes.
> + *
> + * These functions provide low-level implementation for copying data between
> + * regular memory and I/O memory regions. Each architecture must provide its
> + * own implementation based on the specific requirements of the architecture's
> + * memory model and I/O access patterns. An architecture may supply these as
> + * functions or as macros in its own headers before including this file.
> + *
> + * Architecture-specific implementations:
> + * =====================================
> + * Each architecture should implement these functions in xen/lib/<arch>/io.c
> + * (or define them as macros) based on their hardware requirements. See
> + * xen/lib/arm/io.c for an example using explicit I/O accessors.
> + */

The file name referenced is unhelpful and actually wrong for the Arm functions
you add here.

> +#ifndef _XEN_LIB_IO_H
> +#define _XEN_LIB_IO_H
> +
> +#include <xen/types.h>
> +
> +/*
> + * memcpy_fromio - Copy data from I/O memory space to regular memory
> + * @to: Destination buffer in regular memory
> + * @from: Source address in I/O memory space (must be marked __iomem)
> + * @count: Number of bytes to copy
> + *
> + * This function handles copying from memory-mapped I/O regions using
> + * architecture-appropriate I/O accessor functions (e.g. readb/readl on Arm)
> + * that already impose the required ordering for device accesses. Typical
> + * implementations may:
> + * - Handle leading/trailing unaligned bytes with 8-bit accesses

This is either imprecise, or the implementation is wrong: From context, this
ought to be talking solely of the MMIO side of the operation. Yet if src and
dst are misaligned with one another, you'd do the entire operation in 8-bit
chunks. For devices requiring aligned 32-bit accesses that won't work at all.

> + * - Use the widest safe aligned access size supported by the target (often
> + *   32-bit on Arm where 64-bit MMIO may not be atomic)
> + * - Rely on MMIO accessors to provide the needed barriers
> + *
> + * Limitations:
> + * - Only suitable for devices that tolerate 8-bit and 32-bit accesses; it is
> + *   not valid for devices that require strictly 16-bit or 64-bit access sizes.
> + * - Callers must ensure the target MMIO region is mapped with appropriate
> + *   device attributes.
> + */

The description is now valid for the Arm implementation you supply, but the
header we're in is a generic one. Imo, generic constraints should be reduced
as much as possible, like dealing with leading / trailing sub-32-bit items
by doing at most one 8-bit access followed by at most one 16-bit one (the
other way around for the trailing part). Or else the header should be Arm-
only as well (more strict constraints on Arm would make these functions
potentially unusable from generic code, after all).

Along these lines, "device attributes" is Arm terminology, aiui.

Also, if indeed a generic header, why xen/lib/io.h and not xen/io.h (which
already exists)?

Jan

