Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFB94D739
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 21:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774953.1185341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scVEg-0001tx-Dw; Fri, 09 Aug 2024 19:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774953.1185341; Fri, 09 Aug 2024 19:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scVEg-0001rq-BC; Fri, 09 Aug 2024 19:25:14 +0000
Received: by outflank-mailman (input) for mailman id 774953;
 Fri, 09 Aug 2024 19:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waF5=PI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1scVEf-0001rk-Hl
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 19:25:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 179b244c-5685-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 21:25:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 381DC61767;
 Fri,  9 Aug 2024 19:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8C1C32782;
 Fri,  9 Aug 2024 19:25:08 +0000 (UTC)
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
X-Inumbo-ID: 179b244c-5685-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723231509;
	bh=Pn7fV/Ax6GfTPY1qzSmiQw6+6NE+7FZHc8ndrA91tUM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YobYYuRd+C18iBW3asbH7PfSaSufbTWrM/7sjddnMFNuousuDFeYccCozsRUL88tu
	 PhGwYV5TLtWXTZHrxOjCKbpUSbPlI9ICnxbX94eWimyaYOmIaA3YvdVKdQMEm5Aew/
	 6fTT8g/joFNNH6Ntlqj4dRjMR+10T2EnnbRSotifVYsMRGCsqcddlW54wnea9R/re6
	 1Xy6jvW4Lr7ZRMobv08YyEdApW1XSRK6KdXKiByKxYvKTnQtPbUd7ANmPVpLz5UWX7
	 X855lnHavCuJHOJnJexyTQ6kaDu+jLFxNJOhbj/qt8VazeDjL/MP7Z+jF6SnQ8RCny
	 rCk31EQ4ubkNQ==
Date: Fri, 9 Aug 2024 12:25:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] xen: Remove -Wdeclaration-after-statement
In-Reply-To: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2408091217370.200407@ubuntu-linux-20-04-desktop>
References: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding Roberto

Does MISRA have a view on this? I seem to remember this is discouraged?


On Fri, 9 Aug 2024, Alejandro Vallejo wrote:
> This warning only makes sense when developing using a compiler with C99
> support on a codebase meant to be built with C89 compilers too, and
> that's no longer the case (nor should it be, as it's been 25 years since
> C99 came out already).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Yes, I'm opening this can of worms. I'd like to hear others people's
> thoughts on this and whether this is something MISRA has views on. If
> there's an ulterior non-obvious reason besides stylistic preference I
> think it should be documented somewhere, but I haven't seen such an
> explanation.
> 
> IMO, the presence of this warning causes several undesirable effects:
> 
>   1. Small functions are hampered by the preclusion of check+declare
>      patterns that improve readability via concision. e.g: Consider a
>      silly example like:
> 
>      /* with warning */                     /* without warning */
>      void foo(uint8_t *p)                   void foo(uint8_t *p)
>      {                                      {
>          uint8_t  tmp1;                         if ( !p )
>          uint16_t tmp2;                             return;
>          uint32_t tmp3;
>                                                 uint8_t  tmp1 = OFFSET1 + *p;
>          if ( !p )                              uint16_t tmp2 = OFFSET2 + *p;
>              return;                            uint32_t tmp3 = OFFSET3 + *p;
> 
>          tmp1 = OFFSET1 + *p;                   /* Lots of uses of `tmpX` */
>          tmp2 = OFFSET2 + *p;               }
>          tmp2 = OFFSET2 + *p;
> 
>          /* Lots of uses of tmpX */
>      }
> 
>   2. Promotes scope-creep. On small functions it doesn't matter much,
>      but on bigger ones to prevent declaring halfway through the body
>      needlessly increases variable scope to the full scope in which they
>      are defined rather than the subscope of point-of-declaration to
>      end-of-current-scope. In cases in which they can be trivially
>      defined at that point, it also means they can be trivially misused
>      before they are meant to. i.e: On the example in (1) assume the
>      conditional in "with warning" is actually a large switch statement.
> 
>   3. It facilitates a disconnect between time-of-declaration and
>      time-of-use that lead very easily to "use-before-init" bugs.
>      While a modern compiler can alleviate the most egregious cases of
>      this, there's cases it simply cannot cover. A conditional
>      initialization on anything with external linkage combined with a
>      conditional use on something else with external linkage will squash
>      the warning of using an uninitialised variable. Things are worse
>      where the variable in question is preinitialised to something
>      credible (e.g: a pointer to NULL), as then that can be misused
>      between its declaration and its original point of intended use.
> 
> So... thoughts? yay or nay?

In my opinion, there are some instances where mixing declarations and
statements would enhance the code, but these are uncommon. Given the
choice between:

1) declarations always first
2) declarations always mixed with statements

I would choose 1).

One could say that mixing declarations with statements should be done
only when appropriate, but the challenge lies in the subjective nature
of "when appropriate." Different individuals have varying
interpretations of this, which could lead to unnecessary bikeshedding.

For these reasons, I do not support mixing declarations and statements.

