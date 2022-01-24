Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21903498513
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259929.448732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2RP-0005tM-B3; Mon, 24 Jan 2022 16:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259929.448732; Mon, 24 Jan 2022 16:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2RP-0005qh-7x; Mon, 24 Jan 2022 16:43:39 +0000
Received: by outflank-mailman (input) for mailman id 259929;
 Mon, 24 Jan 2022 16:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nC2RO-0005qb-44
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:43:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c64abd10-7d34-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 17:43:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75942B810FD;
 Mon, 24 Jan 2022 16:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB9C340E5;
 Mon, 24 Jan 2022 16:43:33 +0000 (UTC)
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
X-Inumbo-ID: c64abd10-7d34-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643042614;
	bh=HrREaWHY3DAyMl8U0orzrUtiJHYyNjPRzbvbk1rj2q0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jQdMME0snRbZyOSTP63GJkb3b+Adk8Nuj9w5yvdMa9HcYBa5FhuvVrezbZFU7YK+j
	 UlG9Se0mNWIy1F9+7fRCJVcPAvBjCbT47Ku2Hj7DGSyvasUhs21yK6goG65mEDkaGV
	 YA36KTyxQ03J3KvDDeBi7B3eN9nA2ZQxdWJie5hGt8smHcwp6RbbXZIdmpF+C6SJe+
	 r9f5R3a7kMB5UY5jgLSur2hdI/0nlIouHs5d0EHxZNQgZjSUS7wqd+UusLV2jm2X1I
	 qBxPemyPjUotwsd2krbd6SO/lB8bobq4D7PgtE4qaZWVAkGGjSsjmobd8YvDUyEMVu
	 /Qbufae9Y4CRg==
Date: Mon, 24 Jan 2022 08:43:32 -0800 (PST)
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
Subject: Re: [PATCH v2] xen-mapcache: Avoid entry->lock overflow
In-Reply-To: <20220124104450.152481-1-ross.lagerwall@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2201240843130.27308@ubuntu-linux-20-04-desktop>
References: <20220124104450.152481-1-ross.lagerwall@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jan 2022, Ross Lagerwall wrote:
> In some cases, a particular mapcache entry may be mapped 256 times
> causing the lock field to wrap to 0. For example, this may happen when
> using emulated NVME and the guest submits a large scatter-gather write.
> At this point, the entry map be remapped causing QEMU to write the wrong
> data or crash (since remap is not atomic).
> 
> Avoid this overflow by increasing the lock field to a uint32_t and also
> detect it and abort rather than continuing regardless.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2: Change type to uint32_t since there is a hole there
> anyway. The struct size remains at 48 bytes on x86_64.
> 
>  hw/i386/xen/xen-mapcache.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index bd47c3d672..f2ef977963 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
>      hwaddr paddr_index;
>      uint8_t *vaddr_base;
>      unsigned long *valid_mapping;
> -    uint8_t lock;
> +    uint32_t lock;
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
> +        }
>          reventry->dma = dma;
>          reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
>          reventry->paddr_index = mapcache->last_entry->paddr_index;
> -- 
> 2.27.0
> 

