Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628F505F1E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 23:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307589.522766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngYW7-00022d-0e; Mon, 18 Apr 2022 21:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307589.522766; Mon, 18 Apr 2022 21:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngYW6-00020n-TH; Mon, 18 Apr 2022 21:02:38 +0000
Received: by outflank-mailman (input) for mailman id 307589;
 Mon, 18 Apr 2022 21:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngYW5-00020h-Ec
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 21:02:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id def4b8a0-bf5a-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 23:02:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E67A60FCB;
 Mon, 18 Apr 2022 21:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9DCC385A1;
 Mon, 18 Apr 2022 21:02:33 +0000 (UTC)
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
X-Inumbo-ID: def4b8a0-bf5a-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650315754;
	bh=1nTJUTd3vSH9xAxWpz9xqIR5cJ1mGGt6UlvZA/dq5B0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iGVaRUro2zRx/0+gBdUxhw8G9BPgjA3f1ClzxOaQAf3gOLIhz/rrN4sp4Gqi7LFpu
	 mRE05p5BlQZcS8jgyVEo5vToBpQ9SMuoqoiuVgZ8Ru1u7hu/zxHdtyk/pmb2dJAR5k
	 X98K5gINzbGfi1+RaW2Jm6cAGlW61yRdTPG3a2ThlsgV+dDnkhujD2uP1Ajhw9JFAm
	 WXLfsSHbnfUKhkoiWYpJ1jbsj/lH6zY7SNR/egp3E2uIorBsE7LelVQYQyZdZEGesu
	 S8mmLevWoPW5cIs4Qf5H8I+nJGIkPeWvHjbGQ5qW1xAu+HFQqQN5jW8Vz01XMgAlw3
	 kN+5f0wct8iFQ==
Date: Mon, 18 Apr 2022 14:02:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [PATCH v12] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
In-Reply-To: <2a287b59-9ff2-6bd0-fa42-d95333fc1554@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204181402070.915916@ubuntu-linux-20-04-desktop>
References: <20220324133705.37882-1-ayankuma@xilinx.com> <2a287b59-9ff2-6bd0-fa42-d95333fc1554@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Apr 2022, Julien Grall wrote:
> On 24/03/2022 13:37, Ayan Kumar Halder wrote:
> >       /*
> >        * At this point, we know that the instruction is either valid or has
> > been
> >        * decoded successfully. Thus, Xen should be allowed to execute the
> > diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> > index 54167aebcb..87a6240f2a 100644
> > --- a/xen/arch/arm/ioreq.c
> > +++ b/xen/arch/arm/ioreq.c
> > @@ -47,7 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> >                                struct vcpu *v, mmio_info_t *info)
> >   {
> >       struct vcpu_io *vio = &v->io;
> > -    struct instr_details instr = info->dabt_instr;
> > +    const struct instr_details instr = info->dabt_instr;
> >       struct hsr_dabt dabt = info->dabt;
> >       ioreq_t p = {
> >           .type = IOREQ_TYPE_COPY,
> > @@ -62,7 +62,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> >            * memory access. So for now, we can safely always set to 0.
> >            */
> >           .df = 0,
> > -        .data = get_user_reg(regs, info->dabt.reg),
> >           .state = STATE_IOREQ_READY,
> >       };
> >       struct ioreq_server *s = NULL;
> > @@ -74,12 +73,23 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> >           return IO_ABORT;
> >       }
> >   +    if ( instr.state == INSTR_CACHE )
> > +        p.size = dcache_line_bytes;
> I think it would be best to only set the p.size when instr.state !=
> INSTR_CACHE in the else here.
> 
> I can do that on commit. I will also give a chance to Stefano to reply.

The patch looks OK to me, please go ahead and make the change on
commit.

