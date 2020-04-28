Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA91BC413
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSUI-0007AM-F6; Tue, 28 Apr 2020 15:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KfNV=6M=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jTSUH-0007AH-0P
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:49:33 +0000
X-Inumbo-ID: da310ce2-8967-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da310ce2-8967-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=KPzvRysY2ohXq7P+b0bo07gMgLcm6XfJbumUCT2gh1o=; b=i9hHPfTJ3GQO43bqutkwlBGmaE
 DkZyg+WqC2aehZxhUmmkaCj+wV9a5njhYHUurL1UqH0ndbwnmRCWzaaDEiojEFTJbKkNErxtSJZMe
 5fjjeOL2oy/50IXLBVYPZKId+4KM4NPboP6L5b2jryNfTUrAx4wfRl/YoiiDisHXW5HM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jTSUF-0007YH-Ha; Tue, 28 Apr 2020 15:49:31 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jTSUF-0006UT-8F; Tue, 28 Apr 2020 15:49:31 +0000
Date: Tue, 28 Apr 2020 16:49:28 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
Message-ID: <20200428154928.nrhnl6xln2ci5qrf@debian>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
 <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Hongyan Xia <hx242@xen.org>, julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 05:33:29PM +0200, Jan Beulich wrote:
> On 17.04.2020 11:52, Hongyan Xia wrote:
> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -50,17 +50,17 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
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

(Assuming this is actually written by me)

I wanted to make things abundantly clear: plXe points to an entry while
lXt points to the start of a page table.

In a long function the distinction could be helpful; in a short function
(like this one?) not so much.

Wei.

> 
> Jan

