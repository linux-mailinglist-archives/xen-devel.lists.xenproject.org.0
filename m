Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DF28C03F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 21:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5998.15670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS35O-0008VA-7M; Mon, 12 Oct 2020 19:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5998.15670; Mon, 12 Oct 2020 19:02:18 +0000
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
	id 1kS35O-0008Ul-4D; Mon, 12 Oct 2020 19:02:18 +0000
Received: by outflank-mailman (input) for mailman id 5998;
 Mon, 12 Oct 2020 19:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kS35N-0008Ug-9t
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 19:02:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecdfc1f8-e35b-4e59-af6a-4f4656fadb24;
 Mon, 12 Oct 2020 19:02:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8129B2067C;
 Mon, 12 Oct 2020 19:02:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pqe9=DT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kS35N-0008Ug-9t
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 19:02:17 +0000
X-Inumbo-ID: ecdfc1f8-e35b-4e59-af6a-4f4656fadb24
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ecdfc1f8-e35b-4e59-af6a-4f4656fadb24;
	Mon, 12 Oct 2020 19:02:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8129B2067C;
	Mon, 12 Oct 2020 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529336;
	bh=NFFfp+KbgsFcGWT60xOjGsfDsuX6lx/Z+evzycXNx1I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lleIApgKIApv4YDHOfQ7R0EGLYKXGgqv52j2nmd9LAgqVffk5RRGIJN7bDUDUxXo6
	 nSOg56to36KSyScvm7uSDF22JUFuVy72RRSNt99cWiq1HY+ftq9uGRfESvWVPXMP7l
	 7uCq84bzkKJDeKNwMAm4HBzQshvuQ8a1mNumbJgY=
Date: Mon, 12 Oct 2020 12:02:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, ehem+xen@m5p.com, 
    bertrand.marquis@arm.com, andre.przywara@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
In-Reply-To: <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
Message-ID: <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
References: <20200926205542.9261-1-julien@xen.org> <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com> <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Oct 2020, Julien Grall wrote:
> On 28/09/2020 07:47, Masami Hiramatsu wrote:
> > Hello,
> 
> Hi Masami,
> 
> > This made progress with my Xen boot on DeveloperBox (
> > https://www.96boards.org/product/developerbox/ ) with ACPI.
> > 
> 
> I have reviewed the patch attached and I have a couple of remarks about it.
> 
> The STAO table was originally created to allow an hypervisor to hide devices
> from a controller domain (such as Dom0). If this table is not present, then it
> means the OS/hypervisor can use any device listed in the ACPI table.
> 
> Additionally, the STAO table should never be present in the host ACPI table.
> 
> Therefore, I think the code should not try to find the STAO. Instead, it
> should check whether the SPCR table is present.

Yes, that makes sense, but that brings me to the next question.

SPCR seems to be required by SBBR, however, Masami wrote that he could
boot on a system without SPCR, which gets me very confused for two
reasons:

1) Why there is no SPCR? Isn't it supposed to be mandatory? Is it
because there no UART on Masami's system?

2) If there is no SPCR, how did Masami manage to boot Xen?
I take without any serial output? Just with the framebuffer?

