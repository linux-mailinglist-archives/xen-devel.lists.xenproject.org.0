Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39935919C63
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749624.1157856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdSl-0001Pa-Jt; Thu, 27 Jun 2024 00:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749624.1157856; Thu, 27 Jun 2024 00:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdSl-0001N2-GE; Thu, 27 Jun 2024 00:58:11 +0000
Received: by outflank-mailman (input) for mailman id 749624;
 Thu, 27 Jun 2024 00:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdSj-0001Mw-NV
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:58:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fab415f-3420-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:58:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50B44CE2D2F;
 Thu, 27 Jun 2024 00:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0B0C2BD10;
 Thu, 27 Jun 2024 00:58:00 +0000 (UTC)
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
X-Inumbo-ID: 4fab415f-3420-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449881;
	bh=+PT6nuJSWeXiLOR62sev/R4uJBIye3Yt/q1StPQMqGU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mFvupdHVBLk+GsDgqZnxNDFfX91jvtXo7+AMWHEYaSNtew1/lN2pGZY7rhSvAknI0
	 keen3wAO6WCqjBFya1SKURUXHGrIvPfN8bBmlDKz4Z+8FB8tC3KD5y+c5Av9ir8l+Z
	 wyxSaVIWT58AE6+GPiC0pDYHaCzMPevYU1eX32BqL8zgEVAgdcDAHhhhXRd61IM2+D
	 UXWHBS3cVbRxk7gIacmagvVCKK5IntxVyjDhHqPNiNCfygINTiSsifmVFFqWVLA3a7
	 sybY/0cvx9RWnP9Q1UGH3E2jGw50FsQiLXSvc3waWsCGvzz2vHHqv99qgG6OYCbzcf
	 VRiol6I9AvZPQ==
Date: Wed, 26 Jun 2024 17:57:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2] x86/mctelem: address violations of MISRA C: 2012
 Rule 5.3
In-Reply-To: <94752f77597b05ef9b8a387bf29512b11c0d1e15.1719398571.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261757480.3635@ubuntu-linux-20-04-desktop>
References: <94752f77597b05ef9b8a387bf29512b11c0d1e15.1719398571.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Nicola Vetrini wrote:
> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> This addresses violations of MISRA C:2012 Rule 5.3 which states as
> following: An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope.
> 
> In this case the gloabl variable being shadowed is the global static struct
> mctctl in this file, therefore the local variables are renamed to avoid this.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Nice one!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


