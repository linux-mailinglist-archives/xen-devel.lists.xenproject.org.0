Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7D992E20
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812012.1224664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoHT-0003s2-9j; Mon, 07 Oct 2024 14:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812012.1224664; Mon, 07 Oct 2024 14:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoHT-0003pn-5r; Mon, 07 Oct 2024 14:00:11 +0000
Received: by outflank-mailman (input) for mailman id 812012;
 Mon, 07 Oct 2024 14:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxoHR-0003ph-9S
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:00:09 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7528be49-84b4-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:00:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99543ab209so138256966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb23bsm383175466b.34.2024.10.07.07.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:00:04 -0700 (PDT)
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
X-Inumbo-ID: 7528be49-84b4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728309606; x=1728914406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yP7C1cRq+tVeQqg2EdeMEc2ru3gbBmgfy9ow+ZBz+i4=;
        b=AKV++gRGneA6ZB7WbnS0QzNhEXmwh0NVZsPd0xnKMc1mxfXrLjmtt6AOzS2sDGp3dD
         wnvTXDWx4aEj8Olp46LlEd0C/GN0WA1R/FQ6ekWNZ9p+6mFD0wfZbESOCwHHrGs4jsQN
         YVQS9rxuHxjtwYJCy4k8xWnh65r46UVpK2H0inbSWoOMtm5Nu2krbDShGXHTxUo3xh1D
         tvZ/d6y0eBgx8QAHnF2Fcki7H9USwHzfXZtvm8r5t2f+Rp5A4ZvvIZhDDteCSzfKr68l
         6cRKTsjtRgmOneVsSunl7CEuCC8vk4S3VGriXU/JI6mbL7zdGvW59qfPnp28dEYQQgw5
         U7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309606; x=1728914406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP7C1cRq+tVeQqg2EdeMEc2ru3gbBmgfy9ow+ZBz+i4=;
        b=A7G4o3kMNJnhvGbetitMqEiF7lgG50VlDXssNa78LuHVJZLCAFcFEpxYnWyV46J0bF
         EwC0OU+bAshFT8bV0mcKGPMslET8ZdYSuoAJdrVMh7VATuU3j75OLkbTo7v+FGR5MXBl
         W9hNIQhGWuer+FgaVHg5FM+BtOTjSRn1Z9HKL2Vtap1vdAcwiNdfaJzJJXvg3sBaoEZv
         op3lX+OiV2rHHFLq3Dwz5mdE3Q/9va+Annqrp9aQgitA666dix+To2YssM0B1PyGqrk7
         dgu82nWNRsM1n5IQ03TlqeNzNZVLGOjg6lAiHtwLC4EHN7MG04CqprTi0odlQF1+G3RY
         1eZg==
X-Forwarded-Encrypted: i=1; AJvYcCWnDXz8BgfryEVx23VSa7YNIj9Y25syGIPlKhL+HXBUtIL4m/u7oOFf+/beorPz9gx3i9LY/VPe/04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA4EiEWE9hCdKHlIcon5YlqcSSD8Fxes7mUFL1vuFFE+qRk2kw
	qM/CeVOfKJNcuiHp0BIc9YoO/GF6HSCrfzgzrzRuOG+9VO2connZH5xPrB+Gwg==
X-Google-Smtp-Source: AGHT+IFQhxwvRQkSOEGnxBa7K6zrR8K2O4cDAKmlVefUyu+woeyaIcvtW+vt5nTijfiqgxZRKrWhQw==
X-Received: by 2002:a17:907:3e20:b0:a8a:8915:6bf6 with SMTP id a640c23a62f3a-a991c0308famr1232772066b.52.1728309605920;
        Mon, 07 Oct 2024 07:00:05 -0700 (PDT)
Message-ID: <0ff2d8f4-61d2-4eca-a6ee-022624ee3bcb@suse.com>
Date: Mon, 7 Oct 2024 16:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] tests/x86: Introduce a userspace test harness for
 x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
 <20241002152725.1841575-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241002152725.1841575-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 17:27, Andrew Cooper wrote:
> Back to this patch, I can't find any way to get Clang happy with rex.w for
> explicit prefixing.  I suspect we're just going to need to ignore this test
> case for clang=y.

ISTR experimenting with that too a little while back, finding that newer
Clang supports at least rex64.

> Also, Clang and GAS disagree on needing .allow_index_reg for %riz.

Disagree in which way? Does Clang accept it even without the directive?
If so, that maybe fine for AT&T syntax code, but it definitely isn't for
Intel syntax.

> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -5,6 +5,7 @@ SUBDIRS-y :=
>  SUBDIRS-y += resource
>  SUBDIRS-$(CONFIG_X86) += cpu-policy
>  SUBDIRS-$(CONFIG_X86) += tsx
> +SUBDIRS-$(CONFIG_X86) += x86-decode-lite

Won't this be wrong when the tool stack is built 32-bit?

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/Makefile
> @@ -0,0 +1,45 @@
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET := test-x86-decode-lite
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
> +	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
> +
> +.PHONY: uninstall
> +uninstall:
> +
> +vpath %.c ../../../xen/arch/x86/x86_emulate

What is it that you take from there? All ...

> +CFLAGS += $(CFLAGS_xeninclude) -I. -I../../../xen/arch/x86/
> +CFLAGS += $(APPEND_CFLAGS)
> +
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +%.o: Makefile
> +
> +$(TARGET): main.o insns.o decode-lite.o

... objects enumerated here come from local sources.

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/insns.S
> @@ -0,0 +1,703 @@
> +#include "macro-magic.h"
> +
> +        .code64
> +
> +#ifndef __clang__
> +        .allow_index_reg
> +#endif
> +        .text
> +
> +DECL(tests_rel0)
> +modrm:
> +        /* Mod=0, Reg=0, RM {0..f} */
> +        _ add %al, (%rax)
> +        _ add %al, (%rcx)
> +        _ add %al, (%rdx)
> +        _ add %al, (%rbx)
> +        _ add %al, (%rsp) /* SIB */
> +        /*add %al, (%rbp)    RIP --> tests_rel4 */
> +        _ add %al, (%rsi)
> +        _ add %al, (%rdi)
> +        _ add %al, (%r8)
> +        _ add %al, (%r9)
> +        _ add %al, (%r10)
> +        _ add %al, (%r11)
> +        _ add %al, (%r12) /* SIB */
> +        /*add %al, (%r13)    RIP --> tests_rel4 */
> +        _ add %al, (%r14)
> +        _ add %al, (%r15)

There's a lot of redundancy here and below - did you consider using .irp
to reduce this some?

