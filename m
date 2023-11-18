Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E97EFD5A
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 04:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635506.991476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BbD-0007po-F5; Sat, 18 Nov 2023 03:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635506.991476; Sat, 18 Nov 2023 03:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BbD-0007nb-CS; Sat, 18 Nov 2023 03:02:23 +0000
Received: by outflank-mailman (input) for mailman id 635506;
 Sat, 18 Nov 2023 03:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BbC-0007nV-4K
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 03:02:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2d89479-85be-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 04:02:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5251361E08;
 Sat, 18 Nov 2023 03:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639DFC433C7;
 Sat, 18 Nov 2023 03:02:16 +0000 (UTC)
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
X-Inumbo-ID: e2d89479-85be-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700276537;
	bh=W00BR437fiNN2g44kr27gTu/fGrDdVyY3YdmZwS/TQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=URC6k0Rw2azP1hkbCeN2sQc5UoloCVq5zTaLiztH7KdHArGBqllyG2+mPZkL78aGO
	 +vnba2SxJ49meE9ndc7lzk/R5bXlAsA3lS1ODoDbnG+/3SmkUqzox8VGY51DopI6/1
	 puZd7uvECZUhC+H4gswGbGUHDxrvuBv3EqbTupNhYTrHl3vXuYAZpzOh7LqfOIRpvY
	 m/tV9zJJ7BAas1T/MeGKJeORCoM/3H+fvYwCQHR7h0A2pkktwEEh+g9LJjfdgwtBxD
	 55z8Bkbav8Zg+XG1xZQ5us+zgHakfpbIvtyVLfYNx5YOteGsUzEHRfyS3BG5+nxB6I
	 amXTMmWlnt8Xg==
Date: Fri, 17 Nov 2023 19:02:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/5] xen/serial: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <9fe7d6b526fef112dab314cf951662583dcbb40d.1700209834.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311171902080.773207@ubuntu-linux-20-04-desktop>
References: <cover.1700209834.git.federico.serafini@bugseng.com> <9fe7d6b526fef112dab314cf951662583dcbb40d.1700209834.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


