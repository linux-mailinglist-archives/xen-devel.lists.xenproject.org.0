Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53D7E4B55
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 23:01:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629048.981111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0U7J-0003oK-8S; Tue, 07 Nov 2023 22:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629048.981111; Tue, 07 Nov 2023 22:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0U7J-0003kz-58; Tue, 07 Nov 2023 22:00:13 +0000
Received: by outflank-mailman (input) for mailman id 629048;
 Tue, 07 Nov 2023 22:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0U7H-0003kt-1r
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 22:00:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03163eb0-7db9-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 23:00:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32A2361419;
 Tue,  7 Nov 2023 22:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0700C433C8;
 Tue,  7 Nov 2023 22:00:04 +0000 (UTC)
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
X-Inumbo-ID: 03163eb0-7db9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699394405;
	bh=JjYFIMzjgK59+gb0yCd5lP2BTNRoAatys7FBl+6G1bk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qaEq3Y2wK0ae4Nm8Xprn+LkQAbmTC+qHSlVwHKt4ppojmU2Eov79mot7yJN5DzSlw
	 e8UPBoGqYEux1whAjyjsRMeGb1XL5ypkCooGUCgmd5/Fb1CwCOXB53chzVxEXjnV/L
	 WCZnEceIKa9/eHwoswle5YIBQfhRl5KHecLCP6YfuJJF8YVPT3/YXg14gN+B23sHIv
	 Kj962/+tm5vO9EzRE4Bb8z+ZyWRZV5zIuUBnlPciiYIAMpP7C/J9nO0oyokXDYIk1e
	 zqxVS4vQeaLBh2FxKh0qZRtiw4qJG0i1E38lm7iSH0X9v/7uS1+6WgpeWM+eSQKQ9L
	 w8DJYcegRZ80g==
Date: Tue, 7 Nov 2023 14:00:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3] xen/string: address violations of MISRA C:2012
 Rules 8.2 and 8.3
In-Reply-To: <d28ea15aa8d36622548b433d5fb6f19dd521bdfb.1699369270.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311071359520.3478774@ubuntu-linux-20-04-desktop>
References: <d28ea15aa8d36622548b433d5fb6f19dd521bdfb.1699369270.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Nov 2023, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent.
> Mismatches between parameter names "count" and "n" are resolved
> in favor of "n", being the same name used by the C standard.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


