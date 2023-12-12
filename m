Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91180E0F9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652611.1018576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrqn-0002Mu-Oc; Tue, 12 Dec 2023 01:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652611.1018576; Tue, 12 Dec 2023 01:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrqn-0002Jw-Lo; Tue, 12 Dec 2023 01:46:21 +0000
Received: by outflank-mailman (input) for mailman id 652611;
 Tue, 12 Dec 2023 01:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCrqn-0002Jo-1d
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:46:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f5c3783-9890-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 02:46:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B3EADB810DB;
 Tue, 12 Dec 2023 01:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A548C433C7;
 Tue, 12 Dec 2023 01:46:18 +0000 (UTC)
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
X-Inumbo-ID: 3f5c3783-9890-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345579;
	bh=/O9QV8/AHOH6xzHvqcH08MeGR3qFjIZmyEwhQdG7ByY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i26RkqCugYTMz7RFOvnXFUnMncJIO+muZ84J9hugx6fgTkU77JJy3JeVMMUqn/JwH
	 xllO7L5qdf1bhpRpTp550t/rCi2qrW0X+4jSvLB5tKR+v2ZiQ0LgT+BUSrkpvl1SpY
	 45aMLIXRCWwwxcfV9+T8tCQxi5KQ/B/YHOjdQAuByy0tuuoNOdVqK8ltTNFlmJkSV3
	 PAc0Y2riKdBRQyJIrAjbtKBNZmWHlvnjQTDQsHTQrZ1jtjQEsd2MCJJbdpijMsag80
	 vJEXjQpVdh3fwS7TJCNyUMDmLyMOUCPxfk9PaS6zJJ7guInX9yXw4x2kIl5J6AIB0T
	 oTpYSSAWZ4GEw==
Date: Mon, 11 Dec 2023 17:46:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 7/7] x86/xstate: move BUILD_BUG_ON to address MISRA
 C:2012 Rule 2.1
In-Reply-To: <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111745280.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> The string literal inside the expansion of BUILD_BUG_ON is considered
> unreachable code; however, such statement can be moved earlier
> with no functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> The motivation for this code movement is that keeping it inside the switch
> statement matches MISRA's definition of unreachable code, but does not fall into
> the category of declarations without initialization, which is already a deviated
> aspect. An alternative approach would be to deviate BUILD_BUG_ON as well.

I think that deviating BUILD_BUG_ON would be totally fine. But given
that this patch is obviously correct:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/xstate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index cf94761d0542..99f0526c8988 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -396,9 +396,10 @@ void xrstor(struct vcpu *v, uint64_t mask)
>       */
>      for ( prev_faults = faults = 0; ; prev_faults = faults )
>      {
> +        BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
> +
>          switch ( __builtin_expect(ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET], 8) )
>          {
> -            BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
>  #define _xrstor(insn) \
>          asm volatile ( "1: .byte " insn "\n" \
>                         "3:\n" \
> -- 
> 2.34.1
> 

