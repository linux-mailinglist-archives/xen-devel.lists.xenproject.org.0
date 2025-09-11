Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA657B525CB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 03:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119042.1464585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWFl-0002rz-TS; Thu, 11 Sep 2025 01:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119042.1464585; Thu, 11 Sep 2025 01:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWFl-0002qW-Qr; Thu, 11 Sep 2025 01:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1119042;
 Thu, 11 Sep 2025 01:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwWFk-0002qQ-3H
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 01:37:36 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e33971d0-8eaf-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 03:37:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 593A76013D;
 Thu, 11 Sep 2025 01:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F60CC4CEEB;
 Thu, 11 Sep 2025 01:37:31 +0000 (UTC)
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
X-Inumbo-ID: e33971d0-8eaf-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757554652;
	bh=NIg4dDartnnQtRfoVis2/qgqG45a5Bt301WJY1oyCO8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rksC6szsQ1SBS9L5fAbQ7iTpb20AKZAZfHK0UWC7u4Pi6oS67ImI9I70FQUsNCpsV
	 QCVtc29Jnw5aGcpWPWN9tYut7KSdnhG4AIQoC1c0O1kxIqu/2NwjNNpqKuqgYW0Quj
	 FWh/1ZX5L/V3rHaWuH+2gCGfYRJ3QC91LWmzCgBy/nXbi3/MHUuy1dyksNw1FnmzMR
	 1aKXRpmgyFiI2VzFdHlrzVafd+jz4UtOJJA/oicKM5eme39QWHPO7zQ+5Hc46CCnck
	 zY/LNLJxtdpQBW/e4dilEKJaPArXDjXOBoWmfReXmxECi+xbZcx3fUhm829ETFAUtj
	 z59hECbj4hJjQ==
Date: Wed, 10 Sep 2025 18:37:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 06/26] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
In-Reply-To: <7ddbde88-a0d8-4c9f-a3d3-c7331bbecd3a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2509101836360.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-7-Penny.Zheng@amd.com> <7ddbde88-a0d8-4c9f-a3d3-c7331bbecd3a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Jan Beulich wrote:
> On 10.09.2025 09:38, Penny Zheng wrote:
> > Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
> > it shall be wrapped with it
> 
> Isn't this addressing a Misra violation then? Whether it's "unreachable code"
> or "dead code" I can't really tell; I don't think I have properly understood
> when it is which of the two. (Change looks okay to me, apart from this aspect
> of describing it.)

It would be "unreachable code". So yes, this patch helps address Rule
2.1.

