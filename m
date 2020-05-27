Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6A1E472B
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxpr-0007DS-RK; Wed, 27 May 2020 15:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSSa=7J=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jdxpp-0007DN-R9
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:19:13 +0000
X-Inumbo-ID: 6b4cdbb2-a02d-11ea-a75c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b4cdbb2-a02d-11ea-a75c-12813bfff9fa;
 Wed, 27 May 2020 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PorrzRqCInOxYvt20+7xogE6y1SnTT80lZlH/XZ9BsI=; b=kuxbgbMWLwcnM8rlk8O0vGPYCT
 O1P4cE/1vUPQMoDot1CMPKKm5+9v6aTuu8gKp3qrnkiZ/yUkTphJks/14yKeNM9Bch+1c2sj+h9Jx
 cgzrRGBJvMOwg6xQzuhbctlHYq1yn1y54Vum6Qh9mn8wMwVy0mc5tfBba6JJosONbc5Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jdxpn-0006EC-4J; Wed, 27 May 2020 15:19:11 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jdxpm-00036J-Qi; Wed, 27 May 2020 15:19:11 +0000
Message-ID: <662f11745542fa3f65f14bef76961837271251fc.camel@xen.org>
Subject: Re: [PATCH v6 13/15] x86/mm: drop old page table APIs
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 27 May 2020 16:19:08 +0100
In-Reply-To: <be3d3dd0-6001-41a5-7390-44dc8c327d8f@suse.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <d6a642544c5ce0b975cdab8ad054f7a348f17c8d.1587735799.git.hongyxia@amazon.com>
 <be3d3dd0-6001-41a5-7390-44dc8c327d8f@suse.com>
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-05-20 at 12:09 +0200, Jan Beulich wrote:
> On 24.04.2020 16:09, Hongyan Xia wrote:
> > --- a/xen/arch/x86/smpboot.c
> > +++ b/xen/arch/x86/smpboot.c
> > @@ -815,7 +815,7 @@ static int setup_cpu_root_pgt(unsigned int cpu)
> >      if ( !opt_xpti_hwdom && !opt_xpti_domu )
> >          return 0;
> >  
> > -    rpt = alloc_xen_pagetable();
> > +    rpt = alloc_xenheap_page();
> 
> So the idea of not using alloc_domheap_page() +
> map_domain_page_global()
> here is that in the long run alloc_xenheap_page() will resolve to
> just
> this? If so, while I'd have preferred the greater flexibility until
> then,
> this is fair enough, i.e.
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

alloc_xenheap_page() has an advantage which is the fast PA->VA lookup,
which is currently required by the restore_all_guest logic. If we
change how restore_all_guest works or gain fast PA->VA lookup for
globally mapped pages, then xenheap could probably just be removed.

Hongyan


