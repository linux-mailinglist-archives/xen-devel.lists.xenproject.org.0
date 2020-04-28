Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364731BC431
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSaB-0008Gg-Ml; Tue, 28 Apr 2020 15:55:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i5jw=6M=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jTSaA-0008GV-DH
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:55:38 +0000
X-Inumbo-ID: b3ffbbd0-8968-11ea-988f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3ffbbd0-8968-11ea-988f-12813bfff9fa;
 Tue, 28 Apr 2020 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a0ZAuTYZ7Ajr+Ft2sbyzrZuwe2LT3VI+hvVn/LVRoiM=; b=7Lcq6YUVJBJAGmzyP7Wr5Xg+GJ
 NUOnR7Xn/ez/dUyfv1Emn/Pqj/OOEFgXuI8hk6bG5djA26jlxOuvtorCRRe0hRE984zXrVNxdnsVw
 ICSGhqymtyQi3ANy8zbo6jm7mo1v30BUU0kroO5LY/1brw3kxo+FBVX2e7H2sIWwG3Wc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jTSa8-0007gQ-On; Tue, 28 Apr 2020 15:55:36 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=edge-cache-129.e-maa3.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jTSa8-0006wA-Ea; Tue, 28 Apr 2020 15:55:36 +0000
Message-ID: <9df9c5163fde5d25ceb756b20714c58be93b2c6c.camel@xen.org>
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Date: Tue, 28 Apr 2020 16:55:34 +0100
In-Reply-To: <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
 <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 2020-04-28 at 17:33 +0200, Jan Beulich wrote:
> On 17.04.2020 11:52, Hongyan Xia wrote:
> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -50,17 +50,17 @@ static __init void
> > mark_pv_pt_pages_rdonly(struct domain *d,
> >      unsigned long count;
> >      struct page_info *page;
> >      l4_pgentry_t *pl4e;
> > -    l3_pgentry_t *pl3e;
> > -    l2_pgentry_t *pl2e;
> > -    l1_pgentry_t *pl1e;
> > +    l3_pgentry_t *pl3e, *l3t;
> > +    l2_pgentry_t *pl2e, *l2t;
> > +    l1_pgentry_t *pl1e, *l1t;
> 
> I don't quite see why the new local variables get introduced:
> unmap_domain_page(), iirc, is quite fine with a non-page-
> aligned argument.

You are right, although in this function, where plXe points to may not
be the page we want to unmap. When plXe becomes aligned and points to a
new page, we actually want to unmap the page before it increments to an
aligned value.

Hongyan