> +        /* Mod=1, Reg=0, RM {0..f} */
> +        _ add %al, 0x01(%rax)
> +        _ add %al, 0x01(%rcx)
> +        _ add %al, 0x01(%rdx)
> +        _ add %al, 0x01(%rbx)
> +        _ add %al, 0x01(%rsp) /* SIB */
> +        _ add %al, 0x01(%rbp)
> +        _ add %al, 0x01(%rsi)
> +        _ add %al, 0x01(%rdi)
> +        _ add %al, 0x01(%r8)
> +        _ add %al, 0x01(%r9)
> +        _ add %al, 0x01(%r10)
> +        _ add %al, 0x01(%r11)
> +        _ add %al, 0x01(%r12) /* SIB */
> +        _ add %al, 0x01(%r13)
> +        _ add %al, 0x01(%r14)
> +        _ add %al, 0x01(%r15)
> +
> +        /* Mod=2, Reg=0, RM {0..f} */
> +        _ add %al, 0x7f000001(%rax)
> +        _ add %al, 0x7f000001(%rcx)
> +        _ add %al, 0x7f000001(%rdx)
> +        _ add %al, 0x7f000001(%rbx)
> +        _ add %al, 0x7f000001(%rsp) /* SIB */
> +        _ add %al, 0x7f000001(%rbp)
> +        _ add %al, 0x7f000001(%rsi)
> +        _ add %al, 0x7f000001(%rdi)
> +        _ add %al, 0x7f000001(%r8)
> +        _ add %al, 0x7f000001(%r9)
> +        _ add %al, 0x7f000001(%r10)
> +        _ add %al, 0x7f000001(%r11)
> +        _ add %al, 0x7f000001(%r12) /* SIB */
> +        _ add %al, 0x7f000001(%r13)
> +        _ add %al, 0x7f000001(%r14)
> +        _ add %al, 0x7f000001(%r15)
> +
> +        /* Mod=3, Reg=0, RM {0..f} */
> +        _ add %al, %al
> +        _ add %al, %cl
> +        _ add %al, %dl
> +        _ add %al, %bl
> +        _ add %al, %ah
> +        _ add %al, %ch
> +        _ add %al, %dh
> +        _ add %al, %dl
> +        _ add %al, %r8b
> +        _ add %al, %r9b
> +        _ add %al, %r10b
> +        _ add %al, %r11b
> +        _ add %al, %r12b
> +        _ add %al, %r13b
> +        _ add %al, %r14b
> +        _ add %al, %r15b
> +
> +sib:
> +        /* Mod=0, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
> +        _ add %al, (%rax, %rax, 8)
> +        _ add %al, (%rcx, %rax, 8)
> +        _ add %al, (%rdx, %rax, 8)
> +        _ add %al, (%rbx, %rax, 8)
> +        _ add %al, (%rsp, %rax, 8)
> +        _ add %al, (    , %rax, 8) /* "none", %rbp encoded with mod=1/2 */
> +        _ add %al, (%rsi, %rax, 8)
> +        _ add %al, (%rdi, %rax, 8)
> +        _ add %al, (%r8,  %rax, 8)
> +        _ add %al, (%r9,  %rax, 8)
> +        _ add %al, (%r10, %rax, 8)
> +        _ add %al, (%r11, %rax, 8)
> +        _ add %al, (%r12, %rax, 8)
> +        _ rex.b add %al,(,%rax, 8) /* "none", %r13 encoded with mod=1/2 */
> +        _ add %al, (%r14, %rax, 8)
> +        _ add %al, (%r15, %rax, 8)
> +
> +        /* Mod=1, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
> +        _ add %al, 0x01(%rax, %rax, 8)
> +        _ add %al, 0x01(%rcx, %rax, 8)
> +        _ add %al, 0x01(%rdx, %rax, 8)
> +        _ add %al, 0x01(%rbx, %rax, 8)
> +        _ add %al, 0x01(%rsp, %rax, 8)
> +        _ add %al, 0x01(%rbp, %rax, 8)
> +        _ add %al, 0x01(%rsi, %rax, 8)
> +        _ add %al, 0x01(%rdi, %rax, 8)
> +        _ add %al, 0x01(%r8,  %rax, 8)
> +        _ add %al, 0x01(%r9,  %rax, 8)
> +        _ add %al, 0x01(%r10, %rax, 8)
> +        _ add %al, 0x01(%r11, %rax, 8)
> +        _ add %al, 0x01(%r12, %rax, 8)
> +        _ add %al, 0x01(%r13, %rax, 8)
> +        _ add %al, 0x01(%r14, %rax, 8)
> +        _ add %al, 0x01(%r15, %rax, 8)
> +
> +        /* Mod=2, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
> +        _ add %al, 0x7f000001(%rax, %rax, 8)
> +        _ add %al, 0x7f000001(%rcx, %rax, 8)
> +        _ add %al, 0x7f000001(%rdx, %rax, 8)
> +        _ add %al, 0x7f000001(%rbx, %rax, 8)
> +        _ add %al, 0x7f000001(%rsp, %rax, 8)
> +        _ add %al, 0x7f000001(%rbp, %rax, 8)
> +        _ add %al, 0x7f000001(%rsi, %rax, 8)
> +        _ add %al, 0x7f000001(%rdi, %rax, 8)
> +        _ add %al, 0x7f000001(%r8,  %rax, 8)
> +        _ add %al, 0x7f000001(%r9,  %rax, 8)
> +        _ add %al, 0x7f000001(%r10, %rax, 8)
> +        _ add %al, 0x7f000001(%r11, %rax, 8)
> +        _ add %al, 0x7f000001(%r12, %rax, 8)
> +        _ add %al, 0x7f000001(%r13, %rax, 8)
> +        _ add %al, 0x7f000001(%r14, %rax, 8)
> +        _ add %al, 0x7f000001(%r15, %rax, 8)
> +
> +        /* Mod=0, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
> +        _ add %al, (%rax, %riz, 8)
> +        _ add %al, (%rcx, %riz, 8)
> +        _ add %al, (%rdx, %riz, 8)
> +        _ add %al, (%rbx, %riz, 8)
> +        _ add %al, (%rsp, %riz, 8)
> +        _ add %al, (    , %riz, 8) /* %rbp encoded with mod=1/2 */
> +        _ add %al, (%rsi, %riz, 8)
> +        _ add %al, (%rdi, %riz, 8)
> +        _ add %al, (%r8,  %riz, 8)
> +        _ add %al, (%r9,  %riz, 8)
> +        _ add %al, (%r10, %riz, 8)
> +        _ add %al, (%r11, %riz, 8)
> +        _ add %al, (%r12, %riz, 8)
> +        _ rex.b add %al,(,%riz, 8) /* %r13 encoded with mod=1/2 */
> +        _ add %al, (%r14, %riz, 8)
> +        _ add %al, (%r15, %riz, 8)
> +
> +        /* Mod=1, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
> +        _ add %al, 0x01(%rax, %riz, 8)
> +        _ add %al, 0x01(%rcx, %riz, 8)
> +        _ add %al, 0x01(%rdx, %riz, 8)
> +        _ add %al, 0x01(%rbx, %riz, 8)
> +        _ add %al, 0x01(%rsp, %riz, 8)
> +        _ add %al, 0x01(%rbp, %riz, 8)
> +        _ add %al, 0x01(%rsi, %riz, 8)
> +        _ add %al, 0x01(%rdi, %riz, 8)
> +        _ add %al, 0x01(%r8,  %riz, 8)
> +        _ add %al, 0x01(%r9,  %riz, 8)
> +        _ add %al, 0x01(%r10, %riz, 8)
> +        _ add %al, 0x01(%r11, %riz, 8)
> +        _ add %al, 0x01(%r12, %riz, 8)
> +        _ add %al, 0x01(%r13, %riz, 8)
> +        _ add %al, 0x01(%r14, %riz, 8)
> +        _ add %al, 0x01(%r15, %riz, 8)
> +
> +        /* Mod=2, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
> +        _ add %al, 0x7f000001(%rax, %riz, 8)
> +        _ add %al, 0x7f000001(%rcx, %riz, 8)
> +        _ add %al, 0x7f000001(%rdx, %riz, 8)
> +        _ add %al, 0x7f000001(%rbx, %riz, 8)
> +        _ add %al, 0x7f000001(%rsp, %riz, 8)
> +        _ add %al, 0x7f000001(%rbp, %riz, 8)
> +        _ add %al, 0x7f000001(%rsi, %riz, 8)
> +        _ add %al, 0x7f000001(%rdi, %riz, 8)
> +        _ add %al, 0x7f000001(%r8,  %riz, 8)
> +        _ add %al, 0x7f000001(%r9,  %riz, 8)
> +        _ add %al, 0x7f000001(%r10, %riz, 8)
> +        _ add %al, 0x7f000001(%r11, %riz, 8)
> +        _ add %al, 0x7f000001(%r12, %riz, 8)
> +        _ add %al, 0x7f000001(%r13, %riz, 8)
> +        _ add %al, 0x7f000001(%r14, %riz, 8)
> +        _ add %al, 0x7f000001(%r15, %riz, 8)
> +
> +        .macro alu_ops op
> +        _ \op %al, (%rax)
> +        _ \op %eax, (%rax)
> +        _ \op (%rax), %al
> +        _ \op (%rax), %eax
> +        _ \op $1, %al
> +        _ \op $0x7f000001, %eax

While immediate forms below also come in word and qword flavors, no such
exist for the non-immediate forms above. Is that intentional?

> +        /* Vary osize on imm fields */
> +        _ data16 \op $1, %al
> +        _ rex.w \op $1, %al
> +        _ data16 rex.w \op $1, %al

