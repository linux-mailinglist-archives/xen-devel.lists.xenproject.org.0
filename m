Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE507800193
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645214.1007207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tGv-000683-1s; Fri, 01 Dec 2023 02:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645214.1007207; Fri, 01 Dec 2023 02:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tGu-000659-Um; Fri, 01 Dec 2023 02:28:52 +0000
Received: by outflank-mailman (input) for mailman id 645214;
 Fri, 01 Dec 2023 02:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tGt-000653-7I
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:28:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bb5ed81-8ff1-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:28:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F01EA61FDB;
 Fri,  1 Dec 2023 02:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF2BC433C8;
 Fri,  1 Dec 2023 02:28:46 +0000 (UTC)
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
X-Inumbo-ID: 5bb5ed81-8ff1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701397727;
	bh=6yxltZlksu/i8YEsXStKfGz952Zfr4VOImTP5mc35KU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FHn4D52+WwIkYv4jEP7/OOEjGrk4vijuQQGkjIlcLpafboMkj4KwNz1i2DP8djZDV
	 gSZ2eF6tjRjclj1BiqF15Ib8iEMZWMHL1IMKmO+vlmuwQsLyAZzaCJ3ddLDYbLl0UM
	 +/ys8jp3Nx1jpSg0hZFmwqaVUVHQpNMOCMFRWjEGnTUFcwu6RqmJVExm+bt6r7QokG
	 TbEmyyzvzmyctNCSoD5cDauw3aGLmmrWoxtJiYygQ8l7xBBe7uthSm76Cwud8K3kFs
	 ET4v/9wiDXwKuooGowRow0x6vT4I0qSqpEaul7PXaPtlovlnuPjaD01fRVo9rIzwLb
	 hyODvRh1whc2A==
Date: Thu, 30 Nov 2023 18:28:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 05/11] xen/domain: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <d38b5f555c622a23b2433793e70156efe459a811.1700832962.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301828390.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700832962.git.federico.serafini@bugseng.com> <d38b5f555c622a23b2433793e70156efe459a811.1700832962.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

