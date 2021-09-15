Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443AB40CC69
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 20:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187851.336856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQZOb-00032V-Eg; Wed, 15 Sep 2021 18:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187851.336856; Wed, 15 Sep 2021 18:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQZOb-0002zU-An; Wed, 15 Sep 2021 18:12:33 +0000
Received: by outflank-mailman (input) for mailman id 187851;
 Wed, 15 Sep 2021 18:12:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQZOZ-0002zO-Jz
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 18:12:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b077c241-ddb1-4fed-be5b-8bb6d17cebda;
 Wed, 15 Sep 2021 18:12:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6BB6611C4;
 Wed, 15 Sep 2021 18:12:29 +0000 (UTC)
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
X-Inumbo-ID: b077c241-ddb1-4fed-be5b-8bb6d17cebda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631729549;
	bh=KH8oYWjZ0RdqIvN/DV8JM1AQyoP/T4f7uNJ4aoqeHoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IeDbRpFGjbo55IOSZd6M6V2va3x/MZQihLl/C6lmGRqme6FN1DIm9gI+mbq+69rEO
	 j0bn8RE8tMI9l5NkCxBGgBiriWraG+sFT/D9Sr7H9kyo012WN2kjLUWsfqUE1gEkja
	 nS+elKHLgsSNK4MmOv15ldxMqz28BeLj6b+/81de94idRF6Higw3a0BLhv31SnUsA9
	 beqv99wpeFJMsewjecNWm4fDsOlX02vGID6ICx4Qgxchv9EG37p0v91RUC80t3zRJm
	 7ZPd+f/HpJlBT48gKUtGJmVMp+z2YOgNyhI1IDYc847+0hsNr5oFA9NVoVsmUEUfmY
	 3Td8Spiml0A/w==
Date: Wed, 15 Sep 2021 11:12:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <penny.zheng@arm.com>, Bertrand.Marquis@arm.com, 
    Wei.Chen@arm.com, xen-devel@lists.xenproject.org, julien@xen.org
Subject: Re: [PATCH v7 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
In-Reply-To: <d2e87c7a-08e0-3cca-fe4a-6278d6939591@suse.com>
Message-ID: <alpine.DEB.2.21.2109151106430.21985@sstabellini-ThinkPad-T480s>
References: <20210910025215.1671073-1-penny.zheng@arm.com> <20210910025215.1671073-6-penny.zheng@arm.com> <acf2e43e-5db1-1374-013e-b152093b41ba@suse.com> <alpine.DEB.2.21.2109100916270.10523@sstabellini-ThinkPad-T480s>
 <d2e87c7a-08e0-3cca-fe4a-6278d6939591@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Sep 2021, Jan Beulich wrote:
> On 10.09.2021 18:23, Stefano Stabellini wrote:
> > On Fri, 10 Sep 2021, Jan Beulich wrote:
> >> On 10.09.2021 04:52, Penny Zheng wrote:
> >>> In order to deal with the trouble of count-to-order conversion when page number
> >>> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> >>> assign_page for original page with a single order.
> >>>
> >>> Backporting confusion could be helped by altering the order of assign_pages
> >>> parameters, such that the compiler would point out that adjustments at call
> >>> sites are needed.
> >>
> >> Thanks, this now takes care of my primary concern. However, I (now?) have
> >> another (I thought I would have mentioned this before):
> >>
> >>> --- a/xen/common/page_alloc.c
> >>> +++ b/xen/common/page_alloc.c
> >>> @@ -2259,9 +2259,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
> >>>  
> >>>  
> >>>  int assign_pages(
> >>> -    struct domain *d,
> >>>      struct page_info *pg,
> >>> -    unsigned int order,
> >>> +    unsigned long nr,
> >>
> >> If this really is to be "unsigned long" (and not "unsigned int"), then...
> > 
> > Thanks for spotting this. I think it makes sense to use "unsigned int
> > nr" here.
> 
> I see you've made the change while committing, but the subsequent patch
> then would have needed adjustment as well: It's now silently truncating
> an "unsigned long" value to "unsigned int". It was the splitting that's
> now needed there _anyway_ that made me wonder whether the patch here
> really is worthwhile to have. But of course acquire_domstatic_pages()
> could for now also simply reject too large values ...

Yes. Are you thinking of a check like the following at the beginning of
acquire_domstatic_pages?

    if ( nr_mfns > UINT_MAX )
        return -EINVAL;

An alternative would be to change acquire_domstatic_pages to take an
unsigned int as nr_mfns parameter, but then it would just push the
problem up one level to allocate_static_memory, which is reading the
value from device tree so it is out of our control. So I think it is a
good idea to have an explicit check and acquire_domstatic_pages would be
a good place for it.

