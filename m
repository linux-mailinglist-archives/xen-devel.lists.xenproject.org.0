Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190538136D
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 23:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127592.239820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhfks-0003zI-IV; Fri, 14 May 2021 21:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127592.239820; Fri, 14 May 2021 21:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhfks-0003wa-FL; Fri, 14 May 2021 21:53:58 +0000
Received: by outflank-mailman (input) for mailman id 127592;
 Fri, 14 May 2021 21:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhtO=KJ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lhfkq-0003wU-K1
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 21:53:56 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40890c1f-8e7b-43c0-95e5-e590480fa95a;
 Fri, 14 May 2021 21:53:55 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id 69so121687plc.5
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 14:53:55 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::1? ([2601:1c2:4f80:d230::1])
 by smtp.gmail.com with ESMTPSA id d23sm4742563pfo.80.2021.05.14.14.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 14:53:54 -0700 (PDT)
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
X-Inumbo-ID: 40890c1f-8e7b-43c0-95e5-e590480fa95a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZdmFyIX342j4rEeA8lF7p7/HHeBCV5GocOzzYwKVt5I=;
        b=XRa89AgGsiP0mC8r5JL33/pw1by/n2TyWpVmoCmbmKB6uk798YDa6O4FGv5Jods4EC
         2gXgPgt6stQEc6ODhCtmy/vZyUSyYClt133dgpuYu0DhOVFfEIOJpT+JTBic4lwGFNuR
         YAbb8O3lM9mkkYqZgz1B0Y+0yDNBQxcpV89tlmJOWuaDTHOdp5QS/Cy1XFfIrL4DG99G
         iFpoYysl8rKppE6EE3m7yNwDUG+VpuQYSuifO13Mauun1UEOVfcFTny3CZxyVQbhH1Wd
         1bgTYJanO1uXdMazeMNugUzmTVXZmBFx6VcmoGv/XdmYhsAbBkvFxt/QnkhrovB8z3/m
         FshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZdmFyIX342j4rEeA8lF7p7/HHeBCV5GocOzzYwKVt5I=;
        b=S0xSzTxRimnbdcb2RZ93dwvaCud+3cf1dXrIH2JtYqzApNChk3UOL/JrH1ZvIJ+4N4
         C/Nfxef/9cA2Fvf+UKNX5iK5TSXvKU/zWh9jhl8jV/1CSzl8I5NZT9/d2y/NQO9GUvW8
         RUDa5jOzH23EsxnLqVPJoX/Wrnf+VIf/8JPMqaR+3BcE+FrREEe99TOo2KDoaF+Tebds
         n5gMwvS5MC8Zca7NtonN1MWckXDHxAMFXgyFoT8xMkswhiAR5oam6ffYz34vco455yUv
         /8H9A552LF3mpjs5QRHE/pf7bw8iK0W7Y5QbIloNorg1wdmOSMmDXOUGTt9v4WkygxCX
         EGMQ==
X-Gm-Message-State: AOAM530GUjNNFnDCF+tGyUqxr21g7mHCPf98QPL2U4Ta6Pieul0y3518
	tUFn6LDOPdFd0+wmlpzLtOQ=
X-Google-Smtp-Source: ABdhPJysIpxQUCbSJQdoFOhbYkU6zLJQoQzNtjho4BBD1T05Wzk7OUYvY3csmqaNBBSYpb/CF947oA==
X-Received: by 2002:a17:902:e00e:b029:ef:5f1c:18a8 with SMTP id o14-20020a170902e00eb02900ef5f1c18a8mr21109264plo.38.1621029234996;
        Fri, 14 May 2021 14:53:54 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1621017334.git.connojdavis@gmail.com>
 <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <97815ecd-7335-9c85-5df8-802ed119d518@gmail.com>
Date: Fri, 14 May 2021 14:53:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/14/21 11:53 AM, Connor Davis wrote:
> Add arch-specific makefiles and configs needed to build for
> riscv64. Also add a minimal head.S that is a simple infinite loop.
> head.o can be built with
> 
> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=head.o
> 

I recently realized that the Linux kernel build uses `ARCH=riscv`
with 32 vs 64 being differentiated by Kconfig opts (and __riscv_xlen).
I think `riscv64` was inherited by `arm64`.  This is something I'd
like to eventually change the Xen build to (i.e.,
`XEN_TARGET_ARCH=riscv make`) would it be possible for us to get that
in this series?

...

> diff --git a/xen/include/asm-riscv/config.h b/xen/include/asm-riscv/config.h
> new file mode 100644
> index 0000000000..84cb436dc1
> --- /dev/null
> +++ b/xen/include/asm-riscv/config.h
> @@ -0,0 +1,110 @@
> +/******************************************************************************
> + * config.h
> + *
> + * A Linux-style configuration list.
> + */
> +
> +#ifndef __RISCV_CONFIG_H__
> +#define __RISCV_CONFIG_H__
> +

...

> +
> +#ifdef CONFIG_RISCV_64
> +
> +/*
> + * RISC-V Layout:
> + *   0x0000000000000000 - 0x0000003fffffffff (256GB, L2 slots [0-255])
> + *     Unmapped
> + *   0x0000004000000000 - 0xffffffbfffffffff
> + *     Inaccessible: sv39 only supports 39-bit sign-extended VAs.
> + *   0xffffffc000000000 - 0xffffffc0001fffff (2MB, L2 slot [256])
> + *     Unmapped
> + *   0xffffffc000200000 - 0xffffffc0003fffff (2MB, L2 slot [256])
> + *     Xen text, data, bss
> + *   0xffffffc000400000 - 0xffffffc0005fffff (2MB, L2 slot [256])
> + *     Fixmap: special-purpose 4K mapping slots
> + *   0xffffffc000600000 - 0xffffffc0009fffff (4MB, L2 slot [256])
> + *     Early boot mapping of FDT
> + *   0xffffffc000a00000 - 0xffffffc000bfffff (2MB, L2 slot [256])
> + *     Early relocation address, used when relocating Xen and later
> + *     for livepatch vmap (if compiled in)
> + *   0xffffffc040000000 - 0xffffffc07fffffff (1GB, L2 slot [257])
> + *     VMAP: ioremap and early_ioremap
> + *   0xffffffc080000000 - 0xffffffc13fffffff (3GB, L2 slots [258..260])
> + *     Unmapped
> + *   0xffffffc140000000 - 0xffffffc1bfffffff (2GB, L2 slots [261..262])
> + *     Frametable: 48 bytes per page for 133GB of RAM
> + *   0xffffffc1c0000000 - 0xffffffe1bfffffff (128GB, L2 slots [263..390])
> + *     1:1 direct mapping of RAM
> + *   0xffffffe1c0000000 - 0xffffffffffffffff (121GB, L2 slots [391..511])
> + *     Unmapped
> + */
> +
What is the benefit of moving the layout up to 0xffffffc000000000?

-- 
Bobby Eshleman
SE at Vates SAS

