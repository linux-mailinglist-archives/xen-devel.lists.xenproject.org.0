Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E276F6B3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576706.903149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRj9q-0002Ra-1P; Fri, 04 Aug 2023 00:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576706.903149; Fri, 04 Aug 2023 00:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRj9p-0002P1-UL; Fri, 04 Aug 2023 00:59:09 +0000
Received: by outflank-mailman (input) for mailman id 576706;
 Fri, 04 Aug 2023 00:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRj9o-0002Os-RW
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:59:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cfbcfc7-3262-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 02:59:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BA7F61E6E;
 Fri,  4 Aug 2023 00:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17B2C433C7;
 Fri,  4 Aug 2023 00:59:04 +0000 (UTC)
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
X-Inumbo-ID: 1cfbcfc7-3262-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691110746;
	bh=Btq8tZRFhlQCg2lDER3ObYVeMIZwSEBi2OoSzGbb9xE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RCCpvF2Wrj3Nu8u02wLW+yGh1iRg1CfnSALh+liBJh0IXSvFkGorPg/0SY2IDF2Q0
	 6jhQR+tonTWNEoP6J3CSKK1Gy5XCkyDkFdys19hPT9HzEJuUSr5CarslL7Us/F3JkA
	 HnFmSkSnMopU04fUUoqNayQtDOdiO35hVGk/VuB/3eR131fKG2zOij223LI43+KWRW
	 xFP0d+8H+GfCup4vFEAJtFkHmbFcFs9qA+f2xbIR73BwIsTWPcuow+FRFQCfxXIxzw
	 5zloPPLXSI3mxf4p7lW5cPyVKCCdmtbXOA4KeHwzYbyBvvkZ1OGHU9McsvERJiI9J0
	 sx6t5YTVkDooA==
Date: Thu, 3 Aug 2023 17:59:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 11/13] xen/x86: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <40f438ad05338dd86587eb469c7b0614e1d69462.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031757440.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <40f438ad05338dd86587eb469c7b0614e1d69462.1691053438.git.simone.ballarin@bugseng.com>
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

But I think I need an eyes exam after reviewing this patch

