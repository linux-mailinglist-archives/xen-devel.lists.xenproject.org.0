Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412C7B5D48
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611825.951433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRfD-0002FE-4D; Mon, 02 Oct 2023 22:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611825.951433; Mon, 02 Oct 2023 22:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRfD-0002Cq-0n; Mon, 02 Oct 2023 22:45:19 +0000
Received: by outflank-mailman (input) for mailman id 611825;
 Mon, 02 Oct 2023 22:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRfC-0002Ca-0L
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:45:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b3642ae-6175-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 00:45:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C96AAB81691;
 Mon,  2 Oct 2023 22:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF41C433C7;
 Mon,  2 Oct 2023 22:45:13 +0000 (UTC)
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
X-Inumbo-ID: 5b3642ae-6175-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286715;
	bh=0Xv1fg9Yr06kGBm0qoZ9sfFqEhxPHz8ust+2mU10Q3I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X0cjgwL1einGfXTMB138NchZNaSCZ95xno9PXeXSiORCr0nzAzqTsDN9R/lwoVw9U
	 C+HqeSz0xDOf1rOXu3wNK3ptg+8wZc8tZFTbvAuER1GFItaN5IYs0pRQCmMh64D/xO
	 D+FSpBvZclx1S+oP+X0x+B9f5DjQ0tciEqxEGWjAPcNdq9+yG2ER02h+3BO8mIVnaQ
	 XZzzWCKfs/8jwrexHcxH1XHgagkAxCSGMNTa0BRpQkpSTjQXLnLZrHqJFdQZW3qYHl
	 OVaHVQG8m2Xk2GGvNSukPXaj4cN9MZSgh9EAwBHfLfsz9L+qiHqNaww1p9mqtqycnu
	 GnSgycMlya+Sw==
Date: Mon, 2 Oct 2023 15:45:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule
 8.2
In-Reply-To: <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
References: <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

