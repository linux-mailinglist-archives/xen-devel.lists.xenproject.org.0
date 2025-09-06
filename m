Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C4B46845
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113026.1461147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiIL-0006MC-Fe; Sat, 06 Sep 2025 02:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113026.1461147; Sat, 06 Sep 2025 02:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiIL-0006It-CJ; Sat, 06 Sep 2025 02:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1113026;
 Sat, 06 Sep 2025 02:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiIK-0005tC-05
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:04:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc43226c-8ac5-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 04:04:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6DC82602AA;
 Sat,  6 Sep 2025 02:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA72C4CEF1;
 Sat,  6 Sep 2025 02:04:43 +0000 (UTC)
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
X-Inumbo-ID: dc43226c-8ac5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124285;
	bh=z99ETD8Pz6tniWOzx+rgCWKpN5O5JaorEAJ2xal6oi4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lEnIQOrW6MFJygCTXwy5JWQOF42qa4HDL7cvnIUrP7/EExatz3UJryjLRraxbP2Zk
	 RHRmxQmAx6GM7Jtyrt7/6NeRZfrUiFMtc5mXxUZbxktG+SDlDUC6RfF1zc9CIhEcf0
	 3EtK6bruJfrepUZX7Goy0cVoVi9WsAUqB4ARrgggQRIWCu3o9iU/l7MSoBPtpUfEBA
	 mqvW12bmT1hsoiTpyjMz5PYnhCg3ZaEpk1sA99KBxrs53GEHiuzzN27yZ0bFAEq/zH
	 5fclpPqafzQXLE4+yfAb3kaVX9rYMMfdLNVyDg5zDa/LUiwte2lzYYXJlAvnWcNWFI
	 uIFTaGBVCHHTg==
Date: Fri, 5 Sep 2025 19:04:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 11/15] emul/ns16x50: implement FCR register
 (write-only)
In-Reply-To: <20250905232715.440758-12-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051904360.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-12-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add emulation logic for FCR register.
> 
> Note, that does not hook FIFO interrupt moderation to the FIFO management
> code for simplicity.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

