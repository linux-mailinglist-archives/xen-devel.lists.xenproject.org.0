Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98D86D719
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 23:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687445.1070925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpL2-0001L5-8B; Thu, 29 Feb 2024 22:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687445.1070925; Thu, 29 Feb 2024 22:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpL2-0001JZ-5C; Thu, 29 Feb 2024 22:57:16 +0000
Received: by outflank-mailman (input) for mailman id 687445;
 Thu, 29 Feb 2024 22:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfpL0-0000nV-60
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 22:57:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df7da3ad-d755-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 23:57:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33CF460B84;
 Thu, 29 Feb 2024 22:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA620C433C7;
 Thu, 29 Feb 2024 22:57:08 +0000 (UTC)
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
X-Inumbo-ID: df7da3ad-d755-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709247430;
	bh=wVyKWsKWvr/bMiVJL4heuH8fpTxngbQ0/r+YQkB5hjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JwLOQmWmIkgZI6YOlaCg2BgsQjv7v7C4XmLMJCSkrQ6gUcwDqe/GJKpWKjfro39SH
	 TXILjEVlEWyf/7VZWo+G8+lrtuJ6HsxGl90lnIhm8z7MDCJintAMdmJaIrSZLulJ2f
	 acHTg3j6nRoO0dC2MKrepeScAR95ZhqCl6FVblmpjgW4e5z5MZxbioR4k4gFl5sTK4
	 cE5J8z82r2ZXBnZb5nRSvE8a3Ivc9chc+uFvxe4s0f8JmS8ryljhqgSfL5gJQ+izK2
	 Ir03e7uKcsigsAfHrxK6X/clzZvUJDEUIYIKO8uZldk26NUdaxo5YFvBhEyyyvXvax
	 mLRUaC8FJk5qA==
Date: Thu, 29 Feb 2024 14:57:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA
 C Rule 20.7
In-Reply-To: <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Nicola Vetrini wrote:
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


> ---
>  xen/common/keyhandler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 127ca506965c..4c1ce007870f 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -42,10 +42,10 @@ static struct keyhandler {
>  } key_table[128] __read_mostly =
>  {
>  #define KEYHANDLER(k, f, desc, diag)            \
> -    [k] = { { .fn = (f) }, desc, 0, diag }
> +    [k] = { { .fn = (f) }, (desc), 0, (diag) }
>  
>  #define IRQ_KEYHANDLER(k, f, desc, diag)        \
> -    [k] = { { .irq_fn = (f) }, desc, 1, diag }
> +    [k] = { { .irq_fn = (f) }, (desc), 1, (diag) }
>  
>      IRQ_KEYHANDLER('A', do_toggle_alt_key, "toggle alternative key handling", 0),
>      IRQ_KEYHANDLER('d', dump_registers, "dump registers", 1),
> -- 
> 2.34.1
> 

