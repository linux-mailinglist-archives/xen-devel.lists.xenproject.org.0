Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39F27AEA1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:05:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsps-00037v-Bo; Mon, 28 Sep 2020 13:04:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMspr-00037q-JO
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:04:55 +0000
X-Inumbo-ID: 034f00a3-2175-4b8a-9703-88dc0a232e61
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 034f00a3-2175-4b8a-9703-88dc0a232e61;
 Mon, 28 Sep 2020 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601298294;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tAn4BHCGeHj98Lir8HpxdV5sxeVSVIeBfnYOW2Ol6Yc=;
 b=V7kDzjwDu2EoThm7gkBeESX1+0tiMoh3gY8p9bDQ42b43VuavndvsGJw
 UAqqbjF1fFhxfvWAZcfFYW9ci5OL8gk+fZ55rWbF+HVHM67+DwAFwVI1x
 GGJ2ai3CFIgXZZB+wswtuluHIsYb3Uc24j0+Ryb40p9wDvYfJF0zJi+vl g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f+Uu2v9xcybyH/SjMS3wiLkEt749mw3tItEiK/nY34IPte/GT6V+1kEU/eTn6TSjZIEgtEBILT
 YgLKLYGcRjcNfnFOBCjJjgLHgnegkxJRZG/r4lVpSxlOHK+Q4EZCnQMFdvztu74Vct78IshT1J
 toTYwNP4eT1mnWLaQ+4581t5hAByJiZRMdz7oHrhHRdSgJ+pkAQrRS6k0D0nfLvQSf3S2gucq9
 7XCLhK3gNqcOKWU/oRX5aDGdvdSseeo6+SBD7YoLN8XisIWtZQqq18DnkQ8oIhFYFB1HwUCeUx
 x44=
X-SBRS: None
X-MesageID: 27757949
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="27757949"
Subject: Re: [PATCH 4/5] x86/ELF: also record FS/GS bases in
 elf_core_save_regs()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <518a5f88-3ae4-a3ed-ab13-caaf7e8a7295@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5e95ba48-68dc-81f4-1d62-f3310b0ba091@citrix.com>
Date: Mon, 28 Sep 2020 14:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <518a5f88-3ae4-a3ed-ab13-caaf7e8a7295@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/09/2020 13:06, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Any idea why this wasn't done before?  At a minimum, I'd be tempted to
put a sentence in the commit message saying "no idea why this wasn't
done before".

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/include/asm-x86/x86_64/elf.h
> +++ b/xen/include/asm-x86/x86_64/elf.h
> @@ -1,6 +1,7 @@
>  #ifndef __X86_64_ELF_H__
>  #define __X86_64_ELF_H__
>  
> +#include <asm/msr.h>
>  #include <asm/regs.h>
>  
>  typedef struct {
> @@ -59,8 +60,8 @@ static inline void elf_core_save_regs(EL
>      asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
>      asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
>      asm volatile("movl %%ss, %%eax;" :"=a"(core_regs->ss));
> -    /* thread_fs not filled in for now */
> -    /* thread_gs not filled in for now */
> +    rdmsrl(MSR_FS_BASE, core_regs->thread_fs);
> +    rdmsrl(MSR_GS_BASE, core_regs->thread_gs);
>      core_regs->ds = read_sreg(ds);
>      core_regs->es = read_sreg(es);
>      core_regs->fs = read_sreg(fs);
>


