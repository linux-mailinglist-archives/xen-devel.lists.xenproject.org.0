Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755767DD91E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 00:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626032.975928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxxsk-0003We-1F; Tue, 31 Oct 2023 23:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626032.975928; Tue, 31 Oct 2023 23:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxxsj-0003Ub-UN; Tue, 31 Oct 2023 23:10:45 +0000
Received: by outflank-mailman (input) for mailman id 626032;
 Tue, 31 Oct 2023 23:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxxsi-0003UV-LQ
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 23:10:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6493a10-7842-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 00:10:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAD5C61147;
 Tue, 31 Oct 2023 23:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9588C433C9;
 Tue, 31 Oct 2023 23:10:38 +0000 (UTC)
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
X-Inumbo-ID: b6493a10-7842-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698793840;
	bh=psE4H2ilNOLqozfrEJ4l+wzP0s7P1sKN4tUwpE/Tc00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VHdLVN/dEW5yIkJ6hrZ+8h+aUPg/Q/Wu2HH7thZ1DxjAww1NSeZgKO2T+k96OLS0r
	 ZknfEp9MhWlJlZ0sSXCUIemJZHW03kV8A9dia7MezbNIVS/IYCtDUGK5eidtcgonK5
	 IwjKXKY9BWnJLrOYm4WYWpao6CYikLasYv3kDLtOy3A12dlpLEVb0WWL6/DOxqow1+
	 +E3pPSPhD1qStmEGrVBqVMuaE7vTkc42/phCeiNSixuIW/M0iy0vkEVnbHeePd8++U
	 tuqt82etKB5C65uqVLCfG9iYLtgusEEHmd7/W7jlJMcgVirM5qaCxa3zFGTwjvkpLX
	 yTv9NivvX64Ug==
Date: Tue, 31 Oct 2023 16:10:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] xen/domain_page: address violations of MISRA
 C:2012 Rule 8.3
In-Reply-To: <9a539156-9e11-43b7-9f62-0c1b1d842e89@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310311609340.1795129@ubuntu-linux-20-04-desktop>
References: <d70e8e6b00f7b08ed4b360d38113e6a1460ed3ab.1698743361.git.federico.serafini@bugseng.com> <8aa755d3-7cba-9543-95fc-056f397c18ae@suse.com> <9a539156-9e11-43b7-9f62-0c1b1d842e89@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Oct 2023, Julien Grall wrote:
> Hi,
> 
> On 31/10/2023 10:31, Jan Beulich wrote:
> > On 31.10.2023 10:25, Federico Serafini wrote:
> > > Make function defintions and declarations consistent.
> 
> typo: s/defintions/definitions/
> 
> > > No functional change.
> > > 
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > 
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > 
> > However, ...
> > 
> > > ---
> > > Changes in v2:
> > > - use 'ptr' do denote a const void * parameter.
> > 
> > ... not even this (let alone the description) clarifies what the
> > inconsistency was. I had to go check to figure that x86 already uses
> > "ptr". Such things could do with spelling out.
> 
> +1. The more that x86 was the "odd" one but it was chosen to use the variant
> everywhere.
> 
> With the commit message clarified:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

I made the changes on commit to my for-4.19 branch (I am going to wait
until staging fully reopens before moving commits to staging).

