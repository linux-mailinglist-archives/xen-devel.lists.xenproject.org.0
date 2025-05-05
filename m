Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C4AAA353
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 01:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976538.1363674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC4z1-0001h2-T0; Mon, 05 May 2025 23:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976538.1363674; Mon, 05 May 2025 23:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC4z1-0001fO-OS; Mon, 05 May 2025 23:12:23 +0000
Received: by outflank-mailman (input) for mailman id 976538;
 Mon, 05 May 2025 23:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC4yz-0001fI-OM
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 23:12:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d15cf7f-2a06-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 01:12:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7178D629CE;
 Mon,  5 May 2025 23:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7122CC4CEED;
 Mon,  5 May 2025 23:12:04 +0000 (UTC)
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
X-Inumbo-ID: 5d15cf7f-2a06-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486726;
	bh=88PaDfHURWWSCqM62oUkcoRn9IbHXT97qREKVCVw/Kc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QtuA4exxz3syuD1rKJx+Rapmp+b3sD+J2LBdODvTaFaGpod9wpV04gc2rZM3EmPcW
	 nTcKONttmTsYA91aRl2XEtuFw/bsS/P2FOemARSzz7DXTMjgHbrM5a4HzPMlgzGGwl
	 pGPtgokjIU8FbTdbSlWiNIWDAY73HhAA9u9ko/E8UDRWDIRQgx+f8NWyI2tLz28cbk
	 Ez4NotzmLNBXw6awHYG1y3OFshGDm1AdwPueK/i/gCkdKnLRXnryi/v4blR82QbysK
	 ltZmriI9+aZG1J7UFCNsHDxotrqX8qtucQDr8wSZRsbfWYqRgn/eDG22JRXc9o5WV9
	 dO13oX8f88lsA==
Date: Mon, 5 May 2025 16:12:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 1/2] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
In-Reply-To: <20250502233535.3532279-1-victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505051611190.3879245@ubuntu-linux-20-04-desktop>
References: <20250502233535.3532279-1-victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Rule 19.1 states: "An object shall not be assigned or copied
> to an overlapping object". In the function like macro "get_rep_prefix",
> one member of a union is assigned the value of another member. Reading from one
> member and writing to the other violates the rule, while not causing Undefined
> Behavior due to their relative sizes. Instead, use casts combined with exactly
> overlapping accesses to address violations.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Changes in v2:
> - Use casts combined with exactly overlapping accesses to address
>   violations
> - fix commit message
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monn?? <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/x86/x86_emulate/x86_emulate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 8e14ebb35b..d678855238 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -527,8 +527,8 @@ static inline void put_loop_count(
>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>          {                                                               \
>              _regs.r(cx) = 0;                                            \
> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> +            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
> +            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \

NIT: code style, alignment of the \

Can be fixed on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>          }                                                               \
>          goto complete_insn;                                             \
>      }                                                                   \
> @@ -2029,7 +2029,7 @@ x86_emulate(
>          switch ( op_bytes )
>          {
>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> +        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.r(ax); break; /* cwde */
>          case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
>          }
>          break;
> --
> 2.25.1
> 

