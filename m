Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D618097A4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650290.1015676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBP5I-0006Ja-Tq; Fri, 08 Dec 2023 00:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650290.1015676; Fri, 08 Dec 2023 00:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBP5I-0006HM-PT; Fri, 08 Dec 2023 00:51:16 +0000
Received: by outflank-mailman (input) for mailman id 650290;
 Fri, 08 Dec 2023 00:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBP5H-0006HC-VA
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:51:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e32beec9-9563-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 01:51:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F4F462237;
 Fri,  8 Dec 2023 00:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA284C433C8;
 Fri,  8 Dec 2023 00:51:11 +0000 (UTC)
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
X-Inumbo-ID: e32beec9-9563-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701996673;
	bh=taWxm1j4SuC3x/sLSY7ctehV/ukLwUouYiZ83iO1nrA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r0e/LZJxegr5XcknjFYqb2ASurOmyerKPxrBwlv+IrHzY/aK3rdN3haxTq9ApgM+t
	 o0tukvW5ZRbI1n3p2Ay8ST6u+jD/6csu0Nz2zIsKXFrN5imDwxFmoT5GB/KIleSynH
	 iPQyFYXqaqsypQJ1RB8Bh66GgVh3fpfMOON1rp/8nLmGWcbfjxVOq6RWHlChVEIxiM
	 qABTj/vkwAbrMbkCSULnwz+iY+6Ci5Ffz5VfspgDQyGZ9NDtofRT8bBxji6066YU8L
	 rqW04y4lYUyNQ1+v/Rm/UAfq7BY+wA9tuPm1a2m9RdXW6Z2QNlcqXvsRA7wGTQLXAs
	 WIq+1CpugCALg==
Date: Thu, 7 Dec 2023 16:51:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] xen: address violations of MISRA C:2012 Rule 14.4
In-Reply-To: <3012fb117b4ef6458bdb5cfd046c86bce60a6d51.1701941924.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071650550.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com> <3012fb117b4ef6458bdb5cfd046c86bce60a6d51.1701941924.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Struct domain member is_dying is an anonymous enum designed to act as boolean.
> Add deviation to mark its uses in controlling expressions as deliberate.
> 
> Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


