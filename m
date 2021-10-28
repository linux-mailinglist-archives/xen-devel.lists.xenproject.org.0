Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A2D43E334
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218071.378364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg67a-00069X-8I; Thu, 28 Oct 2021 14:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218071.378364; Thu, 28 Oct 2021 14:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg67a-00066X-4l; Thu, 28 Oct 2021 14:11:10 +0000
Received: by outflank-mailman (input) for mailman id 218071;
 Thu, 28 Oct 2021 14:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg67Y-00066R-Gj
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:11:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg67Y-0000aQ-FI
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:11:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg67Y-0005Il-Ea
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:11:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mg67U-0002Ju-PF; Thu, 28 Oct 2021 15:11:04 +0100
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
	bh=686+/GwBsuXxkPZS/sCU+xH1FdRwq4PT+JCTmnLo+sU=; b=qYmo0APZXPGiPX4B86oZndbx4/
	oszeBcCFcpSTUSK5aGIp0YMUiqSq3HiE1BVOg5AKdmcMWXOU8M2ZbmhjwY2G2VYjTrZltyIdi/nQe
	wr/NeyN2Nhb9fHdmJhGEfx5pLrX25Ozq85RrvkHWAOtZ0DksBUjmyPjHmC7gNX6x5e+s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24954.44919.8320.63375@mariner.uk.xensource.com>
Date: Thu, 28 Oct 2021 15:11:03 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan  Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian  Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v3] gnttab: allow setting max version per-domain
In-Reply-To: <YXqfk4tj30EmbSEt@Air-de-Roger>
References: <20211028095923.83982-1-roger.pau@citrix.com>
	<24954.37807.277003.373593@mariner.uk.xensource.com>
	<YXqfk4tj30EmbSEt@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.16 v3] gnttab: allow setting max version per-domain"):
> Would you like me to this to the commit message:
> 
> "xenstored stubdomains are limited to grant table v1 because the
> current MiniOS code used to build them only has support for grants v1.
> There are existing limits set for xenstored stubdomains at creation
> time that already match the defaults in MiniOS."

Yes, please.

> > I am not sure about the implications for migration.  Might using this
> > cause migration to fail for some guests ?
> > 
> >    Note that when using the default grant version the specific max
> >    version in use by the domain is not migrated. Any guests should be
> >    able to cope with the max grant version changing across migrations,
> >    and if a specific guest relies on a maximum grant version being
> >    unconditionally available it should be specified on the configuration
> >    file.
> > 
> > Only if the feature is *not* used, I guess.  Ie, this is the status
> > quo.   So I don't think there is any release risk there.
> 
> This was raised by Jan in a previous version, the discussion can be
> found here:
> 
> https://lore.kernel.org/xen-devel/0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com/
> 
> The issue could arise if a guest that strictly needs grant v2 is
> migrated from a host that has v2 as the default max version to another
> box that has v1 as the max version. If the guest config file doesn't
> explicitly specify that the guest requires grant v2 migration will
> succeed, but the guest will likely fail to resume properly.
> 
> This is already the current behavior if a guest is migrated from a
> host not having gnttab=max-ver set to one having gnttab=max-ver:1.

Right.  I don't think this is the correct behaviour but the patch is
moving in the right direction.

> > If we can get good answers to all of this, ideally I would like to see
> > this committed by the end of tomorrow.  I plan to cut RC1 on Monday.

Thanks.


Tools ack: with the commit message change discussed above,

Reviewed-by: Ian Jackson <iwj@xenproject.org>


I have no further release concerns but a formal release-ack will have
to wait for review of the ocaml parts.

Ian.

