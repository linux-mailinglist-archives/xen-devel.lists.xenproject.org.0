Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F233A5770A
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905523.1313337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqiUJ-0004uL-0g; Sat, 08 Mar 2025 00:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905523.1313337; Sat, 08 Mar 2025 00:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqiUI-0004rm-UK; Sat, 08 Mar 2025 00:56:22 +0000
Received: by outflank-mailman (input) for mailman id 905523;
 Sat, 08 Mar 2025 00:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqiUH-0004rg-9E
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:56:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 256bf26f-fbb8-11ef-9ab7-95dc52dad729;
 Sat, 08 Mar 2025 01:56:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C76EF5C649A;
 Sat,  8 Mar 2025 00:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19E5C4CEE3;
 Sat,  8 Mar 2025 00:56:16 +0000 (UTC)
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
X-Inumbo-ID: 256bf26f-fbb8-11ef-9ab7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741395378;
	bh=tOkzSuCF3xIbg1ODCi3tdRzJm+mv/X9rR8yj4CvmIUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TdETXMOsi1Gu0skF3LvWDkRc2ZHip9uOSapfJkVoMORy7vIbk5a7Eb++MRnczGesT
	 ZhV53+/ZlTyHObPkeOhvY718ccSvFnhc2BhcLNb1DADGyzFqmu756zKhcto8jF4BvB
	 JelIa3onsfB0VImSjzjVP9OfAPF4ijyLclKVZeCVmO2B9lnMGlrNrpuR3m/EUXK1e7
	 WIP3tz8b4qgFCdK/bGHxP40x8yP30p9q1uE9yvEyY62dTY5ALPRCotm1MZ9+lCJy+I
	 9YyYY+OwY2pP/o7vgFRCE5aC013heESTxbxDKqepF5HfMn1rCSs5YeLRRZ9jWxfkNx
	 jG9y7TCdghy7w==
Date: Fri, 7 Mar 2025 16:56:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
In-Reply-To: <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
Message-ID: <alpine.DEB.2.22.394.2503071654180.3032631@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-6-jason.andryuk@amd.com> <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org> <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com> <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-935559913-1741395378=:3032631"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-935559913-1741395378=:3032631
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 7 Mar 2025, Julien Grall wrote:
> > What exactly do you mean by imposing with respect to the iommu?  Require
> > one, or mirror the dom0 code and set it for the hwdom?
> > 
> >      if ( iommu_enabled )
> >          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> 
> I mean requires one. Without it, you would need to set directmap and I don't
> think this should be allowed (at least for now) for the HW domain.

I think the directmap should be optional for the hardware domain. In
practice, we already have not direct-mapped dom0 today when the user
enables cache coloring.
--8323329-935559913-1741395378=:3032631--

