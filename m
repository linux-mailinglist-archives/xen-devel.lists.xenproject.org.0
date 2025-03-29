Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488BA7539C
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931364.1333732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJpQ-00083X-Uw; Sat, 29 Mar 2025 00:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931364.1333732; Sat, 29 Mar 2025 00:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJpQ-00080n-Rv; Sat, 29 Mar 2025 00:13:36 +0000
Received: by outflank-mailman (input) for mailman id 931364;
 Sat, 29 Mar 2025 00:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJpQ-00080f-9S
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:13:36 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a72b638f-0c32-11f0-9ea4-5ba50f476ded;
 Sat, 29 Mar 2025 01:13:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EB08240BD1;
 Sat, 29 Mar 2025 00:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B00C4CEE4;
 Sat, 29 Mar 2025 00:13:30 +0000 (UTC)
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
X-Inumbo-ID: a72b638f-0c32-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743207213;
	bh=DCzUYClgbiXL+bge5SbzUt6HbH/dpN1X3qVoRDyDjz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cTbAhMfzts1g8K/tdPrpFY9/PzuVa/i0elBldZXwzllxWrczfrzZOfpg0J7JaXflD
	 YlY9ljIqJH5RiV+9dU94Gu2Q50xv7dbMTycfwS0NjMeuwbLJboFxJF8kqRPlTXnZCd
	 sHcBH8rRcla6+wa3UdOXAbzbEhQciGN67uonTXCqbVo5U0mPr4MhXx7uhPx4UyrA+N
	 ri8p4g4e9FF5bi6g0fpm8OAEZtO7bdh8HOEuIUFug+LzZru8dq7Ow20onAhPNqdICn
	 Yw86ibXQuak+TqGGxywPtmtCwKhtl9G/lZJDEluLOC1KHNrsGCodNTvF5ElKFJ36SU
	 tF4xZ43JrzFPg==
Date: Fri, 28 Mar 2025 17:13:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
In-Reply-To: <20250326055053.3313146-16-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281713230.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-16-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> The following functions are only used to deal with XEN_SYSCTL_physinfo,
> then they shall be wrapped:
> - arch_do_physinfo
> - get_outstanding_claims
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

