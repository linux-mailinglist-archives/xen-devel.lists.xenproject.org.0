Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AAAB06E8
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 02:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979709.1366224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDB9d-0002r3-DY; Thu, 08 May 2025 23:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979709.1366224; Thu, 08 May 2025 23:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDB9d-0002pb-AY; Thu, 08 May 2025 23:59:53 +0000
Received: by outflank-mailman (input) for mailman id 979709;
 Thu, 08 May 2025 23:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXoN=XY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDB9b-0002pV-Nv
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 23:59:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8651526c-2c68-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 01:59:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 075075C649F;
 Thu,  8 May 2025 23:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A45C4CEE7;
 Thu,  8 May 2025 23:59:46 +0000 (UTC)
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
X-Inumbo-ID: 8651526c-2c68-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746748787;
	bh=Aknd8eRQpMp0mMrUvf/eC7cDHLqD5XkNFJEYp8NtRVQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BFdudM18c3ogVxYD3PhVTCmmyNv5bo3mWMR1xVXdsY8WfqIAslKsmJr0t/Bm15gsY
	 bpXhCIfHv8X9UtV1vUHBmhfp/KD/M7/pbVW2jBv16JXVwbbs/fqUhlPS15Q6AqAzD/
	 oCCN9PDX1LoTYsfkUmgnnIpP6gQfNnOCPhUixX0Rii2ubdix4rr44wmwrDpSAV7eDD
	 t9nqeoFi7+okJCqbG6dX1UgEUScnjLwSgM3FF0VB6vE/NNe7Ev1u47L8LZ0Bz0aiIh
	 R6uGsuJg55JkQxLe4o2etCnfQBHHjjLZcGbCgGLaZ9GmHzfAKqLLsaDUVvL6+kaAOM
	 gV3SJKbjciB+Q==
Date: Thu, 8 May 2025 16:59:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1 1/2] x86: x86_emulate: address violation of MISRA C
 Rule 13.2
In-Reply-To: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505081659230.3879245@ubuntu-linux-20-04-desktop>
References: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-823193177-1746748787=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-823193177-1746748787=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 May 2025, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Rule 13.2 states: "The value of an expression and its persistent
> side effects shall be the same under all permitted evaluation orders".
> 
> The full expansion of macro "commit_far_branch" contains an assignment to
> variable "rc", which is also assigned to the result of the GNU statement
> expression which "commit_far_branch" expands to.
> 
> To avoid any dependence on the order of evaluation, the latter assignment
> is moved inside the macro.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/x86/x86_emulate/x86_emulate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 8e14ebb35b..7108fe7b30 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -337,7 +337,7 @@ do {                                                                    \
>      validate_far_branch(cs, newip);                                     \
>      _regs.r(ip) = (newip);                                              \
>      singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
> -    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
> +    rc = ops->write_segment(x86_seg_cs, cs, ctxt);                      \
>  })
> 
>  int x86emul_get_fpu(
> @@ -2382,7 +2382,7 @@ x86_emulate(
>               (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
>                                &src.val, op_bytes, ctxt, ops)) ||
>               (rc = load_seg(x86_seg_cs, src.val, 1, &cs, ctxt, ops)) ||
> -             (rc = commit_far_branch(&cs, dst.val)) )
> +             commit_far_branch(&cs, dst.val) )
>              goto done;
>          break;
> 
> @@ -2438,7 +2438,7 @@ x86_emulate(
>          _regs.eflags &= mask;
>          _regs.eflags |= (eflags & ~mask) | X86_EFLAGS_MBS;
>          if ( (rc = load_seg(x86_seg_cs, sel, 1, &cs, ctxt, ops)) ||
> -             (rc = commit_far_branch(&cs, (uint32_t)eip)) )
> +             commit_far_branch(&cs, (uint32_t)eip) )
>              goto done;
>          break;
>      }
> @@ -2557,7 +2557,7 @@ x86_emulate(
>          ASSERT(!mode_64bit());
>      far_jmp:
>          if ( (rc = load_seg(x86_seg_cs, imm2, 0, &cs, ctxt, ops)) ||
> -             (rc = commit_far_branch(&cs, imm1)) )
> +             commit_far_branch(&cs, imm1) )
>              goto done;
>          break;
> 
> --
> 2.47.0
> 
--8323329-823193177-1746748787=:3879245--

