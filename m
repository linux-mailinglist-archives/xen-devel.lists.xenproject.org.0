Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FB7B72A0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 22:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612352.952259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmDS-0007OW-5e; Tue, 03 Oct 2023 20:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612352.952259; Tue, 03 Oct 2023 20:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmDS-0007LV-34; Tue, 03 Oct 2023 20:42:02 +0000
Received: by outflank-mailman (input) for mailman id 612352;
 Tue, 03 Oct 2023 20:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnmDR-0007LP-1h
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 20:42:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af9828d-622d-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 22:41:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2ADA7CE1877;
 Tue,  3 Oct 2023 20:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9833C433C8;
 Tue,  3 Oct 2023 20:41:49 +0000 (UTC)
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
X-Inumbo-ID: 4af9828d-622d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696365711;
	bh=uQS55In3SF3nroA+vqGoCwxIEXAeslUxH7X1AtLmYR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dW/FOnu08BgKC9OxlalGmxPYOHtIN3rbGQsnS57vAX5tOsCZ/sI4+bd7lgLucDJLd
	 QjAdpXzMwGIxyomxdA28oBW6RwF0/6Wo46LdSRUQPLeKlrQ6sxyUWQBKCd16zqfmxa
	 COmCTzetdUlgVBNw89uYyKjTNO95uwGMx1+7bnhXqKuHwoEULZ7J8uLbKDCA0uvVTO
	 HueLRu/gdCK6qO3da0L2QMyKcb6goigOnwsf4KDFAbCkBGdyZJG+UzDGGcnG9uAgut
	 RYcAxcycudrigQa+tSeRKzC6VWZIXtCm5e1MfOcf/t2lD8ccBZ8xj66ND2ZvRrDEeJ
	 RiO8gh1n30Iyw==
Date: Tue, 3 Oct 2023 13:41:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Henry.Wang@arm.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/7] x86/grant: switch included header to make
 declarations visible
In-Reply-To: <7dcb6b040d0fab33553dac18e9080465@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310031341240.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com> <ec3179df569d3e2b392360539bddfb3adc726a5e.1696232393.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2310021541230.2348112@ubuntu-linux-20-04-desktop>
 <7dcb6b040d0fab33553dac18e9080465@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Oct 2023, Nicola Vetrini wrote:
> On 03/10/2023 00:42, Stefano Stabellini wrote:
> > On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> > > The declarations for {create,replace}_grant_p2m_mapping are
> > > not visible when these functions are defined, therefore the right
> > > header needs to be included to allow them to be visible.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > ---
> > >  xen/arch/x86/hvm/grant_table.c             | 3 +--
> > >  xen/arch/x86/include/asm/hvm/grant_table.h | 2 ++
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/hvm/grant_table.c
> > > b/xen/arch/x86/hvm/grant_table.c
> > > index 30d51d54a949..afe449d8882c 100644
> > > --- a/xen/arch/x86/hvm/grant_table.c
> > > +++ b/xen/arch/x86/hvm/grant_table.c
> > > @@ -9,8 +9,7 @@
> > > 
> > >  #include <xen/types.h>
> > > 
> > > -#include <public/grant_table.h>
> > > -
> > > +#include <asm/hvm/grant_table.h>
> > >  #include <asm/p2m.h>
> > 
> > This makes sense...
> > 
> > 
> > >  int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
> > > diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h
> > > b/xen/arch/x86/include/asm/hvm/grant_table.h
> > > index 33c1da1a25f3..576aeb50adf4 100644
> > > --- a/xen/arch/x86/include/asm/hvm/grant_table.h
> > > +++ b/xen/arch/x86/include/asm/hvm/grant_table.h
> > > @@ -10,6 +10,8 @@
> > >  #ifndef __X86_HVM_GRANT_TABLE_H__
> > >  #define __X86_HVM_GRANT_TABLE_H__
> > > 
> > > +#include <asm/paging.h>
> > 
> > ... but I don't understand this one. It doesn't look like
> > asm/hvm/grant_table.h actually needs asm/paging.h ? Maybe it should be
> > included in xen/arch/x86/hvm/grant_table.c instead ?
> > 
> > 
> > >  #ifdef CONFIG_HVM
> > > 
> > >  int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
> > > --
> > > 2.34.1
> > > 
> 
> See this thread [1] for more context. There was no response, so I went for the
> route that
> made more sense to me. I guess you could say that only <xen/mm-frame.h> is
> actually needed
> to get a definition of mfn_t, but I put <asm/paging.h> as in the
> <asm/grant_table.h> header.
> 
> [1]
> https://lore.kernel.org/xen-devel/a4b6710b66ed05292388ac6882b940ec@bugseng.com/

I didn't realize it was for mfn_t. In that case it makes sense.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

