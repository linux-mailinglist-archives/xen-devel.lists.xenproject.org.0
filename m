Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9291C1261
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:46:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUV3q-0006lz-72; Fri, 01 May 2020 12:46:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Po+f=6P=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUV3o-0006lu-SI
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:46:32 +0000
X-Inumbo-ID: c8a43c94-8ba9-11ea-9b04-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8a43c94-8ba9-11ea-9b04-12813bfff9fa;
 Fri, 01 May 2020 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p7AYxF2x4WqJ7KzvUodOW8YS2NUfT3SzO82zW2+p7FY=; b=rOu58TACcWMbUSFzPDDR/6G/ma
 4e4IUWwvH9sXu/jFCKg/sBC5mKIHBUpgQgjL/wZoBDimanOIaSRTu3wzk9bR8kJ1tkw1NPJxSxv+6
 yvRPSg1tuOYlMdobHE/etBIApS0Dp98MjOAFwImAEew9jT0j5PfARW9ygH6H7k7vIwDM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUV3n-0001Fb-OE; Fri, 01 May 2020 12:46:31 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUV3n-00080n-Cn; Fri, 01 May 2020 12:46:31 +0000
Message-ID: <e16decc83bc9b097e2df2b80d0c71565a1fd280b.camel@xen.org>
Subject: Re: [PATCH 02/16] acpi: vmap pages in acpi_os_alloc_memory
From: Hongyan Xia <hx242@xen.org>
To: Wei Liu <wl@xen.org>
Date: Fri, 01 May 2020 13:46:29 +0100
In-Reply-To: <20200501120249.bd2w6ksgii4tkrai@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
 <20200501120249.bd2w6ksgii4tkrai@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-05-01 at 12:02 +0000, Wei Liu wrote:
> On Thu, Apr 30, 2020 at 09:44:11PM +0100, Hongyan Xia wrote:
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
> >  	void *ptr;
> >  
> >  	if (system_state == SYS_STATE_early_boot)
> > -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz),
> > 1)));
> > +	{
> > +		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
> > +
> > +		return vmap_boot_pages(mfn, PFN_UP(sz));
> > +	}
> >  
> >  	ptr = xmalloc_bytes(sz);
> >  	ASSERT(!ptr || is_xmalloc_memory(ptr));
> > @@ -244,5 +248,8 @@ void __init acpi_os_free_memory(void *ptr)
> >  	if (is_xmalloc_memory(ptr))
> >  		xfree(ptr);
> >  	else if (ptr && system_state == SYS_STATE_early_boot)
> > +	{
> > +		vunmap(ptr);
> >  		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
> > +	}
> >  }
> > diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> > index 369560e620..c70801e195 100644
> > --- a/xen/include/xen/vmap.h
> > +++ b/xen/include/xen/vmap.h
> > @@ -23,6 +23,11 @@ void *vmalloc_xen(size_t size);
> >  void *vzalloc(size_t size);
> >  void vfree(void *va);
> >  
> > +static inline void *vmap_boot_pages(mfn_t mfn, unsigned int
> > nr_pages)
> 
> Nothing seems to tie this to boot pages only. Maybe it is better to
> name
> it after what it does, like vmap_mfns?

Hmm, indeed nothing so special about *boot* pages. Will change.

Hongyan


