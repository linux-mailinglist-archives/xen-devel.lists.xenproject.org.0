Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEA7F5351
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639227.996286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vcb-0003nf-LY; Wed, 22 Nov 2023 22:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639227.996286; Wed, 22 Nov 2023 22:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vcb-0003lg-HI; Wed, 22 Nov 2023 22:23:01 +0000
Received: by outflank-mailman (input) for mailman id 639227;
 Wed, 22 Nov 2023 22:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5vca-0003la-2U
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:23:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id affe0be2-8985-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:22:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A74A61F9C;
 Wed, 22 Nov 2023 22:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85143C433C7;
 Wed, 22 Nov 2023 22:22:54 +0000 (UTC)
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
X-Inumbo-ID: affe0be2-8985-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700691776;
	bh=gX+ZWOEDdXr6yb1WIejQZL1ucNpcjlQ2UdwLDR7bXz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ufu+xjHIqUXxAODsDfNoweUt+aIJIwn/FoTY6dzxkl4c6aDvG0YevLlJ1zHT8u8CB
	 oHtTAqzx4WzlvhvzgSs1Uj9IJ+ojnP3UF+kU7u92b6RUT4GzulZcom6ESR3bLRiKYa
	 9mkfBvZKfThiKzOHHQwv+L8mKl9iiEihRRx6QV4ualKVYtyXkbBfee62QBEAB0J5H0
	 jgKGo+ux5RelAYFux1/6HBvwIUx8Na3U9Jz+qki7FMlQ90sTGEmH9VcfpDp8rGNym4
	 wM4+6ALQ4JKF84xySg6Jo+QA77HW+NS92zf959ebxPvqRcRazm/CByUClMAv/jGBSL
	 jfqW563Cr6VZQ==
Date: Wed, 22 Nov 2023 14:22:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v4 2/2] xen/mm: address violations of MISRA C:2012
 Rules 8.2 and 8.3
In-Reply-To: <9a73c479f3a9b2a3f796f8f65de3b3feb735c56d.1700645120.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311221422440.2053963@ubuntu-linux-20-04-desktop>
References: <cover.1700645120.git.federico.serafini@bugseng.com> <9a73c479f3a9b2a3f796f8f65de3b3feb735c56d.1700645120.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Federico Serafini wrote:
> Add missing parameter names and uniform the interfaces of
> modify_xen_mappings() and modify_xen_mappings_lite().
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

