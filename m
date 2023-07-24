Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10EA75F643
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568890.888996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNueI-0007er-Jf; Mon, 24 Jul 2023 12:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568890.888996; Mon, 24 Jul 2023 12:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNueI-0007cP-G5; Mon, 24 Jul 2023 12:26:50 +0000
Received: by outflank-mailman (input) for mailman id 568890;
 Mon, 24 Jul 2023 12:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvSe=DK=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qNueG-0007cJ-OT
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:26:49 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a224237-2a1d-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:26:46 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qNudM-004Ned-Mr; Mon, 24 Jul 2023 12:25:53 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B0440300195;
 Mon, 24 Jul 2023 14:25:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5C178266885CD; Mon, 24 Jul 2023 14:25:49 +0200 (CEST)
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
X-Inumbo-ID: 5a224237-2a1d-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FgtQe2iC/0NBUdTIYwU6FvaIC/2mZu3i/WpphGYT+1k=; b=ZIw/NB6uEo0641+Wq8EzNrbHBV
	rrdS2AkdlanLUW4jtuNV7YJmE8dx65rhuqNN6d+O2A+YB9l53nFIBcRLIER24dz2SZGSbQpUdfRFt
	O+SQB8u46jmJ0V3lkB2dv55l0XkOFJ2vLXAjC15/xKJogcvcsepgRzVe5Zf2VfboPt9BBV/mRWBu/
	r1HeDooSZKO8KrM91YanEuhJbHVgQEIeOAYvY50OE9Oa0XF31R7B/jnZvsmScHku30xY6VnjseHTr
	PXjdkkROSxxW+REohqgqj+xc5EAtZBuKqFbmv/xo9QoVvk4ORWEH1k1N/to1rfbfNrbjLNy69S5M/
	AYY+hq7g==;
Date: Mon, 24 Jul 2023 14:25:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
	steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
	yujie.liu@intel.com, gregkh@linuxfoundation.org,
	muchun.song@linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org, netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v2 03/47] mm: shrinker: add infrastructure for
 dynamically allocating shrinker
Message-ID: <20230724122549.GA3731903@hirez.programming.kicks-ass.net>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724094354.90817-4-zhengqi.arch@bytedance.com>

On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:

> +void shrinker_unregister(struct shrinker *shrinker)
> +{
> +	struct dentry *debugfs_entry;
> +	int debugfs_id;
> +
> +	if (!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))
> +		return;
> +
> +	down_write(&shrinker_rwsem);
> +	list_del(&shrinker->list);
> +	shrinker->flags &= ~SHRINKER_REGISTERED;
> +	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
> +		unregister_memcg_shrinker(shrinker);
> +	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
> +	up_write(&shrinker_rwsem);
> +
> +	shrinker_debugfs_remove(debugfs_entry, debugfs_id);

Should there not be an rcu_barrier() right about here?

> +
> +	kfree(shrinker->nr_deferred);
> +	shrinker->nr_deferred = NULL;
> +
> +	kfree(shrinker);
> +}
> +EXPORT_SYMBOL(shrinker_unregister);


