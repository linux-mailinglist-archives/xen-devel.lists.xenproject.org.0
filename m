Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0587EA9780B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963621.1354578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7KdC-0002SO-2H; Tue, 22 Apr 2025 20:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963621.1354578; Tue, 22 Apr 2025 20:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7KdB-0002Qo-UY; Tue, 22 Apr 2025 20:54:13 +0000
Received: by outflank-mailman (input) for mailman id 963621;
 Tue, 22 Apr 2025 20:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7KdA-0002Qh-U0
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:54:12 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef78cf67-1fbb-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 22:54:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E22843A22;
 Tue, 22 Apr 2025 20:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9911C4CEE9;
 Tue, 22 Apr 2025 20:54:06 +0000 (UTC)
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
X-Inumbo-ID: ef78cf67-1fbb-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745355247;
	bh=BMIpjrE12oAKLIL7A8dG+r+KjAp2iS4MSD0NmPpAZdc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fuVQ6yUIcboANdxqdZAN3CxwW8WHsnCNQudBLhi2GSlaU8nOGxVqYUalPtjhHJ0lN
	 zpwKRil7pQ0hZfPxsIJ8rVr6SX1bHJIAIvl9O4cKeKjOagImKeGFIG1LPsOvpe1Mr2
	 mjPWQ8VbfKFNBzM4VlgKV6dKNOGT1lsqcdZs9ksOIkz8v2AYwerKo/TZ+GEhDk/eFI
	 +VP8cjeXIjSqszcJpWylf/HwXT3PvH1gCMmEDmNTNX34MtK2I3GDeaQ1MlObPghwIs
	 YKThJPluts4esK/S+iyICaVmWK/HzaomXqhoEXOhzzj7VwPWWLAXqcGu+YbeE5I7m3
	 88rKRmak6ngTA==
Date: Tue, 22 Apr 2025 13:54:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v3 0/4] CI: updates to XTF CI runners
In-Reply-To: <20250422161819.2089738-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504221353300.785180@ubuntu-linux-20-04-desktop>
References: <20250422161819.2089738-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, dmkhn@proton.me wrote:

> The series started from adding new argo XTF CI job and ended up with updating
> all XTF runners and related CI jobs.
> 
> It unifies the XTF runner scripts so that it is possible to use one script for
> executing any XTF test under QEMU. That simplifies running XTFs locally and in
> CI.
> 
> Patch 1 reworks x86 XTF runner.
> Patch 2 reworks x86 EFI XTF.
> Patch 3 reworks Arm64 XTF runner.
> Patch 4 adds new argo x86 XTF CI job.

I committed the first 3 patches. For the last patch, I take we need to
wait for the argo test to land in XTF?

