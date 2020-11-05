Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B02A7666
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 05:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19626.44857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaWrP-0001IA-D4; Thu, 05 Nov 2020 04:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19626.44857; Thu, 05 Nov 2020 04:26:55 +0000
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
	id 1kaWrP-0001Hl-9j; Thu, 05 Nov 2020 04:26:55 +0000
Received: by outflank-mailman (input) for mailman id 19626;
 Thu, 05 Nov 2020 04:26:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kaWrN-0001Hg-ME
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 04:26:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 096218f0-2b78-40bc-b5ef-a511557b7f4e;
 Thu, 05 Nov 2020 04:26:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1DEF20795;
 Thu,  5 Nov 2020 04:26:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kaWrN-0001Hg-ME
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 04:26:53 +0000
X-Inumbo-ID: 096218f0-2b78-40bc-b5ef-a511557b7f4e
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 096218f0-2b78-40bc-b5ef-a511557b7f4e;
	Thu, 05 Nov 2020 04:26:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E1DEF20795;
	Thu,  5 Nov 2020 04:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604550412;
	bh=QcjEAB5mR04fn/Qx7xlKu3OWYq32vZ8nwE1QoeRP+gU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EwnXvsoHHIT2TDy9LrG+wO0NfkNF8tGwA3hCDiybhI759OHEImybik3XV8FH5ygsX
	 ZC4FvAnGSMrtI/8cqQeo3TLt1nZyl244f7/JkkMVSHXvLDpa6DcfrJ94MI+y0JywHS
	 KHwl0vO//NQlDhblv7uYxy9D1RTnIYwT5mwASq1M=
Date: Wed, 4 Nov 2020 20:26:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Thomas Huth <thuth@redhat.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
    =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
    qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
    Cornelia Huck <cohuck@redhat.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
    Fam Zheng <fam@euphon.net>, Richard Henderson <rth@twiddle.net>, 
    Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
    Wainer dos Santos Moschetta <wainersm@redhat.com>, 
    Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
In-Reply-To: <9ac5e985-a701-f357-29fb-ef7975f5f2c2@redhat.com>
Message-ID: <alpine.DEB.2.21.2011041805060.3264@sstabellini-ThinkPad-T480s>
References: <20201103164604.2692357-1-philmd@redhat.com> <20201103164604.2692357-3-philmd@redhat.com> <20201103165247.GT205187@redhat.com> <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com> <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
 <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s> <9ac5e985-a701-f357-29fb-ef7975f5f2c2@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2020, Thomas Huth wrote:
> On 04/11/2020 03.27, Stefano Stabellini wrote:
> [...]
> > Actually I care about Xen and 9pfs support, it is one of the few
> > combinations that I use regularly and it is even enabled in the Xilinx
> > product I look after. But admittedly I don't test QEMU master as much as
> > I should. With the recent changes to the build system it is not very
> > suprising that there are some issues. It would be great to have a Xen
> > and 9pfs test in the gitlab CI-loop.
> > 
> > 
> > FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 and I
> > get:
> > 
> >   ninja: unknown tool 'query'
> > 
> > Even after rebuilding ninja master by hand. Any ideas? I don't know much
> > about ninja.
> > 
> > 
> > So I gave up on that and I spinned up a Debian Buster x86 container for
> > this build. That one got past the "ninja: unknown tool 'query'" error.
> > The build completed without problems to the end.
> > 
> > Either way I can't reproduce the build error above.
> 
> Did you run "configure" with "--without-default-devices" ?

Yes, and still I can't repro the issue, strange. Anyway, I saw that
Philippe managed to find and fix the issue with "hw/9pfs: Fix Kconfig
dependency problem between 9pfs and Xen", so all sorted :)

