Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492DCAD7B9
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180770.1503896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScXi-0001z0-SH; Mon, 08 Dec 2025 14:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180770.1503896; Mon, 08 Dec 2025 14:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScXi-0001vt-Oa; Mon, 08 Dec 2025 14:48:50 +0000
Received: by outflank-mailman (input) for mailman id 1180770;
 Mon, 08 Dec 2025 14:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vScXh-0001vn-SK
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:48:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008aad14-d445-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 15:48:47 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2ce8681eso3138962f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 06:48:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d330b20sm25263332f8f.29.2025.12.08.06.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 06:48:46 -0800 (PST)
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
X-Inumbo-ID: 008aad14-d445-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765205327; x=1765810127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mFjzTHBxypVrkHsOgihfvwb2D5pbS39Nt/3LDYa2oR4=;
        b=JjLcg6S6QE4wz8Jd5RWqDFxgEj/GdyK+ioOPAWFDINJFXHV8UW6Kd2Si5p77HRcJ/N
         CfInzXugqfVF99Ho3IrCJ9/eJXkv+bHsxT4fuF/QZTFEvjk853+xDBw+Ec3u/HSjquiV
         yVsjWT8HP+Mg1ut0ftGdsC5XrPKaMnOiM/IzPw4Ldob5WriH65BnNlLZxDMr6GO+EOb4
         tUqwRawElY79wEyOgiePRmOZHRMxndwyGB0YJt8GGsHbA29P98vvE45OPvgLSQdjMaik
         wGIz6SfiWKwIOMOvaioTqJepVPsD2yYQzvhR2q91/sBrZ1p2x5LmTD2wLlL3JkpzbElm
         zMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205327; x=1765810127;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFjzTHBxypVrkHsOgihfvwb2D5pbS39Nt/3LDYa2oR4=;
        b=kl/ME4pdUcI5EVYr+HhTPa+tenWlBM6E+gAfYmn9xFjePXdQoXYEkIoJcM2Tf6i+8c
         ChiGxDixAF0FSKPcelPNAwRVbR27FIbjyTACygkab2igcIA/MHSEu76UUP/I//x1mNzz
         e2CtD+lWbEjjGxP0NrsWN5QpzMqATIdNuh1danhg7t9RceioUG8ffcUnCf0oNT9NR/+J
         D1LB/TgMhxhJr9FXCDOOzboQOqFo0b4b68OSeVbxo1UZXkX5ty9oDONhCt3UErozycia
         yhr23TabhZ+G980j0odtL3+zcUOUR5+5vzLEgQuzxn8u2g7xOS62BpJSTyGMoaP2gK0n
         1P8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcG3jHsfx9OeatM6i7DOWA9eDDz7fBdUSRPs5DVlkmJ/CXgpkEnbKF0tPhRiiAW4wh6vaCOCWfbx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw110kZLe1AFhqSQt7G2mjHm7zTazC84nuZI7F+TfZAP6u81fMT
	yqP85RNkEcalGVhjRGoVT0N6ihO7dNzjxBeXbUII/i1CWYIsyOP3L3bFIqc7M4jHLg==
X-Gm-Gg: ASbGncso0KX1+UdAfO9lXMup/jUArWm99lzYg7ze+fEVHv4osWmwur+zw8Qo7MALj0t
	+0e39R6bIa/7hhTa10CkHYGSjiCeH9BXQprpBHYFioZ3TVzgyqE73DRxMXSzg/dzCdKUfXFiO83
	4TC4ZOGtU1vPEc1hmBEP7o3zm/z/K9HHGbs9YFduM6Fm2jg3w3Uk52srQ9s7M5esSwfHEwE67Dp
	peoyGjZnCRaizLHX0kLWXBD+BpvQlUbe+nZX3hi5bgrAjtGhNJRo3xooxsHy78PUuz29jXYYZLU
	Ich0C7nUhzLDKT8UPshMcTsD2bBKxD6msZZdBOitpwySmmSY6I9TYLJqjtpa1klf4ijqkT1uZyw
	SMoxjLtTaenSL9xUit8QIOoWSVNSFciPQBpP7RzRRDoBPpl940seozdt034Sp8Ok7xknmZfdFQ0
	BLBidbPA4cGMk0gvZmtd5OlB6fv1UWV/bYn7ZhGuVSWpIMy5ZlORe9TXb9xbMJfrg1HXPBLiW2J
	Qw=
X-Google-Smtp-Source: AGHT+IHzouZfbIRXXU56JnFmgerl3eOubtLqkA5R8FsxQ/Z1PM7HWmp5ncEMmns3cnnkafKklHUoCA==
X-Received: by 2002:a05:6000:1863:b0:42b:323b:f138 with SMTP id ffacd0b85a97d-42f89f483famr9456736f8f.41.1765205327059;
        Mon, 08 Dec 2025 06:48:47 -0800 (PST)
Message-ID: <ae96860a-02b2-4ae1-ae98-eba0b749ff90@suse.com>
Date: Mon, 8 Dec 2025 15:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] symbols: drop symbols-dummy.c
From: Jan Beulich <jbeulich@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
Content-Language: en-US
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
In-Reply-To: <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 14:47, Jan Beulich wrote:
> No architecture using it anymore, we can as well get rid of it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Should we also drop common/symbols.h again then, by moving its contents
> back into common/symbols.c?
> 
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -74,8 +74,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
>  endif
>  
> -extra-y := symbols-dummy.o
> -
>  obj-$(CONFIG_COVERAGE) += coverage/
>  obj-y += sched/
>  obj-$(CONFIG_UBSAN) += ubsan/
> --- a/xen/common/symbols-dummy.c
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/*
> - * symbols-dummy.c: dummy symbol-table definitions for the inital partial
> - *                  link of the hypervisor image.
> - */
> -
> -#include "symbols.h"
> -
> -#ifdef SYMBOLS_ORIGIN
> -const unsigned int symbols_offsets[1];
> -#else
> -const unsigned long symbols_addresses[1];
> -#endif
> -const unsigned int symbols_num_addrs;
> -const unsigned char symbols_names[1];
> -
> -#ifdef CONFIG_FAST_SYMBOL_LOOKUP
> -const unsigned int symbols_num_names;
> -const struct symbol_offset symbols_sorted_offsets[1];
> -#endif
> -
> -const uint8_t symbols_token_table[1];
> -const uint16_t symbols_token_index[1];
> -
> -const unsigned int symbols_markers[1];
> 

Now this is (to me at least) absurd: I'm removing a file, just to find the pipeline
fails because cppcheck doesn't like docs/misra/exclude-list.json containing a
reference to a non-existing file.

I'll amend the commit with

--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -170,10 +170,6 @@
             "comment": "Imported from Linux, ignore for now"
         },
         {
-            "rel_path": "common/symbols-dummy.c",
-            "comment": "The resulting code is not included in the final Xen binary, ignore for now"
-        },
-        {
             "rel_path": "crypto/*",
             "comment": "Origin is external and documented in crypto/README.source"
         },

but I think such tidying should be optional.

Jan

