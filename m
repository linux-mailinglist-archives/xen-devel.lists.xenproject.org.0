Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1797BEF8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614504.955619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0Nd-0004KC-9i; Tue, 10 Oct 2023 00:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614504.955619; Tue, 10 Oct 2023 00:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0Nd-0004H9-6q; Tue, 10 Oct 2023 00:13:45 +0000
Received: by outflank-mailman (input) for mailman id 614504;
 Tue, 10 Oct 2023 00:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq0Nb-0004Gz-Pq
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:13:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de1be0f4-6701-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 02:13:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E89416145D;
 Tue, 10 Oct 2023 00:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F5FC433C8;
 Tue, 10 Oct 2023 00:13:39 +0000 (UTC)
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
X-Inumbo-ID: de1be0f4-6701-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696896820;
	bh=pFShj7E3teMu9hJW8EV5RvbTmKj4bVtl8O/wRY3ZG7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rSWwqSmBwJb5Dl2qzyJsJ8Nv5st7powAi+gOwKy3X3EFBNT1MufUYMEYMsjc8Ali7
	 h7QWSqCRLEeihNelze6EJ45RLodm8f2u+LVJ3O257jpaiTkMCQQlWEUW9mhTzwRvEJ
	 ipmcQ2GAmESz9/6ElOfCoirfCi4BImsb0ByLXE27SP60xxf9RT0mYvvHnz0URxjquv
	 nvHOAZwld4ZL0iU6W6b/fHxWKMTk5DKGFs5gac1eJyrZN869NXhMcUsbZvrMwPWPF8
	 C5IusCS3xZgKk48eKXyIRuaHMWB/WZtpl/0dqh0bX/eYp+cqXhTIsOIiVpQUQ3JbQI
	 jtgeEJdMWGejQ==
Date: Mon, 9 Oct 2023 17:13:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1 4/7] xen: let xen_ram_addr_from_mapcache() return
 -1 in case of not found entry
In-Reply-To: <20231005181629.4046-5-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310091713200.3431292@ubuntu-linux-20-04-desktop>
References: <20231005181629.4046-1-vikram.garhwal@amd.com> <20231005181629.4046-5-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> Today xen_ram_addr_from_mapcache() will either abort() or return 0 in
> case it can't find a matching entry for a pointer value. Both cases
> are bad, so change that to return an invalid address instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-mapcache.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 8115c44c00..8a61c7dde6 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -404,13 +404,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          }
>      }
>      if (!found) {
> -        fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
> -        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> -            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index,
> -                    reventry->vaddr_req);
> -        }
> -        abort();
> -        return 0;
> +        mapcache_unlock();
> +        return RAM_ADDR_INVALID;
>      }
>  
>      entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
> @@ -418,8 +413,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>          entry = entry->next;
>      }
>      if (!entry) {
> -        DPRINTF("Trying to find address %p that is not in the mapcache!\n", ptr);
> -        raddr = 0;
> +        raddr = RAM_ADDR_INVALID;
>      } else {
>          raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
>               ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
> -- 
> 2.17.1
> 

