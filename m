Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A28A57709
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905515.1313326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqiS6-00041T-LI; Sat, 08 Mar 2025 00:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905515.1313326; Sat, 08 Mar 2025 00:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqiS6-0003zo-IY; Sat, 08 Mar 2025 00:54:06 +0000
Received: by outflank-mailman (input) for mailman id 905515;
 Sat, 08 Mar 2025 00:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqiS5-0003zi-Jn
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:54:05 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d277e15a-fbb7-11ef-9898-31a8f345e629;
 Sat, 08 Mar 2025 01:54:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F370DA455AA;
 Sat,  8 Mar 2025 00:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F69C4CED1;
 Sat,  8 Mar 2025 00:53:58 +0000 (UTC)
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
X-Inumbo-ID: d277e15a-fbb7-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741395239;
	bh=Peod8AxqMf9613TS2aH9gWnEv3mJhqhEDj2d7jrL1+Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cpHIB+M5XkWru4U11Ha6bBfQHxPqTOmZmR+s7igQDsrhsLX1rL+EP12lVUFhITKfj
	 ukmJQQPEj+JoVRpso/2k9soo3Bzm3nIGlYrAmH987e81/GGjXKBqEupO4IYKMA9N78
	 KNDxkZ1eyuPGdln3vCFj32CRO931vaLVipkKiFPCBqMOA0E3Kx3DhD6lHdOpuqB9Zn
	 8l18IVmrGaZPpU4vUgeVoHf6tXi4QJFF48MyNMRTPELTJgV+mLptrWbyBMDOBP25QM
	 0LnmPqDP3dDYLo2FX/mb7nffeMP63BMr8k/5alEt1xmn9W6osLh9VdTrTFVqfPghxm
	 oKQbtFNpox3Xw==
Date: Fri, 7 Mar 2025 16:53:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
In-Reply-To: <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
Message-ID: <alpine.DEB.2.22.394.2503071651090.3032631@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-5-jason.andryuk@amd.com> <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org> <734d9fdf-a201-4a46-9739-26a474683b10@amd.com> <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1608948088-1741395239=:3032631"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1608948088-1741395239=:3032631
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 7 Mar 2025, Julien Grall wrote:
> > init-dom0less only initializes non- introduced domains, so hwdom doesn't get
> > its "domid" xenstore node populated.  That leads to other errors.
> > > So I think with Denis's patch, this isn't strictly needed.  It does help
> > existing toolstack code work today.
> 
> I don't think the toolstack is ready for a split between control/hardware
> domain. That said, shouldn't the toolstack run in the control domain? Same for
> xenstored (unless you have a xenstored domain)?

Yes, the toolstack (if present) would be in the control domain.
xenstored doesn't have to be in the control domain and in fact it might
not be advisable to place it there today.

The main difference between the toolstack and xenstored is that the
toolstack only talks to Xen, while xenstored talks to all other VMs,
which is dangerous in many configurations.
--8323329-1608948088-1741395239=:3032631--

