Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B3762DE3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570136.891593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZ4Y-0000sJ-Ve; Wed, 26 Jul 2023 07:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570136.891593; Wed, 26 Jul 2023 07:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZ4Y-0000qR-SY; Wed, 26 Jul 2023 07:36:38 +0000
Received: by outflank-mailman (input) for mailman id 570136;
 Wed, 26 Jul 2023 07:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOZ4X-0000qI-6F
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:36:37 +0000
Received: from out-62.mta0.migadu.com (out-62.mta0.migadu.com
 [2001:41d0:1004:224b::3e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25cdabc3-2b87-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 09:36:35 +0200 (CEST)
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
X-Inumbo-ID: 25cdabc3-2b87-11ee-b242-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690356994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yrw1e5tQhbkMga7eJrUip2ycPtsuLn9P74mG8ros/F0=;
	b=XkkSjxLZhEs+WTu6Lxce6yw56JkcjLLE3W9mi8l7oiUYes2Mt2Kx9x4+hwiBhDOxzRpaVC
	pfsRiMgi/wQngx46uSL66saqLbu8FkMymz5gIEi/n4cwHkh93N7+NRLIrXwMgbBpn3V0mr
	W8L4NvyZa4l7hBRrr+6H7xx0fZlpIGk=
MIME-Version: 1.0
Subject: Re: [PATCH v2 29/47] vmw_balloon: dynamically allocate the
 vmw-balloon shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-30-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:35:42 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 david@fromorbit.com,
 tkhai@ya.ru,
 Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 tytso@mit.edu,
 steven.price@arm.com,
 cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 yujie.liu@intel.com,
 gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com,
 linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <1D40C9FD-84F6-40BA-8D2C-0DF05882C933@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-30-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the vmw-balloon shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct vmballoon.
> 
> And we can simply exit vmballoon_init() when registering the shrinker
> fails. So the shrinker_registered indication is redundant, just remove it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Nice cleanup.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



