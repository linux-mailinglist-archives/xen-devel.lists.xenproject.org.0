Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEF8BA040
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716139.1118234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2b5h-0005Jk-AN; Thu, 02 May 2024 18:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716139.1118234; Thu, 02 May 2024 18:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2b5h-0005Hv-7Q; Thu, 02 May 2024 18:23:33 +0000
Received: by outflank-mailman (input) for mailman id 716139;
 Thu, 02 May 2024 18:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2b5g-0005Hp-Ab
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:23:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13330339-08b1-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 20:23:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A1EF61BFB;
 Thu,  2 May 2024 18:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0435C113CC;
 Thu,  2 May 2024 18:23:26 +0000 (UTC)
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
X-Inumbo-ID: 13330339-08b1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714674208;
	bh=XLZHrc7PmFH8DYvNL8xM8HEj1o0d+jV/2GKWhhxap2Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m4LAy+GZyqkDCvfr1nexdW320RQUoY3hdjFuqTUY9YUXcZ/nevXLIieVR6h8R40U0
	 +4Jlo8dJnQJpWGyc7YnFc4tUM6V5jfx6Nsw3d8T9FH5geB/pxW/xzfAMqy1m3JtX1L
	 lg7Pc6+Et8uRUCeTJltQW/XM6G3NAAr0EixMLcS3mMddailYdreW8Vn12JTo51Y10L
	 oqNaBnT3zx3J1HnU5HucwklrQuiRbXBUHz3OrLA1hAx74nW+z12Z6VAIcmleNJvncX
	 dquABQ/w4CpOnvy/UCOCjYj/aviU1lfQcgeVs7Q2LY1830Hj3OGBiznTb5o7lI2f2D
	 eF+McxIfcYHnQ==
Date: Thu, 2 May 2024 11:23:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    nicola.vetrini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
In-Reply-To: <20240430110922.15052-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2405021123160.624854@ubuntu-linux-20-04-desktop>
References: <20240430110922.15052-1-luca.fancellu@arm.com> <20240430110922.15052-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Luca Fancellu wrote:
> Import __struct_group from Linux, commit 50d7bd38c3aa
> ("stddef: Introduce struct_group() helper macro"), in order to
> allow the access through the anonymous structure to the members
> without having to write also the name, e.g:
> 
> struct foo {
>     int one;
>     struct {
>         int two;
>         int three, four;
>     } thing;
>     int five;
> };
> 
> would become:
> 
> struct foo {
>     int one;
>     __struct_group(/* None */, thing, /* None */,
>         int two;
>         int three, four;
>     );
>     int five;
> };
> 
> Allowing the users of this structure to access the .thing members by
> using .two/.three/.four on the struct foo.
> This construct will become useful in order to have some generalized
> interfaces that shares some common members.
> 
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d7bd38c3aa
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


