Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB0ADE020
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 02:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018655.1395550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgrm-0007VQ-Ji; Wed, 18 Jun 2025 00:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018655.1395550; Wed, 18 Jun 2025 00:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgrm-0007TL-GZ; Wed, 18 Jun 2025 00:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1018655;
 Wed, 18 Jun 2025 00:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JDB=ZB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRgrl-0007TF-S6
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 00:41:25 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5e1a56d-4bdc-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 02:41:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3908244DC3;
 Wed, 18 Jun 2025 00:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC3DC4CEE3;
 Wed, 18 Jun 2025 00:41:21 +0000 (UTC)
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
X-Inumbo-ID: f5e1a56d-4bdc-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750207283;
	bh=HDpt+A1782zET1ue/ODOiJOIHN8q0DJhaCgkR15C/HI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WUS2Ki3UZJLD6qJ6b8ZfvrPw40KHJq+dZ498AmDIrMQk+ZHqfV6tgSDJUJCpQVnXC
	 TqUG+pOwOsmPVhrTxpV02yERSU9OCLx547zhBhrNN98uoZ1n2pApvFnkzj2Qrg67fU
	 D/YFt97FWHwgqsHwpXILNHqZ+wXsx4It44QCqRfITeZLKBFQo3t3EjJm87dJ7xJ044
	 LFCC8Uh7B/W8/yixDiEhD5hEbC4tf8cWib5wyneE+O1szP+D3ZUQXXfMphRd/0ssz+
	 gBcAEEZxxsMMrmcr65NjMs+6AyccEkIQHddUvat9CwuDkGR+9JpgXppdvP98L+Nqac
	 jISv4LwG7e3KQ==
Date: Tue, 17 Jun 2025 17:41:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 1/3] xen/keyhandler: add missing noreturn attribute
In-Reply-To: <20250606212712.1901838-1-victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506171741010.1780597@ubuntu-linux-20-04-desktop>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Function `reboot_machine' does not return, but lacks the `noreturn'
> attribute.
> 
> Functions that never return should be declared with a `noreturn'
> attribute.
> 
> The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
> currently accepted in Xen), and also Rule 2.1: "A project shall not
> contain unreachable code". Depending on the compiler used and the
> compiler optimization used, the lack of `noreturn' might lead to the
> presence of unreachable code.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


