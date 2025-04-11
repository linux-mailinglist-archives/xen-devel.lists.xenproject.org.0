Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E24A85660
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946853.1344612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39dS-00077l-GE; Fri, 11 Apr 2025 08:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946853.1344612; Fri, 11 Apr 2025 08:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39dS-000766-Ct; Fri, 11 Apr 2025 08:21:14 +0000
Received: by outflank-mailman (input) for mailman id 946853;
 Fri, 11 Apr 2025 08:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39dQ-000760-WA
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:21:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecb29828-16ad-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 10:21:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso957126f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 01:21:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43ccd8sm1297359f8f.72.2025.04.11.01.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 01:21:09 -0700 (PDT)
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
X-Inumbo-ID: ecb29828-16ad-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744359670; x=1744964470; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HTa5Tz0DVW+yp3GjEe24whpKtlpabTknBPKg9yHpb00=;
        b=XqjWbZQzfx8z4kcUDW/v3g6Sn4M08uiB4LfNRW+PXo8IV1UJqRVOIoSQZY6Nlu8nti
         jzB3vrN2RQCz0XQQjd9qnnIeQmg3nMzTKupRgIEgiVhiBiaVJSLWj5KW6oEtc509uj1H
         7siLYhKfnRYJYv6nvRhH3nB+iYJPU81fHaSpRysUoo3P7GS71xBUDv1/x+cLwB8GjDpf
         Wz2bTDP7Cp84/G6mgCYOAwKbwhIEn95RMLAwq2whtAuEXoBxDeAPTLxTKPAyFWhgtgwC
         WS+8yIRNiOFxk7NQWqDTmp0etkap+3ihXJlGxo7wn59cmJEJx132N8XOVSDEGl21X7bn
         wazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359670; x=1744964470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTa5Tz0DVW+yp3GjEe24whpKtlpabTknBPKg9yHpb00=;
        b=bgZiwAaX2ClEl7DbHGo5i1rhu1YAPb0BXDR25qQZ6c3UDedXXw/N25YA8zTvxY528V
         KahGK2woWhiWsoClk1C/1HzsH0uWwuusq9x6CH6os7F9wk5XxngYMjBRM+ylfZ4B+FIQ
         eaPdrlz1dMVlCLfMriktjeBOY/gkeU9Wg8pnsgplLvoA3lmKcs/e7NAK0fWjfj3PgMc8
         m1X58FhgmF1yOCpI3Tg7X6FCgEMInq7xeY+ZObi1zqCtvsYE/SSn5yUBTlwtK6wrFabh
         g32yuOUMZqQIf7+4zjK+aMdWx9n3JU5jMJSghGjLNFPQsqCYks2Ydxwd/+RhuJQZnV+y
         dUnw==
X-Forwarded-Encrypted: i=1; AJvYcCW8TzC28YgoRb9RxxxBf/tsAmhRs3tN2CJH9jfrtRSHplT+2k3gSFX6KD5/FG0260xVO+y3v8XFFFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybOpgFS4MnucYaKWayh2S4PBedZg5cCg3sYlW53LdSmEzWN55d
	uX7l2TMvekTrvBLmWFR8mEl7/FnyRGZTUax4gs1lmTxG36/viXpkYnqsHHTifqosYpUdSNtMZ70
	=
X-Gm-Gg: ASbGnctq4TDzGvRCAmQBVKSpz6HsS4dp3tFsEj/MPgibRykB4PaZLXOD8jLZaWWGf+v
	yWezJeiAAbHWMzR7emyNQ0gdF0Pqx0nYTjJQ2dL8Z3bZI59Yj2ywJO5ou5eHabEkXFhFBKLxLxP
	wAk+dnr9+KCP0PyikQxF3ba5iYW+R/gZVjZMib6Vwm4h55+F0rv0ZKGiV+i5muyw0ywFdhodTcY
	hxPPdwZ0vnsaO27BH/75Nq27h3lPhkVlLHbw8OjgeaJvzr3WP2lTBkhWrJPptCyPbf7RWlHPOyE
	OCdi7s/NAUEnQP88EJuz7vs/6BCurCg/nTlBLK6Xv79uKZPZfocoLCj8+MJy5rRsKypBO4xPgDv
	IttB4sWaDwCOWmSRMR/Wr7sgdC/rHHgMZpDCc
X-Google-Smtp-Source: AGHT+IHher3K5o/H6fs42KJ73smWN2DNBwkI4PqIaS+r5FlTzI9d4vPpKDOxhB4q6lBJiY8T5o/trA==
X-Received: by 2002:a05:6000:40d9:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39ea5214ecdmr1342562f8f.32.1744359670114;
        Fri, 11 Apr 2025 01:21:10 -0700 (PDT)
Message-ID: <964624cb-2b21-4228-8774-2fd697ae13e6@suse.com>
Date: Fri, 11 Apr 2025 10:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tootls/tests: introduce unit tests for rangesets
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250411075502.19926-1-roger.pau@citrix.com>
 <20250411075502.19926-3-roger.pau@citrix.com>
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
In-Reply-To: <20250411075502.19926-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2025 09:55, Roger Pau Monne wrote:
> Introduce some basic infrastructure for doing rangeset unit tests, and add
> a few tests that ensure correctness of rangeset subtraction.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

It's okay as is, so:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Nevertheless a couple of remarks.

