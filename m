Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3159A889B5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950972.1347131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NXr-0000dD-2E; Mon, 14 Apr 2025 17:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950972.1347131; Mon, 14 Apr 2025 17:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NXq-0000aG-Uy; Mon, 14 Apr 2025 17:24:30 +0000
Received: by outflank-mailman (input) for mailman id 950972;
 Mon, 14 Apr 2025 17:24:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u4NXp-0000a2-3y
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:24:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4NXo-00Ez19-1W;
 Mon, 14 Apr 2025 17:24:28 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4NXo-00GcMN-0b;
 Mon, 14 Apr 2025 17:24:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=Z6B4SuUnXlh8AZkWQmhmNfI33gMUs3151/jJOuELimw=; b=I095L5k93DE1eqfsR0Z/PxyUYQ
	GrGteHcF1HZYr1UL0rUzwK6DHoHEdNP+h7dTbz8uMKTMJClZBXXgqs+zG61T1qdNxsI1HkHkSwKiP
	ss7aQ3GzUcpm4motP7E8igT0sLHol3gnCDPL4kpAyd3g5M9zEPqo67CXmvXAi84ac/Oo=;
Date: Mon, 14 Apr 2025 19:24:26 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 4/6] CI: Switch to new argo artefact
Message-ID: <Z_1EyjnMwIudRszF@l14>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414110903.2355303-5-andrew.cooper3@citrix.com>

On Mon, Apr 14, 2025 at 12:09:01PM +0100, Andrew Cooper wrote:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 51229cbe561d..d46da1c43d05 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -242,7 +242,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
>    needs:
>      - alpine-3.18-gcc-debug
>      - project: xen-project/hardware/test-artifacts
> -      job: x86_64-kernel-linux-6.6.56
> +      job: linux-6.6.56-x86_64
>        ref: master
>      - project: xen-project/hardware/test-artifacts
>        job: alpine-3.18-x86_64-rootfs


Don't you need to remove the dependency on "x86_64-argo-linux-6.6.56"
which is just out of context, as I think this is now part of
"linux-6.6.56-x86_64" job.

Besides that:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

