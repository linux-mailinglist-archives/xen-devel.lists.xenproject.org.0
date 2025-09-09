Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7029B50859
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 23:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117378.1463501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw66t-0002cu-0X; Tue, 09 Sep 2025 21:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117378.1463501; Tue, 09 Sep 2025 21:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw66s-0002ae-U1; Tue, 09 Sep 2025 21:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1117378;
 Tue, 09 Sep 2025 21:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO0K=3U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uw66r-0002aU-8n
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 21:42:41 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e75fdda4-8dc5-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 23:42:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7DB8F601F0;
 Tue,  9 Sep 2025 21:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E62C4CEF4;
 Tue,  9 Sep 2025 21:42:36 +0000 (UTC)
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
X-Inumbo-ID: e75fdda4-8dc5-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757454157;
	bh=TllK/t8gPlfegoxQ23pwX3B2yhT6M30jjEkK+d7gQRc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ozfQn6eueTpbrtOnDky/5n3Oq/+263+9crLRJPDcNSz8+rOc+T0XkgqhGsOiWK58u
	 LESKpC9c6X66RpNYSWyoA9E/OgNf2y3gpSvM/dnraGkJXL7ca6F3osYFeqARJbwSMr
	 Oonmpa5MKnpYwrUUwcfApkQULUxy7/SgRyvQXVxcLMO9CSOVAXGceJ5nKnLv6EYxyA
	 uc1PXSA4EpCjv2ur/AaMAjC2jD5TI6SQAuop+O6pG5yfJwh9LfeAK9fpUpJfP9ruOG
	 R0DiB+nWxBqrYjK1C4Q0Ev5Ad0EaZ9b/gipevbjGNtRObvKjOPO2ak1pNhVfc2NEHE
	 HK7i85oJxuOug==
Date: Tue, 9 Sep 2025 14:42:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder] Use LOAD_CMD by default if not specified in
 load_file()
In-Reply-To: <aMCDyZkWoKuzc7xf@kraken>
Message-ID: <alpine.DEB.2.22.394.2509091442280.1405870@ubuntu-linux-20-04-desktop>
References: <20250909074141.7356-1-michal.orzel@amd.com> <aMCDyZkWoKuzc7xf@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Sep 2025, dmukhin@xen.org wrote:
> On Tue, Sep 09, 2025 at 09:41:41AM +0200, Michal Orzel wrote:
> > Commit 061d6782756f modified load_file() to take load command as
> > argument but did not change all the invocations (e.g. loading standalone
> > Linux, bitstream, etc.) which broke the output script (load command
> > empty). Fix it by defaulting to LOAD_CMD if not specified.
> > 
> > Fixes: 061d6782756f ("Add config option to use separate load commands for Xen, DOM0 and DOMU binaries")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

