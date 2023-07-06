Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C32749246
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 02:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559583.874688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHCb8-0006gR-H9; Thu, 06 Jul 2023 00:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559583.874688; Thu, 06 Jul 2023 00:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHCb8-0006dU-Dy; Thu, 06 Jul 2023 00:11:50 +0000
Received: by outflank-mailman (input) for mailman id 559583;
 Thu, 06 Jul 2023 00:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHCb6-0006dO-94
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 00:11:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0f64186-1b91-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 02:11:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 461AE61780;
 Thu,  6 Jul 2023 00:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5C1C433C7;
 Thu,  6 Jul 2023 00:11:41 +0000 (UTC)
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
X-Inumbo-ID: b0f64186-1b91-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688602303;
	bh=Y3MUHD3iL66yRkr5/mlylaIgHmjmvCNQvdOMp5ArEzw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hMC8zqsn6xYWEoQeIXTHhzMFwibaQ+G+Bn5qKdFVxdGzxsA+5tfvohj9AfCyfWi4E
	 EpAAmekKLvjK70pF9/SEsW0x+YS/4x4M/TQP9Ea9rDiY2oddX0QFcwjPRntOy3lgS/
	 7Jcfl32BEkd0ysX6x+yLzEDuDCC8Dxcg81Ew44XV41CtXVs+9oaGrD+V2n/IUinaNJ
	 N5ti6eikf07KawCwY9yQyPfL96qn50zROeGY+kykLN4eXspkmLtZ4tzutoSZpZY8iS
	 +GU8dmjWyQRYbGlFld65iS+LjYPCAbFA3OwschsxcI2Whk+JU5ezU99afBefdpsAFD
	 UKWkvvEgGeIMg==
Date: Wed, 5 Jul 2023 17:11:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307051704030.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

[...]

> diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
> index c3771c2e39..6951a433e8 100644
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -141,7 +141,7 @@ static int __init cf_check stub_selftest(void)
>            .rax = 0x0123456789abcdef,
>            .res.fields.trapnr = X86_EXC_GP },
>          { .opc = { endbr64, 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
> -          .rax = 0xfedcba9876543210,
> +          .rax = 0xfedcba9876543210U,

In my opinion 64-bit values should be either UL or ULL. This one should
be UL ?

Everything else looks fine to me

