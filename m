Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00543AB206C
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 02:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980547.1367086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDXgX-0003zK-Gu; Sat, 10 May 2025 00:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980547.1367086; Sat, 10 May 2025 00:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDXgX-0003wh-Cp; Sat, 10 May 2025 00:03:21 +0000
Received: by outflank-mailman (input) for mailman id 980547;
 Sat, 10 May 2025 00:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDXgV-0003wb-PV
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 00:03:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba27880-2d32-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 02:03:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25FD55C5434;
 Sat, 10 May 2025 00:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BDDC4CEED;
 Sat, 10 May 2025 00:03:12 +0000 (UTC)
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
X-Inumbo-ID: 2ba27880-2d32-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746835394;
	bh=apxLBoPSgiWknjoB+6ASLhkhAwSY/vTIVv34g3VfLRA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jPZ9k3/3Klnj5wliuifJfU4TjvGT7HLY7qoPfyNTOPmAkKYYmGPSskBG8nFnZdI8v
	 /4mNSvkQBsTvDe8ipvsXu3/fSX9sTAZeUusGB6yqr3JnvwIYtKjs7ARth3BngkOO/X
	 7ly+TZHntFuPG79lUGuxwKRj8JQ/k7n6gfhlCiRtf60oCBfFEh+7z6lYNZo3e4+KBV
	 2EEl/LpmgnmzCAN6YM1DthANXAq1kFdOwOADmd2vbiNAbU4/Jo2mjM5FFSVaCDmJRu
	 yXOYrFEnvDu51Mco5SAIdQJzzBl2hUnhv/LGLpm0FiMBXcXgw1cyls9Yo4+WN6rqQC
	 37RkJCGd3mW9Q==
Date: Fri, 9 May 2025 17:03:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1 1/2] x86: x86_emulate: address violation of MISRA C
 Rule 13.2
In-Reply-To: <82b13a72-5b14-4e3c-ad98-fff1e13308ab@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505091702100.3879245@ubuntu-linux-20-04-desktop>
References: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com> <82b13a72-5b14-4e3c-ad98-fff1e13308ab@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-251233205-1746835393=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-251233205-1746835393=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 10 May 2025, Andrew Cooper wrote:
> On 07/05/2025 11:46 pm, victorm.lira@amd.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >
> > Rule 13.2 states: "The value of an expression and its persistent
> > side effects shall be the same under all permitted evaluation orders".
> >
> > The full expansion of macro "commit_far_branch" contains an assignment to
> > variable "rc", which is also assigned to the result of the GNU statement
> > expression which "commit_far_branch" expands to.
> >
> > To avoid any dependence on the order of evaluation, the latter assignment
> > is moved inside the macro.
> 
> The (mostly expanded) and reformatted expression is:
> 
> > if ( (rc = load_seg(x86_seg_cs, src.val, 1, &cs, ctxt, ops)) ||
> >      (rc = ({
> >              ({
> >                  if ( sizeof(dst.val) <= 4 )
> >                  {
> >                      do {
> >                          if ( __builtin_expect(!!(!(!ctxt->lma)),0) )
> >                              ASSERT();
> >                      } while ( 0 );
> >                      ({
> >                          if ( ((dst.val) > (&cs)->limit) )
> >                          {
> >                              x86_emul_hw_exception(13, mkec(13, 0, 0), ctxt);
> >                              rc = 2;
> >                              goto done;
> >                          }
> >                      });
> >                  }
> >                  else
> >                      ({
> >                          if ( (ctxt->lma && (&cs)->l
> >                                ? !(((long)(dst.val) >> 47) == ((long)(dst.val) >> 63))
> >                                : (dst.val) > (&cs)->limit) )
> >                          {
> >                              x86_emul_hw_exception(13, mkec(13, 0, 0), ctxt);
> >                              rc = 2;
> >                              goto done;
> >                          }
> >                      });
> >              });
> >              _regs.rip = (dst.val);
> >              singlestep = _regs.eflags & 0x00000100;
> >              ops->write_segment(x86_seg_cs, &cs, ctxt);
> >          })) )
> 
> And I can't identify anywhere where there is an ambiguous order of
> evaluation.
> 
> The problem with this patch is that, while the existing logic is not
> exactly great, ...
> 
> > diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> > index 8e14ebb35b..7108fe7b30 100644
> > --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> > +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> > @@ -337,7 +337,7 @@ do {                                                                    \
> >      validate_far_branch(cs, newip);                                     \
> >      _regs.r(ip) = (newip);                                              \
> >      singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
> > -    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
> > +    rc = ops->write_segment(x86_seg_cs, cs, ctxt);                      \
> >  })
> >
> >  int x86emul_get_fpu(
> > @@ -2382,7 +2382,7 @@ x86_emulate(
> >               (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
> >                                &src.val, op_bytes, ctxt, ops)) ||
> >               (rc = load_seg(x86_seg_cs, src.val, 1, &cs, ctxt, ops)) ||
> > -             (rc = commit_far_branch(&cs, dst.val)) )
> > +             commit_far_branch(&cs, dst.val) )
> >              goto done;
> 
> ... this is breaking a visual layout pattern where you can always see
> the update to rc beside the "goto done".
> 
> This code is complicated enough without making it harder.
> 
> One option which might work is this:
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c
> b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 3350303f8634..dab4373ece1e 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -333,12 +333,14 @@ do
> {                                                                    \
>                                : (ip) > (cs)->limit, X86_EXC_GP, 0);     \
>  })
>  
> -#define commit_far_branch(cs, newip) ({                                 \
> -    validate_far_branch(cs, newip);                                     \
> -    _regs.r(ip) = (newip);                                              \
> -    singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
> -    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
> -})
> +#define commit_far_branch(cs, newip) (                                  \
> +        ({                                                              \
> +            validate_far_branch(cs, newip);                             \
> +            _regs.r(ip) = (newip);                                      \
> +            singlestep = _regs.eflags & X86_EFLAGS_TF;                  \
> +        }),                                                             \
> +        ops->write_segment(x86_seg_cs, cs, ctxt)                        \
> +    )
>  
>  int x86emul_get_fpu(
>      enum x86_emulate_fpu_type type,
> 
> 
> This rearranges commit_far_branch() to use the comma operator, but
> maintains the previous property that it's still overall an assignment to rc.
> 
> However, I don't have much confidence that Eclair is going to like it more.

Eclair likes it:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-251233205-1746835393=:3879245--

