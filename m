Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890132D0FBF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46386.82330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmF5j-0002WK-IF; Mon, 07 Dec 2020 11:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46386.82330; Mon, 07 Dec 2020 11:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmF5j-0002Vu-ES; Mon, 07 Dec 2020 11:54:07 +0000
Received: by outflank-mailman (input) for mailman id 46386;
 Mon, 07 Dec 2020 11:54:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kmF5i-0002Vp-4x
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:54:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kmF5f-0007HI-VQ; Mon, 07 Dec 2020 11:54:03 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kmF5f-0001WL-K5; Mon, 07 Dec 2020 11:54:03 +0000
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
	bh=ikBlnqEAXg+Yf0+YTnPF983S0uwctkYma+4j5+0nY+0=; b=yHdKlqJBTd6exfWZBmOSyXpejH
	atCFfiPtIaTSopTrJTt5HnirOfTG++XAMtrJsWf63qgFn7wE6lPU1z7gz0TfRlZZn3LaOFyWnfGmz
	wf8Ag5AZrYhtJavhcPk85uWJOQAtFhOKSBFt9GJxQB5rTox+sAR7MkKUGVtpze8bo66s=;
Message-ID: <8ba50b6c69ca5c61da8e01faabd9eadc020a49b2.camel@xen.org>
Subject: Re: [PATCH v2] x86/vmap: handle superpages in vmap_to_mfn()
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 07 Dec 2020 11:54:04 +0000
In-Reply-To: <8a3c4749-4275-b632-b3fa-073447acd352@suse.com>
References: 
	<4a69a1177f9496ad0e3ea77e9b1d5b802bf83b60.1606994506.git.hongyxia@amazon.com>
	 <8a3c4749-4275-b632-b3fa-073447acd352@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-07 at 11:11 +0100, Jan Beulich wrote:
> On 03.12.2020 12:21, Hongyan Xia wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5194,6 +5194,60 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long
> > v)
> >          }                                          \
> >      } while ( false )
> >  
> > +/* Translate mapped Xen address to MFN. */
> > +mfn_t xen_map_to_mfn(unsigned long va)
> > +{
> > +#define CHECK_MAPPED(cond_)     \
> > +    if ( !(cond_) )             \
> > +    {                           \
> > +        ASSERT_UNREACHABLE();   \
> > +        ret = INVALID_MFN;      \
> > +        goto out;               \
> > +    }                           \
> 
> This should be coded such that use sites ...
> 
> > +    bool locking = system_state > SYS_STATE_boot;
> > +    unsigned int l2_offset = l2_table_offset(va);
> > +    unsigned int l1_offset = l1_table_offset(va);
> > +    const l3_pgentry_t *pl3e = virt_to_xen_l3e(va);
> > +    const l2_pgentry_t *pl2e = NULL;
> > +    const l1_pgentry_t *pl1e = NULL;
> > +    struct page_info *l3page;
> > +    mfn_t ret;
> > +
> > +    L3T_INIT(l3page);
> > +    CHECK_MAPPED(pl3e)
> > +    l3page = virt_to_page(pl3e);
> > +    L3T_LOCK(l3page);
> > +
> > +    CHECK_MAPPED(l3e_get_flags(*pl3e) & _PAGE_PRESENT)
> 
> ... will properly require a statement-ending semicolon. With
> additionally the trailing underscore dropped from the macro's
> parameter name

The immediate solution that came to mind is a do-while construct. Would
you be happy with that?

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 

Thanks.

> Or wait,
> 
> > --- a/xen/include/asm-x86/mm.h
> > +++ b/xen/include/asm-x86/mm.h
> > @@ -578,6 +578,7 @@ mfn_t alloc_xen_pagetable_new(void);
> >  void free_xen_pagetable_new(mfn_t mfn);
> >  
> >  l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
> > +mfn_t xen_map_to_mfn(unsigned long va);
> 
> This is now a pretty proper companion of map_page_to_xen(), and
> hence imo ought to be declared next to that one rather than here.
> Ultimately Arm may also need to gain an implementation.

Since map_pages_to_xen() is in the common header, are we okay with
having the declaration but not an implementation on the Arm side in
this patch? Or do we also want to introduce the Arm implementation in
this patch?

> > --- a/xen/include/asm-x86/page.h
> > +++ b/xen/include/asm-x86/page.h
> > @@ -291,7 +291,7 @@ void copy_page_sse2(void *, const void *);
> >  #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
> >  #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
> >  #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
> > -#define vmap_to_mfn(va)     l1e_get_mfn(*virt_to_xen_l1e((unsigned
> > long)(va)))
> > +#define vmap_to_mfn(va)     xen_map_to_mfn((unsigned long)va)
> 
> You've lost parentheses around va.

Will fix.

Hongyan


