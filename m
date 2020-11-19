Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1122B9EA9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 00:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31468.61857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kftfu-0003QE-VO; Thu, 19 Nov 2020 23:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31468.61857; Thu, 19 Nov 2020 23:49:14 +0000
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
	id 1kftfu-0003Pp-S1; Thu, 19 Nov 2020 23:49:14 +0000
Received: by outflank-mailman (input) for mailman id 31468;
 Thu, 19 Nov 2020 23:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kftft-0003Pk-TT
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:49:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86de810e-2931-4cb9-9a53-5fd0f9de4ced;
 Thu, 19 Nov 2020 23:49:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9997C22227;
 Thu, 19 Nov 2020 23:49:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IlxA=EZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kftft-0003Pk-TT
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:49:13 +0000
X-Inumbo-ID: 86de810e-2931-4cb9-9a53-5fd0f9de4ced
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 86de810e-2931-4cb9-9a53-5fd0f9de4ced;
	Thu, 19 Nov 2020 23:49:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9997C22227;
	Thu, 19 Nov 2020 23:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605829752;
	bh=G6ukbbkpPda5QAWWmXouoiYMpJiQ9WlmjD1roz4dw+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=2cIUpyujydy1QD3z4jrR4VNhpuvCf5qNBUlGXCFN+7Vp9Ts6Cm2iPZMsF/34uzkO4
	 QE8exuzAVg/FyT/eE+zEvd2XReJZA/8L5DA6EfTB13hDILp3YjOMS1nsyRcSyFs4to
	 hJ+MHwCezz61vqXK+bOvpfG6rjBPEVamAZCUL7zA=
Date: Thu, 19 Nov 2020 15:49:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    Julien Grall <Julien.Grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 1/2] xen/arm: gic: acpi: Use the correct length for
 the GICC structure
In-Reply-To: <1dfe3afc-55de-77ec-1f21-448c193909b4@xen.org>
Message-ID: <alpine.DEB.2.21.2011191548450.7979@sstabellini-ThinkPad-T480s>
References: <20201119121347.27139-1-julien@xen.org> <20201119121347.27139-2-julien@xen.org> <890D41B9-D3F3-498F-89E4-8BB997B45D6F@arm.com> <1dfe3afc-55de-77ec-1f21-448c193909b4@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-725314894-1605829752=:7979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-725314894-1605829752=:7979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Nov 2020, Julien Grall wrote:
> On 19/11/2020 15:22, Bertrand Marquis wrote:
> > Hi Julien,
> 
> Hi Bertrand,
> 
> > 
> > > On 19 Nov 2020, at 12:13, Julien Grall <julien@xen.org> wrote:
> > > 
> > > From: Julien Grall <julien.grall@arm.com>
> > > 
> > > The length of the GICC structure in the MADT ACPI table differs between
> > > version 5.1 and 6.0, although there are no other relevant differences.
> > > 
> > > Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
> > > overcome this issue.
> > > 
> > 
> > The serie is braking the build on arm64 if ACPI is not activated:
> > arch/arm/gic.c:456: undefined reference to `acpi_gbl_FADT’
> 
> :(. Sorry for that. I usually test with and without ACPI enabled but forgot to
> do for this series.

I just wanted to add that I checked and it looks like to converted all
places now
--8323329-725314894-1605829752=:7979--

