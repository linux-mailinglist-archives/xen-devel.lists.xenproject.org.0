Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A2AA6631B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918284.1322991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKIy-0000gJ-Qa; Mon, 17 Mar 2025 23:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918284.1322991; Mon, 17 Mar 2025 23:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKIy-0000er-Nh; Mon, 17 Mar 2025 23:55:36 +0000
Received: by outflank-mailman (input) for mailman id 918284;
 Mon, 17 Mar 2025 23:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tuKIx-0000el-CW
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:55:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 507cb39a-038b-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 00:55:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EAFEE5C5745;
 Mon, 17 Mar 2025 23:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB9DC4CEE3;
 Mon, 17 Mar 2025 23:55:30 +0000 (UTC)
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
X-Inumbo-ID: 507cb39a-038b-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742255732;
	bh=nxvOgLFQNm/qPxghnUwDRO9OJmt8WoVNDKrOIg2gUOg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LDGYuav8XG2D0Xc2l3VyyO0rP+M1SgWEIxtzsn+3Dcb2LTWa0/LSsKYbWgLCuhvmv
	 zGybS2GEoMmrOhyWWm6OkOKbVoUqrfB7bd5nPrQ93JGAQO9H/woXkxyU/aMkur714v
	 qXVHWNFsIevxxA11AFDvbsRG7dvt2O186Zb8D+u7QT/WYWLVkTz//sXMkoxBFoY+ln
	 w1vYD/M+NPdTnpNa2dKlSW+NrFaAr+Newh4AIaT6ZuYflmU5WFu9YoUpB5fkNgz1/t
	 Krr3vII2DkT3NHEzX5Q+EL0x37LiNiDM0S58FPulIwidzYcVObXc9Mbpk/clFe8lTa
	 WEA5mYr2M2Fng==
Date: Mon, 17 Mar 2025 16:55:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 15/23] xen/xsm: Add XSM_HW_PRIV
In-Reply-To: <a6bd6175-32fb-4da5-b70d-70e8dabadf66@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503171653220.3477110@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-16-jason.andryuk@amd.com> <095042a0-94c1-4f86-b6df-836a7107efa2@suse.com> <a6bd6175-32fb-4da5-b70d-70e8dabadf66@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, Jason Andryuk wrote:
> On 2025-03-17 10:22, Jan Beulich wrote:
> > On 06.03.2025 23:03, Jason Andryuk wrote:
> > > --- a/xen/include/xsm/dummy.h
> > > +++ b/xen/include/xsm/dummy.h
> > > @@ -95,7 +95,11 @@ static always_inline int xsm_default_action(
> > >               return 0;
> > >           fallthrough;
> > >       case XSM_PRIV:
> > > -        if ( is_control_domain(src) )
> > > +    case XSM_HW_PRIV:
> > > +        if ( is_control_domain(src) && action != XSM_HW_PRIV )
> > > +            return 0;
> > > +        if ( is_hardware_domain(src) &&
> > > +             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
> > >               return 0;
> > >           return -EPERM;
> > 
> > Hmm. Isn't DM_PRIV a property applying to the control domain (besides
> > any stub domains), but not the hardware one?
> 
> I ran QEMU in hardware domain to provide devices to a domU.  I thought QEMU
> would better run in hardware domain than control domain.

Leaving stubdoms aside, QEMU has to run in the hardware domain because
the hardware domain is less privileged. QEMU can be attacked or affected
by the guest so it is undesirable to run QEMU in the control domain
which is highly privileged, and considered highly secure / safe.

