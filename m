Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05567B00970
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 19:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039723.1411421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZud8-0000oO-Ei; Thu, 10 Jul 2025 17:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039723.1411421; Thu, 10 Jul 2025 17:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZud8-0000lN-Bp; Thu, 10 Jul 2025 17:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1039723;
 Thu, 10 Jul 2025 17:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mn5d=ZX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZud6-0000lC-CF
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 17:00:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 590ce4d1-5daf-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 19:00:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 95F1E61436;
 Thu, 10 Jul 2025 17:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9760C4CEE3;
 Thu, 10 Jul 2025 17:00:11 +0000 (UTC)
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
X-Inumbo-ID: 590ce4d1-5daf-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752166813;
	bh=dvQvBZ3nBTo0fQvPx2O/QKUWZF1EWzZfOaQFAeiXvXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k1lL8bFjxMEMrExWppGrVcRsHbz87RHlXtxZx2YvYcmBXZU+rDYgV087a89TirotU
	 AzlCBVvX6I9kMYFuTOG7ZqU1EQTp4f17ooAu9k81iQhBfLCihpiH0W6r7R1TLxof2d
	 wp6w121WvZeyiqSjcnf3ZUCoLylMJFyO2NnEO97p7iF6WR8ghSPzPpZeLNR+sJNa57
	 GsR2JcTNKgbB1Axtc+u2qBXSFHdyfu31ne+066fCJWH8EE/JmMneOZd2dMr7OqveVW
	 qCX8Owu0dB5R6ZPdlQU4huodWiyfZs7fV3rmzJI+lJHqfHhmsZoIg10swLlCj+vPZ0
	 rSqr/TZor+mXQ==
Date: Thu, 10 Jul 2025 10:00:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech, 
    julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, 
    roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
In-Reply-To: <ca73a0b6-e484-48be-8ddb-4f53c18c99a0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507100959540.605088@ubuntu-linux-20-04-desktop>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-14-dmukhin@ford.com> <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com> <aFpUNB8BP6+COTRp@kraken> <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com> <aG8eaUx0wW19xS6W@kraken>
 <ca73a0b6-e484-48be-8ddb-4f53c18c99a0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Jul 2025, Jan Beulich wrote:
> On 10.07.2025 03:59, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 09:33:04AM +0200, Jan Beulich wrote:
> >> On 24.06.2025 09:31, dmkhn@proton.me wrote:
> >>> On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
> >>>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> >>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>
> >>>>> Move PL011 emulator to the new location for UART emulators.
> >>>>>
> >>>>> No functional change intended.
> >>>>>
> >>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>>>> ---
> >>>>>  xen/arch/arm/Kconfig                               |  7 -------
> >>>>>  xen/arch/arm/Makefile                              |  1 -
> >>>>>  xen/drivers/Kconfig                                |  2 ++
> >>>>>  xen/drivers/Makefile                               |  1 +
> >>>>>  xen/drivers/vuart/Kconfig                          | 14 ++++++++++++++
> >>>>>  xen/drivers/vuart/Makefile                         |  1 +
> >>>>>  .../arm/vpl011.c => drivers/vuart/vuart-pl011.c}   |  0
> >>>>>  7 files changed, 18 insertions(+), 8 deletions(-)
> >>>>>  create mode 100644 xen/drivers/vuart/Kconfig
> >>>>>  create mode 100644 xen/drivers/vuart/Makefile
> >>>>>  rename xen/{arch/arm/vpl011.c => drivers/vuart/vuart-pl011.c} (100%)
> >>>>
> >>>> I question the placement under drivers/. To me, driver != emulator. I
> >>>> wonder what others think. But yes, we already have drivers/vpci/. That
> >>>> may want moving then ...
> >>>
> >>> re: driver != emulator: I agree; but I followed drivers/vpci.
> >>>
> >>> Do you think common/vuart would be a better location?
> >>
> >> Or maybe common/emul/... This wants discussing, I think.
> > 
> > Will something like the following work
> >   common/hvm/vuart
> > ?
> 
> Not really, emulators may not be limited to HVM. But iirc common/emul/ is
> what we settled on anyway at the last Community Call?

Yes, that is what I recall as well

