Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8F24FEC6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 15:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kACSJ-0002Dd-3s; Mon, 24 Aug 2020 13:24:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kACSH-0002DX-IW
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:24:09 +0000
X-Inumbo-ID: a7628aee-d4c3-4b37-b2a8-a8ddf1846fea
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7628aee-d4c3-4b37-b2a8-a8ddf1846fea;
 Mon, 24 Aug 2020 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598275448;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/gUiF6YP71zkQWWKFsD7w8F1yJy565WdLs747QnH9No=;
 b=JjzBGAoPbNYlJFOQHyHGPDywRad5DRNEH02p0BnUHXQz/fGdWM0V/9wm
 uS3sfjCPuvrNhEWF9XxNrjUi74n/olxRHy7dkpX6aP1TdLYd+CNhmky8v
 ohsbnniJHHPQ8Cz1VGNh5dg0Wc6IIagoDLukfq+fY8Jb8xhQ6PGyP8kPF c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vIBSF2W0c97vwNgvDV+eAmhS4uVFP5ZvskZNQmS08z2k2GaZqcDilo0cOyGTjunWQDW8M6huBm
 dz/yMxL1LiY0k8mktNKgcXKhUrML0mH3rjtPg7DZoO7QUmnW/Lo1GptMF9qfjbpC2y31BGfnnh
 YbetVDMZmPFSOlwJVOTRI2SCcbPXSSz1QeXaNyS/iYzTuJ8xLiNkNZH3jsvbI99rXCyNYcmpnT
 qsXfY5Q8lZGtbVCZL1FQl9vgQ8/AZ42kHorXsh8ZVjRMHNMjUbS5xmLbnbEBikKYjBiIRCYqE3
 jHc=
X-SBRS: 2.7
X-MesageID: 25296321
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="25296321"
Subject: Re: [PATCH v2 2/5] x86: don't maintain compat M2P when !PV32
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <f3631a73-fda0-0676-09b8-c1b4b95cdfe5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a7f182ca-fc96-8fc1-780c-636a4204d599@citrix.com>
Date: Mon, 24 Aug 2020 14:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3631a73-fda0-0676-09b8-c1b4b95cdfe5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 24/08/2020 13:34, Jan Beulich wrote:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -34,17 +34,31 @@ EMIT_FILE;
>  #include <asm/fixmap.h>
>  #include <asm/hypercall.h>
>  #include <asm/msr.h>
> +#include <asm/pv/domain.h>
>  #include <asm/setup.h>
>  #include <asm/numa.h>
>  #include <asm/mem_paging.h>
>  #include <asm/mem_sharing.h>
>  #include <public/memory.h>
>  
> +#ifdef CONFIG_PV32
> +
>  #define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
>  
> -unsigned int __read_mostly m2p_compat_vstart = __HYPERVISOR_COMPAT_VIRT_START;
> +unsigned int __initdata m2p_compat_vstart = __HYPERVISOR_COMPAT_VIRT_START;
> +
> +l2_pgentry_t *__read_mostly compat_idle_pg_table_l2;
> +
> +#else /* !CONFIG_PV32 */
> +
> +/*
> + * Declare the symbol such that (dead) code referencing it can be built
> + * without a lot of #ifdef-ary, but mark it fully const and don't define
> + * this symbol anywhere (relying on DCE by the compiler).
> + */
> +extern const unsigned int *const compat_machine_to_phys_mapping;

This has a different indirection.  I know it is for DCE, but it still
ought to match.

I'm also not convinced that asymmetric const is a good idea.  All it
will do is confuse people, because now the "failed to DCE" error will be
a compiler error for writing to a read-only array, not a link time error
like every other instance of failed DCE.

Therefore, it ought to be:

extern unsigned int compat_machine_to_phys_mapping[];

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm disappointed that HYPERVISOR_COMPAT_VIRT_START() hasn't disappeared,
and instead sprouted a nop wrapper, but I guess it can wait for
subsequent cleanup.

~Andrew