Yet for byte ops the immediate is never going to be wider than a byte.
Wouldn't these be more interesting with word/dword/qword operand size?

> +        _ \op $0x7f01, %ax
> +        _ \op $0x7f000001, %rax
> +        _ data16 \op $0x7f000001, %rax
> +        .endm
> +
> +onebyte_row_0x:
> +        alu_ops add
> +        alu_ops or
> +
> +onebyte_row_1x:
> +        alu_ops adc
> +        alu_ops sbb
> +
> +onebyte_row_2x:
> +        alu_ops and
> +        .code32
> +        _ es nop
> +        .code64
> +        alu_ops sub
> +        _ cs nop
> +
> +onebyte_row_3x:
> +        alu_ops xor
> +        .code32
> +        _ ss nop
> +        .code64
> +        alu_ops cmp
> +        _ ds nop
> +
> +/* onebyte_row_4x --> rex prefixes */
> +
> +onebyte_row_5x:
> +        _ push %rax
> +        _ push %rcx
> +        _ push %rdx
> +        _ push %rbx
> +        _ push %rsp
> +        _ push %rbp
> +        _ push %rsi
> +        _ push %rdi
> +        _ pop %rax
> +        _ pop %rcx
> +        _ pop %rdx
> +        _ pop %rbx
> +        _ pop %rsp
> +        _ pop %rbp
> +        _ pop %rsi
> +        _ pop %rdi
> +
> +onebyte_row_6x:
> +        /*pusha,popa,bound --> not supported */
> +        _ movsxd (%rax), %eax
> +        _ movslq (%rax), %rax
> +        _ fs nop
> +        _ gs nop
> +        _ data16 nop
> +        /* addr32 --> not supported */
> +        _ pushq $0x7f000001
> +        _ pushw $0x7f01
> +        _ rex.w pushq $0x7f000001
> +        _ imul $0x7f01, %ax, %ax
> +        _ imul $0x7f000001, %eax, %eax
> +        _ imul $0x7f000001, %rax, %rax
> +        _ pushq $0
> +        _ pushw $0
> +        _ rex.w pushq $0
> +        _ imul $0, %ax, %ax
> +        _ imul $0, %eax, %eax
> +        _ imul $0, %rax, %rax
> +        _ insb
> +        _ insw
> +        _ insl
> +        _ outsb
> +        _ outsw
> +        _ outsl
> +
> +/* onebyte_row_7x: --> Jcc disp8 */
> +
> +onebyte_row_8x:
> +        _ add $0, %cl /* Grp1 */
> +        _ data16 add $0, %cl
> +        _ rex.w add $0, %cl
> +        _ add $0x7f01, %cx
> +        _ add $0x7f000001, %ecx
> +        _ add $0x7f000001, %rcx
> +        _ add $0, %cx
> +        _ add $0, %ecx
> +        _ add $0, %rcx
> +        _ test %cl, %cl
> +        _ test %ecx, %ecx
> +        _ xchg %cl, %cl
> +        _ xchg %ecx, %ecx
> +        _ mov %cl, (%rax)
> +        _ mov %ecx, (%rax)
> +        _ mov (%rax), %cl
> +        _ mov (%rax), %ecx
> +        _ mov %cs, (%rax)
> +        _ lea (%rax), %eax
> +        _ mov (%rax), %cs
> +        /*pop mem --> Grp1a, Not supported (XOP prefix adjacent) */
> +
> +onebyte_row_9x:
> +        _ nop
> +        _ pause
> +        _ xchg %ax, %ax
> +        _ xchg %eax, %eax
> +        _ xchg %rax, %rax
> +        _ rex.w xchg %rax, %rax
> +        _ cltq
> +        _ cqto
> +        _ wait
> +        _ pushf
> +        _ popf
> +        _ sahf
> +        _ lahf
> +
> +onebyte_row_ax:
> +        _ mov 0x8000000000000001, %al
> +        _ mov 0x8000000000000001, %ax
> +        _ mov 0x8000000000000001, %eax
> +        _ mov 0x8000000000000001, %rax
> +        _ mov %al,  0x8000000000000001
> +        _ mov %ax,  0x8000000000000001
> +        _ mov %eax, 0x8000000000000001
> +        _ mov %rax, 0x8000000000000001
> +        _ movsb
> +        _ movsl
> +        _ cmpsb
> +        _ cmpsl
> +        _ test $0, %al
> +        _ test $0x80000001, %eax
> +        _ test $0x7f000001, %rax
> +        _ stosb
> +        _ stosl
> +        _ lodsb
> +        _ lodsl
> +        _ scasb
> +        _ scasl
> +
> +onebyte_row_bx:
> +        _ mov $0, %al
> +        _ mov $0, %cl
> +        _ mov $0x7f01, %ax
> +        _ mov $0x7f01, %cx
> +        _ mov $0x7f000001, %eax
> +        _ mov $0x7f000001, %ecx
> +        _ mov $0x7f00000000000001, %rax
> +        _ mov $0x7f00000000000001, %rcx
> +
> +onebyte_row_cx:
> +        _ rol $0, %al /* Grp2 */
> +        _ rol $0, %ax
> +        _ rol $0, %eax
> +        _ rol $0, %rax
> +        /*ret $0 --> not supported */
> +        _ ret
> +        /*les,lds --> not supported */

