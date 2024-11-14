Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCFA9C8067
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 03:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836011.1251891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBPIl-0002uX-GO; Thu, 14 Nov 2024 02:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836011.1251891; Thu, 14 Nov 2024 02:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBPIl-0002ss-Dl; Thu, 14 Nov 2024 02:09:43 +0000
Received: by outflank-mailman (input) for mailman id 836011;
 Thu, 14 Nov 2024 02:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npsv=SJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tBPIk-0002sm-6d
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 02:09:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5e3f79-a22d-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 03:09:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EDFE3A41924;
 Thu, 14 Nov 2024 02:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD557C4CEC3;
 Thu, 14 Nov 2024 02:09:34 +0000 (UTC)
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
X-Inumbo-ID: 7f5e3f79-a22d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjdmNWUzZjc5LWEyMmQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTUwMTc3LjU4ODc2Miwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731550175;
	bh=CjCuNaCAQV1P9ZcHdoxS2vmdSFWI+pACjjYcZzKB3x4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IUbmfvP+cUx+mLSUMvNxj4Qbiyi4XPgCN3BkpY5uUtWIbCKM8O52PAlzRu40rZlv+
	 hldgGDQkxHZMV6YrVnYGKwnl3fLzUAXZ72Yh7GN6en6qzGC2CKb+Jl/+mp544MNMAW
	 bmewz3q4mNbWtsVFY/HXc+xeUDgZQH0FdTiabjkoAf63bz4PSXgRpO/Mry5m5z7+QO
	 KF7U92AMzZhaGlwOkJ7x+baQSq+HGt+NtNV7HGQcF42vDHYMUwST+eQJdTQ4tQd1DS
	 iqJiFZNK+MQliLGiGPQH9HlQ8cEthk36UBnc0zidIkrs07YWVItfm4YGWvGkpk3xgL
	 mVtvFYB65suYA==
Date: Wed, 13 Nov 2024 18:09:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs/misra: specify behaviour of checker for Directive
 4.10
In-Reply-To: <5939b15ad764674b7d8cece654f891e880086d54.1731490924.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2411131809240.222505@ubuntu-linux-20-04-desktop>
References: <5939b15ad764674b7d8cece654f891e880086d54.1731490924.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Nov 2024, Alessandro Zucchelli wrote:
> MISRA C:2012 Directive 4.10 states as following: Precautions shall be
> taken in order to prevent the contents of a header file being included
> more than once.
> 
> This commit updates the documentation to describe the behavior defined
> for the checker.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>  docs/misra/rules.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 80e5e972ad..f5858b00bb 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -68,6 +68,8 @@ maintainers if you want to suggest a change.
>         header file being included more than once
>       - Files that are intended to be included more than once do not need to
>         conform to the directive
> +     - A guard identifier is reported if the same guard identifier is redefined
> +       or undefined anywhere in the project

It cannot be another - because it would break the table. I'll fix it on
commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>     * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
>       - Required
> -- 
> 2.43.0
> 

