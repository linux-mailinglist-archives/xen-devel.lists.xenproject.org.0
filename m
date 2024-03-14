Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D687C5D5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 00:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693590.1081921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkuMi-0001CS-KZ; Thu, 14 Mar 2024 23:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693590.1081921; Thu, 14 Mar 2024 23:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkuMi-0001AD-Hx; Thu, 14 Mar 2024 23:20:00 +0000
Received: by outflank-mailman (input) for mailman id 693590;
 Thu, 14 Mar 2024 23:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkuMh-00017Z-CG
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 23:19:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e1dff92-e259-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 00:19:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48C5FCE1E30;
 Thu, 14 Mar 2024 23:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A708C433C7;
 Thu, 14 Mar 2024 23:19:48 +0000 (UTC)
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
X-Inumbo-ID: 5e1dff92-e259-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710458390;
	bh=Pv+dE59ggmG2qzf7R1Dkckr9mrK1X/YubGJWg8w3XKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nk8rICd7sv5rPm+KRPmjDQpAjFTYtHZizlZSnAALeIYw+5a0Nrt9so5LQHJ+LqALX
	 LfAo7vrBCVqLJRV0K3bVsqMJlnwK0ZZi/dxO8Hs5DtX8DkyyiAgtjIrgEWyVBKbOrk
	 Eyo79IkuzaSxyYOKxkbB1bBmmuWIYHmbseP6RWHMcoIg/WdTuI5zqnqXNdwDwJWjiC
	 EXg/qLEorw4eFHkwA2xAt3q+IkcdQ6AWk0W5FFBZP829CPP7KdK1qPxIl3zRGEEsxq
	 UDk5UeJvQ/fW+rUuFLnp0FKDE3KV6HdgzDsroCDOhcV0miyoFQ6zriOGVjnhCAOtYe
	 BuOuuFeT/bJvw==
Date: Thu, 14 Mar 2024 16:19:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 14/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <7a9d46bb-e231-4b1a-a60c-62905e6cc1cc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403141618410.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <305d6474a84e16d44c193a93e2c2ca91d6dd0f7e.1710145041.git.simone.ballarin@bugseng.com> <7a9d46bb-e231-4b1a-a60c-62905e6cc1cc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Mar 2024, Jan Beulich wrote:
> On 11.03.2024 09:59, Simone Ballarin wrote:
> > From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> > 
> > Edit inclusion guards to address violations of
> > MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
> > prevent the contents of a header file being included more than once").
> > Mechanical change.
> 
> The changes all follow a single pattern, yet I'm afraid I can't bring
> this pattern in line with this description. To take ...
> 
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -1,5 +1,5 @@
> > -#ifndef __ASM_DOMAIN_H__
> > -#define __ASM_DOMAIN_H__
> > +#ifndef ASM_X86_DOMAIN_H
> > +#define ASM_X86_DOMAIN_H
> >  
> >  #include <xen/mm.h>
> >  #include <xen/radix-tree.h>
> > @@ -780,7 +780,7 @@ struct arch_vcpu_io {
> >  /* Maxphysaddr supportable by the paging infrastructure. */
> >  unsigned int domain_max_paddr_bits(const struct domain *d);
> >  
> > -#endif /* __ASM_DOMAIN_H__ */
> > +#endif /* ASM_X86_DOMAIN_H */
> 
> ... this as example - what's the violation here? The existing symbol
> provides the intended effect, doesn't it? What it does not is adhere
> to the new naming scheme, but there's no mention of that in the
> description.

I think the commit message is incorrect. As you pointed out there is no
underlying MISRA issue. However, it does bring the headers inline with
the new naming scheme, which I think it is a great improvement.

With the commit message improved:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

