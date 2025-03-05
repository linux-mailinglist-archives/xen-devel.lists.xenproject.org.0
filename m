Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE97A50177
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902322.1310272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppRe-000117-Cz; Wed, 05 Mar 2025 14:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902322.1310272; Wed, 05 Mar 2025 14:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppRe-0000zG-AN; Wed, 05 Mar 2025 14:09:58 +0000
Received: by outflank-mailman (input) for mailman id 902322;
 Wed, 05 Mar 2025 14:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppRd-0000z8-8v
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:09:57 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8400cc69-f9cb-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 15:09:56 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bc4b1603fso21524765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:09:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c16dsm18774595e9.6.2025.03.05.06.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:09:55 -0800 (PST)
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
X-Inumbo-ID: 8400cc69-f9cb-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741183795; x=1741788595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0XFZ2Ptg4ulL7EcjE0LONbQfbQUHARIrFRzFQHpeXA=;
        b=PIHLOtgQRXuzcawWyRGnI6B16hlVVW4b6sOW1soFp9pI6ef0XydAwNCq/JfRonoYbn
         Gzu1nKThlOEYmG4o5pl+MOwH6lAbgKUoWakpoVsUYtWtl18xCU1JENoCKkWZhblIDNOa
         etaHBMo6rNr/r535hymDyfqQ/VUm6WnApiyjMHCPvBJNA/O5kMQ8DpW2m/f9eAiMBV+O
         1PTzbO5BfpAYouC3M8nr7HxAQ77QtUsPS3XZtYlJINttXDKoSOUwldZ4uwvN7DBJPUsz
         7wH4d371Osjthiz2YA0k14p5lT9zemAy9uK9YqbLrMPfnBHCqnW1giMioyXVDy8KReU2
         KGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183795; x=1741788595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0XFZ2Ptg4ulL7EcjE0LONbQfbQUHARIrFRzFQHpeXA=;
        b=COvSTnhQQZzOv0cpcVfX9ny3rxT+EDYGMMBTowSWaERkIpEoN5tBsSv9ztIFYgJvVn
         Y4XbYeDUe4tj49hsl9l/9w0iJYLqtVkPpAF8yHP6R4Ll5ctdIwkbdsl1/oP/mJnH0Jj+
         iRkxD78DEwAgq/Pw4BGKFkP+4MmDSaGZd3fRjvL8V9/t8DmoN7Wxrz7/Sb5EaVbbW5zb
         ueJOlZ1Xa90bmWFdaCkEo+VeLrFO+JGCFBrfeKNL2F0p4Zf5AP6n2f3oXZh7nSAsEXf/
         69P9nlmwonvR16P5b9tnusLWUhNmLaWgyeu4NWKaU9PIJ6VE6XrGK+TLzDehpzMT58au
         vkVA==
X-Forwarded-Encrypted: i=1; AJvYcCWFRRljYhlasDuDnC2q9on04gMCqYjijeboaZZpezHGJrJxpJMESXPY4mrX4/0kGMQ5gopX5jGikfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZh5QJBuWfM3rLoZlVavvZKl26WiBV8t7eGi0PKlIIIdpZhq1l
	TQ8B19/gcjJjrwkYXVFZTQB83DIQDy/uyk0SLdwLsmNBySYN8Ckh0ykDuP2Lbg==
X-Gm-Gg: ASbGncv5BOPDjdfQ341lOaPPFwjy0yWvTA9E/QSQpCeVLJ9yvuVz4on82QzFRRkIlK4
	QhlcchGjmH2gZ26jNAgBRDRYcrllww0varOphAUnbtf+TYLE1idTnX2IsyoWDRNmQp8ZZCRBY+a
	0TfHPxWcYzqKZNSxI7YFTc9y05LuUEKEwOESQqS1hYOBPbpkHVHG6wp7uVKWA+19XEyDuuSIBrS
	OzqwoGBaJikKNRNmmuxVxAwmKxP6Xi2Cnnq7412xJDT3z55xmQ5TDppCpqcQW87VzZou4FIGc3o
	FwdpVxrLswVL4phkr6bCYaGledm2ui5wE58XFniRaBaFIZSJJrH983+s0JmfhG4B4eRmDu2k9mV
	qiaKi2NsXvXfxKsUtaVBsrB6rgH1Z7g==
X-Google-Smtp-Source: AGHT+IH3cupE7rMepLIA2zUNd0bETKlAKXyeJPI7ZuCTeKj7eFrSyORToR8OcIOLw9hWopfBmS4cdQ==
X-Received: by 2002:a05:6000:2ac:b0:391:1473:134e with SMTP id ffacd0b85a97d-3911f725c6amr2247512f8f.5.1741183795448;
        Wed, 05 Mar 2025 06:09:55 -0800 (PST)
Message-ID: <3d183a5b-008a-4985-bc94-1fb5dd93af7c@suse.com>
Date: Wed, 5 Mar 2025 15:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/IDT: Generate bsp_idt[] at build time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
 <20250305000247.2772029-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250305000247.2772029-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 01:02, Andrew Cooper wrote:
> ... rather than dynamically at boot time.  Aside from less runtime overhead,
> this approach is less fragile than the preexisting autogen stubs mechanism.
> 
> We can manage this with some linker calculations.  See patch comments for full
> details.
> 
> For simplicity, we create a new set of entry stubs here, and clean up the old
> ones in the subsequent patch.  bsp_idt[] needs to move from .bss to .data.
> 
> No functional change yet; the boot path still (re)writes bsp_idt[] at this
> juncture.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v2:
>  * Shuffle semicolon position
>  * Eclair magic comment for multi-include files
> 
> There's something differnet about LLD vs LD.  Without the ABSOLUTE() in
> gen-idt.lds.h, LD is fine but LLD puts out symbols in the form:
> 
>   x86_IDT_entry_0xff_ADDR1|0000000000002fb0|   t  |            NOTYPE|                |     |.text
>   x86_IDT_entry_0xff_ADDR2|0000000000004020|   a  |            NOTYPE|                |     |*ABS*
> 
> which causes a slew of errors making symbols for xen-syms:
> 
>   .xen-syms.0.S:20:8: error: out of range literal value
>    .long 0x15a0 - (((((((261 >> 8) * 0xffff000000000000) | (261 << 39))) + ((1 << 39) / 2)) + (64 << 30)) + (1 << 30))
>          ^
> 
> owing to half the symbols being t rather than a.  Moreover, this is reliable
> for the full FreeBSD builds, but interminttent on randconfig.  I haven't
> figured out which other option is having an effect.
> 
> Forcing them all to absolute works in both toolchains.

Just to double-check: Making these symbols absolute does not collide with
the .reloc section generation that we do for xen.efi, does it? That is, the
absence of relocations for the IDT merely means that we must not use the
IDT or any of its entries prior to relocating Xen back to its linked
addresses. Or, if e.g. we fetched an entry's address from the IDT earlier
on, we'd need to be aware that it's the linked address we fetch, not the
one matching where we execute. If that's a correct understanding of mine
and also matches your intentions:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

