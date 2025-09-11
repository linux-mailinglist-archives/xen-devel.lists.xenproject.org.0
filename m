Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492EDB52675
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119112.1464636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX4J-0003Lh-Gv; Thu, 11 Sep 2025 02:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119112.1464636; Thu, 11 Sep 2025 02:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX4J-0003JQ-CF; Thu, 11 Sep 2025 02:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1119112;
 Thu, 11 Sep 2025 02:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwX4I-0002uc-7r
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:29:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f785973-8eb7-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:29:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E584E44A83;
 Thu, 11 Sep 2025 02:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86021C4CEEB;
 Thu, 11 Sep 2025 02:29:45 +0000 (UTC)
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
X-Inumbo-ID: 2f785973-8eb7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757557786;
	bh=bh5xWp9+jIQ/i/yL7/mFQRgmtOWyuT3Y3rSxCUgpVvY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mgDOKPeMYwilzXKC5jw+gMqPHihclgg2pB6Scy6ZW8zm5pC1Rm4ESfkHYBZfpfrXR
	 aOlNibj3hSCcshRLZjE1mcYyF8YL5O885w5nZp0P9N6mXkIIhSor9X7E6hWT24umOF
	 exszK0h3OBIK2IfK514uSFJHtDtGJuQ+mk5TS+2Bbc8S67S7rI40C9wwkwoZVsQs+p
	 xZw8onqCgZJqrNfPcETHtv3cMIYXHuSnVqTVzms/+yhaDJ4v94xlQHDWMGNHxV5WcG
	 oXrs3L4xfwElVG5AtipcMRIQEZKlx+8+0tajwUPQP/d2H8Ph3yE9OVvIyyX9ihw7Mu
	 XhTlPST5Qtcgw==
Date: Wed, 10 Sep 2025 19:29:44 -0700 (PDT)
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
Subject: Re: [PATCH v2 11/26] xen/domctl: wrap domain_set_node_affinity()
 with CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-12-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101929370.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-12-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function domain_set_node_affinity() is responsible for
> XEN_DOMCTL_setnodeaffinity domctl-op, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS
> Wrap XEN_DOMCTL_setnodeaffinity-case and xenctl_bitmap_to_nodemask()
> transiently with CONFIG_MGMT_HYPERCALLS, and it will be removed when
> introducing CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

