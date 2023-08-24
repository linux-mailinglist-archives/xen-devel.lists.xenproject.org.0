Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8DD787B24
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 00:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590340.922600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZIQV-0000C7-A7; Thu, 24 Aug 2023 22:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590340.922600; Thu, 24 Aug 2023 22:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZIQV-00008x-5n; Thu, 24 Aug 2023 22:03:39 +0000
Received: by outflank-mailman (input) for mailman id 590340;
 Thu, 24 Aug 2023 22:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZIQU-00008r-7f
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 22:03:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12c2a6dd-42ca-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 00:03:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E1F466117;
 Thu, 24 Aug 2023 22:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B54CC433C8;
 Thu, 24 Aug 2023 22:03:33 +0000 (UTC)
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
X-Inumbo-ID: 12c2a6dd-42ca-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692914614;
	bh=ltLdf+HLq8NBHuWCGX1yJy0cSUQvInVFhPwJr8IXKxY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gdUJBLpF6quuHfYyPtYZrAQ3cIZNKJCOaassAw+TbHszEZPX2SPtj/xzL5znFpdl+
	 p/P7ugZwhcCy//qFflQwO2NNGRPZ8Qpr++tT2JmO7GKZ2RkvojzakrXWUAk2S5wGSs
	 zaUYhIw5VxG/R3AphaYYYB8QKRWNGOZeS4DLRsm1JACrSbhzu4gfx9dbwp2hVWsBNL
	 x9lONUDRkz2V3silvd88gaLGPKFIqlIJfDEZeTxgwMz9Ydi/OiolA3mWTrcnBFk84f
	 bIWXKYS7Tn7mdg0ELbxOjQ2URoq4Q0CqDkLWfRkSpZfvgHQpxGW8WKW9PLYXCtn5oS
	 EiNxV/xaKNPoA==
Date: Thu, 24 Aug 2023 15:03:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: paul@xen.org, wl@xen.org
cc: Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, nicola.vetrini@bugseng.com
Subject: Need Ack, Re: [XEN PATCH v4 3/4] x86/viridian: address violations
 of MISRA C:2012 Rule 7.2
In-Reply-To: <fb8c98c3e0450dc5a30a02ea2e477865@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308241503050.6458@ubuntu-linux-20-04-desktop>
References: <cover.1690368810.git.simone.ballarin@bugseng.com> <3007febabe8a13259dc10b566d23a27a89b75358.1690368810.git.simone.ballarin@bugseng.com> <fb8c98c3e0450dc5a30a02ea2e477865@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Paul, Wei, can we have an ack?


On Thu, 24 Aug 2023, Nicola Vetrini wrote:
> On 26/07/2023 13:03, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > 
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> > headline states:
> > "A 'u' or 'U' suffix shall be applied to all integer constants
> > that are represented in an unsigned type".
> > 
> > Add the 'U' suffix to integers literals with unsigned type and also to other
> > literals used in the same contexts or near violations, when their positive
> > nature is immediately clear. The latter changes are done for the sake of
> > uniformity.
> > 
> > Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in v4:
> > - change commit headline
> > - add Reviewed-by
> > 
> > Changes in v3:
> > - create this commit for 'viridian.c' and 'hyperv-tlfs.h'
> > ---
> >  xen/arch/x86/hvm/viridian/viridian.c         |  2 +-
> >  xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 28 ++++++++++----------
> >  2 files changed, 15 insertions(+), 15 deletions(-)
> > 
> 
> This patch has perhaps slipped by since its submission. As it can be applied
> on top of
> staging without conflicts, then it probably needs an ack from the x86 viridian
> maintainers.
> 
> -- 
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)
> 

