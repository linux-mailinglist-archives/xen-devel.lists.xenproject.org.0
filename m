Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A199650B6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 22:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786095.1195640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjlgL-0005VM-QU; Thu, 29 Aug 2024 20:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786095.1195640; Thu, 29 Aug 2024 20:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjlgL-0005T2-Nw; Thu, 29 Aug 2024 20:23:49 +0000
Received: by outflank-mailman (input) for mailman id 786095;
 Thu, 29 Aug 2024 20:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjlgK-0005Sw-Gn
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 20:23:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9769691a-6644-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 22:23:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 35E73A429CB;
 Thu, 29 Aug 2024 20:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62ECC4CEC1;
 Thu, 29 Aug 2024 20:23:43 +0000 (UTC)
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
X-Inumbo-ID: 9769691a-6644-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724963024;
	bh=Q/GabXxRkrG/A8CtNWlncrU95PRdbk2vURGI7vgVYeI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qwYGHVbHwjiaqvgukAKNJvjZMLHNURjNrcL1xeIQRzrPyKnU9Qyzjq3yW/HDOCM4Y
	 Fx4AKfzUCid23t8bWzuUPAZRsMizAmQUxxIDDLvbsJd+e4eXs5q4dpaavVGTIvToFP
	 woxOHiO6lrcoaslh7mE3Xa/FusCEZjJrKpU7J0hlxF0M8yuZM+sN2ef3KdlFoVJ1Kw
	 3Z/40/ueJpIxt/Y8LDXLw/VARucB4PhvKOl6UQgarexkfo3PUdaXEma9sAE9c+A7nA
	 g40yITlkbo1TZpsUHCiStmGmq2ehGNC1tXUyHBKi9XvdqE54ByrbjNgEby9zSsp5Xk
	 Ic58Xzf2OsrAA==
Date: Thu, 29 Aug 2024 13:23:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Lira, Victor M" <VictorM.Lira@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: fix false success in qemu tests
In-Reply-To: <fab9c785-3db3-45a9-b701-826478f9bdee@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408291323290.53815@ubuntu-linux-20-04-desktop>
References: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com> <2756d5b3-e4b1-420e-8402-2697c559acb9@amd.com> <fab9c785-3db3-45a9-b701-826478f9bdee@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2024, Lira, Victor M wrote:
> Hello Michal,
> 
> Unfortunately only removing "set +e" did not fix the issue as the test still
> will always pass.
> See here (line 90):
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7700210695
> 
> I think we will need to use the fifo or the Bash "pipefail" function.

pipefail is better if possible


> > You may want to use "Fixes" tag. See docs/process/sending-patches.pandoc.
> > This commit tries to do 2 thins at once:
> >   - fix "set +e" issue
> >   - make xilinx tests use expect
> > 
> > These should be 2 separate patches. The first patch should only remove "set
> > +e" from qemu patches.
> > There is no need for fifo in qemu tests. You should use that only in xilinx
> > tests where we cannot remove "set +e".
> > 
> > ~Michal
> 
> OK, I will review the doc and create separate patches for fixing the qemu and
> xilinx tests.
> 
> 
> Victor
> 
> 

