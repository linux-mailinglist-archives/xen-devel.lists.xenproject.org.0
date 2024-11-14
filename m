Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7469C8081
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 03:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836021.1251901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBPUs-0005WK-If; Thu, 14 Nov 2024 02:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836021.1251901; Thu, 14 Nov 2024 02:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBPUs-0005Us-FY; Thu, 14 Nov 2024 02:22:14 +0000
Received: by outflank-mailman (input) for mailman id 836021;
 Thu, 14 Nov 2024 02:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npsv=SJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tBPUr-0005Um-EX
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 02:22:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f917e93-a22f-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 03:22:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A19BC5C5C35;
 Thu, 14 Nov 2024 02:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75504C4CED5;
 Thu, 14 Nov 2024 02:22:06 +0000 (UTC)
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
X-Inumbo-ID: 3f917e93-a22f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNmOTE3ZTkzLWEyMmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTUwOTI5LjY3NjY4Niwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731550927;
	bh=C53hPqifI5xadHt07QRXodayfWfbo8znzBVDFVRekBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hNt1JgbMtUdqeNRc2bpIqBvfESY2yuubrH/ZYtwpOVv2t/xvVN5HMMgu00WVqcvcd
	 OUS4IC3erhqXc7XNs118mA0sPZqtHt6ZrhH8+ad9+KQ4s5DhfO7bdmR20Z6pKQBFI9
	 gaOSLH9TyJ4R6qlrJMtjyWDrETcvZUdMGxw1vH1tAuGs1eZrV0WuyLjazeOpTzf6YC
	 GTk1abfrTbrEuin6MN+J6ayCfNf9m+5SWku/M3reatsSgaKE9OGgFOdrEzeGE09/KT
	 9tGAJOtiBpdOx51jfx7xKIUgpqyUhohAq/xMoJvQElAEypiSYK8uhcz/YyqNMmMyVh
	 C4hHecjMMfICA==
Date: Wed, 13 Nov 2024 18:22:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: add deviations for MISRA C 2012 Rule R5.4
In-Reply-To: <7ba6e67a-1470-4734-a065-4d4045f8422a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2411131812410.222505@ubuntu-linux-20-04-desktop>
References: <255ae80cc8b95f33daa7534c9552c571391cf689.1731490650.git.alessandro.zucchelli@bugseng.com> <7ba6e67a-1470-4734-a065-4d4045f8422a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Nov 2024, Jan Beulich wrote:
> On 13.11.2024 10:38, Alessandro Zucchelli wrote:
> > This addresses violations of MISRA C:2012 Rule 5.4 which states as
> > following: Macro identifiers shall be distinct.
> > 
> > This deviation aims to address violations of Rule 5.4 regarding
> > identifiers XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list and
> > XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list, and identifiers
> > declared in header file include/asm/guest/hyperv-tlfs.h.
> 
> Please can you provide enough context? The two identifiers are quite
> obviously distinct. Just not in the first 40 characters. A limit I had
> to actually go look up, because it's entirely arbitrary.
> 
> Plus - what are we going to do if further such identifiers appear?
> Exclude them one by one? That wouldn't really scale. Can we perhaps
> make a wider exception, e.g. at least for all XLAT_*_HDNL_* ones? Then
> again part of the problem here is that hvm_altp2m_set_mem_access_multi
> is already excessively long, alone taking up 31 characters.

If the reason for the deviation is solely the length of the identifiers,
I believe we should increase the limit from 40 to 64 characters. If we
make this change, would it resolve the issue?  After that, can we mark
Rule 5.4 as clean?

Regardless, the recent MISRA regressions have demonstrated the need to
act quickly in marking as many rules as clean as possible to prevent
further regressions (new MISRA violations) from entering the codebase.
There are a few pending patches on the list to address only one or two
violations left so that we can mark a rule as clean. I believe we should
accept these patches even if they are not perfect, as the cost of
delaying action would be far greater for everyone involved. Andrew had
to spent a full day this week just to catch up on recent violations that
we would have easily caught if we had marked rules as clean.

Based on that, I think we should take this patch changing the deviation
to cover all XLAT_*_HDNL_*. The change can be made on commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

