Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263772C8C49
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 19:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41380.74509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjneN-0000tu-CR; Mon, 30 Nov 2020 18:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41380.74509; Mon, 30 Nov 2020 18:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjneN-0000tV-8b; Mon, 30 Nov 2020 18:11:47 +0000
Received: by outflank-mailman (input) for mailman id 41380;
 Mon, 30 Nov 2020 18:11:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kjneL-0000tQ-5O
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 18:11:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kjneH-0003AP-Vv; Mon, 30 Nov 2020 18:11:41 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=edge-cache-235.e-lhr50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kjneH-0008CH-J5; Mon, 30 Nov 2020 18:11:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=ndgVYZCrNmPbecjhfCy3ZQaLH0zpEGe05VzAmEtBl2s=; b=uSdYT+fG9DAb6Pm4Dlo2z0CP+L
	cusBBvqmPk1HkhAm+j6a7G+tcY8aUK0dlvh7vK8kCXfpkWmoaGeLCftR3JAiJVMKjjSBl0rDJisOf
	gcf/Z3jvpeimbe3IpS5s4iBEovARFM1juI8Qyl044J1dSfw9T42EaQOZjz+2cGvxvRl8=;
Message-ID: <8118aa61528cb14acab8a399bd483557bd3c921e.camel@xen.org>
Subject: Re: [PATCH 04/16] x86/srat: vmap the pages for acpi_slit
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	 <wl@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Date: Mon, 30 Nov 2020 18:11:38 +0000
In-Reply-To: <d41fee35-8889-3ab8-2a5e-f4b442747362@suse.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
	 <f4226fafcd333c0274fcee24601c280bf6494417.1588278317.git.hongyxia@amazon.com>
	 <d41fee35-8889-3ab8-2a5e-f4b442747362@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-30 at 11:16 +0100, Jan Beulich wrote:
> On 30.04.2020 22:44, Hongyan Xia wrote:
> > --- a/xen/arch/x86/srat.c
> > +++ b/xen/arch/x86/srat.c
> > @@ -196,7 +196,8 @@ void __init acpi_numa_slit_init(struct
> > acpi_table_slit *slit)
> >  		return;
> >  	}
> >  	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
> > -	acpi_slit = mfn_to_virt(mfn_x(mfn));
> > +	acpi_slit = vmap_boot_pages(mfn, PFN_UP(slit->header.length));
> > +	BUG_ON(!acpi_slit);
> >  	memcpy(acpi_slit, slit, slit->header.length);
> >  }
> 
> I'm not sure in how far this series is still to be considered
> active / pending; I still have it in my inbox as something to
> look at in any event. If it is, then I think the latest by this
> patch it becomes clear that we either want to make vmalloc()
> boot-allocator capable, or introduce e.g. vmalloc_boot().
> Having this recurring pattern including the somewhat odd
> vmap_boot_pages() is imo not the best way forward. It would
> then also no longer be necessary to allocate contiguous pages,
> as none of the users up to here appear to have such a need.

This series is blocked on the PTE domheap conversion series so I will
definitely come back here after that series is merged.

vmap_boot_pages() (poorly named, there is nothing "boot" about it) is
actually useful in other patches as well, especially when there is no
direct map but we need to map a contiguous range, since
map_domain_page() can only handle a single one. So I would say there
will be a need for this function (maybe call it vmap_contig_pages()?)
even if for this patch a boot-capable vmalloc can do the job.

Hongyan


