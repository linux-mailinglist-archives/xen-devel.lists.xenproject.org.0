Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D87EFD25
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635487.991416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4B6C-00063j-RS; Sat, 18 Nov 2023 02:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635487.991416; Sat, 18 Nov 2023 02:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4B6C-00061b-OY; Sat, 18 Nov 2023 02:30:20 +0000
Received: by outflank-mailman (input) for mailman id 635487;
 Sat, 18 Nov 2023 02:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4B6B-00061V-Go
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:30:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681937e5-85ba-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 03:30:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72BEBCE2641;
 Sat, 18 Nov 2023 02:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAA7C433C7;
 Sat, 18 Nov 2023 02:30:11 +0000 (UTC)
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
X-Inumbo-ID: 681937e5-85ba-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700274613;
	bh=rY5zNOfcP/uVizHjmVmyNwXpric9Z0L04Kd6a8tV8tA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JFIVNYId64IROGLhAZo1tPW4mbdxKd/lqVU/tpCHCU4O8mMGmfavqyxEEiMK0sp4w
	 zuwedAXgukTccakPY0ZpSZQwtpWeUX/hTpYU5LsglFqIXQ/sNQvhzRkqheOi3Z/3GZ
	 aND/ozXj+JW/caDfMYKb7mU5VI2z6jP6aOi3l9cfh51Xur4tKTSh3OpyidwfjUgVWs
	 s/g95i3+yDwdvImVmzLFsy1vu8rQ4ETTU476AUC6M2OGau4TQhAe2uZtYPH4ATZzE9
	 /CgnIlkajHmUOa5YYh1FSfoLaba/fY+6n6AS+LwvNXFGtaZ1JO5hkXqidbujbiw52v
	 JS5lHcNQwbIFQ==
Date: Fri, 17 Nov 2023 18:30:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3] xen: introduce function type bug_fn_t.
In-Reply-To: <82bd029b-4c26-4eb3-9e93-1d34fab40db3@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311171829560.773207@ubuntu-linux-20-04-desktop>
References: <3942021ff51b117ab2b50aecd6e75353cd73ab20.1700158707.git.federico.serafini@bugseng.com> <82bd029b-4c26-4eb3-9e93-1d34fab40db3@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Julien Grall wrote:
> Hi Federico,
> 
> On 17/11/2023 08:28, Federico Serafini wrote:
> > Introduce function type bug_fn_t. This improves readability and helps
> > to validate that the function passed to run_in_exception_handle() has
> > the expected prototype.
> Hmmm... I read the second part as you will validate the type in
> run_in_exception_handle(). But I can't find such change. How about:
> 
> "and could be used to help validating that ..."
> 
> No need to send a new revision for that. I can do it on commit.

I committed it together with the old patches I was tracking

