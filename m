Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C618A75393
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931317.1333683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJj2-0003DR-Fe; Sat, 29 Mar 2025 00:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931317.1333683; Sat, 29 Mar 2025 00:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJj2-0003Ac-C4; Sat, 29 Mar 2025 00:07:00 +0000
Received: by outflank-mailman (input) for mailman id 931317;
 Sat, 29 Mar 2025 00:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJj1-0003AW-82
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:06:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b800ecb3-0c31-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 01:06:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BC855C100B;
 Sat, 29 Mar 2025 00:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D803C4CEE4;
 Sat, 29 Mar 2025 00:06:51 +0000 (UTC)
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
X-Inumbo-ID: b800ecb3-0c31-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743206811;
	bh=6eCqg+LdGBNrvhsbXaHSbjq0x0nrWkdqHarhMNLviVM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KcFDURPitEOeGrJy2kJ+GRAbZhudGgYmURYaJ+c46T97G/pvHBHBSWfpSuq/Xz6uZ
	 SDysQDjyeohS00RB3QF6895EY7ZypHvAKq3RCclYWBrI7BqnuzQoa+S0xVPfqj2t+r
	 VvsNWdkQHlxx8UrXx7MCICnx4pc+Sn56JxiUSkj73HM7e9DtLiNCRlvCgUil7RnIN6
	 NpH9N67trQKb1CEuYFYLzT1dn6np/R62AXYdJHsH6ksLTizii+9+5wt85Xw098VErS
	 yj8xQPKl6CqFlyEJopXueLkoI3Oo7ur451gx3696D3dFdtGkfkP/19jYHeyWr4b/Po
	 3RwsLuiXB8gig==
Date: Fri, 28 Mar 2025 17:06:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 03/19] xen/xsm: wrap around xsm_sysctl with
 CONFIG_SYSCTL
In-Reply-To: <20250326055053.3313146-4-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281706420.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-4-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> As function xsm_sysctl() is solely invoked in sysctl.c, we need to
> wrap around it with CONFIG_SYSCTL
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


