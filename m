Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A3ACED8B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006561.1385770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7oI-0005Od-6k; Thu, 05 Jun 2025 10:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006561.1385770; Thu, 05 Jun 2025 10:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7oI-0005Ms-3m; Thu, 05 Jun 2025 10:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1006561;
 Thu, 05 Jun 2025 10:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7oG-0005Mk-O4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:26:56 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a962fb2-41f7-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:26:55 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so526060f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:26:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132bff6688sm1224745a91.5.2025.06.05.03.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:26:54 -0700 (PDT)
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
X-Inumbo-ID: 9a962fb2-41f7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749119215; x=1749724015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1v47NjpfklYXAFnt1Xg3d5eW/3aEbLVULucn4vLD+N4=;
        b=DosBO0Gz/81wa4HianKDWqliA/kzP8Hmlif+/6lWy/w6zVMaKGmDeJHQl5AnhKQjGF
         qVv9Grygcoane414JhCa+lfH3qCgfEOcO90jbpu4cK4Y4H3JxYqw7MdVuASevyCM7Zgv
         11vDG89LTR79B1DBdi44R1rqvFSdIVibBTqugwNn29NOGgZd2iPALQGgpbyesBisIuwN
         WQk/i0hmj+2DQ26XGsQo1O/jghH3vHDYc9TGjtbdftMoQGNP1bMIA5xoIJ7yHm5hsElJ
         +nDfAYtPtX1amfXwsto4y3OmPduxhV8gzThsQyxClUdbcnsasJ1NVzd996krZ2KxkMIW
         nX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119215; x=1749724015;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v47NjpfklYXAFnt1Xg3d5eW/3aEbLVULucn4vLD+N4=;
        b=htM6StGGG68s9btcBf3hwCdfTyzKKry/k2KiuiiZdhFJPaoodkLcfN1iAgZn6UEz+K
         MiaLadxTZ6yDIH0NeYfZewpNLz3J+H9fmXJP8EW3rKqbOJigVwhb0ue7iov9WVpWtZyq
         2QjvKY6XqzRko5/Z0ZwlV1cqYehmF6C49D33p+KfJ31k0BskjMGs0ZYMtSVPl1fcCz5X
         HI5ZrdazXcd7GwiRqTiwfMqULUgMUs5nDwWjAcgzGVdMt2lKvx5fAsYrRkvDq27B5RIM
         U4drxF6UM3pTRSPFAM+Msf2tF+TilAMRE37AgNK0D7DCvINhCGAUrWk8moExNxoBtTVK
         2VAg==
X-Gm-Message-State: AOJu0YyJML73KVBbnqdJS9qAkugCsyXstQPd2JhGaLRkJrGJEWGtRkPl
	rVI0ymUf+UQtzz85aMjyvOfBHK5Q1Jtj3j0RgstWMDNPlVMCAceug9zdmXwctxRVVeqRfhQRHXt
	05Kw=
X-Gm-Gg: ASbGncuGJJ5xKEpH0MvqxKw7movLJhYY/4wUQj0VDN8/B7c/V6ArA31mrfBljLVPhvS
	eiMvgt0DHimaz453vLWNcYnUuMFrZOFAMbCWoinjY9MhPTcWSjP2/aO3aezzdveOg4GRyNSVXVZ
	2HGOviOIpLWhbqr4YXDPU9OQO37UMleRbcHxJKyzjEzFObi0GEoIpa9NU/b/sB1cdYoanrUKDxy
	ctMM56wBfak89XuJaF80PUpcRlHNdDoQ6C/xLxiYUjb4ndH0hbyFW6iq9YodvTPXysbkJM2f8g6
	v4I9FS0U1JMIl21zyAiSc4Gr8wSRuys01JhJx4O4lL6kbmRcj4DbHjKshea2HcZXo40xFvoCGkr
	vFU6vgFdbS6CzK3+JB4so7YR5nl0J/e3CNoyWHc87pMVNYc0=
X-Google-Smtp-Source: AGHT+IHeyyS21Ai+7nJZfxT9YbsjuA/gqHmUIi2J+XzzBjGSD6NPvK+8TuhRB9TSp5IKQQ1CoUx/KA==
X-Received: by 2002:a05:6000:2c11:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a51d961af6mr5282398f8f.34.1749119215013;
        Thu, 05 Jun 2025 03:26:55 -0700 (PDT)
Message-ID: <f659ba34-a1cc-444b-8727-2ecfbcfb00e3@suse.com>
Date: Thu, 5 Jun 2025 12:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/6] x86: control memset() and memcpy() inlining
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
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
In-Reply-To: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stop the compiler from inlining non-trivial memset() and memcpy() (for
memset() see e.g. map_vcpu_info() or kimage_load_segments() for
examples). This way we even keep the compiler from using REP STOSQ /
REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
available).

With gcc10 this yields a modest .text size reduction (release build) of
around 2k.

Unfortunately these options aren't understood by the clang versions I
have readily available for testing with; I'm unaware of equivalents.

Note also that using cc-option-add is not an option here, or at least I
couldn't make things work with it (in case the option was not supported
by the compiler): The embedded comma in the option looks to be getting
in the way.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base.
v2: New.
---
The boundary values are of course up for discussion - I wasn't really
certain whether to use 16 or 32; I'd be less certain about using yet
larger values.

Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
for known size, properly aligned blocks is up for discussion.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -58,6 +58,9 @@ endif
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
 export CFLAGS_stack_boundary
 
+CFLAGS += $(call cc-option,$(CC),-mmemcpy-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+CFLAGS += $(call cc-option,$(CC),-mmemset-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
 # and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.


