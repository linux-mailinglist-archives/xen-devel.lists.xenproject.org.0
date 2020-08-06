Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB8C23E1F7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 21:18:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3lNt-0006PH-El; Thu, 06 Aug 2020 19:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3lNs-0006PC-12
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 19:17:00 +0000
X-Inumbo-ID: 8cc625d6-1cb7-4673-9c0d-6780bb4433a5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cc625d6-1cb7-4673-9c0d-6780bb4433a5;
 Thu, 06 Aug 2020 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596741418;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FEUdhmjUy/NnCsRpt6oD9B36F3Nekf8D3Ivt330Jyik=;
 b=HW7gMjsJO3htpLgYC0WtuiKdeVvA6E8FMEo5xhLUKMG0iBXfLrQoODDm
 rOp5LxK4V+FFlPMrXPOVljSUkyT7Sg9F/VNyGHDarGwBZdUuhlH5QJggp
 xjEVaqi0BevWSVETQwMiIgYRx3s2ydFz6mazL72GHkhoi2VhQKoxUquzG 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1zR/2PDKAaqlrZNSqAWmRQn4vfqXx2M7qvWNZGpWj/h5L092BBCRMFy4QEqn82cByKTEnTJcP1
 Q8Y64Zy0kqtw2VM5psYdNGmJxJFobVDrM3kaoPTLY4dHAvD6cxbaymZugsUsIBtBrQVpfzlfh8
 F2bKKx2OOPpJSw1YoM/2cClgMDk6EQHwXsSU3YTgJ1FPXnMPsQKhmA+X2gn/kp8N7eRM2mFPyh
 +RRP6NsdPTZ23RHkF9G5os8DNHkwmLJL/a5GdxrMBTr0cxUSnnIqKOjwDZBZf6cLAMex4OAjH/
 ZvI=
X-SBRS: 3.7
X-MesageID: 24346601
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,441,1589256000"; d="scan'208";a="24346601"
Subject: Re: [PATCH 2/3] x86: don't maintain compat M2P when !PV32
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <4575f42b-a347-b34e-0032-e04668106a9b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <52b4f80f-9967-fae9-ce85-c69bf3b6e22d@citrix.com>
Date: Thu, 6 Aug 2020 20:16:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4575f42b-a347-b34e-0032-e04668106a9b@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:28, Jan Beulich wrote:
> Note that opt_pv32's declaration / #define need to be moved due to other
> header dependencies; in particular can asm-x86/mm.h not include
> asm-x86/pv/domain.h.

While I do appreciate that our headers are a complete tangle, I can't
help but feel that this is making the problem worse.

mm.h isn't a better place for opt_pv32 to live.  config.h perhaps,
seeing as its effects are wider than both the domain support itself, or
the memory management support ?

> While touching their definitions anyway, also adjust section placement
> of m2p_compat_vstart and compat_idle_pg_table_l2. Similarly, while
> putting init_xen_pae_l2_slots() inside #ifdef, also move it to a PV-only
> source file.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

So interestingly, this is done out of the order which I was expecting to
do things.  Its not a problem, but I'd like to double check that we
aren't creating future problems.

The goal of this suggestion was actually for PV-Shim, to have only the
regular or compat M2P, as they're fairly large structures and adversely
affect VM density.

This of course requires the kernel elf file to be parsed earlier during
boot, but that isn't a problem.  (It also allows for a PV/PVH dom0
usability fix, whereby the Xen command line has to match the ELF image
provided, rather than auto-selecting the default when only one option is
available.)

The other aspect would be to teach Xen to run on only the compat M2P,
which is fine for any shim smaller than 16T.  (Honestly, if it weren't
an ABI with guests, Shim ought to run exclusively on the compat M2P to
reduce the memory overhead.)

Then during boot, the Shim path would chose to construct only the
regular or compat M2P, based on bitness of the provided kernel.

> ---
> An alternative place for opt_pv32.h would seem to be asm-x86/config.h.

Oh - yes please.  I think that would be better overall.

>
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -597,8 +597,10 @@ int arch_domain_create(struct domain *d,
>      }
>      d->arch.emulation_flags = emflags;
>  
> +#ifdef CONFIG_PV32
>      HYPERVISOR_COMPAT_VIRT_START(d) =
>          is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
> +#endif

Can we drop HYPERVISOR_COMPAT_VIRT_START() ?

Its use here as an lvalue in particular makes logic especually hard to
follow, but all it is actually doing is wrapping the shorter
d->arch.hv_compat_vstart

In particular, it would remove the need to conditionally stub
HYPERVISOR_COMPAT_VIRT_START() later.

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -315,10 +318,10 @@ static void destroy_m2p_mapping(struct m
>   */
>  static int setup_compat_m2p_table(struct mem_hotadd_info *info)
>  {
> +    int err = 0;
>      unsigned long i, smap, emap, epfn = info->epfn;
>      mfn_t mfn;
>      unsigned int n;
> -    int err = 0;

Remnants of an earlier change?

> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -42,8 +42,12 @@
>  #define _PGT_validated    PG_shift(6)
>  #define PGT_validated     PG_mask(1, 6)
>   /* PAE only: is this an L2 page directory containing Xen-private mappings? */
> +#ifdef CONFIG_PV32
>  #define _PGT_pae_xen_l2   PG_shift(7)
>  #define PGT_pae_xen_l2    PG_mask(1, 7)
> +#else
> +#define PGT_pae_xen_l2    0
> +#endif

Hmm - this is going to irritate Coverity and Clang some more.  I still
need to figure out an effective way to make Coverity not object to this
type of short circuiting like this.

I've looked through the users and I think that they're all safe.  I do
however wonder whether is_guest_l2_slot() can be simplified and have its
is_pv_32bit_domain() clause dropped, seeing as it is expensive with its
lfences, and the logic ought to only care about PGT_pae_xen_l2 vs
PGT_l2_page_table.

>  /* Has this page been *partially* validated for use as its current type? */
>  #define _PGT_partial      PG_shift(8)
>  #define PGT_partial       PG_mask(1, 8)
> @@ -494,15 +498,39 @@ extern paddr_t mem_hotplug;
>  #define SHARED_M2P_ENTRY         (~0UL - 1UL)
>  #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
>  
> -#define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
> +#ifdef CONFIG_PV32
> +
> +extern int8_t opt_pv32;
> +
> +# define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
> +
> +# define set_compat_m2p(mfn, entry) \
> +    ((void)(!opt_pv32 || \
> +            (mfn) >= (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 || \
> +            (compat_machine_to_phys_mapping[mfn] = (entry))))

I know this is extracting previous logic, but "entry" would probably be
better if it were named "val" or similar.

However, see my reply to patch 3 which I think will simplify this
substantially.

~Andrew

