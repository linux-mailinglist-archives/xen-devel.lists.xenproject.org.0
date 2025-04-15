Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19613A8A96C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 22:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954622.1348651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4n2k-0005PG-Rb; Tue, 15 Apr 2025 20:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954622.1348651; Tue, 15 Apr 2025 20:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4n2k-0005Mt-Oi; Tue, 15 Apr 2025 20:38:06 +0000
Received: by outflank-mailman (input) for mailman id 954622;
 Tue, 15 Apr 2025 20:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZ1T=XB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4n2j-0005Mn-6K
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 20:38:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86942b09-1a39-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 22:38:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 508375C5A07;
 Tue, 15 Apr 2025 20:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D87C4CEE7;
 Tue, 15 Apr 2025 20:37:59 +0000 (UTC)
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
X-Inumbo-ID: 86942b09-1a39-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744749481;
	bh=YHRIdkp/La6RZNUsrbQro8/zHysEvwBk8lOgjmZcqE8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I+XbPJbxIm8U2Pisc7EIBG88K4r7oevSlq3xwydRi05EotHaM60w4O7teXkoKW+za
	 DDuuS3KpaEDgbne+DyWvCtNKWzzk7364Q6AYXq/C+Srmbve3/09g7gETP3ixRZ2Gv0
	 Q53hl2vbRDDQupao8xg9bDu0HkVqxgHuIcq0L/83hZNWJEEI8xlroPUcWzyVICBtOJ
	 IEFYclygLJRiHh4ZqqI7jS5zHTGCEGM9EcbbZhOdDOCj/Yf6y4gHEg97IbjJkfqsDF
	 wG0CtktDhcFId3nK9DgW1Lu7Gu5yG29mDeeLVJ1cyqYj/GRWDwc9rtz2ZObeKAyXsz
	 r0fEFMk8a3NeA==
Date: Tue, 15 Apr 2025 13:37:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>, 
    "Wood (US), Brian J" <brian.j.wood2@boeing.com>, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    Luca.Fancellu@arm.com, andrei.cherechesu@oss.nxp.com, 
    andrei.cherechesu@nxp.com, peng.fan@nxp.com, john.ernberg@actia.se, 
    sstabellini@kernel.org
Subject: Re: NXP Layerscape SMMU IDs
In-Reply-To: <BN0P110MB20674B71640958CA7A56035AF3B6A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2504151335030.8008@ubuntu-linux-20-04-desktop>
References: <BN0P110MB20674B71640958CA7A56035AF3B6A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding a few people in CC that might be able to help

On Fri, 11 Apr 2025, Weber (US), Matthew L wrote:
> Hello,
> 
> We're curious if anyone else has figured out NXP Layerscape Xen support to get at least basic domains launching with minimal IO support?
> 
> Started a recent discussion on it here:
> https://community.nxp.com/t5/Layerscape/How-to-determine-LS1088A-SMMU-Masters-and-Stream-IDs/m-p/2072157#M15560
> 
> We're guessing some of the NXP specific chip/interconnect designs in Layerscape were carried over from the QORIQ PowerPC P/T series.  Maybe some clues in that Topaz hypervisor code?  https://github.com/nxp-qoriq-yocto-sdk/hypervisor
> 
> Regards,
> Matt
> 