> --- /dev/null
> +++ b/tools/tests/rangeset/Makefile
> @@ -0,0 +1,45 @@
> +XEN_ROOT=$(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET := test-rangeset
> +
> +.PHONY: all
> +all: $(TARGET)
> +
> +.PHONY: run
> +run: $(TARGET)
> +	./$<
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -- *.o $(TARGET) $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~
> +
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET))
> +
> +list.h: $(XEN_ROOT)/xen/include/xen/list.h
> +rangeset.h: $(XEN_ROOT)/xen/include/xen/rangeset.h
> +list.h rangeset.h:
> +	sed -e '/#include/d' <$< >$@
> +
> +rangeset.c: $(XEN_ROOT)/xen/common/rangeset.c list.h rangeset.h
> +	# Remove includes and add the test harness header
> +	sed -e '/#include/d' -e '1s/^/#include "harness.h"/' <$< >$@
> +
> +CFLAGS  += -D__XEN_TOOLS__
> +CFLAGS  += $(APPEND_CFLAGS)
> +CFLAGS += $(CFLAGS_xeninclude)
> +LDFLAGS += $(APPEND_LDFLAGS)

The mix of padding ahead of the += is a little odd here.

> --- /dev/null
> +++ b/tools/tests/rangeset/harness.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for rangesets.
> + *
> + * Copyright (C) 2025 Cloud Software Group
> + */
> +
> +#ifndef _TEST_HARNESS_
> +#define _TEST_HARNESS_
> +
> +#include <assert.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <xen-tools/common-macros.h>
> +
> +#define smp_wmb()
> +#define __must_check __attribute__((__warn_unused_result__))
> +#define cf_check
> +
> +#define BUG_ON(x) assert(!(x))
> +#define ASSERT(x) assert(x)
> +
> +#include "list.h"
> +#include "rangeset.h"
> +
> +typedef bool rwlock_t;
> +typedef bool spinlock_t;

Are spinlocks really required for the rangeset code?

> --- /dev/null
> +++ b/tools/tests/rangeset/test-rangeset.c
> @@ -0,0 +1,228 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Unit tests for rangesets.
> + *
> + * Copyright (C) 2025 Cloud Software Group
> + */
> +
> +#include "harness.h"
> +
> +struct range {
> +    unsigned long start, end;
> +};
> +
> +struct action {
> +    enum {
> +        ADD,
> +        REMOVE,
> +    } action;
> +    struct range r;
> +};
> +
> +#define DECLARE_ACTIONS(nr) static const struct action actions ## nr []
> +#define DECLARE_RESULTS(nr) static const struct range results ## nr []
> +
> +/*
> + * Subtract range with tail overlap on existing range:
> + *
> + * { 0, 1, 4, 5 } - { 3, 4 } = { 0, 1, 5, 5 }
> + */
> +DECLARE_ACTIONS(0) = {
> +    { ADD,    { 0, 1 } },
> +    { ADD,    { 4, 5 } },
> +    { REMOVE, { 3, 4 } },
> +};
> +DECLARE_RESULTS(0) = {
> +    { 0, 1 }, { 5, 5 },
> +};
> +
> +/*
> + * Subtract range with complete and tail overlap on existing ranges:
> + *
> + * { 0, 1, 4, 5, 7, 8 } - { 3, 4, 5, 6, 7 } = { 0, 1, 8 }
> + */
> +DECLARE_ACTIONS(1) = {
> +    { ADD,    { 0, 1 } },
> +    { ADD,    { 4, 5 } },
> +    { ADD,    { 7, 8 } },
> +    { REMOVE, { 3, 7 } },
> +};
> +DECLARE_RESULTS(1) = {
> +    { 0, 1 }, { 8, 8 },
> +};
> +
> +/*
> + * Subtract range with no overlap:
> + *
> + * { 0, 1, 4, 5 } - { 2, 3 } = { 0, 1, 4, 5 }
> + */
> +DECLARE_ACTIONS(2) = {
> +    { ADD,    { 0, 1 } },
> +    { ADD,    { 4, 5 } },
> +    { REMOVE, { 2, 3 } },
> +};
> +DECLARE_RESULTS(2) = {
> +    { 0, 1 }, { 4, 5 },
> +};
> +
> +/*
> + * Subtract range with partial overlap on two existing ranges:
> + *
> + * { 0, 1, 4, 5 } - { 1, 4 } = { 0, 5 }
> + */
> +DECLARE_ACTIONS(3) = {
> +    { ADD,    { 0, 1 } },
> +    { ADD,    { 4, 5 } },
> +    { REMOVE, { 1, 4 } },
> +};
> +DECLARE_RESULTS(3) = {
> +    { 0, 0 }, { 5, 5 },
> +};
> +
> +static const struct test {
> +    unsigned int nr_actions, nr_results;
> +    const struct action *actions;
> +    const struct range *result;
> +} tests[] = {
> +#define DECLARE_TEST(nr)                                \
> +    {                                                   \
> +        .actions = actions ## nr,                       \
> +        .nr_actions = ARRAY_SIZE(actions ## nr),        \
> +        .result  = results ## nr,                       \
> +        .nr_results = ARRAY_SIZE(results ## nr),        \
> +    }
> +
> +    DECLARE_TEST(0),
> +    DECLARE_TEST(1),
> +    DECLARE_TEST(2),
> +    DECLARE_TEST(3),
> +
> +#undef DECLARE_TEST
> +};
> +
> +static int print_range(unsigned long s, unsigned long e, void *data)
> +{
> +    printf("[%ld, %ld]\n", s, e);
> +
> +    return 0;
> +}
> +
> +static int count_ranges(unsigned long s, unsigned long e, void *data)
> +{
> +    unsigned int *nr = data;
> +
> +    ++*nr;
> +    return 0;
> +}
> +
> +const struct range *expected;

static?

Jan

