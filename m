Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BBC915B49
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747101.1154414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuWE-0007Pn-3p; Tue, 25 Jun 2024 00:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747101.1154414; Tue, 25 Jun 2024 00:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuWE-0007ON-0k; Tue, 25 Jun 2024 00:58:46 +0000
Received: by outflank-mailman (input) for mailman id 747101;
 Tue, 25 Jun 2024 00:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuWC-0006do-De
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:58:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c789d4-328e-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:58:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B33B460AE9;
 Tue, 25 Jun 2024 00:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74A7C2BBFC;
 Tue, 25 Jun 2024 00:58:40 +0000 (UTC)
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
X-Inumbo-ID: 10c789d4-328e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719277121;
	bh=1h0SljQwYt2uhrVy5EsJfWfyNxB7RHb9qSthRi3i8Rc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l+vgBivQ3VE221i+O9++hhLsCGB7n4KLWhRdHlD5gSe0Yb0tObVRXSpUbpyHj50mv
	 DUrHFLy+veN2vsRIOn+e9NIFFbmqh+EMs+1GHPE4MZqMN/RqrXu1zan/ryzZ7jeBlq
	 5g4q7c6QqWDGsMgDOWpY6iFjGvwEhtkVL48nMnIVLKPLSjPxJS3TdZ4Sx0E1AFD3Rq
	 f3ypVJRRmoRAGD/9zamTjOY8ZcoI+LKOtaG8yGPv5n5HRljTPn39K89Ez7+uLgf9OF
	 sVxG+4kgW6A/TgA8x2wOm2LGwFDoSf6s8snQ/+yWzDoHxdHaS2oIwsAKr4c20zqdXH
	 vX0lMamdeajPA==
Date: Mon, 24 Jun 2024 17:58:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 09/13] x86/mm: add defensive return
In-Reply-To: <f3adf3d5dac5c4c108207883472f3ebcfa11c685.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241758300.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <f3adf3d5dac5c4c108207883472f3ebcfa11c685.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add defensive return statement at the end of an unreachable
> default case. Other than improve safety, this meets the requirements
> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/mm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 648d6dd475..2e19ced15e 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -916,6 +916,7 @@ get_page_from_l1e(
>                  return 0;
>              default:
>                  ASSERT_UNREACHABLE();
> +                return 0;

Let's avoid this

