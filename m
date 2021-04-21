Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2D366CFF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 15:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114509.218243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZD4q-0003ZZ-FK; Wed, 21 Apr 2021 13:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114509.218243; Wed, 21 Apr 2021 13:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZD4q-0003ZA-Bs; Wed, 21 Apr 2021 13:39:36 +0000
Received: by outflank-mailman (input) for mailman id 114509;
 Wed, 21 Apr 2021 13:39:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZD4o-0003Z5-Ll
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 13:39:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZD4l-0000HB-Vk; Wed, 21 Apr 2021 13:39:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZD4l-0001Uw-CG; Wed, 21 Apr 2021 13:39:31 +0000
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
	bh=JN4E55cpVCbgAq+7oLvl1m6DdRXGpvZ9z88oDuBr/9s=; b=N7O3jzTqzr1JqDnEclX8fNWiRq
	+W6uwJmQrcFzNRqexaL5eiohwc8HaBV2mJrMfQoxRqbVGjkVbNL6nMsAgi1WKUSPWCz0n8vLdBQnh
	bM8Eb8VMVtHKwYKRq+rCsIdEP6GskYGTlyDwhHSwmoYqD1G1WzwOHDkmhTQkQfBi1+6o=;
Message-ID: <66d5ed414d414629e04717560f2090345c0759ac.camel@xen.org>
Subject: Re: [PATCH v9 10/13] x86/smpboot: switch clone_mapping() to new APIs
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 21 Apr 2021 14:39:28 +0100
In-Reply-To: <de0df262-6c83-41d2-02d6-ce56d484baa2@suse.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
	 <d55bcecc33df5b277bc3e1dbb48826bc816d8d10.1617706782.git.hongyxia@amazon.com>
	 <de0df262-6c83-41d2-02d6-ce56d484baa2@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2021-04-20 at 14:32 +0200, Jan Beulich wrote:
> On 06.04.2021 13:05, Hongyan Xia wrote:
> > @@ -742,51 +742,58 @@ static int clone_mapping(const void *ptr,
> > root_pgentry_t *rpt)
> >          }
> >      }
> >  
> > +    UNMAP_DOMAIN_PAGE(pl1e);
> > +    UNMAP_DOMAIN_PAGE(pl2e);
> > +    UNMAP_DOMAIN_PAGE(pl3e);
> 
> Just one minor remark: A pedantic(?) compiler might warn about the
> setting to NULL of pl3e here, when
> 
> >      if ( !(root_get_flags(rpt[root_table_offset(linear)]) &
> > _PAGE_PRESENT) )
> >      {
> > -        pl3e = alloc_xen_pagetable();
> > +        mfn_t l3mfn;
> > +
> > +        pl3e = alloc_map_clear_xen_pt(&l3mfn);
> >          rc = -ENOMEM;
> >          if ( !pl3e )
> >              goto out;
> > -        clear_page(pl3e);
> >          l4e_write(&rpt[root_table_offset(linear)],
> > -                  l4e_from_paddr(__pa(pl3e), __PAGE_HYPERVISOR));
> > +                  l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR));
> >      }
> >      else
> > -        pl3e = l4e_to_l3e(rpt[root_table_offset(linear)]);
> > +        pl3e = map_l3t_from_l4e(rpt[root_table_offset(linear)]);
> 
> ... it is guaranteed to get initialized again before any further
> consumption. IOW strictly speaking the last of those three would
> want to be unmap_domain_page(), just like you have ...
> 
> > @@ -802,6 +809,9 @@ static int clone_mapping(const void *ptr,
> > root_pgentry_t *rpt)
> >  
> >      rc = 0;
> >   out:
> > +    unmap_domain_page(pl1e);
> > +    unmap_domain_page(pl2e);
> > +    unmap_domain_page(pl3e);
> >      return rc;
> >  }
> 
> ... here.

True. I will switch to lower case for pl3e just in case.

Hongyan


