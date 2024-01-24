Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82102839DC4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 01:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670645.1043564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRZY-0000B8-4F; Wed, 24 Jan 2024 00:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670645.1043564; Wed, 24 Jan 2024 00:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRZY-00008V-1Q; Wed, 24 Jan 2024 00:56:56 +0000
Received: by outflank-mailman (input) for mailman id 670645;
 Wed, 24 Jan 2024 00:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnut=JC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rSRZV-00008O-Oh
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 00:56:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c69c0a-ba53-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 01:56:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48267CE3030;
 Wed, 24 Jan 2024 00:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77849C433C7;
 Wed, 24 Jan 2024 00:56:42 +0000 (UTC)
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
X-Inumbo-ID: 74c69c0a-ba53-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706057803;
	bh=bHReAgxWlYCDbjV6niWqJhCLRMaShBkmb4HS9kUp5Gg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CbdZZq4tbZxdNxHG/2VEkTWhNg2zqnw0yHHTwJsmqVT3CQS4xQXWDAk6fqt73AqVU
	 h1nLInAovIlLCRGnx7M0ljo/HAzWry706kYVWtVOGthvVecVhN0DTgiuj5Z98hAixl
	 zvstEvwSSpKyrQfxSWjK9E4wej31OAQ0HZ/EbS5sQufeRyt0CjiiuuXhQ2tXzdHN2B
	 uXhJvXgRHRWJXLR/GCrF6wqPM/5tCZK0NAp1EX6U2ok5NcRngLBjab/ZuZf726pOYg
	 PRn+jWP0PKuI5KLwocSktsTEaJVJhUCGvMZRpnGeYPFhsbbRphfC3t+HEn1PpIaVb4
	 Z/9R2QGxPe5mg==
Date: Tue, 23 Jan 2024 16:56:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
cc: sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org, 
    vikram.garhwal@amd.com, viresh.kumar@linaro.org, 
    xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, 
    Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] xen: Drop out of coroutine context
 xen_invalidate_map_cache_entry
In-Reply-To: <20240116143622.6641-1-peng.fan@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2401231655530.2287888@ubuntu-linux-20-04-desktop>
References: <20240116143622.6641-1-peng.fan@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Jan 2024, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> xen_invalidate_map_cache_entry is not expected to run in a
> coroutine. Without this, there is crash:
> 
>     signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>     threadid=<optimized out>) at pthread_kill.c:78
>     at /usr/src/debug/glibc/2.38+git-r0/sysdeps/posix/raise.c:26
>     fmt=0xffff9e1ca8a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
>     assertion=assertion@entry=0xaaaae0d25740 "!qemu_in_coroutine()",
>     file=file@entry=0xaaaae0d301a8 "../qemu-xen-dir-remote/block/graph-lock.c", line=line@entry=260,
>     function=function@entry=0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdrv_graph_rdlock_main_loop") at assert.c:92
>     assertion=assertion@entry=0xaaaae0d25740 "!qemu_in_coroutine()",
>     file=file@entry=0xaaaae0d301a8 "../qemu-xen-dir-remote/block/graph-lock.c", line=line@entry=260,
>     function=function@entry=0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdrv_graph_rdlock_main_loop") at assert.c:101
>     at ../qemu-xen-dir-remote/block/graph-lock.c:260
>     at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/include/block/graph-lock.h:259
>     host=host@entry=0xffff742c8000, size=size@entry=2097152)
>     at ../qemu-xen-dir-remote/block/io.c:3362
>     host=0xffff742c8000, size=2097152)
>     at ../qemu-xen-dir-remote/block/block-backend.c:2859
>     host=<optimized out>, size=<optimized out>, max_size=<optimized out>)
>     at ../qemu-xen-dir-remote/block/block-ram-registrar.c:33
>     size=2097152, max_size=2097152)
>     at ../qemu-xen-dir-remote/hw/core/numa.c:883
>     buffer=buffer@entry=0xffff743c5000 "")
>     at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:475
>     buffer=buffer@entry=0xffff743c5000 "")
>     at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:487
>     as=as@entry=0xaaaae1ca3ae8 <address_space_memory>, buffer=0xffff743c5000,
>     len=<optimized out>, is_write=is_write@entry=true,
>     access_len=access_len@entry=32768)
>     at ../qemu-xen-dir-remote/system/physmem.c:3199
>     dir=DMA_DIRECTION_FROM_DEVICE, len=<optimized out>,
>     buffer=<optimized out>, as=0xaaaae1ca3ae8 <address_space_memory>)
>     at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/include/sysemu/dma.h:236
>     elem=elem@entry=0xaaaaf620aa30, len=len@entry=32769)
>     at ../qemu-xen-dir-remote/hw/virtio/virtio.c:758
>     elem=elem@entry=0xaaaaf620aa30, len=len@entry=32769, idx=idx@entry=0)
>     at ../qemu-xen-dir-remote/hw/virtio/virtio.c:919
>     elem=elem@entry=0xaaaaf620aa30, len=32769)
>     at ../qemu-xen-dir-remote/hw/virtio/virtio.c:994
>     req=req@entry=0xaaaaf620aa30, status=status@entry=0 '\000')
>     at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:67
>     ret=0) at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:136
>     at ../qemu-xen-dir-remote/block/block-backend.c:1559
> --Type <RET> for more, q to quit, c to continue without paging--
>     at ../qemu-xen-dir-remote/block/block-backend.c:1614
>     i1=<optimized out>) at ../qemu-xen-dir-remote/util/coroutine-ucontext.c:177
>     at ../sysdeps/unix/sysv/linux/aarch64/setcontext.S:123
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Hi Peng! Many thanks for the patch and for the investigation!

Only one minor question below


> ---
>  hw/xen/xen-mapcache.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index f7d974677d..4e1bb665ee 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -481,11 +481,38 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
>      g_free(entry);
>  }
>  
> -void xen_invalidate_map_cache_entry(uint8_t *buffer)
> +typedef struct XenMapCacheData {
> +    Coroutine *co;
> +    uint8_t *buffer;
> +    int ret;

Do we need int ret? It doesn't look like we are using it.


> +} XenMapCacheData;
> +
> +static void xen_invalidate_map_cache_entry_bh(void *opaque)
>  {
> +    XenMapCacheData *data = opaque;
> +
>      mapcache_lock();
> -    xen_invalidate_map_cache_entry_unlocked(buffer);
> +    xen_invalidate_map_cache_entry_unlocked(data->buffer);
>      mapcache_unlock();
> +
> +    aio_co_wake(data->co);
> +}
> +
> +void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
> +{
> +    if (qemu_in_coroutine()) {
> +        XenMapCacheData data = {
> +            .co = qemu_coroutine_self(),
> +            .buffer = buffer,
> +        };
> +        aio_bh_schedule_oneshot(qemu_get_current_aio_context(),
> +                                xen_invalidate_map_cache_entry_bh, &data);
> +        qemu_coroutine_yield();
> +    } else {
> +        mapcache_lock();
> +        xen_invalidate_map_cache_entry_unlocked(buffer);
> +        mapcache_unlock();
> +    }
>  }
>  
>  void xen_invalidate_map_cache(void)
> -- 
> 2.35.3
> 

