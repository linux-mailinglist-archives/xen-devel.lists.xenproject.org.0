Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32162F8614
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 21:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68598.122797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VMX-0008K0-SV; Fri, 15 Jan 2021 20:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68598.122797; Fri, 15 Jan 2021 20:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VMX-0008Jb-PZ; Fri, 15 Jan 2021 20:06:25 +0000
Received: by outflank-mailman (input) for mailman id 68598;
 Fri, 15 Jan 2021 20:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0VMW-0008JW-3T
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 20:06:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9995c717-4422-4514-931f-02d76157a733;
 Fri, 15 Jan 2021 20:06:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B932238D7;
 Fri, 15 Jan 2021 20:06:22 +0000 (UTC)
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
X-Inumbo-ID: 9995c717-4422-4514-931f-02d76157a733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610741182;
	bh=LSXUMUraicVCCKQpfYHoRzzK05i8kb7lDNvJm8vAVCg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M9bm0hZHkIh2odFo2tyEUAtlkxXLrpMVdIIoAJpmEHnIHYEUHNDJgZI7TQ5NSvom4
	 k+3Xfcf76pliH8rKK0mvDeL/8yth7/MwSZ2sDqZxPQFGq45cXhB71FnsCIaKB4OGZ0
	 eJ9FOoAu81ejkT/8JbHEW7M33MqsQU8yT+PP2OsK/Bs8JLB1ditekLB98mg9Tq5yN2
	 Q+FLoCkrnfvpwVP1CCmC6ap4dQRzfoMgZABBUwd28H+qfLOh1MDoCHwhkl/wVbQ8II
	 Uw0XCWhdHQ01CGu9xLK9icwTrdAWtCRG/AywUiFJra4p5tkcAIZahMGOFXCcr8lpSq
	 SZSZ4VW2Wm5/g==
Date: Fri, 15 Jan 2021 12:06:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>, 
    Ross Lagerwall <ross.lagerwall@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: livepatch: Include xen/mm.h rather than
 asm/mm.h
In-Reply-To: <20210115195710.GB23704@char.us.oracle.com>
Message-ID: <alpine.DEB.2.21.2101151206120.31265@sstabellini-ThinkPad-T480s>
References: <20210115192947.6499-1-julien@xen.org> <20210115195710.GB23704@char.us.oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-669571726-1610741182=:31265"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-669571726-1610741182=:31265
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 15 Jan 2021, Konrad Rzeszutek Wilk wrote:
> On Fri, Jan 15, 2021 at 07:29:47PM +0000, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > Livepatch fails to build on Arm after commit ced9795c6cb4 "mm: split
> > out mfn_t / gfn_t / pfn_t definitions and helpers":
> > 
> > In file included from livepatch.c:13:0:
> > /oss/xen/xen/include/asm/mm.h:32:28: error: field ‘list’ has incomplete type
> >      struct page_list_entry list;
> >                             ^~~~
> > /oss/xen/xen/include/asm/mm.h:53:43: error: ‘MAX_ORDER’ undeclared here (not in a function); did you mean ‘PFN_ORDER’?
> >                  unsigned long first_dirty:MAX_ORDER + 1;
> >                                            ^~~~~~~~~
> >                                            PFN_ORDER
> > /oss/xen/xen/include/asm/mm.h:53:31: error: bit-field ‘first_dirty’ width not an integer constant
> >                  unsigned long first_dirty:MAX_ORDER + 1;
> >                                ^~~~~~~~~~~
> > 
> > This is happening because asm/mm.h is included directly by livepatch.c.
> > Yet it depends on xen/mm.h to be included first so MAX_ORDER is defined.
> > 
> > Resolve the build failure by including xen/mm.h rather than asm/mm.h.
> > 
> > Fixes: ced9795c6cb4 ("mm: split out mfn_t / gfn_t / pfn_t definitions and helpers")
> Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> Thank you!
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > ---
> >  xen/arch/arm/livepatch.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> > index 915e9d926a11..75e8adcfd6a1 100644
> > --- a/xen/arch/arm/livepatch.c
> > +++ b/xen/arch/arm/livepatch.c
> > @@ -6,11 +6,11 @@
> >  #include <xen/lib.h>
> >  #include <xen/livepatch_elf.h>
> >  #include <xen/livepatch.h>
> > +#include <xen/mm.h>
> >  #include <xen/vmap.h>
> >  
> >  #include <asm/cpufeature.h>
> >  #include <asm/livepatch.h>
> > -#include <asm/mm.h>
> >  
> >  /* Override macros from asm/page.h to make them work with mfn_t */
> >  #undef virt_to_mfn
> > -- 
> > 2.17.1
> > 
> 
--8323329-669571726-1610741182=:31265--

