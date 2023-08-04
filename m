Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07276F694
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576665.903049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiru-0004CL-F8; Fri, 04 Aug 2023 00:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576665.903049; Fri, 04 Aug 2023 00:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiru-0004Ae-Bj; Fri, 04 Aug 2023 00:40:38 +0000
Received: by outflank-mailman (input) for mailman id 576665;
 Fri, 04 Aug 2023 00:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRirs-0004AY-Ht
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:40:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85aaec7f-325f-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 02:40:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B92B261E69;
 Fri,  4 Aug 2023 00:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D32C433C7;
 Fri,  4 Aug 2023 00:40:32 +0000 (UTC)
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
X-Inumbo-ID: 85aaec7f-325f-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691109633;
	bh=EaAQPFoaGOI3ZfSLVu0aZr8HeevyqtL/S0G/iXavdas=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ptHtLHezoaXBnNqx1jtxwQq1wyegSfjNrAr4jbJcJVnFQCzLS+jy1mvPBnUfpDsnb
	 w1FdM/2oaJi7FfP2c39SEP7P3xf065X83K6KFfCsbvlaKY1hnULXD/cxzaXM2L7PtS
	 007i/ADbNAaz7fCag3lyteEBSwNtkm9pZskjbCIoC2abytyI0AVVvB8oMFzyb2VlDu
	 zlFPiHkAB7QRlePxRyDWrT3x2FBioNjSezPq1ExfY0BgvtIQjhfSsj8Jqpt7nXJQmB
	 WbViOBW96ehjeaWVzd1R8/OpMuueK4iaGk2UiaaAWDBR5Bl6EXqoc1q72Vpmo8qzU8
	 qqQUKrl4A6taA==
Date: Thu, 3 Aug 2023 17:40:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 01/13] AMD/IOMMU: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <2af1f76d2c002dd9f0b01eebf7af516d86bfe91e.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031740180.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <2af1f76d2c002dd9f0b01eebf7af516d86bfe91e.1691053438.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

