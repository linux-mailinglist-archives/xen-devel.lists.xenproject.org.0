Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8376F6AE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576701.903139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRj5A-0001lt-FU; Fri, 04 Aug 2023 00:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576701.903139; Fri, 04 Aug 2023 00:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRj5A-0001kE-CD; Fri, 04 Aug 2023 00:54:20 +0000
Received: by outflank-mailman (input) for mailman id 576701;
 Fri, 04 Aug 2023 00:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRj59-0001k8-Hs
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:54:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70957153-3261-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 02:54:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56C7461E6E;
 Fri,  4 Aug 2023 00:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA6BC433C8;
 Fri,  4 Aug 2023 00:54:15 +0000 (UTC)
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
X-Inumbo-ID: 70957153-3261-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691110456;
	bh=EaAQPFoaGOI3ZfSLVu0aZr8HeevyqtL/S0G/iXavdas=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XqHoxIPYc4YiOSoTC11OGMQFXqOryxj5DT7VZoc+jA+56DVknxaxLysIP/4wfUgEu
	 Md8x/yEiF6brFiGBozICG65NaU2rxc4Y7R2AHL3IQDFDqtxt+w819Q8Tq+7TWWxkUD
	 Wj9KQPS2RlorM7rgRLtYSx5/Eriz26vTzo3dPXtuBv6XqXaxwNDAWyO4gsoLmyVwoC
	 hMjVcq+lcMZ1Lr1QVqGHjOxOzZNOsE50SkklD3lJdi0KZftRuqNvU9I8PdqC5HHk6O
	 SwZATPv6epgq/Yj/gpIJXb7cE0TrNo8ei2lWmdGaGG6WJv8el4EorLPbhJKuNnuK6V
	 YAVPCwJAAVJsA==
Date: Thu, 3 Aug 2023 17:54:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 10/13] x86/viridian: address violations of MISRA
 C:2012 Rule 7.3
In-Reply-To: <63f0d6385f302517244604af5536ffebd74ba589.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031753150.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <63f0d6385f302517244604af5536ffebd74ba589.1691053438.git.simone.ballarin@bugseng.com>
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

