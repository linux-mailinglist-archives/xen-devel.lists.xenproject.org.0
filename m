Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9C6524BF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 17:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467203.726232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fbV-0002UU-Ba; Tue, 20 Dec 2022 16:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467203.726232; Tue, 20 Dec 2022 16:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fbV-0002SQ-8h; Tue, 20 Dec 2022 16:36:33 +0000
Received: by outflank-mailman (input) for mailman id 467203;
 Tue, 20 Dec 2022 16:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAKX=4S=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1p7fbT-0002SK-IX
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 16:36:31 +0000
Received: from ppsw-40.srv.uis.cam.ac.uk (ppsw-40.srv.uis.cam.ac.uk
 [131.111.8.140]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74494d17-8084-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 17:36:30 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47772)
 by ppsw-40.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1p7fbM-000CFD-LO (Exim 4.96) (return-path <amc96@srcf.net>);
 Tue, 20 Dec 2022 16:36:24 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5F42B1FB8D;
 Tue, 20 Dec 2022 16:36:24 +0000 (GMT)
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
X-Inumbo-ID: 74494d17-8084-11ed-8fd4-01056ac49cbb
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <07db6af0-c5d9-56a8-0536-60d850915de2@srcf.net>
Date: Tue, 20 Dec 2022 16:36:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Demi Marie Obenour <demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <24461a6b-b118-aad9-6407-d215d07a2924@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v5 11/10] hvmloader: use memory type constants
In-Reply-To: <24461a6b-b118-aad9-6407-d215d07a2924@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2022 4:13 pm, Jan Beulich wrote:
> Now that we have them available in a header which is okay to use from
> hvmloader sources, do away with respective literal numbers and silent
> assumptions.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/firmware/hvmloader/cacheattr.c
> +++ b/tools/firmware/hvmloader/cacheattr.c
> @@ -22,6 +22,8 @@
>  #include "util.h"
>  #include "config.h"
>  
> +#include <xen/asm/x86-defns.h>
> +
>  #define MSR_MTRRphysBase(reg) (0x200 + 2 * (reg))
>  #define MSR_MTRRphysMask(reg) (0x200 + 2 * (reg) + 1)
>  #define MSR_MTRRcap          0x00fe
> @@ -71,23 +73,32 @@ void cacheattr_init(void)
>  
>      addr_mask = ((1ull << phys_bits) - 1) & ~((1ull << 12) - 1);

Does this want to be PAGE_SHIFT ?

>      mtrr_cap = rdmsr(MSR_MTRRcap);
> -    mtrr_def = (1u << 11) | 6; /* E, default type WB */
> +    mtrr_def = (1u << 11) | X86_MT_WB; /* E, default type WB */
>  
>      /* Fixed-range MTRRs supported? */
>      if ( mtrr_cap & (1u << 8) )
>      {
> +#define BCST2(mt) ((mt) | ((mt) << 8))
> +#define BCST4(mt) (BCST2(mt) | (BCST2(mt) << 16))
> +#define BCST8(mt) (BCST4(mt) | ((uint64_t)BCST4(mt) << 32))

IMO this is clearer as

#define BCST8(mt) ((mt) * 0x0101010101010101ULL)

which saves several macros.

>          /* 0x00000-0x9ffff: Write Back (WB) */
> -        content = 0x0606060606060606ull;
> +        content = BCST8(X86_MT_WB);
>          wrmsr(MSR_MTRRfix64K_00000, content);
>          wrmsr(MSR_MTRRfix16K_80000, content);
> +
>          /* 0xa0000-0xbffff: Write Combining (WC) */
>          if ( mtrr_cap & (1u << 10) ) /* WC supported? */
> -            content = 0x0101010101010101ull;
> +            content = BCST8(X86_MT_WC);
>          wrmsr(MSR_MTRRfix16K_A0000, content);

This looks like it's latently buggy.  We'll end up with WB if WC isn't
supported, when it ought to be UC.

I suppose it doesn't actually matter because if there is a VGA region
there, it will actually be holes in the P2M and trap for emulation.

Also, Xen being 64-bit, WC is always available.

> +
>          /* 0xc0000-0xfffff: Write Back (WB) */
> -        content = 0x0606060606060606ull;
> +        content = BCST8(X86_MT_WB);
>          for ( i = 0; i < 8; i++ )
>              wrmsr(MSR_MTRRfix4K_C0000 + i, content);
> +#undef BCST8
> +#undef BCST4
> +#undef BCST2
> +
>          mtrr_def |= 1u << 10; /* FE */
>          printf("fixed MTRRs ... ");
>      }
> @@ -106,7 +117,7 @@ void cacheattr_init(void)
>              while ( ((base + size) < base) || ((base + size) > pci_mem_end) )
>                  size >>= 1;
>  
> -            wrmsr(MSR_MTRRphysBase(i), base);
> +            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
>              wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));

If you're re-spinning for page_size or the macros, any chance of also
gaining some constants for E/FE to avoid these naked shifts?

~Andrew

>  
>              base += size;
> @@ -121,7 +132,7 @@ void cacheattr_init(void)
>              while ( (base + size < base) || (base + size > pci_hi_mem_end) )
>                  size >>= 1;
>  
> -            wrmsr(MSR_MTRRphysBase(i), base);
> +            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
>              wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));
>  
>              base += size;
>
>


