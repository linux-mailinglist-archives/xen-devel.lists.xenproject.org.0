Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7D55546F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354307.581382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o463M-0001c6-Ju; Wed, 22 Jun 2022 19:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354307.581382; Wed, 22 Jun 2022 19:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o463M-0001Zk-H6; Wed, 22 Jun 2022 19:30:16 +0000
Received: by outflank-mailman (input) for mailman id 354307;
 Wed, 22 Jun 2022 19:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BDV=W5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o463K-0001ZW-Q8
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 19:30:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc5760f2-f261-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 21:30:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62D7760EF4;
 Wed, 22 Jun 2022 19:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A49C34114;
 Wed, 22 Jun 2022 19:30:11 +0000 (UTC)
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
X-Inumbo-ID: bc5760f2-f261-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655926211;
	bh=IwyPm/RSmjo26ngQXhzJwWqIaCH6+ra277GLEFac3pc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NiDRGdQa2V4ZE15+GXShHj+wWnHoWyD9GQDUrfcjapXvbhzDkA4znD07FlNMl3R3I
	 rI4sDaj5yMqHB3l+AUjFkLf8wKSILe52srTyAgZ0j5GSiCBl8A5LOozdpdXwWh37oF
	 ekT0N0KzRKNfq2jFzARPjHbPoM4NLvuJsZNpWXAfFKdlulCbIJBAfAwv8JTY5bxXnk
	 V1TwxC5dcHd508xeKvnoTYNW0NLiq1hsT1h/3X2SlVyb9KwHLxgTuV31/znm+s248F
	 dSezI9VqjPsM5x12k7lzi4QKySfNCrGEWGyWerc9d6zzdWb7/TUTGQy9GBsmabS2qe
	 LBzLQNiWJxkQg==
Date: Wed, 22 Jun 2022 12:30:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] xen/common: gunzip: Fix MISRA C 2012 Rule 8.4
 violation
In-Reply-To: <20220622151514.545850-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206221230040.2157383@ubuntu-linux-20-04-desktop>
References: <20220622151514.545850-1-burzalodowa@gmail.com> <20220622151514.545850-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jun 2022, Xenia Ragiadakou wrote:
> Include header <xen/gunzip.h> so that the declarations of functions gzip_check()
> and perform_gunzip(), which have external linkage, are visible before the
> function definitions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/gunzip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
> index b9ecc17e44..aa16fec4bb 100644
> --- a/xen/common/gunzip.c
> +++ b/xen/common/gunzip.c
> @@ -1,4 +1,5 @@
>  #include <xen/errno.h>
> +#include <xen/gunzip.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
> -- 
> 2.34.1
> 

