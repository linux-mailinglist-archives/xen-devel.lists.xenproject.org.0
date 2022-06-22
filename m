Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A798E55546E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 21:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354300.581371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o462c-0000JM-BN; Wed, 22 Jun 2022 19:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354300.581371; Wed, 22 Jun 2022 19:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o462c-0000HH-8P; Wed, 22 Jun 2022 19:29:30 +0000
Received: by outflank-mailman (input) for mailman id 354300;
 Wed, 22 Jun 2022 19:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BDV=W5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o462a-0000HB-Kr
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 19:29:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0fa7205-f261-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 21:29:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D81B603E0;
 Wed, 22 Jun 2022 19:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFDCC34114;
 Wed, 22 Jun 2022 19:29:25 +0000 (UTC)
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
X-Inumbo-ID: a0fa7205-f261-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655926166;
	bh=lEXS5xvDudB/17pOBtKnSM5CJJDIEZjJvjb4/t/prBA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rKgMyXRbNUwrlSxfOtRFbAvdpuoIAphO7cvxMbWuH/7P2ZxThPpnPFasqs2Tso613
	 QG3QqDbm+UMvE6APWnJs2N/9FfYEOycVIfFnQ7eIv7Jc6yal0a3td4rTIDI3U6tQ4A
	 u0mDVnfd1rjxIBoKx9JFM3OVOqfAtL/taVoXJUrBIK6FRKUUvlHdBf8g+Yor8O4uDL
	 YOgPuzrXHCmiK4FmQfl3Zn14Cnf33lb/e2ZmU2GObLTmGYB4J3LWfMM5QtX2ea5qP0
	 nZs9SCxjGuTMHpxzUB+uGdXy2/QqOZKPXJDxSsUmEeTinhGTMBmxU/29Nm0S/5znuz
	 gL5pp/56mNK/w==
Date: Wed, 22 Jun 2022 12:29:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] xen/lib: list-sort: Fix MISRA C 2012 Rule 8.4
 violation
In-Reply-To: <20220622151514.545850-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206221229180.2157383@ubuntu-linux-20-04-desktop>
References: <20220622151514.545850-1-burzalodowa@gmail.com> <20220622151514.545850-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jun 2022, Xenia Ragiadakou wrote:
> Include header <xen/list_sort.h> so that the declaration of the function
> list_sort(), which has external linkage, is visible before the function
> definition.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/lib/list-sort.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/lib/list-sort.c b/xen/lib/list-sort.c
> index f8d8bbf281..de1af2ef8b 100644
> --- a/xen/lib/list-sort.c
> +++ b/xen/lib/list-sort.c
> @@ -16,6 +16,7 @@
>   */
>  
>  #include <xen/list.h>
> +#include <xen/list_sort.h>
>  
>  #define MAX_LIST_LENGTH_BITS 20
>  
> -- 
> 2.34.1
> 

