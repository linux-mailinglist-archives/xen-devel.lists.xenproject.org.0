Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB109D87FB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842642.1258326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa5M-0003UT-D9; Mon, 25 Nov 2024 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842642.1258326; Mon, 25 Nov 2024 14:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa5M-0003Rn-A2; Mon, 25 Nov 2024 14:29:08 +0000
Received: by outflank-mailman (input) for mailman id 842642;
 Mon, 25 Nov 2024 14:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa5K-0002BZ-8Y
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:29:06 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ecc9735-ab39-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 15:29:03 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434a1fe2b43so3893185e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:29:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b463abbfsm200763465e9.32.2024.11.25.06.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:29:01 -0800 (PST)
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
X-Inumbo-ID: 9ecc9735-ab39-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjllY2M5NzM1LWFiMzktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ0OTQzLjk0MTA1Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544943; x=1733149743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik+kdwvsn5sI13Sqvs0LoMAnkH/bBuVd5/sAq0CDmGU=;
        b=Il3rTUUPchL5fOtlOteck2i3OpbcWvYwakRA9DhY1Kc0+eA8WEgCjFa4rtXp1f+Y9S
         unahajGuthcGZwm5mwB63aSBaPtQLfkefaqOSgmno2CWOWwYug0z7GSlPs1FetnaHtt0
         jKObspLYoBjNCO5J8Jvq0VnZ5RbcEkzq8TQMk6uy2c+fryPnS5Exlr/BpSJd04NEQZWl
         hEC+HN/pIm8jbdx5JwSGC87vXYNoVR/VJj0CQSBi/zPFKFCusBKvVkgtzkd5kgzkG7u/
         YVLQnU+DWBsGQ9xSrJDFtwsrlTjQQZ5PDxwnm07E/lYquTgapkEE0Lm+rn+yw4ZWPB9G
         XUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544943; x=1733149743;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ik+kdwvsn5sI13Sqvs0LoMAnkH/bBuVd5/sAq0CDmGU=;
        b=Pu5w1aAsEg21seTO5RMr//K/FvMR3XVXIerxflBG7luyTdDrpzuIVb0jCgQWITImpC
         yr+ltuEtvKlAb7jsWs9Bmf1hoviLnXwJrAS9Lhn93xFnheSoUzQmJHgEM21e4JWK5rFH
         ekl8zCoPxxI+Xqi5QvlYFLduCHIhNtyVAFKS+cUSqdmasXOhv0ACSBFURqHXuVYncHQm
         JU+nkoxJn6ZVjuiDPHlO7WTzhjQzyjfoa3UysBushnxwjcRvPXDrJHJJW9VkqpUbRkNY
         KBNIpzrf7vkaNjpwDpR15ijP9rYB3iEhYu8sW/DT7/rgAtycT/JwENrJ976fwCTn63ls
         LV0Q==
X-Gm-Message-State: AOJu0YxZt7kQIKGhg8RDANlbDvvs9S7QjBG/vyzveZWSiqBgbNE/2x4d
	Lg6IZ0b3evX7HpszupXTfd0M4ZJ2ET2wtHIGFVmZpr4oS+xHpSVxoZv0VIKD0OSm5Y2Lh+HTLjk
	=
X-Gm-Gg: ASbGncvb3uVYWAeSEtdmop8ecD229pcZYZ9t3wgcgGlDDT2DuC+vv53q+QDxiWM1REi
	z4RgQ33rEZgC38rJuF93yayTr3gHm5gwuydyAqy7mZScIbMPYt0Rk2qhjZbSwjB2Q6eZsxBoF5D
	Q2wmsBn+KK5NOkvJH4sHap30h5+gdfo2ueHrvqAClAW5LRxVsFd3dcX2TyFg6OGHGsqK62XHNGE
	jOVH7pSJDvHNHCIjahS0BlcrC3HpG/Cxv5ECozfKmi6WB/fN0FdJSKQJjKpj7TRhyTkB/t6RWZH
	1J3ssWntmvLQRNFyO3vr/H4aM4Z8lL7whzU=
X-Google-Smtp-Source: AGHT+IHUshLW1UH2BD/cE563Qw8MRdVLVfUzlOYqpiV9f+lqWs3Om2jqwXsYN5ldzFhj2qZ8FQFuJA==
X-Received: by 2002:a05:600c:4447:b0:42c:e0da:f15c with SMTP id 5b1f17b1804b1-433ce495857mr101725265e9.20.1732544941872;
        Mon, 25 Nov 2024 06:29:01 -0800 (PST)
Message-ID: <1c935aba-a185-43de-9806-6781b1a7fcf9@suse.com>
Date: Mon, 25 Nov 2024 15:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/7] x86: control memset() and memcpy() inlining
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
In-Reply-To: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
@@ -65,6 +65,9 @@ endif
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
 export CFLAGS_stack_boundary
 
+CFLAGS += $(call cc-option,$(CC),-mmemcpy-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+CFLAGS += $(call cc-option,$(CC),-mmemset-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
 # and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.


