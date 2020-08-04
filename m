Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332623C22C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 01:23:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k36GN-0001g6-Nn; Tue, 04 Aug 2020 23:22:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k36GM-0001g1-Oo
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 23:22:30 +0000
X-Inumbo-ID: 1b6332ac-f65e-4ebd-8dbb-081a2cc29d21
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b6332ac-f65e-4ebd-8dbb-081a2cc29d21;
 Tue, 04 Aug 2020 23:22:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D85C92073E;
 Tue,  4 Aug 2020 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596583348;
 bh=PsSJUCD59asltcoFiaVL865acSKkt2G4DHIVsCjUDOs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=UqSjPVKuhrcyUhuZlqz/uf2//X+bnHxeXL4pwtRu1HNLEEmeQB+NkDAlTPcLo06NQ
 ZHdk9Zd9pmuO9R20Hjg1tkml5QRywe8TzUJQy/QyZ0g59UDiv9CPwsgUtVv4GOfvEN
 fylxSKRjtfeABEWpflj9Vb6/xD/R8KGc1B2s2tNI=
Date: Tue, 4 Aug 2020 16:22:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <6c4f7698-a015-91c7-83ec-203f63d48900@xen.org>
Message-ID: <alpine.DEB.2.21.2008041345310.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <001101d66a33$bba44670$32ecd350$@xen.org>
 <6c4f7698-a015-91c7-83ec-203f63d48900@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 4 Aug 2020, Julien Grall wrote:
> On 04/08/2020 08:49, Paul Durrant wrote:
> > > diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
> > > index 931404c..b5fc066 100644
> > > --- a/tools/libxc/xc_dom_arm.c
> > > +++ b/tools/libxc/xc_dom_arm.c
> > > @@ -26,11 +26,19 @@
> > >   #include "xg_private.h"
> > >   #include "xc_dom.h"
> > > 
> > > -#define NR_MAGIC_PAGES 4
> > > +
> > >   #define CONSOLE_PFN_OFFSET 0
> > >   #define XENSTORE_PFN_OFFSET 1
> > >   #define MEMACCESS_PFN_OFFSET 2
> > >   #define VUART_PFN_OFFSET 3
> > > +#define IOREQ_SERVER_PFN_OFFSET 4
> > > +
> > > +#define NR_IOREQ_SERVER_PAGES 8
> > > +#define NR_MAGIC_PAGES (4 + NR_IOREQ_SERVER_PAGES)
> > > +
> > > +#define GUEST_MAGIC_BASE_PFN (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT)
> > > +
> > > +#define special_pfn(x)  (GUEST_MAGIC_BASE_PFN + (x))
> > 
> > Why introduce 'magic pages' for Arm? It's quite a horrible hack that we have
> > begun to do away with by adding resource mapping.
> 
> This would require us to mandate at least Linux 4.17 in a domain that will run
> an IOREQ server. If we don't mandate this, the minimum version would be 4.10
> where DM OP was introduced.
> 
> Because of XSA-300, we could technically not safely run an IOREQ server with
> existing Linux. So it is probably OK to enforce the use of the acquire
> interface.

+1

