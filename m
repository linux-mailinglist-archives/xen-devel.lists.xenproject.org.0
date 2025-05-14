Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9FAB6E9C
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984428.1370573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDWU-0000lU-Oj; Wed, 14 May 2025 14:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984428.1370573; Wed, 14 May 2025 14:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDWU-0000iT-Ki; Wed, 14 May 2025 14:55:54 +0000
Received: by outflank-mailman (input) for mailman id 984428;
 Wed, 14 May 2025 14:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/Iz=X6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFDWT-0000iN-SU
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:55:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 881ae6bb-30d3-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 16:55:53 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a1b8e8b2b2so3845501f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:55:53 -0700 (PDT)
Received: from [10.81.43.161] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f28f7sm19715832f8f.41.2025.05.14.07.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 07:55:51 -0700 (PDT)
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
X-Inumbo-ID: 881ae6bb-30d3-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747234552; x=1747839352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9TtX17OyTAXFFybJLHpCO/hSZpr2EGnj/QvLJiIkJpo=;
        b=MpEZ0F88GPwVDI2QRSXrYy89Y49pOOX1mgC3ECgB1HRy8xxLteptS7+xnB00WP0OmO
         fdxOAHdbL0AL75WEL3DcE9quIU9r+3A12rFs/9sfwxqZma4ylQ9h6lcdJFMtOu0lxvAO
         KWo5yfO0o2/WxufGjjAfAbGFu1qkN561c+JfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234552; x=1747839352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TtX17OyTAXFFybJLHpCO/hSZpr2EGnj/QvLJiIkJpo=;
        b=ZSy/noOSMrqoLwuJHQL/bAcqes7I8wC7wwz8zrHKfujhkIQuTebISESY3aICVTpxoI
         6DOH8nM+IljO87DWGqWJfqTZlVHtPWeIqqSAiuX/3uMVVu42xt084DVxfH0WPX3auf6M
         KYBjSYXirFIC5fnHDG6Lrk13dKbkJkL8jd3RmF8r9qeFTB3alkI/cGsOTXFlzLJexNwP
         lzGUGoVXRia57g6V+7JAm+Pbl0hiitaDzF+DCP5K/1Fu1JotPSyLdkHHbc0oIXYTo4Xi
         fbEH0Vk8nVr6XHcTZLvAQ2RUweLWlwMZBoRXusXaPM5RPuSc3LJ6kj0vF3cqYFEEWpdj
         6AGw==
X-Forwarded-Encrypted: i=1; AJvYcCXnHcX82BJXZMVkYuxPoqwBZ+wRbO8ibfgKKQgvuWyJr9IPXNy9EG0WD50D7jclHZFD9w8yiiuCtnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyATTMbzw+yaFNCVxp7n0S4tneCamCzwUziIxMvQaqNzIenxpVs
	GftcnurHQYX3TvhCUjMNoX+liPz5TexP0LmTVCXUmCZy5xhyMkVF5Muz8pAgJ8U=
X-Gm-Gg: ASbGncuAWvO3FvsNoBclvsNf3dimRA+MMQB9ytf+odE7jXN+9FwRUPznZm/zF5yRYXk
	mtRF9XoaaBslx2jx3sgnCZNZ1G0HDWww9UPwKh/ufExlggFXCyO5BoGHjsFFiQfg5I6gMQnEDHT
	uTIJAsuIM8wty5t9jmX5iOcdjluaEaXPIipXSU2FoFask6N2zEjz21fYAkcrOHTkQAQc/YJKNMh
	jHUV/V6QSi172d2P7mpsg9bNji4YsuR4TgMRu++sMs8ZwXd0OroOA6RtTH0cQupmC4jd6AlewlS
	qjVRJes/FaOhN1YBxKfT+ln1tqIkvRiQx4yv4WbcudhTQnewwp5/kcHLJmE8Wg==
X-Google-Smtp-Source: AGHT+IEysw4tsW8QvPsyJHgl0/T+/Xsy/I6JuU7dKncQ4UEbd7qYR8wCWHTM3HljkJTiJ0O5au/EDA==
X-Received: by 2002:a05:6000:c08:b0:3a3:4ba4:e8ac with SMTP id ffacd0b85a97d-3a34ba4e906mr1543256f8f.8.1747234552394;
        Wed, 14 May 2025 07:55:52 -0700 (PDT)
Message-ID: <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
Date: Wed, 14 May 2025 15:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2025 6:05 pm, Sergii Dmytruk wrote:
> diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
> new file mode 100644
> index 0000000000..07be43f557
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -0,0 +1,277 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +

