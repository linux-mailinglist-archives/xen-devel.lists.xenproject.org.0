Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546E934505
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 01:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760196.1169914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUE08-0003h3-WA; Wed, 17 Jul 2024 23:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760196.1169914; Wed, 17 Jul 2024 23:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUE08-0003ds-Sq; Wed, 17 Jul 2024 23:24:00 +0000
Received: by outflank-mailman (input) for mailman id 760196;
 Wed, 17 Jul 2024 23:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sUE07-0003dm-ON
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 23:23:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b9da50-4493-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 01:23:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 289D7CE179C;
 Wed, 17 Jul 2024 23:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356BBC2BD10;
 Wed, 17 Jul 2024 23:23:52 +0000 (UTC)
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
X-Inumbo-ID: a2b9da50-4493-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721258633;
	bh=41zNvG9hfN+rh0WlabWq2O5krpbBdzFTAuP1+lgMr8o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HtfeIvmTp9iv3ZwJrDqRhg2Ii3lSzJk863Q/YvQ83abSCB6AiboLRVnacUGjIOZjE
	 V1VXUfMr2f1mlig7c6Btz48Kp/u+kLRicWXns6k4EgPOC7AkBssHx6XpeH3QX7rKbO
	 BzcmD6RVAy4VecD6Loij/GeUSZuVAtANrqp0icTbxYUIYif/gNlMqet+VNVJlqIiSs
	 PZ+lPR27wjxMtmW5n5L+2B7Qskh90q+dcxe+hxLQEGFblFinBx9FrrnuTnc1faOU1Z
	 DLC6WAPqieYAN0kBG6QhHklTI0tZVrsqmMXjZiinUH72OLxtHjAjogyr7r5eBjeje1
	 4Rl97PUa6F4mA==
Date: Wed, 17 Jul 2024 16:23:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v4 8/9] x86/mm: add defensive return
In-Reply-To: <de98fe0d6b36383b6eb8d1a9b077b0b387ae0848.1721050709.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407171623430.3635@ubuntu-linux-20-04-desktop>
References: <cover.1721050709.git.federico.serafini@bugseng.com> <de98fe0d6b36383b6eb8d1a9b077b0b387ae0848.1721050709.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Jul 2024, Federico Serafini wrote:
> Add defensive return statement at the end of an unreachable
> default case. Other than improve safety, this meets the requirements
> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> No changes from v3, further feedback on this thread would be appreciated:
> https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
> ---
>  xen/arch/x86/mm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 648d6dd475..a1e28b3360 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -916,6 +916,7 @@ get_page_from_l1e(
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

