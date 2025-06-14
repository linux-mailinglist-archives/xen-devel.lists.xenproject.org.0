Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B14AD996A
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 03:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015178.1393118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFdC-0003Z0-CO; Sat, 14 Jun 2025 01:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015178.1393118; Sat, 14 Jun 2025 01:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFdC-0003Vz-8s; Sat, 14 Jun 2025 01:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1015178;
 Sat, 14 Jun 2025 01:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFdA-0003Vr-KF
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 01:24:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1d244f-48be-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 03:24:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1102C44910;
 Sat, 14 Jun 2025 01:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E046C4CEE3;
 Sat, 14 Jun 2025 01:24:18 +0000 (UTC)
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
X-Inumbo-ID: 4c1d244f-48be-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749864259;
	bh=7EdCI3syDbkpz8P45yBlM0QHGsxgwkRydgYwWknMJOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sQirh3NYV/jqsqGjzqKEFqQzeLZznHNpTwmzv8l2GFnEjz1yVxPJcsQPFojIuUUQx
	 6B3wi0dz1lTGo0rBhmAPcL8vAZVwkooMnJMtqgLiSzNqW01D1alcNnKdWG8dryJVah
	 6RG3FvE7OjZ0IvVa7zMGF/a5QM2Ux2WyObtuHt1f8Or0J+7l1KqwAPZYi4i25Fgf7k
	 m+i6RmgdTyoOAX+iVXHbTTE+QsHBk9vENdkWN+z4+IXj/utUZYjU5HhbH/1wzQw9QN
	 /NUcSKbNDLE5bhm2Ke2bxM3dszOFBho80DdQPkxAYgbzNuDW28Tde6e/hno7TdAIz1
	 fMNrH/aLFBIYA==
Date: Fri, 13 Jun 2025 18:24:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 12/14] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
In-Reply-To: <20250613151612.754222-13-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131824100.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-13-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> ... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
> and may function without it.
> 
> Not a functional change on architectures that currently use these files,
> as they already select CONFIG_HAS_DEVICE_TREE.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


