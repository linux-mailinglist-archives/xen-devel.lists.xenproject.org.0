Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCD8B4289
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713153.1114190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Uig-0003jY-OE; Fri, 26 Apr 2024 23:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713153.1114190; Fri, 26 Apr 2024 23:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Uig-0003i2-Ky; Fri, 26 Apr 2024 23:11:06 +0000
Received: by outflank-mailman (input) for mailman id 713153;
 Fri, 26 Apr 2024 23:11:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0Uif-0003hs-5u
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:11:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a0da9e-0422-11ef-909a-e314d9c70b13;
 Sat, 27 Apr 2024 01:11:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 68371620E6;
 Fri, 26 Apr 2024 23:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288F6C113CD;
 Fri, 26 Apr 2024 23:11:01 +0000 (UTC)
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
X-Inumbo-ID: 40a0da9e-0422-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714173062;
	bh=wQhZtx/fJTYvC/bvNFwdNpjKfRYseWxYxmYaXg8CdKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LT4YTEIfOzyWwtgVHzwioBX9TdwzypEb8rxOQwrtHMeFc+YvV0zOfHYnrA5uH2Eg3
	 hhylVAiQ/T5vKwyfvrDOM9NDr2JUL/C9VLJ8y3ymjYGnqUgnpeeE2ihgTOFr+aLRWn
	 yhtBKGv0Twrh3BHk3CQi3PQLGEpUuOPsjcGIVtrdi0ixQESvSpcTH0Hpj39zzgAlR2
	 8wG7DYhuuusRCFGO1zI30pQ+SiNw7jTII44hVOV/Rgk5KkjBpBvy4+/vudSkNq0w2F
	 OdlChkmaCODJdrDwORvnXsZjQnfqAettBVInGKxUaunkRVqktSy4VAFNU0AHKXa9Fa
	 GAj/1KuuYLlpA==
Date: Fri, 26 Apr 2024 16:10:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 4/7] x86/MCE: guard lmce_support/cmci_support
In-Reply-To: <d5fa50b3056b96f3046be39ed682a8b347f1b425.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261610530.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <d5fa50b3056b96f3046be39ed682a8b347f1b425.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Guard access to Intel-specific lmce_support & cmci_support variables in
> common MCE/VMCE code. These are set in Intel-specific parts of mcheck code
> and can potentially be skipped if building for non-intel platform by
> disabling CONFIG_INTEL option.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


