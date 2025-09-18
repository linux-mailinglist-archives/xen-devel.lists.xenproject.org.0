Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58555B85CCC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 17:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126330.1467946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGxh-0006Jl-3e; Thu, 18 Sep 2025 15:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126330.1467946; Thu, 18 Sep 2025 15:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGxh-0006IH-0y; Thu, 18 Sep 2025 15:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1126330;
 Thu, 18 Sep 2025 15:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzGxe-0006IB-U6
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 15:54:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9111be2-94a7-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 17:54:13 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso372581f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 08:54:13 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff437784sm2630563a12.47.2025.09.18.08.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 08:54:12 -0700 (PDT)
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
X-Inumbo-ID: b9111be2-94a7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758210853; x=1758815653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhSMs68KB4zvHKuNzIr4t9C+2trQhoZOnppeZF8v5wk=;
        b=ASkql0cCjb9FaQDBtucwJqyD6toAVjIy/iZU+9AQdVU7AlFTy3kUHVg8z7CuSGmb/A
         ZU9hvtyRSQa4QkGvLtSdScZfgRZ6DDYLxBXWtApvnqQINf1/Cio6UQQbWX6YWmm2RCAp
         Hkl1uiTb5arh6QCtMN/0YxjvtUhdW2jkvklC5cNfO5PNLAdTqZiaKahZblNczVGm17hh
         /cKwb1N7Q4tCsIfymVsu6MfxN4NPTBqUxQ0z4Rg2y4g0kUOAEpMbPDRubkoFN2R11g3D
         zFn8LoIzHNpACQRD1yLshluPaDp+I3USbny/8pQZU69LEk+OIExml8Wo4+ajWiesMOLs
         rckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210853; x=1758815653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhSMs68KB4zvHKuNzIr4t9C+2trQhoZOnppeZF8v5wk=;
        b=hkJnFTqlbQJxoTLnyOLIFzOb6gH++a6Y0SHuebRZZhky3eLTtSlfG1v2M2W/rgDewS
         cOlEj0fgUuzQ/knTkAOXtx9z+sDCHkPRqSWwQMIwR47GEbKLdeAds4eNud9lJSzOnbl7
         kgvPyg1SbnbPsgDiFqa1Tp3d8/pweBvP7/wj2oEGOyPWkl5wcXjMAbgJwIMrvd6SUwTe
         KQfl8JkeM8VtEgJR6dib/zHQ8f2/P/sJYTUtdURc59f9qs28YXTIgA4f6f1dQpC2kxje
         Ly4jlOzMnTpI9GuCc06pjwJfr3Tz2O3nDo8DiQn5SlCD18oA9qKO2J2vjZxf8AnKxssz
         IysA==
X-Forwarded-Encrypted: i=1; AJvYcCW1yB1uHCmq9QjGfaR6ED+UPsW5wf0Ar2FzsZRwFUypu2y6gFGPps1kx5oHvQ8uL8polm06+B8mpzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPaMh5/AfBeHR9Z04gpbm7Im8p+aQBWBhUchfNwsGNaLdFTY7V
	hXVLgBrCC7Za3V5r4iD8z7cUb2DI3UZQdElM42VvVrlcMRHgCTU4mYSswanBWYCUDg==
X-Gm-Gg: ASbGncsY7clx9EBBcSWJyVWc2kBaREkCrikgz4JI1dLReUd9yUs0YWsHiN1KznoJ+u5
	sZkZ5mjFmayj8/RzJKMYMNLp1cyJPcBjZz9WcF7RmiTy31MNDAJP16pguRoIupqtwsDAL+OYfa0
	H1y0zv45WnAlQ8qZqQb0LmxY05Cy8BG7J4gVrwfq+LwLJmCHnbOkYg0/p2C7mjMfU2/fdoKmDpv
	Q+rsEoU5ILERWTdMHllGQU6W4smVuyPta6plQCIevqgPDzh/tBC0mUvKW71g+3I2puWsuK6KPh/
	Ll1e8l1gLNaQYKzny2VwFfoMTTOK7scxKwY7M/iYZ8riCnFdnEh0O+qNabXWHodQhlQ9PzER4Wa
	RyZfrEVnAcKa8r0BQ0E4htsBzTj53ar6sN75hEZnCVhdXM6/VXA==
X-Google-Smtp-Source: AGHT+IGYj8uD0vI2ehpiu8cFKj9q3CPXxcsGgjFLOvWZ9CjSc7N3Fo8eOzW5QbvEh6b2PFLTUdxfpA==
X-Received: by 2002:adf:a3cd:0:b0:3ee:11d1:2a1e with SMTP id ffacd0b85a97d-3ee11d13550mr1946442f8f.10.1758210852802;
        Thu, 18 Sep 2025 08:54:12 -0700 (PDT)
Message-ID: <b7fa50ae-8094-4451-8326-53c975f7b441@suse.com>
Date: Thu, 18 Sep 2025 17:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] xen/riscv: detect and initialize G-stage mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/p2m.c
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/macros.h>
> +#include <xen/sections.h>
> +
> +#include <asm/csr.h>
> +#include <asm/flushtlb.h>
> +#include <asm/riscv_encoding.h>
> +
> +unsigned long __ro_after_init gstage_mode;
> +
> +void __init gstage_mode_detect(void)
> +{
> +    unsigned int mode_idx;
> +
> +    const struct {

static and __initconst.

> +        unsigned long mode;

Here and also for the global var: Why "long", when it's at most 4 bits?

> +        unsigned int paging_levels;
> +        const char *name;

More efficiently char[8]?

> +    } modes[] = {
> +        /*
> +         * Based on the RISC-V spec:
> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32,

The use of "other" is lacking some context here.

> +         *   a paged virtual-memory scheme described in Section 10.3.

Section numbers tend to change. Either to disambiguate by also spcifying
the doc version, or (preferably) you give the section title instead.

> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
> +         *   Sv39, Sv48, and Sv57.
> +         */
> +#ifdef CONFIG_RISCV_32
> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
> +#else
> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
> +#endif
> +    };
> +
> +    gstage_mode = HGATP_MODE_OFF;
> +
> +    for ( mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
> +    {
> +        unsigned long mode = modes[mode_idx].mode;
> +
> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
> +
> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
> +        {
> +            gstage_mode = mode;
> +            break;
> +        }
> +    }
> +
> +    if ( gstage_mode == HGATP_MODE_OFF )
> +        panic("Xen expects that G-stage won't be Bare mode\n");
> +
> +    printk("%s: G-stage mode is %s\n", __func__, modes[mode_idx].name);

I don't think the function name matters here at all.

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -22,6 +22,7 @@
>  #include <asm/early_printk.h>
>  #include <asm/fixmap.h>
>  #include <asm/intc.h>
> +#include <asm/p2m.h>
>  #include <asm/sbi.h>
>  #include <asm/setup.h>
>  #include <asm/traps.h>
> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      console_init_postirq();
>  
> +    gstage_mode_detect();

I find it odd for something as fine grained as this to be called from top-
level start_xen(). Imo this wants to be a sub-function of whatever does
global paging and/or p2m preparations (or even more generally guest ones).

Jan

