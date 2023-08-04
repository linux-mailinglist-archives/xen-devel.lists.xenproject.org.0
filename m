Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240E376F6B7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 03:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576709.903159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjBa-0000Mp-Bu; Fri, 04 Aug 2023 01:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576709.903159; Fri, 04 Aug 2023 01:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRjBa-0000IY-9D; Fri, 04 Aug 2023 01:00:58 +0000
Received: by outflank-mailman (input) for mailman id 576709;
 Fri, 04 Aug 2023 01:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRjBY-000873-UQ
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 01:00:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ca173fe-3262-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 03:00:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4036261E6E;
 Fri,  4 Aug 2023 01:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB64C433C7;
 Fri,  4 Aug 2023 01:00:51 +0000 (UTC)
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
X-Inumbo-ID: 5ca173fe-3262-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691110852;
	bh=EaAQPFoaGOI3ZfSLVu0aZr8HeevyqtL/S0G/iXavdas=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oCdTSf8x8OpBX90SukM/z2/NrfXWpUWtiUR6G2PQxFBfv8gGp6Adpr+bqQrbUDuvq
	 494lL2cUhFMy3KatYnsw90Ko/lBprxXN64LOsgw+kdrp1a+T03nsWUsWmWoBvd2Vh2
	 JUExD81vud6g5BokrU9kUUzchhZZ/HaquRejbxnyF+oMu6XDVsBolLjnkMvr/T3C4J
	 Y+XnXo/ZlF+3X7zmw9Aoa5TRUBXSx6EJ8JrFDCr7Bao+NLZIcIxeQRXNJ3ycsS/5Pc
	 gwpvdnFJbfV2ZUr44ehcTjCOWdFqqry3K0H9sT4CNcd6imWgO55xX3qs3Jpf2UtXdJ
	 SVYaGRNAjPCKA==
Date: Thu, 3 Aug 2023 18:00:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 12/13] xen/common: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <f095e38d076bbc5d9150da9d1896e6ccbd39ff6f.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031759480.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <f095e38d076bbc5d9150da9d1896e6ccbd39ff6f.1691053438.git.simone.ballarin@bugseng.com>
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

