Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E6AEED09
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 05:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029346.1403089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWRkz-0003Ky-3k; Tue, 01 Jul 2025 03:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029346.1403089; Tue, 01 Jul 2025 03:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWRky-0003JX-VV; Tue, 01 Jul 2025 03:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1029346;
 Tue, 01 Jul 2025 03:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8i3=ZO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWRkx-0003JP-9E
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 03:34:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b22669-562c-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 05:34:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD71160053;
 Tue,  1 Jul 2025 03:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9A1C4CEF0;
 Tue,  1 Jul 2025 03:33:55 +0000 (UTC)
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
X-Inumbo-ID: 39b22669-562c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751340838;
	bh=bDx14VVmQi/kkUH/Wpv77FOd8v1+seccUrx8QvHcvls=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tPmhi+bIehAtJn0sN+MxIl4cW/rV7puo2LiP6nBywUshMnsJBaTIjVTb2bclI+SlM
	 e9/zwL/ebO7qPdAfcZzGsWW8iuyF3MzyUPO0hHBp1nHoDYldTe9lOgCF1g6f6tOAa9
	 dINXAxLRhUcuI3MnDxu4dgeNZT/xPmHONyMVRH8Rf7c0fus1QnU5ZxbEbwebQ9+wnk
	 CJbA53oa1goF3iXfB0oTlwnjcTjVzNKqoi2d1uL/V6ROUj7kS91fxk3Uf/U2lLvUDN
	 aY6g4DY1nPSzduxSe2PA634KepDWyrYp2AbZyg4bQH7vzyYzrHUxkfS3rGd+Xzr158
	 Wq4HYZbAAXI2w==
Date: Mon, 30 Jun 2025 20:33:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2506302033060.862517@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop> <aGKnDHtRD5OLGaYj@macbook.local> <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Stefano Stabellini wrote:
> I added some debug messages (see
> attached stefano-debug.patch). Something seems to be wrong with the
> pdx_group_valid bitmap after 0x880000, as we start getting MFN ranges
> such as 0x254c0000-0x25500000 which don't make any sense to me.

From what I can see the first time setup_directmap_mappings is called
with base_mfn=50000000, __mfn_to_virt goes wrong and triggers the ASSERT
in maddr_to_virt.

