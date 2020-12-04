Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A602CEC75
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44373.79512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8cx-000404-W5; Fri, 04 Dec 2020 10:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44373.79512; Fri, 04 Dec 2020 10:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8cx-0003zi-T5; Fri, 04 Dec 2020 10:47:51 +0000
Received: by outflank-mailman (input) for mailman id 44373;
 Fri, 04 Dec 2020 10:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8cw-0003zb-Ig
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:47:50 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c28f864-2c61-4c9a-b610-eb1e28479484;
 Fri, 04 Dec 2020 10:47:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r3so4860390wrt.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:47:49 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u23sm2699076wmc.32.2020.12.04.02.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:47:48 -0800 (PST)
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
X-Inumbo-ID: 2c28f864-2c61-4c9a-b610-eb1e28479484
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kuA/yQ4vyj1G+DxnjxkDCulQAGgM5Ed5CjhJHkroJBQ=;
        b=SsOdunQ03Ev3RWuLCIkr8nniJiZ1S1vS8gca0mY5UEFh3WyeDS5j0rXphfcOs8tBos
         FxnsQwPAFelhn6WYTjVHk0d+zSH6SDienOgqDfMdwZtuz3BiiSD0AdTq+DgbbKZQhwTr
         mA7Y2jeb8tU14PJo9BaMo8P/1ikmnAOr0G+PTmdcnAZoS4SA4Rww2ukLz9vmYVtoRYg+
         Fn5WC2adnL2epqniYnck1W8mcvwQY0k7X9PfTheNZpP11X8szGqXkPjHXBJXwtFbv57b
         caixsTo95aUIBsUcm/EXYPYR7oOCxoi0/e70VubdvUgxUUNUO4ME13HM9P8w5WjinygB
         YiWQ==
X-Gm-Message-State: AOAM5322ir0sFEg4aQjaFbmdtQdj4fgyIzVtWY9Bx2EFxeSn06GAXEJd
	gDNKhS74ECWjnQpchQzgc8U=
X-Google-Smtp-Source: ABdhPJyDoCSpapC7Lo3EXfLV+9P/i+CHNVNN2n6OA6NRQMCGFghA0ou6ARfLrntyTiavL5aAFezIyQ==
X-Received: by 2002:a5d:400a:: with SMTP id n10mr4232204wrp.362.1607078868865;
        Fri, 04 Dec 2020 02:47:48 -0800 (PST)
Date: Fri, 4 Dec 2020 10:47:47 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Cc: 'Jan Beulich' <jbeulich@suse.com>, 'Wei Liu' <wl@xen.org>,
	'Paul Durrant' <pdurrant@amazon.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 00/11] viridian: add support for ExProcessorMasks
Message-ID: <20201204104747.zh7qpxmlpzg6xl2n@liuwe-devbox-debian-v2>
References: <20201202092205.906-1-paul@xen.org>
 <fabc2720-3cbc-0b3f-1b09-23ec25189407@suse.com>
 <011301d6ca17$1a3fb690$4ebf23b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011301d6ca17$1a3fb690$4ebf23b0$@xen.org>
User-Agent: NeoMutt/20180716

On Fri, Dec 04, 2020 at 08:26:01AM -0000, Paul Durrant wrote:
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 04 December 2020 08:12
> > To: Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> > Cc: Paul Durrant <pdurrant@amazon.com>; xen-devel@lists.xenproject.org
> > Subject: Re: [PATCH v4 00/11] viridian: add support for ExProcessorMasks
> > 
> > Wei,
> > 
> > On 02.12.2020 10:21, Paul Durrant wrote:
> > > From: Paul Durrant <pdurrant@amazon.com>
> > >
> > > Paul Durrant (11):
> > >   viridian: don't blindly write to 32-bit registers is 'mode' is invalid
> > >   viridian: move flush hypercall implementation into separate function
> > >   viridian: move IPI hypercall implementation into separate function
> > >   viridian: introduce a per-cpu hypercall_vpmask and accessor
> > >     functions...
> > >   viridian: use hypercall_vpmask in hvcall_ipi()
> > >   viridian: use softirq batching in hvcall_ipi()
> > >   viridian: add ExProcessorMasks variants of the flush hypercalls
> > >   viridian: add ExProcessorMasks variant of the IPI hypercall
> > >   viridian: log initial invocation of each type of hypercall
> > >   viridian: add a new '_HVMPV_ex_processor_masks' bit into
> > >     HVM_PARAM_VIRIDIAN...
> > >   xl / libxl: add 'ex_processor_mask' into
> > >     'libxl_viridian_enlightenment'
> > >
> > >  docs/man/xl.cfg.5.pod.in             |   8 +
> > >  tools/include/libxl.h                |   7 +
> > >  tools/libs/light/libxl_types.idl     |   1 +
> > >  tools/libs/light/libxl_x86.c         |   3 +
> > >  xen/arch/x86/hvm/viridian/viridian.c | 604 +++++++++++++++++++++------
> > >  xen/include/asm-x86/hvm/viridian.h   |  10 +
> > >  xen/include/public/hvm/params.h      |   7 +-
> > >  7 files changed, 516 insertions(+), 124 deletions(-)
> > 
> > the status of this series was one of the topics of yesterday's
> > community call. Since Paul's prior ping hasn't had a response by
> > you (possibly because you're on PTO for an extended period of
> > time) the plan is to get this series in with as much of
> > reviewing that I was able to do by, perhaps, the middle of next
> > week. Unless of course we hear back from you earlier, giving at
> > least an indication of when you might be able to look at this.
> > 
> > Thanks for your understanding.
> > 
> > Paul, I notice v4 patches 10 and 11 never arrived in my inbox.
> 
> Oh, yes... I don't see them in my mail either. (I guess I did 'git send-email 000*' instead of 'git send-email 00*'). I'll send v5 (with the extra style fix) and get them on list.
> 
> > The list archives also don't have them. Therefore I can't check
> > the status of the tools side changes, and I don't think I'd
> > want to commit those anyway without tool stack side acks, the
> > more that they weren't part of what I've looked at.
> > 
> 
> Sure. The toolstack side is pretty trivial so hopefully Anthony or Ian would happy to give an ack.

You have my ack on that part too.

Wei.

