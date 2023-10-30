Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DC7DC2A6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 23:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625411.974652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxbAP-00061Z-20; Mon, 30 Oct 2023 22:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625411.974652; Mon, 30 Oct 2023 22:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxbAO-0005zF-Uf; Mon, 30 Oct 2023 22:55:28 +0000
Received: by outflank-mailman (input) for mailman id 625411;
 Mon, 30 Oct 2023 22:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxbAN-0005pt-V3
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 22:55:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69cd933e-7777-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 23:55:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31FD260AF4;
 Mon, 30 Oct 2023 22:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4E3C433C9;
 Mon, 30 Oct 2023 22:55:22 +0000 (UTC)
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
X-Inumbo-ID: 69cd933e-7777-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698706524;
	bh=b6tRFh1fKYNq6qkhoaVync13KCCPnHftQ1YKMhtU220=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D9fqT/6E076b+kQnqDt9iti6VSH8zSagQcGHZm5ZKfFdgE+aGwqHLdOVwxBeegQXt
	 o3OLZdzb0mC1ff215Su/7VUJaUp4rK2DhZFupIG2IyYDWq5avs/pcSFjxYIfv9n2Jk
	 yz+YTZV6d8O8NzuIpqZdjoTXSjgzvfloPBCJOeOSvyvRDG4Pcg6HeXNlDofpPx+O2b
	 YB1jHiwsJnnuIXC+Fui1hzdKIBNR3pA26V1U33pWFfysMthiapHtB7BYRzVLSw7HIy
	 mbBmrFaBJvhhrCvCBLInr2h0kCtx05FtIm8+fmNTje19dYQGGcuWSxF2xudXuFkeOY
	 h3l2f5un/uRtw==
Date: Mon, 30 Oct 2023 15:55:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310301555020.1625118@ubuntu-linux-20-04-desktop>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com> <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Nicola Vetrini wrote:
> As stated in rules.rst, functions used only in asm modules
> are allowed to have no prior declaration visible when being
> defined, hence these functions are marked with an
> 'asmlinkage' macro, which is then deviated for MISRA C:2012
> Rule 8.4.
> 
> 'current_stack_pointer' in x86/asm_defns is a declaration, not a definition,
> and is thus marked as safe for ECLAIR.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Just wanted to say that this patch looks OK and I don't have any further
coments on top of Jan's

