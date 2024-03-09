Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62433876E9A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690450.1076467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilZZ-0002Dg-6s; Sat, 09 Mar 2024 01:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690450.1076467; Sat, 09 Mar 2024 01:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilZZ-0002Bq-3F; Sat, 09 Mar 2024 01:32:25 +0000
Received: by outflank-mailman (input) for mailman id 690450;
 Sat, 09 Mar 2024 01:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilZX-0002Bd-Lj
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:32:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea8e782-ddb4-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 02:32:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D2B56117D;
 Sat,  9 Mar 2024 01:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7388C433C7;
 Sat,  9 Mar 2024 01:32:16 +0000 (UTC)
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
X-Inumbo-ID: dea8e782-ddb4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709947938;
	bh=N4Zlr2YBEF2Zmj+/2VFqqlC0xz7Y3kl8JtrrJtLq/F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ES94JaM5KQUZg2wNEojB4BVTSqTM5TDEBvnSB0STZj0SBNvlT7Ld7IPZBjeecfaBL
	 0FFA/NNvZ5VUyGEc7aiTGoON7KrSmIDBROyueiQ7A5L7XwJ4dw3JwyuTiP/66dqn/g
	 /C9Fc3kDWXoTApJOUkPwFDSmZ9aEnn3kbx2gBKJOwdUkhGwq59SffCOAqSm9P+bpLx
	 v+RbRze2XVSgoTcUF2CTOV+Ek9SyrjYhfmsgkwi8VTtTktCU9e6xlfYOstrNSey7Op
	 WDb61UuD/GQK8lz9CAij46vaaZBIeVlull3qoyRPoQxj1zwxpxuw1e+FCEx5h3dK9Q
	 uMPfjRsHzQ41Q==
Date: Fri, 8 Mar 2024 17:32:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 4/7] xen/param: address violations of MISRA C Rule
 20.7
In-Reply-To: <6ad91190bd777ee76d94efbe71341a38dbcdb428.1709896401.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081732080.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com> <6ad91190bd777ee76d94efbe71341a38dbcdb428.1709896401.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

