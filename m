Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B494912FC7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 23:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745630.1152775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmCy-00022e-6t; Fri, 21 Jun 2024 21:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745630.1152775; Fri, 21 Jun 2024 21:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmCy-0001zr-48; Fri, 21 Jun 2024 21:54:12 +0000
Received: by outflank-mailman (input) for mailman id 745630;
 Fri, 21 Jun 2024 21:54:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKmCw-0001zl-Tn
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 21:54:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8b2c1a1-3018-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 23:54:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0EAF162581;
 Fri, 21 Jun 2024 21:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DFEC2BBFC;
 Fri, 21 Jun 2024 21:54:05 +0000 (UTC)
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
X-Inumbo-ID: c8b2c1a1-3018-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719006846;
	bh=THbuOmsvYWGac9QqIhH7AaSf77crrWy5gCjOQmWut1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KNqHXKde333GWfjx9hiUbJwOJfH51mABhz4IPa9gqFmD5kIJ6tT+cYEzW7e00n42L
	 6F88kgT3YsBWSydPMbKAgx8A1VYK1q5zmto5AoSxC6GH60azRBtQk0bqxrWuNV1Kl4
	 Cyu5T0z5qjFXTIeDmLRAA5+OMi4oyO/piTCq9Aj++cHhl+8wCwL0FOVX9DREwimte+
	 Xk3d8o/H5FYfvX5+oRMi1o3qs87j2azngA5vKrf66bM0N7LN2QR/O4MglgZYLlJc3b
	 Bs9H+emq5//djg/QXaTjlEkZvnSrq41rFeMWZiksMIliz5zeIzMv48L10pKgANuLCR
	 253zvnj6xC55g==
Date: Fri, 21 Jun 2024 14:54:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be
 unsigned long
In-Reply-To: <20240621205800.329230-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2406211438590.2572888@ubuntu-linux-20-04-desktop>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com> <20240621205800.329230-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1459642098-1719006205=:2572888"
Content-ID: <alpine.DEB.2.22.394.2406211444420.2572888@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1459642098-1719006205=:2572888
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2406211444421.2572888@ubuntu-linux-20-04-desktop>

On Fri, 21 Jun 2024, Andrew Cooper wrote:
> Right now, the non-compat declaration and definition of do_multicall()
> differing types for the nr_calls parameter.
> 
> This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
> first 128bit architecture (RISC-V looks as if it might get there first).
> 
> Worse, the type chosen here has a side effect of truncating the guest
> parameter, because Xen still doesn't have a clean hypercall ABI definition.
> 
> Switch uniformly to using unsigned long.
> 
> This addresses the MISRA violation, and while it is a guest-visible ABI
> change, it's only in the corner case where the guest kernel passed a
> bogus-but-correct-when-truncated value.  I can't find any any users of
> mutilcall which pass a bad size to begin with, so this should have no
> practical effect on guests.
> 
> In fact, this brings the behaviour of multicalls more in line with the header
> description of how it behaves.
> 
> With this fix, Xen is now fully clean to Rule 8.3, so mark it so.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I am in favor of this approach. I have 2 suggestions which are
nice-to-have, not must-have.

We all know that "unsigned long" is register size. However, the C
standard doesn't define it that way. I tried to make it clear in
docs/misra/C-language-toolchain.rst. However, nowhere in the public
Xen headers we say that by "unsigned long" we mean register size. I
think we should say that somewhere in the headers, but I can see it
doesn't have to be part of this patch. It would be nice to add a comment
in xen/include/public/xen.h saying "unsigned long is register size" or
"refer to docs/misra/C-language-toolchain.rst for type sizes and
definitions", but it is not a hard request.

The second observation, if we are concerned about invalid nr_calls
values, we could add a check at the beginning of do_multicall:

  if ( nr_calls >= UINT32_MAX )

I am not sure it is an improvement, but maybe it is.


Given that both the above suggestions are nice-to-have:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>





> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I know this isn't going to be universally liked, but we need to do something,
> and this is my very strong vote for the least bad way out of the current mess.
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
>  xen/common/multicall.c                        | 4 ++--
>  xen/include/hypercall-defs.c                  | 4 ++--
>  xen/include/public/xen.h                      | 2 +-
>  4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index b829655ca0bc..3d06a1aad410 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -45,6 +45,7 @@ MC3R1.R7.2||
>  MC3R1.R7.4||
>  MC3R1.R8.1||
>  MC3R1.R8.2||
> +MC3R1.R8.3||
>  MC3R1.R8.5||
>  MC3R1.R8.6||
>  MC3R1.R8.8||
> diff --git a/xen/common/multicall.c b/xen/common/multicall.c
> index 1f0cc4cb267c..ce394c5efcfe 100644
> --- a/xen/common/multicall.c
> +++ b/xen/common/multicall.c
> @@ -34,11 +34,11 @@ static void trace_multicall_call(multicall_entry_t *call)
>  }
>  
>  ret_t do_multicall(
> -    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, uint32_t nr_calls)
> +    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, unsigned long nr_calls)
>  {
>      struct vcpu *curr = current;
>      struct mc_state *mcs = &curr->mc_state;
> -    uint32_t         i;
> +    unsigned long    i;
>      int              rc = 0;
>      enum mc_disposition disp = mc_continue;
>  
> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index 47c093acc84d..7720a29ade0b 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -135,7 +135,7 @@ xenoprof_op(int op, void *arg)
>  #ifdef CONFIG_COMPAT
>  prefix: compat
>  set_timer_op(uint32_t lo, uint32_t hi)
> -multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
> +multicall(multicall_entry_compat_t *call_list, unsigned long nr_calls)
>  memory_op(unsigned int cmd, void *arg)
>  #ifdef CONFIG_IOREQ_SERVER
>  dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
> @@ -172,7 +172,7 @@ console_io(unsigned int cmd, unsigned int count, char *buffer)
>  vm_assist(unsigned int cmd, unsigned int type)
>  event_channel_op(int cmd, void *arg)
>  mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
> -multicall(multicall_entry_t *call_list, unsigned int nr_calls)
> +multicall(multicall_entry_t *call_list, unsigned long nr_calls)
>  #ifdef CONFIG_PV
>  mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
>  stack_switch(unsigned long ss, unsigned long esp)
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index b47d48d0e2d6..e051f989a5ca 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -623,7 +623,7 @@ DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
>  /*
>   * ` enum neg_errnoval
>   * ` HYPERVISOR_multicall(multicall_entry_t call_list[],
> - * `                      uint32_t nr_calls);
> + * `                      unsigned long nr_calls);
>   *
>   * NB. The fields are logically the natural register size for this
>   * architecture. In cases where xen_ulong_t is larger than this then
> -- 
> 2.39.2
> 
--8323329-1459642098-1719006205=:2572888--

