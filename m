Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF0919D13
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 03:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749646.1157885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMeNr-0005D2-3b; Thu, 27 Jun 2024 01:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749646.1157885; Thu, 27 Jun 2024 01:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMeNr-0005BC-0r; Thu, 27 Jun 2024 01:57:11 +0000
Received: by outflank-mailman (input) for mailman id 749646;
 Thu, 27 Jun 2024 01:57:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMeNp-0005B6-TB
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 01:57:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ec73eb6-3428-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 03:57:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB02161CD0;
 Thu, 27 Jun 2024 01:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41018C116B1;
 Thu, 27 Jun 2024 01:57:05 +0000 (UTC)
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
X-Inumbo-ID: 8ec73eb6-3428-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719453426;
	bh=gLAP1m53uVVW3DuwXlWwrPUiuDJAbkgLRc5l5TBw7WA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JXeb1JGkWjv6Za/8aPiQisk0Z3f0t/kO6cGr2hwoM7eQ/otROXPdMcLSlhJHA3ckJ
	 f5Pcdsm82cDiL+oY+1a+9sEEZY7ANxfy3uPlV8OsRep5vkaXU1OSWIkD8B/nNoxQLv
	 9bVKBknKh2rkIaRPW+dD7YMuPbhP8Scs6WTmLxerDMDWBqYjgmssZVDJLlnlSwo3z4
	 epsqZNLyy86SUlAbxhZpquLcIn1/sORGaTJEJFEL0gwa+0sU/ShAyatR43ZNqmWt7t
	 pCNAaTW/4JylxzJCZNIFng4IT+AO2Yda+QaoVjrIXjynU6Abzyh6r0elMG/dAk81f5
	 NV+I2UOkNkRQA==
Date: Wed, 26 Jun 2024 18:57:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
In-Reply-To: <alpine.DEB.2.22.394.2406261758390.3635@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2406261855020.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop> <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
 <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop> <6441010f-c2f6-4098-bf23-837955dcf803@suse.com> <alpine.DEB.2.22.394.2406261758390.3635@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Stefano Stabellini wrote:
> So, after thinking about it and also talking to the safety manager, I
> think we should:
> - implement ASSERT_UNREACHABLE with a warning in release builds
> - have "return -EPERM;" or similar for defensive programming

Federico, as Jan agrees already on the second point, then I withdraw all
my comments about code after ASSERT_UNREACHABLE (you can consider your
R16.3 patches with my acks fully acked).

