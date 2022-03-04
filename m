Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2544CE038
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 23:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284942.484184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQGL7-0000Zm-3u; Fri, 04 Mar 2022 22:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284942.484184; Fri, 04 Mar 2022 22:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQGL7-0000X9-0g; Fri, 04 Mar 2022 22:23:57 +0000
Received: by outflank-mailman (input) for mailman id 284942;
 Fri, 04 Mar 2022 22:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zYUj=TP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nQGL6-0000X3-CX
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 22:23:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6fe11f3-9c09-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 23:23:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4367AB8267A;
 Fri,  4 Mar 2022 22:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44258C340EE;
 Fri,  4 Mar 2022 22:23:52 +0000 (UTC)
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
X-Inumbo-ID: c6fe11f3-9c09-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646432632;
	bh=BsJiPOPlwKKu/0/BCjO4QXxRCz/0dNfpTa19/sxPjkY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nwN+nOqlSUFMjH8s1K/KrDpjay724NTxHVeNkzYZrfxvzkYalJsHaXhisySo7cSCN
	 RU0bKAIKtyJQEAEgzZoKRCWrF8Tmo8YPYcxVF+sx3MAQ+thc5cOzQNwDU84BDZ7ZZ6
	 pcZ/iWnZ1V7WwOSknBwXX1yJdZK+cs+69+A2/gJKJIUfn4irVg0/06FTD4rXKyNqzx
	 mQuaxuMhDNkU/7bExiKmDgxSEARI0xZFDbXjQQ5EGUx0QGrKCw4ncgXG0q0ICfsGv8
	 Z1B/mPnX6oDOqvZejyKsnU4EoagRzrnsAunU97k/3++HotpCo9Hzg5NMFqx66ECsX4
	 1y1e6rpymW06g==
Date: Fri, 4 Mar 2022 14:23:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel@lists.xenproject.org, stefanos@xilinx.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    wl@xen.org, paul@xen.org, roger.pau@citrix.com, 
    Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v9 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
In-Reply-To: <e8c030cf-6909-b730-96f9-b98221c8d4c2@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203041423400.3261@ubuntu-linux-20-04-desktop>
References: <20220301124022.10168-1-ayankuma@xilinx.com> <20220301124022.10168-3-ayankuma@xilinx.com> <alpine.DEB.2.22.394.2203031637200.3261@ubuntu-linux-20-04-desktop> <e8c030cf-6909-b730-96f9-b98221c8d4c2@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Mar 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 04/03/2022 00:42, Stefano Stabellini wrote:
> > >   void register_mmio_handler(struct domain *d,
> > > diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> > > index 308650b400..58cd320b5a 100644
> > > --- a/xen/arch/arm/ioreq.c
> > > +++ b/xen/arch/arm/ioreq.c
> > > @@ -47,6 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> > >                                struct vcpu *v, mmio_info_t *info)
> > >   {
> > >       struct vcpu_io *vio = &v->io;
> > > +    struct dabt_instr instr = info->dabt_instr;
> > >       ioreq_t p = {
> > >           .type = IOREQ_TYPE_COPY,
> > >           .addr = info->gpa,
> > > @@ -76,10 +77,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs
> > > *regs,
> > >       if ( !s )
> > >           return IO_UNHANDLED;
> > >   -    if ( !info->dabt.valid )
> > > -        return IO_ABORT;
> > > +    ASSERT(dabt.valid);
> > 
> > I cannot see where we set dabt.valid on successfully decoding the
> > instruction. It looks like we don't? If we don't, then here the ASSERT
> > would fail in case of postindexing instructions, right?
> 
> We don't currently set dabt.valid. There are other reasons to set it (see my
> reply to Ayan). So...
> 
> > 
> > If we don't, then we should probably just get rid of this ASSERT: it is
> > not worth setting dabt.valid just so that this ASSERT would succeed.
> 
> ... I would keep the ASSERT.

OK

