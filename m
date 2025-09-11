Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC3B52670
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119099.1464617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX2V-0002Rz-Qd; Thu, 11 Sep 2025 02:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119099.1464617; Thu, 11 Sep 2025 02:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX2V-0002P4-Ms; Thu, 11 Sep 2025 02:27:59 +0000
Received: by outflank-mailman (input) for mailman id 1119099;
 Thu, 11 Sep 2025 02:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwX2T-0002Oy-NV
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:27:57 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec46650c-8eb6-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:27:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 53702601AB;
 Thu, 11 Sep 2025 02:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48FEC4CEEB;
 Thu, 11 Sep 2025 02:27:52 +0000 (UTC)
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
X-Inumbo-ID: ec46650c-8eb6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757557674;
	bh=AzRleKA5hFtB+5s/7DOclRULhkto/ekJs8r5r4I4s4g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QgyQ007qkVXfhp3x0HvoYWJNdEF5soVrzG6CrHNFv5TliAw9rX95/CJZMYyfBFi4B
	 N9kuIFIP1GmA20vFDuPtKf6nTOcf0OB+EFUF6BGwdcXMXv1pJiGhDal50UfFMFPXvr
	 Qsz+Rl/wqA5vsUvFsjrAgKV/fXlsOVpHhew6BlPdp0pzIq451UhYlKcqxhTW8sm1dX
	 DJNuMKoWpoucfLTq074AnSoIDms3/Pr7509CV1S3d9AH0hT9ddW4OKlR5fdHAvb2aE
	 YpGEgi/x1fNRC5jVw6/zFD2mOjaV0HJwZJWdb5Fh9FRAPxL8IMnF6PnL7q3wgPc2iL
	 ibg0G2YCC7lww==
Date: Wed, 10 Sep 2025 19:27:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 09/26] xen/domctl: wrap domain_resume() with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-10-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101927420.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-10-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> One usage of function domain_resume() is in domain resume domctl-op, and
> the other is in domain_soft_reset(), which is already guarded with
> CONFIG_MGMT_HYPERCALLS.
> So we could wrap domain_soft_reset() with CONFIG_MGMT_HYPERCALLS.
> 
> Wrap XEN_DOMCTL_resumedomain-case transiently with CONFIG_MGMT_HYPERCALLS, and
> it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

