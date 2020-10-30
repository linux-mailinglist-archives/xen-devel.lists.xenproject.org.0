Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B92A0D58
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16153.39469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZ89-0007tN-E6; Fri, 30 Oct 2020 18:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16153.39469; Fri, 30 Oct 2020 18:28:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZ89-0007sy-Ar; Fri, 30 Oct 2020 18:28:05 +0000
Received: by outflank-mailman (input) for mailman id 16153;
 Fri, 30 Oct 2020 18:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MNT=EF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYZ88-0007st-9N
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:28:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9725f7b8-f10f-45de-867f-ad036ded4a4f;
 Fri, 30 Oct 2020 18:28:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 124EB20702;
 Fri, 30 Oct 2020 18:28:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0MNT=EF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYZ88-0007st-9N
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:28:04 +0000
X-Inumbo-ID: 9725f7b8-f10f-45de-867f-ad036ded4a4f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9725f7b8-f10f-45de-867f-ad036ded4a4f;
	Fri, 30 Oct 2020 18:28:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 124EB20702;
	Fri, 30 Oct 2020 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604082482;
	bh=njaLhnwcnoISGj90YGg4hfeOnhw6M8jJBygy8V9B+oM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jRVGOKI4+A9p2dlAK0o5iCU+WZ0XYptQFM6ElWutFm+1HEAdwNOrLjFKMHSIAPgXL
	 zd9XxQiMe+PdHyGI78Mzn14+sqfrnL+xa+m9/+9pd+dcKvKFNQTbIi6Xzs+V8pyj8m
	 cXCAQ5o6f93ycRHsJ86rBPRCY4tZnwITNRUVRV6U=
Date: Fri, 30 Oct 2020 11:28:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Rahul.Singh@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 2/7] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
In-Reply-To: <6038f41f-594c-e573-9126-f31291af9c38@xen.org>
Message-ID: <alpine.DEB.2.21.2010301127470.12247@sstabellini-ThinkPad-T480s>
References: <20201023154156.6593-1-julien@xen.org> <20201023154156.6593-3-julien@xen.org> <alpine.DEB.2.21.2010231714510.12247@sstabellini-ThinkPad-T480s> <6038f41f-594c-e573-9126-f31291af9c38@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Oct 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/10/2020 01:16, Stefano Stabellini wrote:
> > On Fri, 23 Oct 2020, Julien Grall wrote:
> > >   bool __acpi_unmap_table(const void *ptr, unsigned long size)
> > >   {
> > >       vaddr_t vaddr = (vaddr_t)ptr;
> > > +    unsigned int idx;
> > > +
> > > +    /* We are only handling fixmap address in the arch code */
> > > +    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
> > > +         (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END)) )
> > 
> > Is it missing "+ PAGE_SIZE"?
> > 
> >     if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
> >          (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) )
> 
> Yes it should be + PAGE_SIZE. Do you mind if I fix it on commit?

No, I don't mind. Go ahead.

