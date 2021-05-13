Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EA38007C
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 00:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127097.238789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhK4I-00084Q-PR; Thu, 13 May 2021 22:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127097.238789; Thu, 13 May 2021 22:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhK4I-00081S-MJ; Thu, 13 May 2021 22:44:34 +0000
Received: by outflank-mailman (input) for mailman id 127097;
 Thu, 13 May 2021 22:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2h5=KI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhK4G-00081M-W1
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 22:44:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b17e4acb-9970-4262-b398-cbdb75f85b4e;
 Thu, 13 May 2021 22:44:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D13C613CB;
 Thu, 13 May 2021 22:44:31 +0000 (UTC)
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
X-Inumbo-ID: b17e4acb-9970-4262-b398-cbdb75f85b4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620945871;
	bh=uusHZ6Hu18cGkfqehEHDwxB05WhNIrzTKdoOVktZntA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Tl4cK54NmaePGQhluNWOJ8aKN1yjCZ7ovpnHW3XZL9r/i/N8FOs/P0PRlmRBnVBA1
	 OVfiDKdFJA9vlkvEL3VTjOYnDtWuep0Wgaus/MnA1LiXvZjrbHvAX8jMZX9hfS8e/5
	 4UA59IFCrW2AYNwXsmpUrf4nDKYpgJOquaDmkpP436doLBwSokIxfBjAuQWyTnrmwA
	 5jfcpYR2CO1gFgyL/QaxkIeFxNOG9Qy/qbo3ZGChe5jz4EazHXY5mV7DghyIVwgm10
	 TpeUfUeCPq1bqRxgxpp2vDS0KWTFGI0/zGLH00PRaSOsNfY6/kw69M9XvAiJgOmEs3
	 Z5jvOaSZ/Gvuw==
Date: Thu, 13 May 2021 15:44:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 02/15] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
In-Reply-To: <e834b447-46c2-14fe-a39c-209d4d6ca5fe@xen.org>
Message-ID: <alpine.DEB.2.21.2105131533070.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-3-julien@xen.org> <alpine.DEB.2.21.2105111515470.5018@sstabellini-ThinkPad-T480s> <94e364a7-de40-93ab-6cde-a2f493540439@xen.org> <alpine.DEB.2.21.2105121425500.5018@sstabellini-ThinkPad-T480s>
 <e834b447-46c2-14fe-a39c-209d4d6ca5fe@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 May 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 12/05/2021 22:30, Stefano Stabellini wrote:
> > On Wed, 12 May 2021, Julien Grall wrote:
> > > > > +#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
> > > > > +#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
> > > > > +#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
> > > > > 
> > > > > +#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
> > > > > +#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
> > > > > +#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
> > > > > +#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
> > > > 
> > > > I would avoid adding these 4 macros. It would be OK if they were just
> > > > used within this file but lpae.h is a header: they could end up be used
> > > > anywhere in the xen/ code and they have a very generic name. My
> > > > suggestion would be to skip them and just do:
> > > 
> > > Those macros will be used in follow-up patches. They are pretty useful to
> > > avoid introduce static array with the different information for each
> > > level.
> > > 
> > > Would prefix them with XEN_ be better?
> > 
> > Maybe. The concern I have is that there are multiple page granularities
> > (4kb, 16kb, etc) and multiple page sizes (4kb, 2mb, etc). If I just see
> > LEVEL_ORDER it is not immediately obvious what granularity and what size
> > we are talking about.
> 
> I am a bit puzzled with your answer. AFAIU, you are happy with the existing
> macros (THIRD_*, SECOND_*) but not with the new macros.
>
> In reality, there is no difference because THIRD_* doesn't tell you the exact
> size but only "this is a level 3 mapping".
> 
> So can you clarify what you are after? IOW is it reworking the current naming
> scheme?

You are right -- there is no real difference between THIRD_*, SECOND_*
and LEVEL_*.

The original reason for my comments is that I hadn't read the following
patches, and the definition of LEVEL_* macros is simple, they could be
open coded. It looked like they were only going to be used to make the
definition of THIRD_*, SECOND_* a bit easier. So, at first, I was
wondering if they were needed at all.

Secondly, I realized that they were going to be used in *.c files by
other patches. That's why they are there. But I started thinking whether
we should find a way to make it a bit clearer that they are for Xen
pages, currently at 4KB granularity. THIRD_*, SECOND_*, etc. are already
generic names which don't convey the granularity or whether they are Xen
pages at all. But LEVEL_* seem even more generic.

As I mentioned, I don't have any good suggestions for changes to make
here, so unless you can come up with a good idea let's keep it as is.

