Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE639400F5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 00:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767175.1177767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYc8-0003SG-33; Mon, 29 Jul 2024 22:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767175.1177767; Mon, 29 Jul 2024 22:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYc8-0003QW-08; Mon, 29 Jul 2024 22:13:08 +0000
Received: by outflank-mailman (input) for mailman id 767175;
 Mon, 29 Jul 2024 22:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYYc6-0003QL-4E
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 22:13:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9366374-4df7-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 00:13:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4D0ACCE0A25;
 Mon, 29 Jul 2024 22:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BF7C32786;
 Mon, 29 Jul 2024 22:12:56 +0000 (UTC)
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
X-Inumbo-ID: b9366374-4df7-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722291177;
	bh=8qN6bkvEn2bUYp+GfPElANlqN5MUNzSykFxHvABWZYQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JAbmZGtgDYH6SxweMNF87lMahJ7Nz2NNzcKvGmX6Q5dfiVRhPcHjcU0BmCk6/25Zo
	 YipRflgFYeeaH+cZ82pM5/ips+bRaHKtsydm+NP2yX+WZ6AxYEfdUclFkfAhMD40PW
	 veVdoWkQeJtIQ4mY5cgmOXka5MT6fVD3GVFymcdEi1Z8S9gmd0j2/BMd9w9Rn60GrH
	 FFcqGtlKZOx22FIoInznBFWnkbzmwB+kpgt+5AGKUWZ1r2lBJfzIRpu2vl5KuO0CUg
	 cHy3daVaqjwwzVwrtqwCLgplWWUhkFot8tHyPjMMZMIJo3tVvsxveSHno7uRH31XU/
	 4y9suUOwwcY5A==
Date: Mon, 29 Jul 2024 15:12:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v5 7/8] x86/mm: add defensive return
In-Reply-To: <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
References: <cover.1722239813.git.federico.serafini@bugseng.com> <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jul 2024, Federico Serafini wrote:
> Add defensive return statement at the end of an unreachable
> default case. Other than improve safety, this meets the requirements
> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> No changes from v3 and v4, further feedback on this thread would be appreciated:
> https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
> ---
>  xen/arch/x86/mm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 95795567f2..8973e76dff 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -917,6 +917,7 @@ get_page_from_l1e(
>                  return 0;
>              default:
>                  ASSERT_UNREACHABLE();
> +                return -EPERM;
>              }
>          }
>          else if ( l1f & _PAGE_RW )
> -- 
> 2.34.1
> 
> 

