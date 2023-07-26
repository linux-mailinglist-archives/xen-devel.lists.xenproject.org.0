Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5390A763230
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570240.891892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOary-0004Nd-QT; Wed, 26 Jul 2023 09:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570240.891892; Wed, 26 Jul 2023 09:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOary-0004LW-Nj; Wed, 26 Jul 2023 09:31:46 +0000
Received: by outflank-mailman (input) for mailman id 570240;
 Wed, 26 Jul 2023 09:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOarw-0003z4-8p
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:31:44 +0000
Received: from out-63.mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b3b2762-2b97-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 11:31:43 +0200 (CEST)
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
X-Inumbo-ID: 3b3b2762-2b97-11ee-b242-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690363901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9JATXkXZaN7f0jrXVOoaEMLIPnzZ4EB9BwhBVu88/k=;
	b=BJaw31GHkPVMB5J3bFLk7nCWUXBih3Evut0vs64rGABml16vhPPP+VTCvSpnvcgPtpNdnt
	lUE24RniQLpCmG5kFgpHNW+1PDmB/qhB9l9vhPT5YKqpl2p08nrVkD19PS1VqQI3/KFSOu
	LvMc1Yox7zbU5EqPQ+5oAKbHUZVLA0E=
MIME-Version: 1.0
Subject: Re: [PATCH v2 43/47] mm: shrinker: add a secondary array for
 shrinker_info::{map, nr_deferred}
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-44-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 17:30:53 +0800
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
 Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev <netdev@vger.kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <B421DD89-09B5-4488-BEC1-D6F88C6DE75A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-44-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> Currently, we maintain two linear arrays per node per memcg, which are
> shrinker_info::map and shrinker_info::nr_deferred. And we need to =
resize
> them when the shrinker_nr_max is exceeded, that is, allocate a new =
array,
> and then copy the old array to the new array, and finally free the old
> array by RCU.
>=20
> For shrinker_info::map, we do set_bit() under the RCU lock, so we may =
set
> the value into the old map which is about to be freed. This may cause =
the
> value set to be lost. The current solution is not to copy the old map =
when
> resizing, but to set all the corresponding bits in the new map to 1. =
This
> solves the data loss problem, but bring the overhead of more pointless
> loops while doing memcg slab shrink.
>=20
> For shrinker_info::nr_deferred, we will only modify it under the read =
lock
> of shrinker_rwsem, so it will not run concurrently with the resizing. =
But
> after we make memcg slab shrink lockless, there will be the same data =
loss
> problem as shrinker_info::map, and we can't work around it like the =
map.
>=20
> For such resizable arrays, the most straightforward idea is to change =
it
> to xarray, like we did for list_lru [1]. We need to do xa_store() in =
the
> list_lru_add()-->set_shrinker_bit(), but this will cause memory
> allocation, and the list_lru_add() doesn't accept failure. A possible
> solution is to pre-allocate, but the location of pre-allocation is not
> well determined.
>=20
> Therefore, this commit chooses to introduce a secondary array for
> shrinker_info::{map, nr_deferred}, so that we only need to copy this
> secondary array every time the size is resized. Then even if we get =
the
> old secondary array under the RCU lock, the found map and nr_deferred =
are
> also true, so no data is lost.
>=20
> [1]. =
https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@bytedance.c=
om/
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



