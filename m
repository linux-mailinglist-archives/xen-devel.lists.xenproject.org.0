Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDC48BAFC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 23:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256171.439491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7PzC-0005CN-W0; Tue, 11 Jan 2022 22:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256171.439491; Tue, 11 Jan 2022 22:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7PzC-0005A8-Sh; Tue, 11 Jan 2022 22:51:26 +0000
Received: by outflank-mailman (input) for mailman id 256171;
 Tue, 11 Jan 2022 22:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMx1=R3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7PzC-0005A0-8s
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 22:51:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00a8418e-7331-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 23:51:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6B8561203;
 Tue, 11 Jan 2022 22:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59D1C36AE9;
 Tue, 11 Jan 2022 22:51:22 +0000 (UTC)
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
X-Inumbo-ID: 00a8418e-7331-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641941483;
	bh=esDHpoAtK0+XTTO/qpX/i26NVTtLMkAbXBWFlSubeQE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sLiOrkPqAPPYn2zrDRIaGJGd5f0klzNKEkWnLZTnM0WMYXRZa9C+cAOaE1Koz+pY+
	 lbITED1TdgF7zWn8HA/pLDNJXeuXb3pXMJdWL1ddOtO+c5UoFcNtUM4hRBe3KpBYXL
	 CvuTN/eLzZpwowia0ERPKfFcRFCLbcufx/j5H5H1Ai600ARrupJTHjIgem3zlm82EV
	 t9Zo3nRBzNYSMS9LdgV29Gv0lIH/SZ+Zce14jUJQZtRgytXUwATB/MEjXU0OqwPNDf
	 xBALHHU5SlIPQafNL+g1CBdoP9UKgCbsjgVuQzu9rrJw2/0O36H1SOAf6aitnBtPWD
	 0KTxHpv9lYRXg==
Date: Tue, 11 Jan 2022 14:51:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
In-Reply-To: <627242da-78e2-913f-33a4-4ae7fb94664a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2201111450070.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-1-sstabellini@kernel.org> <f3baac82-0eff-f885-f03a-ba987c8e12b6@suse.com> <alpine.DEB.2.22.394.2201101458520.2060010@ubuntu-linux-20-04-desktop>
 <627242da-78e2-913f-33a4-4ae7fb94664a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Jan 2022, Jan Beulich wrote:
> On 11.01.2022 00:08, Stefano Stabellini wrote:
> > On Mon, 10 Jan 2022, Jan Beulich wrote:
> >> On 08.01.2022 01:49, Stefano Stabellini wrote:
> >>> Introduce a new feature flag to signal that xenstore will not be
> >>> immediately available at boot time. Instead, xenstore will become
> >>> available later, and a notification of xenstore readiness will be
> >>> signalled to the guest using the xenstore event channel.
> >>
> >> In addition to what Julien has said, I'd like to point out that Linux'es
> >> xenbus driver already has means to deal with xenstored not being around
> >> right away (perhaps because of living in a stubdom which starts in
> >> parallel). I therefore wonder whether what you want can't be achieved
> >> entirely inside that driver, without any new feature flag.
> > 
> > The fewer changes to Linux the better but we couldn't find a way to make
> > it work with zero changes.
> > 
> > In a way, the patch for Linux is re-using the existing infrastructure to
> > delay initialization, e.g. xenbus_probe_thread to call xenbus_probe
> > later.
> > 
> > However, today there is nothing stopping Linux/HVM to continue
> > initialization immediately except for xs_hvm_defer_init_for_callback
> > which is not applicable in this case. So we introduced
> > XENFEAT_xenstore_late_init.
> > 
> > As I wrote in another reply, I think we could do without
> > XENFEAT_xenstore_late_init if we instead rely on checking for
> > HVM_PARAM_STORE_EVTCHN being valid and HVM_PARAM_STORE_PFN being zero.
> 
> Just as an aside - as discussed in some other context not so long ago,
> HVM_PARAM_*_PFN being zero isn't the best way of expressing "not yet
> initialized", and hence you would also want to check against ~0.
 
Yes, good point


> > But either way as far as I can tell we need to add a new check to delay
> > xenstore initialization in Linux/HVM.
> 
> Yes, I can see that a Linux side change might be needed. But isolating
> the change to there will be much better than needing to also have a
> Xen side change in place.

I agree. I managed to remove XENFEAT_xenstore_late_init from the patch
series and everything works fine. It will be in the next version.

