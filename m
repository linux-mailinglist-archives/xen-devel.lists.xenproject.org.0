Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F203E800194
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645217.1007217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tHz-0006f7-Da; Fri, 01 Dec 2023 02:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645217.1007217; Fri, 01 Dec 2023 02:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tHz-0006d3-A4; Fri, 01 Dec 2023 02:29:59 +0000
Received: by outflank-mailman (input) for mailman id 645217;
 Fri, 01 Dec 2023 02:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tHx-0006co-6Q
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:29:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838dccb7-8ff1-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:29:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B95ABB84696;
 Fri,  1 Dec 2023 02:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E3DC433C9;
 Fri,  1 Dec 2023 02:29:52 +0000 (UTC)
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
X-Inumbo-ID: 838dccb7-8ff1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701397794;
	bh=6yxltZlksu/i8YEsXStKfGz952Zfr4VOImTP5mc35KU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DF8yR9oY7oO4GiTP6XysRgXRgS1YcF8MC9G4Hu8iFz/T1vLUs6WjSn6qoUZKjXsAz
	 Kev464+NHVrw6xBc62l5oEdhTTsPYdQ2J6Lx2ok/0jJ7j/O5WjkiH19NN0sVcqEdEy
	 872sOo/e4frNMrG3Tjd/nIV9LSbB9wCsjptKSQPRFm8ZjlDhGGFp/BzkpL5Zb6Kcmm
	 c0HKCFryIMLKBXRPpbR9FipGhgsSXTUNwGYN3MeuwW9dnOLAy6tdyRBDnMsIELMzM5
	 Gx3yOugoOyoOwn+9Ga84/W/grJX1yWbPrArJRaR1jHgfgmlUCHP/tUiweD/Wifs5vq
	 sCsYQxMSitX8Q==
Date: Thu, 30 Nov 2023 18:29:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 06/11] xen/notifier: address violations of MISRA
 C:2012 Rule 8.2
In-Reply-To: <cdd613a0570b9376eee058e399e4e0cc08ed7df2.1700832962.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301829440.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700832962.git.federico.serafini@bugseng.com> <cdd613a0570b9376eee058e399e4e0cc08ed7df2.1700832962.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

