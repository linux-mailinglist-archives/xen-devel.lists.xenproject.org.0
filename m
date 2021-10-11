Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CA428D96
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205975.361419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZv74-0005B5-Kx; Mon, 11 Oct 2021 13:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205975.361419; Mon, 11 Oct 2021 13:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZv74-00057u-Hx; Mon, 11 Oct 2021 13:13:06 +0000
Received: by outflank-mailman (input) for mailman id 205975;
 Mon, 11 Oct 2021 13:13:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZv72-00057o-KT
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:13:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZv72-0005j5-Ja
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:13:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZv72-0008Jp-IN
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:13:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mZv6z-00019w-08; Mon, 11 Oct 2021 14:13:01 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=dTMF7exkdx37Ym3T/GqUaJCGI9ifJqKuFtXwFnmmJ+o=; b=PrHyCKpkPnbO/sLeauJwjoW/Kb
	lui6lT2/cSb36oJhsgq2KAz3+6t5yopHQRxtnHk3VYADws3lXH4HhNTacDwjCqKMX9btn8SAe5Xhd
	VI8GEunw+HieevlGhIR7KOdvmic29r0/O5tw8bHuhFjG1k1OrL4ruRG0SNKV5xvU27j8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24932.14428.657415.416663@mariner.uk.xensource.com>
Date: Mon, 11 Oct 2021 14:13:00 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU
 disabled [and 1 more messages]
In-Reply-To: <ed7632b9-5426-b351-45af-7ad3bf31d3d9@suse.com>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
	<a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
	<24932.6255.815797.597475@mariner.uk.xensource.com>
	<ed7632b9-5426-b351-45af-7ad3bf31d3d9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU disabled [and 1 more messages]"):
> On 11.10.2021 12:56, Ian Jackson wrote:
> > I think 2/ is a new quirk (or, new behaviour for an existing quirk).
> > I think I am happy to treat that as a bugfix, assuming we are
> > reasonably confident that most systems (including in particular all
> > systems without the quirk) will take unchanged codepaths.  Is that
> > right ?
> 
> Yes. According to Linux there's exactly one BIOS flavor known to
> exhibit the issue.
> 
> > I don't understand 1/.  It looks bugfixish to me but I am really not
> > qualified.  I am inclined to defer to your judgement, but it would
> > help me if you explicitly addressed the overall risks/benefits.
> 
> Right now our documentation claims similarity to a Linux workaround
> without the similarity actually existing in the general case. A
> common case (a single integrated graphics device) is handled, but the
> perhaps yet more common case of a single add-in graphics devices is
> not. Plus the criteria by which a device is determined to be a
> graphics one was completely flawed. Hence people in need of the
> workaround may find it non-functional. However, since our doc tells
> people to report if they have a need to use the option engaging the
> workaround, and since we didn't have any such reports in a number
> of years, I guess both benefits and possible risks here are of
> purely theoretical nature. Note that I've specifically said "possible"
> because I can't really see any beyond me not having properly matched
> Linux'es equivalent workaround - that workaround has been in place
> unchanged for very many years.

OK, great.  Thanks for the explanation.  For the record,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> > But when reading the patch I did notice one thing that struck me as
> > undesriable:
...
> > That seems like a recipe for missing one.  And I think a missed one
> > would be an XSA.  Could we not structure the code some way to avoid
> > this foreseeable human error ?
> 
> I'm afraid I don't see a good way to do so, as imo it's desirable to
> have separate log messages. IOW something like
> 
>     if ( ... )
>     {
>         msg = "...";
>         goto dead;
>     }
> 
> doesn't look any better to me. Also leaving individual IOMMUs disabled
> should really be the exception anyway.

C does not make this kind of thing easy.  I might be tempted to make
an inner function which returned a const char*, with NULL meaning "it
went OK".  Oh for a proper sum type...

Ian.

