Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD0AAEF55C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029495.1403248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYRs-0000AT-Ls; Tue, 01 Jul 2025 10:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029495.1403248; Tue, 01 Jul 2025 10:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYRs-00007L-Ib; Tue, 01 Jul 2025 10:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1029495;
 Tue, 01 Jul 2025 10:42:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWYRr-00007A-R1
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:42:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f82ab6e-5668-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 12:42:45 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so4079262f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 03:42:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541d23fsm11677206b3a.59.2025.07.01.03.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 03:42:44 -0700 (PDT)
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
X-Inumbo-ID: 1f82ab6e-5668-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751366565; x=1751971365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TAhja6YMWJivWv2HGOVzJolKcyisYA5Kof8C+w8zDzE=;
        b=L7gqbkkDri/hCOgsFWRPh20ONtV9iIFLxwg910JB6rhOWjBA+Xrkj6aTk1ItoCm2l9
         C4JwGFcgyeLmpVwQoqWetcMy6zAwUrzGkSsvwzodmpwORqpAkuR8eiXQaT341Xhgtk+J
         f1GBC7/UygrJnVsfJb/qIs+B1P2fQcIp6EhOQObnoXu+gdaPK2xeltYWOtNTtheNGWPB
         FNdcZLtDaWXBVDdhsTdFk14h9sz9Het9AUs/KVzVc5BX+YxyzXf+iNiNp5dsf+UI6u6n
         BuGvVJexjbhqtbSYmQ53VoFSiWaUC98MQErtw6V+0kQtAqMOFOqFdAvahWQDF0KXgjQ5
         vsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366565; x=1751971365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAhja6YMWJivWv2HGOVzJolKcyisYA5Kof8C+w8zDzE=;
        b=vYorokuZyZlTTl7RXIfbQPCuZYs5BG6FpkjQTQHVbRy45Eldy/fXe25XxAM6u5V5Kp
         owokVUb9bQ4uisCZxlhx3sld/2dijZ6IU/xO2qpWgYRPKp3/xIcA0hC+l9X8BovmwnJ3
         N0VD2C+qKVctdLl1hIfMUem9km5D1qnZtZwTNOR3GQwuO970ysnXBbk39An03pL9S0FW
         zjjqJqfOnH+jXhWaygy62efXrvhlRe36Xm97LTjwac4W1jkheIVWIAWRu2m6pyVNXyMW
         +G23yy2J5q10RCP7hkB866cs4kCt8e0II4gJeWKjOXthP3/B3SHW/KwJY+LF/DzKAbTc
         jeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Pp+YdoKViIw2SDrYdYBbbw50zNJbGste40LE5p7H4BIH4Vro1HiV3nemF4Zzg6zhy7W8NIo4h04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrvbrFvbfZ0//FHZXhaqUNYQg5gCtPciAUofa6WYBuPEqdORGp
	flOCDFQMJBrqkEHLSoKrk1zj5dAtkma3ZzwwvJQK35NBXAeQOec8+il7uvsc8NFqVQ==
X-Gm-Gg: ASbGncu1Ytb5QBbutLg+w6KAiEmlXUOF54hjJTbBoxL8d8N5PhqUb548cvqr0UFTqGn
	zeNJAW3OTNE7Ql/CRVSvpzDV+45BJuHhHnGkk1rVL2Sz7bCJ/BM0p4wsyDHI+x8IjTq4kQagGef
	8HA8Y5pk++Dao9xcozgE13wzgtRFD199+DExp5+q/T79gPNEW+KevCYi5ZdgoiFx8M74JwQ7Qtl
	JrYAibo2j2lcMNP2hrjLke2K8qVVkhe5/V2WpY1l/K37KrFwvN/nl9ZDl68ISOj8zqqFMoz0k3p
	keeHbpF6yICErxGrq2okEjVYhbRr3VfXT4Q38j77TlU2Pu0qj1FV+hdBJ487wDclSW6YaaPrVkk
	7DQl5okE8ztU2yQPLttlxCKTLW1Mu9bGD2wyHvCQqN1sfpgI=
X-Google-Smtp-Source: AGHT+IFXaxbkfl8ymqdktK1hGJR9WDJALRDi4wFcC80DqsFZNEgjYjTriidVs+jOHo6YVdqy6NGFpA==
X-Received: by 2002:adf:ea10:0:b0:3a5:270e:7d3 with SMTP id ffacd0b85a97d-3af100ae56cmr2090030f8f.13.1751366564709;
        Tue, 01 Jul 2025 03:42:44 -0700 (PDT)
Message-ID: <d562251a-a6ec-4e2f-b1f7-dd87a97d4005@suse.com>
Date: Tue, 1 Jul 2025 12:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/flask: estimate max sidtable size
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250630085559.554334-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250630085559.554334-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 10:55, Sergiy Kibrik wrote:
> Currently Xen lacks a defined largest number of security IDs it can potentially
> use. The number of SIDs are naturally limited by number of security contexts
> provided by a given security policy, i.e. how many combination of user, role
> and type there can be, and is dependant on the policy being used.
> Thus in Xen the number of allocated entries in sidtable is hard-limited by UINT_MAX.
> However in the embedded environment configured for safety it is desirable to
> avoid guest-triggered dynamic memory allocations at runtime, or at least limit
> them to some decent amounts. So we seek to estimate this limit.
> 
> This patch suggests one way to do it using Xen's flask policy.
> List of users, roles and types is read from binary policy using setools utils,
> then it is used to count the No. of combinations these values can give.
> This No. of combinations then can be used in code as a practical replacement
> of UINT_MAX limit. Also it can be used later to pre-allocate sidtable at boot
> and avoid runtime entries allocation altogether.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
> This RFC presents a concept of estimating a max possible sidtable size.
> Can we discuss how valid this concept is? Currently it yields 420 as max SID,
> is it a reasonable number?

As this is policy dependent - what policy did you use to obtain that 420?

> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -14,7 +14,7 @@ AV_H_DEPEND := $(srcdir)/policy/access_vectors
>  
>  FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
>  AV_H_FILES := av_perm_to_string.h av_permissions.h
> -ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
> +ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES) se_limits.h)

As a nit: Dashes in preference to underscores please in any new files'
names.

> @@ -54,4 +54,7 @@ $(obj)/policy.bin: FORCE
>  	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
>  	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
>  
> +$(obj)/%/se_limits.h: $(obj)/policy.bin
> +	$(srcdir)/policy/mkselim.sh $^ $@

Hmm, that's using the built-in policy, isn't it? What if later another
policy is loaded? Wouldn't it be possible to have ...

> --- a/xen/xsm/flask/ss/sidtab.c
> +++ b/xen/xsm/flask/ss/sidtab.c
> @@ -13,6 +13,7 @@
>  #include "flask.h"
>  #include "security.h"
>  #include "sidtab.h"
> +#include "se_limits.h"
>  
>  #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
>  
> @@ -228,7 +229,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
>          if ( sid )
>              goto unlock_out;
>          /* No SID exists for the context.  Allocate a new one. */
> -        if ( s->next_sid == UINT_MAX || s->shutdown )
> +        if ( s->next_sid == SEPOL_SID_LIMIT || s->shutdown )

... more than this many SIDs? What if CONFIG_XSM_FLASK_POLICY isn't even set?

It also doesn't really become clear to me how you avoid or even (meaningfully)
bound memory allocation here. A table of several hundred entries is still a
decent size. If you really knew the max size up front, why couldn't the table
be allocated statically. (Sadly the table allocation isn't in context, as you
don't even touch that code, wherever it lives.)

Jan

