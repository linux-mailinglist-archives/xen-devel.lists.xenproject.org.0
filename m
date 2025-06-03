Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F1ACBDF4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 02:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003902.1383526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMFeM-0003Vc-Rl; Tue, 03 Jun 2025 00:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003902.1383526; Tue, 03 Jun 2025 00:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMFeM-0003Td-P2; Tue, 03 Jun 2025 00:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1003902;
 Tue, 03 Jun 2025 00:37:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMFeL-0002zE-DC
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 00:37:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deadca1f-4012-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 02:37:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 88ECB40C03;
 Tue,  3 Jun 2025 00:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C1BC4CEEB;
 Tue,  3 Jun 2025 00:37:01 +0000 (UTC)
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
X-Inumbo-ID: deadca1f-4012-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748911023;
	bh=9nNX2P5wnstgiSFoybutTPcfvKINkRlNhtcOUedxy18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ewT88G2rLJVufigC8BWhn6YdoNf04+zIR3W/CpLzbKpkjoATVleJ3GdQ6++61AppA
	 XYLRwXUyGgwtQ2nSYAVS3zzSl9EE36i8DcH9JOFq6Fx7r7SeU0w25zWkNeI17/iubF
	 GgJQH4Z06p6j46e9tVN/dNrzsrSHmY04/znKSo8b3p8IQxBCO0ms3Kby/hn5wha8dd
	 cIpNSFOqk9PG48efDvC8V8rNpFGPUgjsyQkO71S1F0rWbKksuHWZGydZdIg+rElDH/
	 JWE64x7jcqQjiqZxAgkDJCJS3/8/NtptyrXi1aAtbQyD9kc3GBTWVaO2ZxU/sTwI15
	 hl9G5BVjJYJOw==
Date: Mon, 2 Jun 2025 17:37:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 2/4] xen/console: introduce console input permission
In-Reply-To: <20250530231841.73386-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2506021736440.1147082@ubuntu-linux-20-04-desktop>
References: <20250530231841.73386-1-dmukhin@ford.com> <20250530231841.73386-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add new flag to domain structure for marking permission to intercept
> the physical console input by the domain.
> 
> Update console input switch logic accordingly.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v4:
> - kept input_allowed as a separate flag
> - updated logic for input_allowed in vpl011
> - fixup for console_switch_input()
> ---
>  xen/arch/arm/vpl011.c      |  1 +
>  xen/arch/x86/pv/shim.c     |  2 ++
>  xen/common/domain.c        |  2 ++
>  xen/drivers/char/console.c | 18 +++++++++++++++++-
>  xen/include/xen/sched.h    |  8 +++++++-
>  5 files changed, 29 insertions(+), 2 deletions(-)
> 


