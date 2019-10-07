Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48719CEE6E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 23:33:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHaag-0006Et-W6; Mon, 07 Oct 2019 21:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHaae-0006El-M8
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 21:30:48 +0000
X-Inumbo-ID: b9ce2836-e949-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9ce2836-e949-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 21:30:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E31B20867;
 Mon,  7 Oct 2019 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570483846;
 bh=ZP6p2oensXj7KkRd+Cu8T8ycR2MOFR2Tss3SYBpTO3c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tfvMNKhDSjkDRvYoXLoFhTv5+2hxAZjlXzO6UENeISz0R/rl8qdOClgBpxfKkPyxf
 JLtttMBfQLpZNel7a5O38/iIzkLAI+GzoE1d+LNxUcf/cWszR5wO0HwwBP6RHTrKVk
 Y8D2v5DjW2NNNv5Eop70w7GKYSaCKvF+/auhhx74=
Date: Mon, 7 Oct 2019 14:30:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
In-Reply-To: <71fe02ae-a279-8d30-28e9-35d6c84c9a08@suse.com>
Message-ID: <alpine.DEB.2.21.1910071430100.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
 <71fe02ae-a279-8d30-28e9-35d6c84c9a08@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-441291930-1570483846=:13684"
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node
 in DT
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
Cc: julien@xen.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr_Babchuk@epam.com,
 oleksandr_tyshchenko@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-441291930-1570483846=:13684
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 7 Oct 2019, Jürgen Groß wrote:
> On 05.10.19 01:09, Stefano Stabellini wrote:
> > When reserved-memory regions are present in the host device tree, dom0
> > is started with multiple memory nodes. Each memory node should have a
> > unique name, but today they are all called "memory" leading to Linux
> > printing the following warning at boot:
> > 
> >    OF: Duplicate name in base, renamed to "memory#1"
> > 
> > This patch fixes the problem by appending a "@<unit-address>" to the
> > name, as per the Device Tree specification, where <unit-address> matches
> > the base of address of the first region.
> > 
> > Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > ---
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 921b054520..a4c07db383 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -646,16 +646,22 @@ static int __init make_memory_node(const struct domain
> > *d,
> >       int res, i;
> >       int reg_size = addrcells + sizecells;
> >       int nr_cells = reg_size * mem->nr_banks;
> > +    /* Placeholder for memory@ + a 32-bit number + \0 */
> > +    char buf[18];
> 
> You are using PRIx64 for printing the number, so I guess you should
> enlarge buf by 8 bytes and adjust the comment (s/32/64/).

Well spotted! In fact, there is a similar error in make_cpus_node. I'll
fix that one too in a separate patch.


> >       __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
> >       __be32 *cells;
> >         BUG_ON(nr_cells >= ARRAY_SIZE(reg));
> > +    /* Nothing to do */
> > +    if ( mem->nr_banks == 0 )
> > +        return 0;
> >         dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
> >                  reg_size, nr_cells);
> >         /* ePAPR 3.4 */
> > -    res = fdt_begin_node(fdt, "memory");
> > +    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
> > +    res = fdt_begin_node(fdt, buf);
> >       if ( res )
> >           return res;
> 
> 
> Juergen
> 
--8323329-441291930-1570483846=:13684
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-441291930-1570483846=:13684--

