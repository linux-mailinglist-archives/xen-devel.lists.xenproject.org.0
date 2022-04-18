Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB718504D05
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 09:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306971.522193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngLXn-0006YN-SJ; Mon, 18 Apr 2022 07:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306971.522193; Mon, 18 Apr 2022 07:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngLXn-0006Vp-Or; Mon, 18 Apr 2022 07:11:31 +0000
Received: by outflank-mailman (input) for mailman id 306971;
 Mon, 18 Apr 2022 07:11:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hkv=U4=inria.fr=julia.lawall@srs-se1.protection.inumbo.net>)
 id 1ngLXm-0006Fh-8t
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 07:11:30 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45458bb-bee6-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 09:11:29 +0200 (CEST)
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 09:11:28 +0200
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
X-Inumbo-ID: c45458bb-bee6-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mv4SaWQ4Bw/fucJMQTHXYSdAaF06VUODAZIEs7Rd828=;
  b=lWksnZqipOAWdvIJHQZisQD4gkBg4dI8MjvO0LGlApIsodldzOKpy7RB
   WkZlN9qNTRdIP0Rz5pZF6HfRrHibnwybDOJS664mmGWq3JP343u7vK3dV
   W9b500xj2LIBfEoXpNJHkCJmk/9uX5ACczMVJ+EpOgFB8QEErkVJhLi1B
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,269,1643670000"; 
   d="scan'208";a="32129625"
Date: Mon, 18 Apr 2022 09:11:27 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
cc: outreachy@lists.linux.dev, boris.ostrovsky@oracle.com, jgross@suse.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, ira.weiny@intel.com
Subject: Re: [PATCH] xen: gntalloc.c:  Convert kmap() to kmap_local_page()
In-Reply-To: <20220418061927.6833-1-eng.alaamohamedsoliman.am@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204180910320.2860@hadrien>
References: <20220418061927.6833-1-eng.alaamohamedsoliman.am@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 18 Apr 2022, Alaa Mohamed wrote:

> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible.
>
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore __del_gref() is a function
> where the use of kmap_local_page() in place of kmap() is correctly
> suited.

What is it about __del_gref() that makes this change the right choice?

julia

>
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
>  drivers/xen/gntalloc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
> index 4849f94372a4..55acb32842a3 100644
> --- a/drivers/xen/gntalloc.c
> +++ b/drivers/xen/gntalloc.c
> @@ -178,9 +178,9 @@ static void __del_gref(struct gntalloc_gref *gref)
>  	unsigned long addr;
>
>  	if (gref->notify.flags & UNMAP_NOTIFY_CLEAR_BYTE) {
> -		uint8_t *tmp = kmap(gref->page);
> +		uint8_t *tmp = kmap_local_page(gref->page);
>  		tmp[gref->notify.pgoff] = 0;
> -		kunmap(gref->page);
> +		kunmap_local(tmp);
>  	}
>  	if (gref->notify.flags & UNMAP_NOTIFY_SEND_EVENT) {
>  		notify_remote_via_evtchn(gref->notify.event);
> --
> 2.35.2
>
>
>

