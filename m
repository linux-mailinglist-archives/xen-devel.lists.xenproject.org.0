Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9A76F6A1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576675.903079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiwd-0005t9-Dk; Fri, 04 Aug 2023 00:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576675.903079; Fri, 04 Aug 2023 00:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiwd-0005qy-Al; Fri, 04 Aug 2023 00:45:31 +0000
Received: by outflank-mailman (input) for mailman id 576675;
 Fri, 04 Aug 2023 00:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRiwb-0005oh-QP
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:45:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 346cb86a-3260-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 02:45:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0074261DC7;
 Fri,  4 Aug 2023 00:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73609C433C8;
 Fri,  4 Aug 2023 00:45:25 +0000 (UTC)
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
X-Inumbo-ID: 346cb86a-3260-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691109926;
	bh=T/Gyp8K+J/T2MSq60L3DlKPnDzhU+5aLg0S52VXWxEk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=myoZ64wH+anhtW07wEvaIpbUIWI5F/mzBsQtE2EOiOZfHSByKh/j1BtwsO4l2V0fX
	 6KKKC7fTRvwqgyvMHWG0ro8BxfwRGuRJLGiEeoaJH4EwC/jfrwNFgdAX3SSzGdlZgt
	 qnDNiF6jUqoBRbIArLgQBfP2gXICz/u+idOFMkUSyVKJLYQXV7548MapQIZ8jjdGEM
	 POBpUHDCxUF7HcxXlHIvh7VL5pBfU5gAB36P6/2KGHJj0od2CeL0wb05eRmreIpL39
	 3f06Lgfu1hOfWefdw6Bk2+WJ58kVi5s0R2C8M+4wkrUz1fhUPVkBwBxQwr46cq9M3T
	 /Lut0Fe0EzbYw==
Date: Thu, 3 Aug 2023 17:45:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 04/13] x86/IOMMU: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <ba2605e168cb65ca7f2e4fcc6b957b5ae0b3062a.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031745140.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <ba2605e168cb65ca7f2e4fcc6b957b5ae0b3062a.1691053438.git.simone.ballarin@bugseng.com>
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
> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

