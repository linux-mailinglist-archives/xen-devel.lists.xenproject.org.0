Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D443B526F3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 05:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119229.1464715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXpT-0006BF-9F; Thu, 11 Sep 2025 03:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119229.1464715; Thu, 11 Sep 2025 03:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXpT-000699-6l; Thu, 11 Sep 2025 03:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1119229;
 Thu, 11 Sep 2025 03:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwXpS-000693-4r
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 03:18:34 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fea94400-8ebd-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 05:18:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B322601AB;
 Thu, 11 Sep 2025 03:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E4EC4CEEB;
 Thu, 11 Sep 2025 03:18:28 +0000 (UTC)
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
X-Inumbo-ID: fea94400-8ebd-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757560710;
	bh=g3/p4H40JqcqTgjiwVQSePcgScvUvtEsjUEL8LdYBbM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nke7/mHGlkUBBgIH+vTqQaqCQhAC44OKc3IN7MNZ5tT6hG/7x0daw2CqsrwzT0+6a
	 FJ4N/hFyNahBH0PGCwsdV8lH9Q018CFX2Uw0hwxCRx9HT/m7wNTEPuASotlpAC3Cr1
	 vT2yiSK8RFbQ0MrIY+NsIV7btZLrD+afiKQSi2uZfuGaTfR5JrTii3g3LkKvGLKzGO
	 H6bdVm8id5a8HtZl41F3rPAzVg4VNyvGoVfZhc1Jz8JbQ8TqdtdQ9qCn/657N/NS+Q
	 Y7KdIH1HjTfRrH6/r1wCOaOh4eZyGL1CLyJwgNa5ijy975At4kjd/1kqFIrzns2rPQ
	 pqwOx7pOgml6w==
Date: Wed, 10 Sep 2025 20:18:27 -0700 (PDT)
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
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 22/26] xen/domctl: wrap arch_{get,set}_paging_mempool_size()
 with CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-23-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509102018070.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-23-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Arch-specific arch_{get,set}_paging_mempool_size() is responsible for
> XEN_DOMCTL_{get,set}_paging_mempool_size domctl-op, and shall be wrapped
> with CONFIG_MGMT_HYPERCALLS
> Wrap XEN_DOMCTL_{get,set}_paging_mempool_size-case transiently with
> CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
> CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

