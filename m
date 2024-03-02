Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E986EDEC
	for <lists+xen-devel@lfdr.de>; Sat,  2 Mar 2024 02:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687825.1071637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgEJx-0003Mt-QA; Sat, 02 Mar 2024 01:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687825.1071637; Sat, 02 Mar 2024 01:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgEJx-0003L8-NV; Sat, 02 Mar 2024 01:37:49 +0000
Received: by outflank-mailman (input) for mailman id 687825;
 Sat, 02 Mar 2024 01:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2h5=KI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rgEJx-0003L2-1L
 for xen-devel@lists.xenproject.org; Sat, 02 Mar 2024 01:37:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77a97774-d835-11ee-a1ee-f123f15fe8a2;
 Sat, 02 Mar 2024 02:37:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22D176166F;
 Sat,  2 Mar 2024 01:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294F3C433F1;
 Sat,  2 Mar 2024 01:37:42 +0000 (UTC)
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
X-Inumbo-ID: 77a97774-d835-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709343463;
	bh=lJvnf0pQcy0ymoylRx3ZZX5D0qQlqk0flX5dDYoiFMo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nf+OhHP2cVdjH3D/+8jOysDr/70AXpdpAukO5T0Qnzm8US0KqjEQvQ9Q9eDtaVxlQ
	 tBIjA+MDHp/Qn7avVgBen/uyn7JfDO/ciW/AhAa5gtfJf+pPKL4NR0UC0dWba6N5qh
	 AMLbTW5EulWN8CfNVYmtM4TT+sQU+Tl0u2CqnwQqwkj2dxa1DA//5Um1fUpJfvZV+2
	 H/zFWUpuKmAT+ckn0LnSbWHGOiqIi8lFyfsJmx6s9ZcuEJB1u3NXka5kKUbu/MtSrm
	 dr62tk5zp/1QLY+FVNmRv19pD5YOfP+cXc8UsSo/8+zOz8xb4D0B2wjbrsFjXnifRU
	 44bunly2ERkTQ==
Date: Fri, 1 Mar 2024 17:37:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA
 C Rule 20.7
In-Reply-To: <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
 <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Mar 2024, Jan Beulich wrote:
> On 29.02.2024 23:57, Stefano Stabellini wrote:
> > On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> >> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> >> of macro parameters shall be enclosed in parentheses". Therefore, some
> >> macro definitions should gain additional parentheses to ensure that all
> >> current and future users will be safe with respect to expansions that
> >> can possibly alter the semantics of the passed-in macro parameter.
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> You did see the discussion on earlier patches, though? I don't think
> any of the parentheses here are needed or wanted.

We need to align on this. Currently if we go by what's written in
docs/misra/deviations.rst, then rhs should have parentheses.

Can we safely claim that rhs parentheses are never needed? If so, then
great, let's add it to deviations.rst and skip them here and other
places in this patch series (e.g. patch #8). When I say "never" I am
taking for granted that the caller is not doing something completely
unacceptably broken such as: 

     WRITE_SYSREG64(var +, TTBR0_EL1)

If we cannot generically claim that rhs parentheses are never needed,
then I don't think we should make any exceptions. We should add them here
and everywhere else. It should be easy to write a macro or review a
patch with a macro from someone else, and making special exception makes
it more difficult for everyone.

