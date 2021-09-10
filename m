Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A0406F94
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 18:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184686.333391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOjJp-00068e-Qr; Fri, 10 Sep 2021 16:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184686.333391; Fri, 10 Sep 2021 16:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOjJp-00065p-Nh; Fri, 10 Sep 2021 16:24:01 +0000
Received: by outflank-mailman (input) for mailman id 184686;
 Fri, 10 Sep 2021 16:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOjJo-00065j-CS
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 16:24:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80b45f86-1253-11ec-b255-12813bfff9fa;
 Fri, 10 Sep 2021 16:23:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC63E611AD;
 Fri, 10 Sep 2021 16:23:58 +0000 (UTC)
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
X-Inumbo-ID: 80b45f86-1253-11ec-b255-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631291038;
	bh=FAMH8UOR1BFdb9OeNpXyvfariFRCVSw0ymZGcKGhxVE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b2/WvYxLIN4sUuxFTtH1CcP96c/oT4wvZKa0N5cnPg5Zl72UYbeTTTNb1iZf53yuK
	 8t0P+ZvBySSf1Xw1I27jK+8lnDyKbHJ483iaOgLv+73GFuFUPUJagSL3pIOt+3CZZ3
	 Hb9XAtmAzJTb8EXFtEsloeSvsUuqIO+HuhEQ4XM1oYcm/wV0mKsfQuFdWJw2HqSpYZ
	 DkNP6PjXtqDKdQRG/oPrqBMkHRpOZvy5AQC3/f0VqOcb9SUjMp4VXVX2MyHvqQzppT
	 +txQNRwZu/wMNlREPpooz36Wl5w7BkmkQHXsb0G055me35hbLZyvDD6QN6PcjSVOHX
	 kMCymvxrreBzA==
Date: Fri, 10 Sep 2021 09:23:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Penny Zheng <penny.zheng@arm.com>, Bertrand.Marquis@arm.com, 
    Wei.Chen@arm.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    julien@xen.org
Subject: Re: [PATCH v7 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
In-Reply-To: <acf2e43e-5db1-1374-013e-b152093b41ba@suse.com>
Message-ID: <alpine.DEB.2.21.2109100916270.10523@sstabellini-ThinkPad-T480s>
References: <20210910025215.1671073-1-penny.zheng@arm.com> <20210910025215.1671073-6-penny.zheng@arm.com> <acf2e43e-5db1-1374-013e-b152093b41ba@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Sep 2021, Jan Beulich wrote:
> On 10.09.2021 04:52, Penny Zheng wrote:
> > In order to deal with the trouble of count-to-order conversion when page number
> > is not in a power-of-two, this commit re-define assign_pages for nr pages and
> > assign_page for original page with a single order.
> > 
> > Backporting confusion could be helped by altering the order of assign_pages
> > parameters, such that the compiler would point out that adjustments at call
> > sites are needed.
> 
> Thanks, this now takes care of my primary concern. However, I (now?) have
> another (I thought I would have mentioned this before):
> 
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -2259,9 +2259,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
> >  
> >  
> >  int assign_pages(
> > -    struct domain *d,
> >      struct page_info *pg,
> > -    unsigned int order,
> > +    unsigned long nr,
> 
> If this really is to be "unsigned long" (and not "unsigned int"), then...

Hi Jan,

Thanks for spotting this. I think it makes sense to use "unsigned int
nr" here.

