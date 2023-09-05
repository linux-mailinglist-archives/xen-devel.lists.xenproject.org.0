Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4C7931F8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 00:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595909.929592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdeWO-0007Pz-H8; Tue, 05 Sep 2023 22:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595909.929592; Tue, 05 Sep 2023 22:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdeWO-0007O5-EK; Tue, 05 Sep 2023 22:27:44 +0000
Received: by outflank-mailman (input) for mailman id 595909;
 Tue, 05 Sep 2023 22:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IDwH=EV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdeWN-0007Nw-47
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 22:27:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cd1ee52-4c3b-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 00:27:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E92DB816ED;
 Tue,  5 Sep 2023 22:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC46DC433CA;
 Tue,  5 Sep 2023 22:27:38 +0000 (UTC)
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
X-Inumbo-ID: 6cd1ee52-4c3b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693952859;
	bh=OX3L10SuN1W6QMrxDYb2mX7nY/V90/XCzZIYSkI9NuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bthpRCM/3IgeEH6Y/kiQL8GYGUND1mWeMzSrY13WKN1OBmXMaJd3i5cz9AxQSVNyC
	 DpX9Ziu8CHIotXzOvQwseEosWZBOUZ4VTSLW5F0RgPLNsCugNebSjQekP9ni2u5PbG
	 uEWXMtbf/38Ct8BcL2IQ5YeoQ4zTWNtZi5ab36E++9OGqFHoAYmCGhBEJhezM/lic9
	 t59yH/lOSbaP9OKItCk8pkEJvaZx1RgFOLkEDY8orUmu3Gl5AkGqxPYHVn/yseTrRt
	 xConaExAabhR2ehSRvTjo48eePR8IiUfbx155RZZ0fk2SV4Yl+uFeUVNQhzu6OjCyL
	 XT/iUlztPnyuQ==
Date: Tue, 5 Sep 2023 15:27:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309051519270.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop>
 <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Simone Ballarin wrote:
> On 29/08/23 00:51, Stefano Stabellini wrote:
> > On Mon, 28 Aug 2023, Simone Ballarin wrote:
> > > Move or amended inclusion guards to address violations of
> > > MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> > > to prevent the contents of a header file being included more than
> > > once").
> > > 
> > > Inclusion guards must appear at the beginning of the headers
> > > (comments are permitted anywhere) and the #if directive cannot
> > > be used for other checks.
> > > 
> > > Mechanical change.
> > > 
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > > ---
> > >   xen/include/xen/err.h       | 4 +++-
> > >   xen/include/xen/pci_ids.h   | 5 +++++
> > >   xen/include/xen/softirq.h   | 4 +++-
> > >   xen/include/xen/unaligned.h | 7 ++++---
> > >   xen/include/xen/vmap.h      | 4 +++-
> > >   5 files changed, 18 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
> > > index 2f29b57d28..a6323d82d7 100644
> > > --- a/xen/include/xen/err.h
> > > +++ b/xen/include/xen/err.h
> > > @@ -1,5 +1,6 @@
> > > -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> > > +#if !defined(__XEN_ERR_H__)
> > >   #define __XEN_ERR_H__
> > > +#if !defined(__ASSEMBLY__)
> > 
> > The original pattern was also guarding the header file sufficiently,
> > protecting it from double-inclusion. In fact, it is posing stricter
> > restrictions than usual (not laxer). This change is unnecessary?
> 
> The MISRA directive asks to use one of the two following forms:
> 
> <start-of-file>
> #if !defined ( identifier )
> #define identifier
> /* Contents of file */
> #endif
> <end-of-file>
> 
> <start-of-file>
> #ifndef identifier
> #define identifier
> /* Contents of file */
> #endif
> <end-of-file>
> 
> I do not see any reason for deviating, but if you ask that, I can do it.

Let's follow MISRA's form.

