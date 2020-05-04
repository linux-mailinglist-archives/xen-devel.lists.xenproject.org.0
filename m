Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78AB1C3469
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 10:28:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVWS1-00012C-Re; Mon, 04 May 2020 08:27:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EiMY=6S=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jVWRz-000123-O0
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 08:27:43 +0000
X-Inumbo-ID: 1fe8673a-8de1-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fe8673a-8de1-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JjAg5xRaxEfxbRzTOHID8bMgMfwvn+IOOGPb4fJo2CM=; b=l++DlWrXH0NfLsCTkBa9ohXokZ
 jsTFIotuKYbZhyj/Ruwk5SaiRjgfMzGzyGCrRHZSTk6BvKC1TsnLenGjzgka/39zG2qL00NsLsEwP
 8osHSfhHWvedWmbT6TPqagJPpceWDaG95pIQuc8xcYLxjIbM/OcsrF2X/M0edgFSxG68=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jVWRx-0003V5-UZ; Mon, 04 May 2020 08:27:41 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jVWRx-00006I-JT; Mon, 04 May 2020 08:27:41 +0000
Message-ID: <c3edd42c66ded0c1f129e1de2a4b8f54cef4c136.camel@xen.org>
Subject: Re: [PATCH 02/16] acpi: vmap pages in acpi_os_alloc_memory
From: Hongyan Xia <hx242@xen.org>
To: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 04 May 2020 09:27:39 +0100
In-Reply-To: <CAJ=z9a0S0rOYbJVPGK6mTKN0OgJtiTU7YN-APLF4Dvr4CaKfJg@mail.gmail.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
 <CAJ=z9a0S0rOYbJVPGK6mTKN0OgJtiTU7YN-APLF4Dvr4CaKfJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-05-01 at 22:35 +0100, Julien Grall wrote:
> Hi,
> 
> On Thu, 30 Apr 2020 at 21:44, Hongyan Xia <hx242@xen.org> wrote:
> > 
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > Also, introduce a wrapper around vmap that maps a contiguous range
> > for
> > boot allocations.
> > 
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > ---
> >  xen/drivers/acpi/osl.c | 9 ++++++++-
> >  xen/include/xen/vmap.h | 5 +++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> > index 4c8bb7839e..d0762dad4e 100644
> > --- a/xen/drivers/acpi/osl.c
> > +++ b/xen/drivers/acpi/osl.c
> > @@ -219,7 +219,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
> >         void *ptr;
> > 
> >         if (system_state == SYS_STATE_early_boot)
> > -               return
> > mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> > +       {
> > +               mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
> > +
> > +               return vmap_boot_pages(mfn, PFN_UP(sz));
> > +       }
> > 
> >         ptr = xmalloc_bytes(sz);
> >         ASSERT(!ptr || is_xmalloc_memory(ptr));
> > @@ -244,5 +248,8 @@ void __init acpi_os_free_memory(void *ptr)
> >         if (is_xmalloc_memory(ptr))
> >                 xfree(ptr);
> >         else if (ptr && system_state == SYS_STATE_early_boot)
> > +       {
> > +               vunmap(ptr);
> >                 init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
> 
> __pa(ptr) can only work on the direct map. Even worth, on Arm it will
> fault because there is no mapping.
> I think you will want to use vmap_to_mfn() before calling vunmap().

Thanks for spotting this. This is definitely wrong. Will revise.

Hongyan


