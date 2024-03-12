Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065D8791E6
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691735.1077999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzJS-00056b-B3; Tue, 12 Mar 2024 10:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691735.1077999; Tue, 12 Mar 2024 10:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzJS-00054W-7n; Tue, 12 Mar 2024 10:24:50 +0000
Received: by outflank-mailman (input) for mailman id 691735;
 Tue, 12 Mar 2024 10:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiV3=KS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rjzJQ-00054Q-J0
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:24:48 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf63d273-e05a-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 11:24:46 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-42f2009e559so39169471cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:24:46 -0700 (PDT)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05622a144d00b0042f09f01fc5sm3605042qtx.59.2024.03.12.03.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 03:24:44 -0700 (PDT)
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
X-Inumbo-ID: bf63d273-e05a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710239085; x=1710843885; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g10mt9fmav6B3gWf5WI149xekOm7KtFu5UaQ24GsQBw=;
        b=uD3+0pqNYHEPaC82S7n/3Q7Lqu0srJjx5DkqLdSqToxhCJPJpk6lxIA0MPec/DJU73
         1yDosnxwv10AS0r5Cs3b6Rp7539I7qj7CYW5Br8elvYktimB7plj7ZQWaXXtz/PErLcH
         vAh8SwsjyOszwDJyBRglKJGaQWEmKcaTpzH6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710239085; x=1710843885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g10mt9fmav6B3gWf5WI149xekOm7KtFu5UaQ24GsQBw=;
        b=qalCHE9QT/oaZhWcTh8eaFgTuhq5P+zII/vVMvw4LGF2K2GPlc13RLLowSIovZMnVQ
         rR5yVMFPDX/RIeobDzzXyBkq+Yb0B00MMUr+5yYJEoHQsi3DfJ4/EBuXuEtWqQUDfI9w
         XLnGTDR+eTmrTAvJCmPED+piCc8D4PZqZzSLRlj9PfSYpzfYTl1s0KEYjmVLsrzRM9Us
         L+z4MeZ30fd7yujWK8P7b+0vCp5Teu5poBJt9UR/1q5gPyLq6HN52aiXlJnh/c2SnP5X
         PdJ5G355qgIAaJQShcK4hQT6drn5L3d1/7amdcErxH6I6IzlX8oGJbyPpKYYQQ0O6ush
         O2wQ==
X-Gm-Message-State: AOJu0YyXeDe687QvnrTe/1kFPKjDcdDWtt50Lh/HleP9/fOqABeZv0qk
	tbP1bcPC/MUfkrrU9og0z9R5ccAoDf1Usu9X5IB7TTzPITzQvlxkNXNxD31o2tc=
X-Google-Smtp-Source: AGHT+IFjUZa2g+oIG3wLAueq51RDtTCE+l7Oc6t/FV3WT6CSsP6dAm+9JZ+Xd2D5rECyFfTT060u5w==
X-Received: by 2002:ac8:5c02:0:b0:42e:fa89:14b7 with SMTP id i2-20020ac85c02000000b0042efa8914b7mr14610904qti.15.1710239085226;
        Tue, 12 Mar 2024 03:24:45 -0700 (PDT)
Date: Tue, 12 Mar 2024 11:24:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Message-ID: <ZfAtahcXWGqckQFW@macbook>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311203431.342530-1-marmarek@invisiblethingslab.com>

On Mon, Mar 11, 2024 at 09:33:11PM +0100, Marek Marczykowski-Górecki wrote:
> The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
> map. This should be true for addresses coming from the firmware, but
> when extra pages used by Xen itself are included in the mapping, those
> are taken from usable RAM used. Mark those pages as reserved too.
> 
> Not marking the pages as reserved didn't caused issues before due to
> another a bug in IOMMU driver code, that was fixed in 83afa3135830
> ("amd-vi: fix IVMD memory type checks").
> 
> Failing to reserve memory will lead to panic in IOMMU setup code. And
> not including the page in IOMMU mapping will lead to broken console (on
> due to IOMMU faults). Handling failure with panic() isn't the most user
> friendly thing, but at this stage the alternative would require undoing
> a lot of console init. Since the user can do it much easier - by simply
> not enabling xhci console next time, say that and panic.
> 
> Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the XHCI"
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> As an alternative implementation I have considered changing
> iommu_get_extra_reserved_device_memory() to modify memory map. But that
> may hide (or cause) some other issues when this API will gain some more
> users in the future.
> 
> The reserve_e820_ram() is x86-specific. Is there some equivalent API for
> ARM, or maybe even some abstract one? That said, I have no way to test
> XHCI console on ARM, I don't know if such hardware even exists...
> ---
>  xen/arch/x86/setup.c        |  3 +++
>  xen/drivers/char/xhci-dbc.c | 22 ++++++++++++++++++++++
>  xen/include/xen/serial.h    |  2 ++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index a21984b1ccd8..8ab89b3710ed 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>                                    RANGESETF_prettyprint_hex);
>  
> +    /* Needs to happen after E820 processing but before IOMMU init */
> +    xhci_dbc_uart_reserve_ram();

Overall it might be better if some generic solution for all users of
iommu_add_extra_reserved_device_memory() could be implemented, but I'm
unsure whether the intention is for the interface to always be used
against RAM.

>      xsm_multiboot_init(module_map, mbi);
>  
>      /*
> diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
> index 3bf389be7d0b..e31f3cba7838 100644
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -31,6 +31,9 @@
>  #include <asm/io.h>
>  #include <asm/string.h>
>  #include <asm/system.h>
> +#ifdef CONFIG_X86
> +#include <asm/e820.h>
> +#endif
>  
>  /* uncomment to have dbc_uart_dump() debug function */
>  /* #define DBC_DEBUG 1 */
> @@ -1426,6 +1429,25 @@ void __init xhci_dbc_uart_init(void)
>      }
>  }
>  
> +void __init xhci_dbc_uart_reserve_ram(void)
> +{
> +    struct dbc *dbc = &dbc_uart.dbc;

const.  Or seeing as it's used only once you could just use
dbc_uart.dbc.enable.

> +
> +    if ( !dbc->enable )
> +        return;
> +
> +#ifdef CONFIG_X86
> +    if ( !reserve_e820_ram(
> +            &e820,
> +            virt_to_maddr(&dbc_dma_bufs),
> +            virt_to_maddr(&dbc_dma_bufs) + sizeof(dbc_dma_bufs) - 1) )

It would be best to align this up:
PAGE_ALIGN(virt_to_maddr(&dbc_dma_bufs) + sizeof(dbc_dma_bufs))

The '- 1' is wrong, as reserve_e820_ram() expects a non-inclusive end
parameter.

> +        panic("Failed to reserve XHCI DMA buffers (%"PRIx64"-%"PRIx64"), "

We usually represent inclusive memory ranges as "[%lx, %lx]".

> +              "disable xhci console to work around\n",
> +              virt_to_maddr(&dbc_dma_bufs),
> +              virt_to_maddr(&dbc_dma_bufs) + sizeof(dbc_dma_bufs) - 1);
> +#endif
> +}

Won't it be best to make the whole function guarded by CONFIG_X86? So
that attempts to use it on !X86 will get a build failure and clearly
notice some work is needed in order to use the function on other
arches?

Thanks, Roger.