Please have at least a one-liner introduction to what TXT is.  Is there
a stable URL for the TXT spec?  (I can't spot an obvious one, googling
around)

> +#ifndef ASM__X86__INTEL_TXT_H
> +#define ASM__X86__INTEL_TXT_H

I realise this is what the documentation currently says, but we're just
in the process of finalising some changes.  Please make this
X86_INTEL_TXT_H.

> +
> +/*
> + * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
> + */
> +#define TXT_PUB_CONFIG_REGS_BASE        0xfed30000U
> +#define TXT_PRIV_CONFIG_REGS_BASE       0xfed20000U
> +
> +/*
> + * The same set of registers is exposed twice (with different permissions) and
> + * they are allocated continuously with page alignment.
> + */
> +#define NR_TXT_CONFIG_SIZE \
> +    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)

Commit message needs to note that you're swapping NR_TXT_CONFIG_PAGES
for NR_TXT_CONFIG_SIZE, hence the change in logic in
tboot_protect_mem_regions().

> +#ifndef __ASSEMBLY__
> +
> +/* Need to differentiate between pre- and post paging enabled. */
> +#ifdef __EARLY_SLAUNCH__
> +#include <xen/macros.h>
> +#define _txt(x) _p(x)
> +#else
> +#include <xen/types.h>
> +#include <asm/page.h>   // __va()
> +#define _txt(x) __va(x)
> +#endif

I have to admit that I'm rather suspicious of this, but I'm going to
have to wait to see later patches before making a suggestion.  (I highly
suspect we'll want a fixmap entry).

> +
> +/*
> + * Always use private space as some of registers are either read-only or not
> + * present in public space.
> + */
> +static inline uint64_t read_txt_reg(int reg_no)

unsigned int reg

I'd be tempted to name it simply txt_read().  I don't think the extra
"_reg" is a helpful suffix, and it makes the APIs consistent with
txt_reset().  But I expect others may have opinions here.

> +{
> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> +    return *reg;
> +}
> +
> +static inline void write_txt_reg(int reg_no, uint64_t val)
> +{
> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> +    *reg = val;
> +    /* This serves as TXT register barrier */
> +    (void)read_txt_reg(TXTCR_ESTS);

What is this barrier for?

It's not for anything in the CPU side of things, because UC accesses are
strictly ordered.

I presume it's for LPC bus ordering then, but making every write be a
write/read pair seems very expensive.

> +}
> +
> +static inline void txt_reset(uint32_t error)
> +{
> +    write_txt_reg(TXTCR_ERRORCODE, error);
> +    write_txt_reg(TXTCR_CMD_NO_SECRETS, 1);
> +    write_txt_reg(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
> +    write_txt_reg(TXTCR_CMD_RESET, 1);
> +    while (1);

for ( ;; )
    cpu_relax();

please.

Will the write to CMD_RESET try to initiate a platform reset, or will we
just hang here forever?


> +/*
> + * Functions to extract data from the Intel TXT Heap Memory. The layout
> + * of the heap is as follows:
> + *  +------------------------------------+
> + *  | Size of Bios Data table (uint64_t) |
> + *  +------------------------------------+
> + *  | Bios Data table                    |
> + *  +------------------------------------+
> + *  | Size of OS MLE table (uint64_t)    |
> + *  +------------------------------------+
> + *  | OS MLE table                       |
> + *  +--------------------------------    +
> + *  | Size of OS SINIT table (uint64_t)  |
> + *  +------------------------------------+
> + *  | OS SINIT table                     |
> + *  +------------------------------------+
> + *  | Size of SINIT MLE table (uint64_t) |
> + *  +------------------------------------+
> + *  | SINIT MLE table                    |
> + *  +------------------------------------+
> + *
> + *  NOTE: the table size fields include the 8 byte size field itself.
> + */
> +static inline uint64_t txt_bios_data_size(void *heap)
> +{
> +    return *((uint64_t *)heap) - sizeof(uint64_t);
> +}

This is quite horrible, but I presume this is as specified by TXT?

To confirm, it's a tightly packed data structure where each of the 4
blobs is variable size?  Are there any alignment requirements on the
table sizes?  I suspect not, given the __packed attributes.

> diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
> index d5db60d335..8a573d8c79 100644
> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -15,6 +15,7 @@
>  #include <asm/tboot.h>
>  #include <asm/setup.h>
>  #include <asm/trampoline.h>
> +#include <asm/intel-txt.h>
>  
>  #include <crypto/vmac.h>

I'll send a prep patch to fix tboot.c, but we're trying to keep includes
sorted (for sanity of backports).

~Andrew

