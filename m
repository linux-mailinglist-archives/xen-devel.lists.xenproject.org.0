Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC497C9140
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616938.959320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRPX-0004GP-5a; Fri, 13 Oct 2023 23:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616938.959320; Fri, 13 Oct 2023 23:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRPX-0004EW-2R; Fri, 13 Oct 2023 23:17:39 +0000
Received: by outflank-mailman (input) for mailman id 616938;
 Fri, 13 Oct 2023 23:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRPW-0004EH-4l
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:17:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1ea8115-6a1e-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:17:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B413762202;
 Fri, 13 Oct 2023 23:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E10C433C7;
 Fri, 13 Oct 2023 23:17:34 +0000 (UTC)
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
X-Inumbo-ID: b1ea8115-6a1e-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697239055;
	bh=M303czI56qsf74+hRyGl5GbH+VNDYMPKt23eMUsxU2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uzg1LlGf+/BwXfEerXQD8O/J8Zk4zRDFNPd2CiH3ObtW0ypMkBB186mSrhFIjhtr2
	 CBmJc/L7I53yVHVGkgnyYq4l/OEmzGah7NmBbD9kIWP+sbUlr1CZEZ/OGqaF0IZozF
	 igQve2aOFAr8HSfZbTb/F1hiIAgTLJpfP9gZ+qXCPwONMxQy6drD3By6m0nrl5YETo
	 q6Dl5L1MW2jK9YcFBVddAo2SN68DA9GCjxx4601w9QYOCfEYxk74Ym6Db+l2Yh+mvh
	 B451E8UK+VDHGtaNpbetiDgLbpMlHq+0PfWGE5KymAb2h9U4ik287CfQrELrmKtuEu
	 /vl3JtbtYz5Cg==
Date: Fri, 13 Oct 2023 16:17:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 06/10] arm/cmpxchg: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <7323f8210d16e58d8b4cdac89a10d67e7d7d023f.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131617220.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <7323f8210d16e58d8b4cdac89a10d67e7d7d023f.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


