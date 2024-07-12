Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A893025B
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 01:26:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758363.1167831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSPdg-0002sF-Ct; Fri, 12 Jul 2024 23:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758363.1167831; Fri, 12 Jul 2024 23:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSPdg-0002p7-9s; Fri, 12 Jul 2024 23:25:20 +0000
Received: by outflank-mailman (input) for mailman id 758363;
 Fri, 12 Jul 2024 23:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSPde-0002oi-T9
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 23:25:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fef0f8f6-40a5-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 01:25:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E76E962192;
 Fri, 12 Jul 2024 23:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42F2C32782;
 Fri, 12 Jul 2024 23:25:14 +0000 (UTC)
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
X-Inumbo-ID: fef0f8f6-40a5-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720826715;
	bh=2zEjcXKoJL7qQnx6vetCK8ktV0s50c1VeFvpg3lynWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lWkT0Au9OeD3iasDu0gnxzpFYmo4y+aTVogzVSAFCu37EfABfDYd/6rke/9/Q6YI0
	 YYDhNC67Gnlgl2MF/E3juPof4WhW34oY5R4ruNu0+3lS+jJHSO8QjGf6GTX7HtQH53
	 P+vMjj3HM7S+JGRi1Sj0lPpSD8u2LpYFu5MRCzZSAlUM6cIIpj73FwwmA4dSdrHZHp
	 ngIyN2gnvd/NB3qNqr0ThZ6zZk//q5q4cLa+t3CS63HbwTIpxzD+Ca+iZdrX09KMUj
	 mMkm9YADEiSmJ2XYe5q/u1uex1l1LFi/Pq2R053JxJL4jPn8SzvLVAnEbH8u499sGg
	 BcYYDxnqvFPeg==
Date: Fri, 12 Jul 2024 16:25:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 07/12] x86/hvm: address violations of MISRA C Rule
 16.3
In-Reply-To: <f4eb47f2-ba7e-4326-b2c3-5d1c97cadd5b@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407121619270.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719383180.git.federico.serafini@bugseng.com> <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com> <2c60ef16-e17c-48dd-911a-d1734aed6da5@suse.com> <f4eb47f2-ba7e-4326-b2c3-5d1c97cadd5b@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jul 2024, Federico Serafini wrote:
> On 01/07/24 10:47, Jan Beulich wrote:
> > On 26.06.2024 11:28, Federico Serafini wrote:
> > > @@ -2798,11 +2800,12 @@ void hvm_emulate_one_vm_event(enum emul_kind kind,
> > > unsigned int trapnr,
> > >           hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
> > >           memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
> > >                  hvio->mmio_insn_bytes);
> > > +        fallthrough;
> > >       }
> > > -    /* Fall-through */
> > >       default:
> > 
> > Can you clarify for me please whether this arrangement actually helps?
> > I'm pretty sure it'll result in a Coverity complaint, as my understanding
> > is that for them the marker (comment or pseudo-keyword) has to immediately
> > precede the subsequent label. IOW even if you confirmed that Eclair is
> > smarter in this regard, it may still need converting to
> > 
> >          hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
> >          memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
> >                 hvio->mmio_insn_bytes);
> >      }
> >          fallthrough;
> >      default:
> > 
> 
> Yes, this is ok for ECLAIR.

Given that Jan might be right that Coverity and others would prefer the
keyword on the line immediately above "default", and given that it works
anyway for ECLAIR, then I think it would be better to stay on the safe
side and move the "fallback" right on top of default.

If you are OK with it, please resend this patch and following patches.
Patches 1-6 are fully acked and I'd be happy to take them in my for-4.20
branch.