LES and LDS don't even exist for 64-bit code.

> +        _ movb $0, (%rax) /* Grp11 */
> +        _ movw $0, (%rax)
> +        _ movl $0, (%rax)
> +        _ movq $0, (%rax)
> +        /*xbegin (Grp11) --> disp32 */
> +        /*enter,leave,lretq $0 --> not supported */
> +        _ lretq
> +        _ int3
> +        _ int $0
> +        /*into,iret --> not supported */
> +
> +onebyte_row_dx:
> +        _ rol $1, %al /* Grp2 */
> +        _ rol $1, %ax
> +        _ rol $1, %eax
> +        _ rol $1, %rax
> +        _ rol %cl, %al
> +        _ rol %cl, %ax
> +        _ rol %cl, %eax
> +        _ rol %cl, %rax
> +        /*aam,aad,setalc,xlat,d8...df --> not supported */
> +
> +onebyte_row_ex:
> +        /*loop{ne,e,},jrcxz --> not supported */
> +        _ in $0, %al
> +        _ in $0, %eax
> +        _ out %al,  $0
> +        _ out %eax, $0
> +        /*call,jmp --> disp32 */
> +        /*ljmp --> not supported */

Nor does this, and you also don't have a similar comment for lcall (0x9a).

> +        /*jmp --> disp8 */
> +        _ in %dx, %al
> +        _ in %dx, %eax
> +        _ out %al,  %dx
> +        _ out %eax, %dx
> +
> +onebyte_row_fx:
> +        _ lock addb $0, (%rax)
> +        n "icebp" .byte 0xf1 /* icebp */
> +        _ repne nop
> +        _ repe nop
> +        _ hlt
> +        _ cmc
> +        _ test $0, %cl /* Grp3, /0 has extra Imm{8,} */
> +        _ not %cl
> +        _ test $0x7f01, %cx
> +        _ not %cx
> +        _ test $0x7f000001, %ecx
> +        _ not %ecx
> +        _ test $0x7f000001, %rcx
> +        _ not %rcx
> +        _ clc
> +        _ stc
> +        _ cli
> +        _ sti
> +        _ cld
> +        _ std
> +        _ inc %cl /* Grp4 */
> +        _ dec %cl
> +        _ inc %ecx /* Grp5 */
> +        _ dec %ecx
> +        _ call *(%rax)
> +        _ lcall *(%rax)
> +        _ jmp *(%rax)
> +        _ ljmp *(%rax)
> +        _ push (%rax)
> +
> +twobyte_row_0x:
> +        _ sldt (%rax) /* Grp6 */
> +        _ sgdt (%rax) /* Grp7 */
> +        _ lar (%rax), %eax
> +        _ lsl (%rax), %eax
> +        _ clts
> +        _ wbinvd
> +        _ ud2a
> +
> +twobyte_row_1x:
> +        _ prefetchnta (%rax) /* Grp16 (Hint Nop) */
> +        _ nopl (%rax)
> +
> +twobyte_row_2x:
> +        _ mov %cr0, %rax
> +        _ mov %dr0, %rax
> +        _ mov %rax, %cr0
> +        _ mov %rax, %dr0
> +
> +twobyte_row_3x:
> +        _ wrmsr
> +        _ rdtsc
> +        _ rdmsr
> +        _ rdpmc
> +
> +twobyte_row_4x:
> +        _ cmovo (%rax), %eax
> +        _ cmovg (%rax), %eax
> +
> +/* twobyte_row_8x: --> Jcc disp32 */
> +
> +twobyte_row_9x:
> +        _ seto (%rax)
> +        _ setg (%rax)
> +
> +twobyte_row_ax:
> +        _ push %fs
> +        _ pop %fs
> +        _ cpuid
> +        _ bt %eax, (%rax)
> +        _ shld $0, %ax, (%rax)
> +        _ shld $0, %eax, (%rax)
> +        _ shld $0, %rax, (%rax)
> +        _ shld %cl, %ax, (%rax)
> +        _ shld %cl, %eax, (%rax)
> +        _ shld %cl, %rax, (%rax)
> +        _ push %gs
> +        _ pop %gs
> +        /*rsm --> not supported */
> +        _ bts %eax, (%rax)
> +        _ shrd $0, %ax, (%rax)
> +        _ shrd $0, %eax, (%rax)
> +        _ shrd $0, %rax, (%rax)
> +        _ shrd %cl, %ax, (%rax)
> +        _ shrd %cl, %eax, (%rax)
> +        _ shrd %cl, %rax, (%rax)
> +        _ fxsave (%rax) /* Grp15 */
> +        _ imul (%rax), %eax
> +
> +twobyte_row_bx:
> +        _ cmpxchg %al, (%rax)
> +        _ cmpxchg %eax, (%rax)
> +        _ lss (%rax), %eax
> +        _ btr %eax, (%rax)
> +        _ lfs (%rax), %eax
> +        _ lgs (%rax), %eax
> +        _ movzbl (%rax), %eax
> +        _ movzwl (%rax), %eax
> +        _ popcnt (%rax), %eax
> +        _ ud1 (%rax), %eax /* Grp10 */
> +        _ bt $0, %ax /* Grp8 */
> +        _ bt $0, %eax
> +        _ bt $0, %rax
> +        _ btc %eax, (%rax)
> +        _ bsf (%rax), %eax
> +        _ bsr (%rax), %eax
> +        _ movsbl (%rax), %eax
> +        _ movswl (%rax), %eax
> +
> +twobyte_row_cx:
> +        _ xadd %al, (%rax)
> +        _ xadd %eax, (%rax)
> +        _ cmpxchg8b (%rax) /* Grp9 */
> +        _ bswap %eax
> +        _ bswap %edi
> +
> +END(tests_rel0)
> +
> +DECL(tests_rel1)
> +disp8:
> +1:
> +        _ jo   1b
> +        _ jno  1b
> +        _ jb   1b
> +        _ jae  1b
> +        _ je   1b
> +        _ jne  1b
> +        _ jbe  1b
> +        _ ja   1b
> +        _ js   1b
> +        _ jns  1b
> +        _ jp   1b
> +        _ jnp  1b
> +        _ jl   1b
> +        _ jge  1b
> +        _ jle  1b
> +        _ jg   1b
> +        _ jmp  1b
> +
> +disp8_rex:
> +        _ rex.w jo   1b
> +        _ rex.w jno  1b
> +        _ rex.w jb   1b
> +        _ rex.w jae  1b
> +        _ rex.w je   1b
> +        _ rex.w jne  1b
> +        _ rex.w jbe  1b
> +        _ rex.w ja   1b
> +        _ rex.w js   1b
> +        _ rex.w jns  1b
> +        _ rex.w jp   1b
> +        _ rex.w jnp  1b
> +        _ rex.w jl   1b
> +        _ rex.w jge  1b
> +        _ rex.w jle  1b
> +        _ rex.w jg   1b
> +        _ rex.w jmp  1b
> +END(tests_rel1)
> +
> +DECL(tests_rel4)
> +disp32:
> +        _ call   other_section
> +        _ jmp    other_section
> +        _ jo     other_section
> +        _ jno    other_section
> +        _ jb     other_section
> +        _ jae    other_section
> +        _ je     other_section
> +        _ jne    other_section
> +        _ jbe    other_section
> +        _ ja     other_section
> +        _ js     other_section
> +        _ jns    other_section
> +        _ jp     other_section
> +        _ jnp    other_section
> +        _ jl     other_section
> +        _ jge    other_section
> +        _ jle    other_section
> +        _ jg     other_section
> +        _ xbegin other_section
> +
> +disp32_rex:
> +        _ rex.w call   other_section
> +        _ rex.w jmp    other_section
> +        _ rex.w jo     other_section
> +        _ rex.w jno    other_section
> +        _ rex.w jb     other_section
> +        _ rex.w jae    other_section
> +        _ rex.w je     other_section
> +        _ rex.w jne    other_section
> +        _ rex.w jbe    other_section
> +        _ rex.w ja     other_section
> +        _ rex.w js     other_section
> +        _ rex.w jns    other_section
> +        _ rex.w jp     other_section
> +        _ rex.w jnp    other_section
> +        _ rex.w jl     other_section
> +        _ rex.w jge    other_section
> +        _ rex.w jle    other_section
> +        _ rex.w jg     other_section
> +        _ rex.w xbegin other_section
> +
> +riprel:
> +        _ add %al, 0(%rip)
> +        _ rex.b add %al, 0(%rip)
> +
> +        _ addb $1, 0(%rip)
> +        _ rex.b addb $1, 0(%rip)
> +
> +        _ addl $0x7f000001, 0(%rip)
> +        _ rex.b addl $0x7f000001, 0(%rip)
> +END(tests_rel4)
> +
> +DECL(tests_unsup)
> +
> +unsup_prefix: /* Prefixes unimplemented for simplicity. */
> +        _ vaddpd %zmm0, %zmm0, %zmm0 /* 0x62 EVEX */
> +        _ addr32 nop                 /* 0x67 Address size override */
> +        _ bextr $0, %eax, %eax       /* 0x8f XOP */
> +        _ bextr %eax, %eax, %eax     /* 0xc4 VEX3 */
> +        _ vaddpd %ymm0, %ymm0, %ymm0 /* 0xc5 VEX2 */
> +        n "jmpabs 0" .byte 0xd5, 0x00, 0xa1, 0x01, 0, 0, 0, 0, 0, 0, 0x80 /* 0xd5 REX2 */
> +        _ fadds (%rax)               /* 0xd8 ... 0xdf ESCAPE (x87) */
> +        _ femms                      /* 0x0f,0x0e ... 0x0f 3DNOW */
> +
> +unsup_branch:
> +1:
> +        _ loopne 1b
> +        _ loope  1b
> +        _ loop   1b
> +        _ jrcxz  1b
> +
> +opsize_branch: /* 66-prefixed branches are decoded differently by vendors */
> +        _ data16 call   other_section
> +        _ data16 jmp    other_section
> +        _ data16 jo     other_section
> +        _ data16 jno    other_section
> +        _ data16 jb     other_section
> +        _ data16 jae    other_section
> +        _ data16 je     other_section
> +        _ data16 jne    other_section
> +        _ data16 jbe    other_section
> +        _ data16 ja     other_section
> +        _ data16 js     other_section
> +        _ data16 jns    other_section
> +        _ data16 jp     other_section
> +        _ data16 jnp    other_section
> +        _ data16 jl     other_section
> +        _ data16 jge    other_section
> +        _ data16 jle    other_section
> +        _ data16 jg     other_section
> +        _ data16 xbegin other_section
> +
> +not_64bit: /* Not valid/encodable in 64bit mode */
> +        .code32
> +        _ push %es
> +        _ pop %es
> +        _ push %cs
> +        _ push %ss
> +        _ pop %ss
> +        _ push %ds
> +        _ pop %ds
> +        _ daa
> +        _ das
> +        _ aaa
> +        _ aas
> +        _ pusha
> +        _ popa
> +        _ bound %eax, (%eax)
> +        /*arpl %ax, %ax --> movsxd in 64bit mode */
> +        /* Grp1 */
> +        _ lcall $-1, $-1
> +        _ les (%eax), %eax
> +        _ lds (%eax), %eax
> +        _ into
> +        _ aam $0
> +        _ aad $0 /* Also REX2, also not supported */
> +        n "salc" .byte 0xd6
> +        _ ljmp $-1, $-1
> +        .code64

