Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF7AD7A8B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:53:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKP67-0007we-Ep; Tue, 15 Oct 2019 15:50:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yms0=YI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKP66-0007wW-F9
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:50:54 +0000
X-Inumbo-ID: 91b0b560-ef63-11e9-9396-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91b0b560-ef63-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 15:50:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CD1820854;
 Tue, 15 Oct 2019 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571154653;
 bh=hMdW7a5HPGVx15x6Oo5ehi8WO7VlsTTNsKPGqT4UaIk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NpFOHwEz9E7a0JBHtGkb0EcBdngyWMZdKop4u93vzO98XgpPjPhEQ2ZUTAf984jrT
 WYhGXlRiH63z8Tr6G4+HqhbaOVxqmRXz4JhiFrnb+lgKvwELeva3yi1FoDVcL2m+X0
 KI3YWJMUJAFRjg2gAmRK3GJzMW1lGUopkkWf9YUY=
Date: Tue, 15 Oct 2019 08:50:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
In-Reply-To: <3cdf0397-fd18-35af-6181-c7842dfc3e37@suse.com>
Message-ID: <alpine.DEB.2.21.1910150849130.6326@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
 <3cdf0397-fd18-35af-6181-c7842dfc3e37@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1660004983-1571154579=:6326"
Content-ID: <alpine.DEB.2.21.1910150850330.6326@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove special dom0 case in
 dump_hyp_walk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1660004983-1571154579=:6326
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1910150850331.6326@sstabellini-ThinkPad-T480s>

On Tue, 15 Oct 2019, Jürgen Groß wrote:
> On 15.10.19 05:49, Stefano Stabellini wrote:
> > There is no need to have a special dom0 case to convert the pgtable
> > virtual address into a physical address. The virt_to_maddr function can
> > work both in the dom0 case and the domU case.
> > 
> > This is more than a cleanup: when Xen is loaded at addresses lower than
> > 2MB on arm32 phys_offset might not hold the right value and be unable to
> > perform a virt to phys conversion properly. Reducing the unnecessary
> > usage of phys_offset is a good idea.
> > 
> > Link: https://marc.info/?l=xen-devel&m=157081398022401
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index a6637ce347..b7883cfbab 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -284,10 +284,7 @@ void dump_hyp_walk(vaddr_t addr)
> >              "on CPU%d via TTBR 0x%016"PRIx64"\n",
> >              addr, smp_processor_id(), ttbr);
> >   -    if ( smp_processor_id() == 0 )
> > -        BUG_ON( (lpae_t *)(unsigned long)(ttbr - phys_offset) != pgtable );
> > -    else
> > -        BUG_ON( virt_to_maddr(pgtable) != ttbr );
> > +    BUG_ON( virt_to_maddr(pgtable) != ttbr );
> >       dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
> >   }
> 
> I can't make a connection between commit message ("special dom0 case")
> and the code modification. The special case removed is about cpu 0, not
> dom0.

That's what happen when I write a commit message late in the night.
Sorry about that. I'll resend it.
--8323329-1660004983-1571154579=:6326
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1660004983-1571154579=:6326--

