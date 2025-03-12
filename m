Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A54A5E878
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911021.1317586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVbA-0001I6-KJ; Wed, 12 Mar 2025 23:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911021.1317586; Wed, 12 Mar 2025 23:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVbA-0001Fj-G7; Wed, 12 Mar 2025 23:34:52 +0000
Received: by outflank-mailman (input) for mailman id 911021;
 Wed, 12 Mar 2025 23:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVb8-0001Fd-F1
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:34:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95660cfb-ff9a-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:34:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 707A7A4140F;
 Wed, 12 Mar 2025 23:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB17C4CEDD;
 Wed, 12 Mar 2025 23:34:44 +0000 (UTC)
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
X-Inumbo-ID: 95660cfb-ff9a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822486;
	bh=y0yQJRuy+QF1g5v6Gxf8ham3SVd77ry1hi7sQRG+tz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IhQiYKdTCXdiz/Gba26sPLNjU0BauXG+0KIyw13gVODlmSXMMcRaxUcQhzGxtzCY5
	 XuwQibiCMZHRYnc7waxHmhR601eTdaa/storFNNuM/LgJESxe1Wbacu2AX6AputTbJ
	 VoqkaOue0SoNwqeo4biBWg+UiF8oBMjcGELd6esUJ1pSvSJS4hQJ8/fldK7uCfKs5f
	 yKy7LgQhcGde9X94vkanJwCu+9NYqU1hTQ2wqDOq07g6y9KRaEYrxqjBli9bnAoOty
	 babci1ghdfNxEoB2m+jhjlyQqnaZ+jgdl3N0EIrIe/MCAvJ0cQpreW7oJPDSefZUvO
	 IvuEI8O0deZoA==
Date: Wed, 12 Mar 2025 16:34:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org, 
    ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 14/19] xen: make avail_domheap_pages() static
In-Reply-To: <alpine.DEB.2.22.394.2503121627560.3477110@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2503121632330.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-15-Penny.Zheng@amd.com> <alpine.DEB.2.22.394.2503121627560.3477110@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-145566692-1741822485=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-145566692-1741822485=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 12 Mar 2025, Stefano Stabellini wrote:
> On Wed, 12 Mar 2025, Penny Zheng wrote:
> > Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
> > so it shall be static, no need to extern.
> > 
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I spoke too soon: this patch breaks the build:

common/page_alloc.c: In function ‘get_outstanding_claims’:
common/page_alloc.c:587:20: error: implicit declaration of function ‘avail_domheap_pages’; did you mean ‘avail_node_heap_pages’? [-Werror=implicit-function-declaration]
  587 |     *free_pages =  avail_domheap_pages();
      |                    ^~~~~~~~~~~~~~~~~~~
      |                    avail_node_heap_pages
common/page_alloc.c:587:20: error: nested extern declaration of ‘avail_domheap_pages’ [-Werror=nested-externs]
common/page_alloc.c: At top level:
common/page_alloc.c:2798:22: error: conflicting types for ‘avail_domheap_pages’
 2798 | static unsigned long avail_domheap_pages(void)
      |                      ^~~~~~~~~~~~~~~~~~~
common/page_alloc.c:587:20: note: previous implicit declaration of ‘avail_domheap_pages’ was here
  587 |     *free_pages =  avail_domheap_pages();
      |                    ^~~~~~~~~~~~~~~~~~~
common/page_alloc.c:2798:22: error: ‘avail_domheap_pages’ defined but not used [-Werror=unused-function]
 2798 | static unsigned long avail_domheap_pages(void)
      |                      ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[2]: *** [Rules.mk:249: common/page_alloc.o] Error 1
make[1]: *** [build.mk:72: common] Error 2
make: *** [Makefile:615: xen] Error 2


I think you fixed it in the next patch. Still, it is better not to break
bisectability.

> > ---
> >  xen/common/page_alloc.c | 2 +-
> >  xen/include/xen/mm.h    | 1 -
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> > index 7476d37238..5e710cc9a1 100644
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -2796,7 +2796,7 @@ unsigned long avail_domheap_pages_region(
> >      return avail_heap_pages(zone_lo, zone_hi, node);
> >  }
> >  
> > -unsigned long avail_domheap_pages(void)
> > +static unsigned long avail_domheap_pages(void)
> >  {
> >      return avail_heap_pages(MEMZONE_XEN + 1,
> >                              NR_ZONES - 1,
> > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> > index 86bbb15890..cbb9f2dfdb 100644
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -140,7 +140,6 @@ struct page_info *alloc_domheap_pages(
> >  void free_domheap_pages(struct page_info *pg, unsigned int order);
> >  unsigned long avail_domheap_pages_region(
> >      unsigned int node, unsigned int min_width, unsigned int max_width);
> > -unsigned long avail_domheap_pages(void);
> >  unsigned long avail_node_heap_pages(unsigned int nodeid);
> >  #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
> >  #define free_domheap_page(p)  (free_domheap_pages(p,0))
> > -- 
> > 2.34.1
> > 
> 
--8323329-145566692-1741822485=:3477110--

