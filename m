Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF494801A17
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 03:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645912.1008465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Fs0-0006Dd-Bi; Sat, 02 Dec 2023 02:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645912.1008465; Sat, 02 Dec 2023 02:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Fs0-0006BS-8b; Sat, 02 Dec 2023 02:36:40 +0000
Received: by outflank-mailman (input) for mailman id 645912;
 Sat, 02 Dec 2023 02:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhqb=HN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r9Fry-0006BM-VG
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 02:36:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c20ed9b-90bb-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 03:36:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0549762167;
 Sat,  2 Dec 2023 02:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E051C433C7;
 Sat,  2 Dec 2023 02:36:32 +0000 (UTC)
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
X-Inumbo-ID: 9c20ed9b-90bb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701484593;
	bh=ue0fnjufnIgs+iS/q12GjlaFwl+pJcqf59Sgz+NQFrc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T0l/IElMv+Gsc2wiwoSAEl0109XzO43j43munDOZ8txdYnbSH/WFRAckjIjuKZslI
	 UDGwcrzNDMe8uDKr9bmxzjZYhunymfbMSemMtzIV5ltMOaCAfiXdOdW7b42Nb3kGBY
	 cNFkKeU1hITcaOQRvbMRpOQdXEoQ2Tz7596Ts7EwcBqfusMhp4bZeFYk5c9j0/bQcp
	 tB8wiylAI7mzDC0vApsbkgLt9vWVy/FJ2DZKe+UFI1mErJLo0ekuwrJbnzdzefmtQ7
	 gxC1MB4UHCs5UrIIsp3Vk1HY0rHlsemkHQQ3lVPY0fvS7oB4EPrQQZzQBuFkY+XakV
	 LeQK/fHl2JmHg==
Date: Fri, 1 Dec 2023 18:36:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/5] xen/x86: introduce self modifying code test
In-Reply-To: <ZWnMom8D8F4nEZFp@macbook>
Message-ID: <alpine.DEB.2.22.394.2312011835340.110490@ubuntu-linux-20-04-desktop>
References: <20231128100352.35430-1-roger.pau@citrix.com> <20231128100352.35430-4-roger.pau@citrix.com> <3ac223d0-75a1-40b0-8bf9-1c556703c07d@suse.com> <ZWnMom8D8F4nEZFp@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-245369522-1701484593=:110490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-245369522-1701484593=:110490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> > > @@ -1261,6 +1269,7 @@ struct xen_sysctl {
> > >          struct xen_sysctl_livepatch_op      livepatch;
> > >  #if defined(__i386__) || defined(__x86_64__)
> > >          struct xen_sysctl_cpu_policy        cpu_policy;
> > > +        struct xen_sysctl_test_smc          smc;
> > 
> > Imo the field name would better be test_smc (leaving aside Stefano's comment).
> 
> Right, will see what Stefano thinks about using test_smoc.


If you meant "test_smoc", that's totally fine.

If you meant "test_smc" I think that must be a test for the virtual SMC
interface that Xen exposes, right?  Good we need some tests for vsmc.c
;-)
--8323329-245369522-1701484593=:110490--

