Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A1949672C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 22:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259448.447835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB1Ee-0000M1-1z; Fri, 21 Jan 2022 21:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259448.447835; Fri, 21 Jan 2022 21:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nB1Ed-0000J9-VD; Fri, 21 Jan 2022 21:14:15 +0000
Received: by outflank-mailman (input) for mailman id 259448;
 Fri, 21 Jan 2022 21:14:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ra3=SF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nB1Ec-0000J3-J2
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 21:14:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14831bee-7aff-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 22:14:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A912161800;
 Fri, 21 Jan 2022 21:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736CAC340E2;
 Fri, 21 Jan 2022 21:14:10 +0000 (UTC)
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
X-Inumbo-ID: 14831bee-7aff-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642799651;
	bh=zoztyVQaXvxc3hMVc6n/GFYezsl3xm4XPka3UtTcfKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pf33FMltCFx3UZ/6L7wLb45lmtZebp4iiVKx6zgObthgT7/9rfJJUKZ5oIgHB5R5u
	 7/LRC7QuNiUmmtPvTbfIFiXJRh9fXhAUdYjfZYE4kXm4urlHDx9C0EmWb1pbMEtAEg
	 7yNhI6psISuP7W3I0UB8+y+G6Vjck4rWm2MvqVnYIw83nDn3u8D6cCoBNsgGVyblke
	 x3QeChIHIzXavLaE8KvGesD6Vm2ZVYkuaea5pyBraCp+zLnX6RueGthbmB7utjV4eC
	 4rPjHTje4fenkW5HjdmCbEjvF7Pi15zXI0+eFrXGox9H7rkrgKpH5vHNLOenK8xqVo
	 Tk6dyFPVl2GVQ==
Date: Fri, 21 Jan 2022 13:14:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ross Lagerwall <ross.lagerwall@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Igor Druzhinin <igor.druzhinin@citrix.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] xen-mapcache: Avoid entry->lock overflow
In-Reply-To: <20220121173329.904412-1-ross.lagerwall@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2201211308400.27308@ubuntu-linux-20-04-desktop>
References: <20220121173329.904412-1-ross.lagerwall@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jan 2022, Ross Lagerwall wrote:
> In some cases, a particular mapcache entry may be mapped 256 times
> causing the lock field to wrap to 0. For example, this may happen when
> using emulated NVME and the guest submits a large scatter-gather write.
> At this point, the entry map be remapped causing QEMU to write the wrong
> data or crash (since remap is not atomic).
> 
> Avoid this overflow by increasing the lock field to a uint16_t and also
> detect it and abort rather than continuing regardless.

Nice catch!


> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  hw/i386/xen/xen-mapcache.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index bd47c3d672..82dc495a60 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
>      hwaddr paddr_index;
>      uint8_t *vaddr_base;
>      unsigned long *valid_mapping;
> -    uint8_t lock;
> +    uint16_t lock;

As struct MapCacheEntry is not packed, we might as well switch to
uint32_t as it doesn't make a difference.


>  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
>      uint8_t flags;
>      hwaddr size;
> @@ -355,6 +355,12 @@ tryagain:
>      if (lock) {
>          MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
>          entry->lock++;
> +        if (entry->lock == 0) {
> +            fprintf(stderr,
> +                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
> +                    entry->paddr_index, entry->vaddr_base);
> +            abort();

I was going to suggest that it might be better to return NULL and let
the caller handle the failure but it looks like the caller *cannot*
handle the failure.


> +        }
>          reventry->dma = dma;
>          reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
>          reventry->paddr_index = mapcache->last_entry->paddr_index;
> -- 
> 2.27.0
> 

