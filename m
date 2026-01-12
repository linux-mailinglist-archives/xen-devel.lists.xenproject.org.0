Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5690DD15689
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 22:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200951.1516731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfPJm-0007IR-Ia; Mon, 12 Jan 2026 21:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200951.1516731; Mon, 12 Jan 2026 21:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfPJm-0007FK-FY; Mon, 12 Jan 2026 21:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1200951;
 Mon, 12 Jan 2026 21:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfPJk-0007FE-RI
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 21:19:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57482c6a-effc-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 22:19:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BAAB46000A;
 Mon, 12 Jan 2026 21:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF97C116D0;
 Mon, 12 Jan 2026 21:19:10 +0000 (UTC)
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
X-Inumbo-ID: 57482c6a-effc-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768252751;
	bh=8YIm2mjYvImlnR/TA3qCvrzUgrrwDkBwcChNR/m79wE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WnM5VaC7NJI8LGV6MW0olTcx8NqsH7iwZqud7q6uwf82LFnN57mCPspC8NifAWvh8
	 nawuQVF9Ii5FE61W98pNTxHTp9RuvVPdeRcp51fU5lILpXcuAj8tk5wZi50sGdFtM/
	 LI3DUC6BB7N5c1L5YatopDc2fgggnfxv+sRMkkZcZZY1lpbnx4odkISeYHwY7QurUK
	 ZaUjQoX3EKmsSzQ/PdQTnv6r6rAGpEaPIfVAFLRIiVkOTsjHLvDWxMituIrDB//KmC
	 rWHplp1YFRZAfkff9Qg5l+0t5NmbbBn0yAbMWTo62tuoevSjUIJgWi9qcOaeqPG/G/
	 uJ09kT3K2JNgg==
Date: Mon, 12 Jan 2026 13:19:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print correct domid in allocate_memory_11
In-Reply-To: <2b0b3c25-c504-4e5f-b995-cde41093f560@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2601121319000.992863@ubuntu-linux-20-04-desktop>
References: <20260112104233.86482-1-michal.orzel@amd.com> <2b0b3c25-c504-4e5f-b995-cde41093f560@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Jan 2026, Andrew Cooper wrote:
> On 12/01/2026 10:42 am, Michal Orzel wrote:
> > allocate_memory_11() can be called for dom0 and direct-mapped hwdom
> > domU. In the latter scenario, a log message would still mention dom0
> > instead of the correct domid.
> >
> > Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

