Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4875A91012
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956844.1350108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cxq-00069p-Op; Thu, 17 Apr 2025 00:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956844.1350108; Thu, 17 Apr 2025 00:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cxq-000676-Lc; Thu, 17 Apr 2025 00:18:46 +0000
Received: by outflank-mailman (input) for mailman id 956844;
 Thu, 17 Apr 2025 00:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Cxo-00066y-Hn
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:18:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d91108-1b21-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 02:18:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F7635C52C7;
 Thu, 17 Apr 2025 00:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5658DC4CEE2;
 Thu, 17 Apr 2025 00:18:39 +0000 (UTC)
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
X-Inumbo-ID: 84d91108-1b21-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849121;
	bh=p60El9KhttI6jSEUCffSKEG5DJG9Rkby0dmfK3nWEnQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ULVWQmkgiOiWGUASX56TvMpF0/M2tqmP3HMhNHY0e66TnGsCbzH98BjA4ZALGmBGo
	 dHiyXa+owIXhArY5B9+AnXK/9BWXE0Z4ObHn/QoDIPjHS2TCKvrzyjb6ASedQ5lx0L
	 m+666s8ofiCtlNCXHBGiDynvzBGEiTfC7qZoFvipeh2hb+uljly0Z91JYz5KPSFV8M
	 6xWkFBc73LXUUw5FJMZsBNnky5fh1NuZN4Zu9eQuUWNicFY4i2rfFHaMSS4DRCUDJt
	 6cG6hxrxTiYMp+btjtCVtYkPjkbAa8MWsIdZY6IqG5g9reIY8aPa4R2v3QQf6eoS5G
	 8DWTVMe59oxoQ==
Date: Wed, 16 Apr 2025 17:18:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Lin Liu <lin.liu@citrix.com>
Subject: Re: [PATCH v6 12/15] arm: Remove asm/byteorder.h
In-Reply-To: <20250416115900.2491661-13-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504161718320.8008@ubuntu-linux-20-04-desktop>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com> <20250416115900.2491661-13-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Andrew Cooper wrote:
> With the common code moved fully onto xen/byteorder.h, clean up the dregs.
> 
> Sort includes in some files while swapping over to xen/byteorder.h.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

