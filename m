Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA80F9301F7
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758313.1167750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOS6-0003Ue-L8; Fri, 12 Jul 2024 22:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758313.1167750; Fri, 12 Jul 2024 22:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOS6-0003SG-IB; Fri, 12 Jul 2024 22:09:18 +0000
Received: by outflank-mailman (input) for mailman id 758313;
 Fri, 12 Jul 2024 22:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOS5-0003At-0E
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:09:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ff49ac2-409b-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 00:09:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4758861FA9;
 Fri, 12 Jul 2024 22:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1C1C32782;
 Fri, 12 Jul 2024 22:09:12 +0000 (UTC)
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
X-Inumbo-ID: 5ff49ac2-409b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720822154;
	bh=xNmXvw4VZyzt89sjmOYJLkGH19HhPAfNXd06YwiPV08=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jBABa7hY/o+laccqJqX4lFj4MWogNJtPG/Lp2JFQd1j7tFrcGEyQZkiD7t1Pala5F
	 iQ2fDEbGi1DE4mMp41li9rqLZ8i6H4euv0AZ9F1GCTfnZretVB5iOL1cNeTaOEYuOL
	 la5y5frd2XlHo+3phF7Au/mh39mmASJQlr+eEJH7+5j59UI+DDX6+TL69/rDSIsAKm
	 WKGoe6Fsrk6avsyFXnNarP9vtQyvLlXaEfqxBr7wdJq3I9BZWdVrcgnsP5ip416E4K
	 GLFWZ3VjilNK1JAv9MBSSL43/VRhZK0lbgJx3EbtL7GsVjOvX16QJb5HhrWQ5ZRo35
	 o1m1f1qB/iJ4Q==
Date: Fri, 12 Jul 2024 15:09:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 04/17] xen/arm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <5646033a5e15c44fa6eb441690f36254d068ddee.1719829101.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407121502370.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <5646033a5e15c44fa6eb441690f36254d068ddee.1719829101.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jul 2024, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Add inclusion guard to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

