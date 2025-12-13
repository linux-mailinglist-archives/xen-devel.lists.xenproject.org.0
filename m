Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03864CBA2B0
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 02:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186045.1507942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUEcO-0005FJ-Vz; Sat, 13 Dec 2025 01:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186045.1507942; Sat, 13 Dec 2025 01:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUEcO-0005Cx-TD; Sat, 13 Dec 2025 01:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1186045;
 Sat, 13 Dec 2025 01:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk1a=6T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vUEcN-0005Cr-AQ
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 01:40:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad741737-d7c4-11f0-b15b-2bf370ae4941;
 Sat, 13 Dec 2025 02:40:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 967F560197;
 Sat, 13 Dec 2025 01:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F75BC4CEF5;
 Sat, 13 Dec 2025 01:40:15 +0000 (UTC)
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
X-Inumbo-ID: ad741737-d7c4-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765590016;
	bh=sJ4RR/YDaD3uR8Zhckm1hynsY52H0lkF9ncPKODrChw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MX03DpFKucfStOaSk+0mDtjqljCddhjtWLsEfEQFgBXf/6DGi3EhQpW4ZSc6Ye5tM
	 j6TrQeYmGUXy1PncRIedhU4zoLGSmeEQq7NJkybDNEWfZkrTSHKeCRlNYds4+1s1vK
	 F6OEvyzE7iZedgkz076CgxF0WVkRl4+sAMC7MMV8qCIGL+TynwnwVYluJrTIkkEZNI
	 G2R+Qqow8NwIZrRqqC+6dBvUiqCEaboXTW7m2y0wR1NWKuK5s040GSEoHLN2ADJd2T
	 hB46r15hBkJCJHj2VhqKuF982xraRJSprC3N9MCt+cxaeoIvUHoEtTwyni/alDFiqh
	 kvy2fv9R40mQw==
Date: Fri, 12 Dec 2025 17:40:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] automation: edit pipeline to fix blocked status
In-Reply-To: <20251212235727.1377099-1-victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2512121740040.381016@ubuntu-linux-20-04-desktop>
References: <20251212190850.1357779-2-victorm.lira@amd.com> <20251212235727.1377099-1-victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Dec 2025, Victor Lira wrote:
> The original yocto config had a hidden default of allow_failure: true for the
> manual job while the hidden default for rules is false. This causes the
> stages with manual jobs to show as blocked.
> 
> Set it explicitly to true to avoid the analyze and build stages being shown as
> blocked.
> 
> Fixes: 485ab1b5db0f358625fafe2df4e41e3ef008aed8
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