I'm not sure we want to test these. Any of them can gain meaning (like D5
now did as REX2, and like D6 was for L1OM). Yes, for now we don't support
e.g. REX2, but that can change.

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/macro-magic.h
> @@ -0,0 +1,52 @@
> +#ifndef X86_DECODE_LITE_LINKAGE_H
> +#define X86_DECODE_LITE_LINKAGE_H
> +
> +/* Start a 'struct test' array */
> +.macro start_arr aname
> +    .pushsection .data.rel.ro.\aname, "aw", @progbits
> +    .globl \aname
> +    .type \aname, STT_OBJECT
> +\aname:

No .align (or alike)?

> +    .popsection
> +
> +    /* Declare a macro wrapping \aname */
> +    .macro pushsection_arr
> +    .pushsection .data.rel.ro.\aname, "aw", @progbits
> +    .endm
> +.endm
> +
> +/* Macro 'n' to wrap the metadata of an instruction.  Name can be different. */
> +.macro n name:req insn:vararg
> +    /* Emit the instruction, with start & end markers. */
> +.Ls\@: \insn
> +.Le\@:
> +
> +    /* Emit \name as a string. */
> +    .pushsection .rosdata.str1, "aMS", @progbits, 1

.rodata.str1?

> +.Ln\@: .asciz "\name"
> +    .popsection
> +
> +    /* Emit an entry into the array. */
> +    pushsection_arr
> +    .quad .Ln\@, .Ls\@, .Le\@ - .Ls\@
> +    .popsection
> +.endm
> +
> +/* Macro '_' where the name is the instruction itself. */
> +.macro _ insn:vararg
> +    n "\insn" \insn

As agreed upon elsewhere, perhaps better to use a comma to separate the
arguments (and also macro parameters further up).

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/x86-emulate.h
> @@ -0,0 +1,27 @@
> +#ifndef X86_EMULATE_H
> +#define X86_EMULATE_H
> +
> +#include <assert.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <xen/asm/x86-defns.h>
> +#include <xen/asm/x86-vendors.h>
> +
> +#include <xen-tools/common-macros.h>
> +
> +#define ASSERT assert
> +
> +#define printk(...)
> +
> +#define likely
> +#define unlikely
> +#define cf_check
> +#define init_or_livepatch
> +#define init_or_livepatch_const
> +
> +#include "x86_emulate/x86_emulate.h"
> +
> +#endif /* X86_EMULATE_H */

Deliberately not re-using the test harness'es x86-emulate.h?

Jan

