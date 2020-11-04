Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8022A5CAC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 03:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18772.43781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka8WI-0002wz-4s; Wed, 04 Nov 2020 02:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18772.43781; Wed, 04 Nov 2020 02:27:30 +0000
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
	id 1ka8WI-0002wd-1P; Wed, 04 Nov 2020 02:27:30 +0000
Received: by outflank-mailman (input) for mailman id 18772;
 Wed, 04 Nov 2020 02:27:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ka8WG-0002wY-Q2
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 02:27:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5dda95f-de45-4451-8a44-2376a0c7154e;
 Wed, 04 Nov 2020 02:27:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3F2C21534;
 Wed,  4 Nov 2020 02:27:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bmKO=EK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ka8WG-0002wY-Q2
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 02:27:28 +0000
X-Inumbo-ID: e5dda95f-de45-4451-8a44-2376a0c7154e
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e5dda95f-de45-4451-8a44-2376a0c7154e;
	Wed, 04 Nov 2020 02:27:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F3F2C21534;
	Wed,  4 Nov 2020 02:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604456846;
	bh=AAO/693nsK4aj5g61yL0xiPaCLcEqYbqVqiD/UMxyDg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wbd2WmcxvzgXxQuvpgP0ltdv3CQkkb4HZwVP1XvmO1qWWyKPjV4NuF2TFZU0Y/GeV
	 A//QEjWq1xPg0Ygi3BWhqDBQ+b07XyL1toATNnFX3u9EFSEyBVe1uFRMJT8qBKJskk
	 HjFjiw1L4lmc/SsHy9PgS7i6m2Dc2aVkkf1ePccA=
Date: Tue, 3 Nov 2020 18:27:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
    qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
    Cornelia Huck <cohuck@redhat.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
    Fam Zheng <fam@euphon.net>, Richard Henderson <rth@twiddle.net>, 
    Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
    Thomas Huth <thuth@redhat.com>, 
    Wainer dos Santos Moschetta <wainersm@redhat.com>, 
    Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
In-Reply-To: <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
Message-ID: <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
References: <20201103164604.2692357-1-philmd@redhat.com> <20201103164604.2692357-3-philmd@redhat.com> <20201103165247.GT205187@redhat.com> <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com> <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2447170-1604453887=:3264"
Content-ID: <alpine.DEB.2.21.2011031752410.3264@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2447170-1604453887=:3264
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2011031752411.3264@sstabellini-ThinkPad-T480s>

On Tue, 3 Nov 2020, Philippe Mathieu-Daudé wrote:
> I forgot to Cc the 9pfs & Xen maintainers, doing it now ;)
> 
> On 11/3/20 6:01 PM, Philippe Mathieu-Daudé wrote:
> > On 11/3/20 5:52 PM, Daniel P. Berrangé wrote:
> >> On Tue, Nov 03, 2020 at 05:46:03PM +0100, Philippe Mathieu-Daudé wrote:
> >>> We test './configure --without-default-devices' since commit
> >>> 20885b5b169 (".travis.yml: test that no-default-device builds
> >>> do not regress") in Travis-CI.
> >>>
> >>> As we prefer to use GitLab-CI, add the equivalent job there.
> >>>
> >>> One minor difference: the GitLab Ubuntu docker image has the
> >>> Xen devel packages installed. As it is automatically selected,
> >>> we need to disable it with the --disable-xen option, else the
> >>> build fails:
> >>>
> >>>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
> >>>   hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
> >>>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference to `local_ops'
> >>>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference to `synth_ops'
> >>>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference to `proxy_ops'
> >>>   collect2: error: ld returned 1 exit status
> >>
> >> Surely this is a build bug we need to fix rather than ignore in CI ?
> > 
> > Well it predates this series, so nobody really cared
> > (thus I wonder if it makes sense to invest resources
> > there).
> > 
> > Anyway I can have a look after 5.2-rc1.

Actually I care about Xen and 9pfs support, it is one of the few
combinations that I use regularly and it is even enabled in the Xilinx
product I look after. But admittedly I don't test QEMU master as much as
I should. With the recent changes to the build system it is not very
suprising that there are some issues. It would be great to have a Xen
and 9pfs test in the gitlab CI-loop.


FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 and I
get:

  ninja: unknown tool 'query'

Even after rebuilding ninja master by hand. Any ideas? I don't know much
about ninja.


So I gave up on that and I spinned up a Debian Buster x86 container for
this build. That one got past the "ninja: unknown tool 'query'" error.
The build completed without problems to the end.

Either way I can't reproduce the build error above.
--8323329-2447170-1604453887=:3264--

