Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06355F035
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 23:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357376.585867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ITD-0006RV-2J; Tue, 28 Jun 2022 21:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357376.585867; Tue, 28 Jun 2022 21:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ITC-0006Np-VR; Tue, 28 Jun 2022 21:10:02 +0000
Received: by outflank-mailman (input) for mailman id 357376;
 Tue, 28 Jun 2022 21:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6ITA-0006B8-Vu
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 21:10:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ba430d-f726-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 23:09:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EC7B61865;
 Tue, 28 Jun 2022 21:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CB1C341C8;
 Tue, 28 Jun 2022 21:09:54 +0000 (UTC)
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
X-Inumbo-ID: a9ba430d-f726-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656450595;
	bh=1QJk4e5j0/pz9uIpQ4JWK8nVogVrZMYPM6m/PAoDjys=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nsBw1UXuvcxUmPH3tNOnNFdZmPyjltPcid9fynO3ewZauLE/h0Zh18vREFpG4Nqzu
	 OURDTsKPHFaUrB6xAS/uDBdZlT6nup9UQFWqRhV7bVH6dvrG2vyOgconcovvPAiI8T
	 YjNjQtMDgVUJPw8gTKybzJR8uJnlc6pUBGobQBf2CENvKROG01H7xvF7nKGdEiIvNp
	 05spaUErlHtzYRv6eXBbkgHYR3MmWa6k64+oOwWq4PkEy/1+g6OHMldslx6Cd72eOE
	 kxE6BeyIZl2aTxC9kXzoZny7+GOf5ELCBrK194czS1pUKo3lMpZGRQ7A/j3ZPYBo4U
	 FdTV4tqNYeaEQ==
Date: Tue, 28 Jun 2022 14:09:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: B <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org, 
    Eduardo Habkost <eduardo@habkost.net>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 0/2] Decouple Xen-HVM from PIIX
In-Reply-To: <D8EF825B-45A2-4DE5-A787-8FE7BE88D2E6@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281408490.247593@ubuntu-linux-20-04-desktop>
References: <20220626094656.15673-1-shentey@gmail.com> <D8EF825B-45A2-4DE5-A787-8FE7BE88D2E6@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Jun 2022, B wrote:
> Am 26. Juni 2022 09:46:54 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >hw/i386/xen/xen-hvm.c contains logic which is PIIX-specific. This makes xen-hvm.c depend on PIIX which can be avoided if PIIX logic was isolated in PIIX itself.
> >
> >
> >
> >Bernhard Beschow (2):
> >
> >  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
> >
> >  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and
> >
> >    remove it
> >
> >
> >
> > hw/i386/xen/xen-hvm.c       | 17 ++---------------
> >
> > hw/isa/piix3.c              | 15 ++++++++++++++-
> >
> > include/hw/xen/xen.h        |  2 +-
> >
> > include/hw/xen/xen_common.h |  6 ------
> >
> > stubs/xen-hw-stub.c         |  3 ++-
> >
> > 5 files changed, 19 insertions(+), 24 deletions(-)
> >
> >
> >
> >-- >
> >2.36.1
> >
> >
> >
> 
> Hi Laurent,
> 
> would you like to queue this as well? Both patches have been reviewed at least once, piix twice. Or would you rather keep the review period open for longer?
 
Paul reviewed them both -- I don't think we need further reviews.
Laurent could just take them.

