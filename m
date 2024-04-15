Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FB8A5D43
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 23:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706500.1103668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUHU-0007GX-Ep; Mon, 15 Apr 2024 21:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706500.1103668; Mon, 15 Apr 2024 21:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUHU-0007Ed-Bp; Mon, 15 Apr 2024 21:54:28 +0000
Received: by outflank-mailman (input) for mailman id 706500;
 Mon, 15 Apr 2024 21:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNdO=LU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwUHS-0007EV-Vc
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 21:54:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8dcef19-fb72-11ee-b909-491648fe20b8;
 Mon, 15 Apr 2024 23:54:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ECC5DCE0AEB;
 Mon, 15 Apr 2024 21:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AD0C113CC;
 Mon, 15 Apr 2024 21:54:21 +0000 (UTC)
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
X-Inumbo-ID: b8dcef19-fb72-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713218062;
	bh=cD7EECxs4sKtM7VgHsPaRPxKxt5Q97QQpMUCAOT08sM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zje931JZASPJAr6h/uOW9YpAqhqUJdSeZpNqkpz/LlcBDlbrXdunk6auwAf8huSfO
	 HXIUql3L9WBnZjFT8ubvlGOkVvpAQzYC/cBBUgRloo5JXz3kxpGP+n1jJdT97Sp25g
	 FD4tfeVA9YInvUhgrmEt+YEm1XbdylwL4iJvMWpajl0VxhyBI/3g3WUMnxKY8BVTrA
	 dUMRNbmFPlhnkoYH6jHUZKcT/vagT/fyb72B3IvBXbCjNw1YWQIauIbJixlFZzgXoR
	 nQxD7XTMvImVxfeRF9ACV+H0pq39U6jxtpnzvLwDXOyo6jSbI9hPojnC7GcC+s4OhT
	 1KBMdHDLk3Fvw==
Date: Mon, 15 Apr 2024 14:54:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 3/4] xen/gnttab: Perform compat/native gnttab_query_size
 check
In-Reply-To: <20240415154155.2718064-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404151453400.997881@ubuntu-linux-20-04-desktop>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com> <20240415154155.2718064-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Apr 2024, Andrew Cooper wrote:
> This subop appears to have been missed from the compat checks.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  xen/common/compat/grant_table.c | 4 ++++
>  xen/include/xlat.lst            | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
> index af98eade17c9..8a754055576b 100644
> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -30,6 +30,10 @@ CHECK_gnttab_unmap_grant_ref;
>  CHECK_gnttab_unmap_and_replace;
>  #undef xen_gnttab_unmap_and_replace
>  
> +#define xen_gnttab_query_size gnttab_query_size
> +CHECK_gnttab_query_size;
> +#undef xen_gnttab_query_size
> +
>  DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
>  DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
>  DEFINE_XEN_GUEST_HANDLE(gnttab_copy_compat_t);
> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
> index b3befd9cc113..53a1bdfc533f 100644
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -88,6 +88,7 @@
>  !	gnttab_get_status_frames	grant_table.h
>  ?	gnttab_get_version		grant_table.h
>  ?	gnttab_map_grant_ref		grant_table.h
> +?	gnttab_query_size		grant_table.h
>  ?	gnttab_set_version		grant_table.h
>  !	gnttab_setup_table		grant_table.h
>  ?	gnttab_swap_grant_ref		grant_table.h
 

I am no compat layer expert, but shouldn't there be something like:

#ifndef CHECK_gnttab_map_grant_ref
    CASE(map_grant_ref);
#endif

somewhere under compat_grant_table_op ?



