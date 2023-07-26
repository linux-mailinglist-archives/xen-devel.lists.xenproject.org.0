Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A27762CD6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570105.891503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYij-0002GX-8x; Wed, 26 Jul 2023 07:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570105.891503; Wed, 26 Jul 2023 07:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYij-0002Dt-5e; Wed, 26 Jul 2023 07:14:05 +0000
Received: by outflank-mailman (input) for mailman id 570105;
 Wed, 26 Jul 2023 07:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOYih-0002Dj-LB
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:14:03 +0000
Received: from out-3.mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff11c44a-2b83-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 09:14:01 +0200 (CEST)
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
X-Inumbo-ID: ff11c44a-2b83-11ee-8613-37d641c3527e
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690355641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGcKZp3hFkU5xFrSCjAkw6H7DFoCu3eaWoJYWwGl/BE=;
	b=oAdnd9nZjeI3kyPEsvbWMnutbGwA6A/dnneU8CJq7+Jt5loXWooRhnwIByjGtqjMSkXONA
	pNjiGN0aO6zYh0sGJrXLfhIGW2JwY9JyCA6cMT7CdHDW/adI6zyBptMVHroPA7pSViOJ/f
	hCfYb58R4eJqbPwcBX6PzM13HtrcK50=
MIME-Version: 1.0
Subject: Re: [PATCH v2 21/47] mm: workingset: dynamically allocate the
 mm-shadow shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-22-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:13:37 +0800
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <08F2140B-0684-4FB0-8FB9-CEB88882F884@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-22-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> Use new APIs to dynamically allocate the mm-shadow shrinker.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> mm/workingset.c | 26 ++++++++++++++------------
> 1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 4686ae363000..4bc85f739b13 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -762,12 +762,7 @@ static unsigned long scan_shadow_nodes(struct =
shrinker *shrinker,
> NULL);
> }
>=20
> -static struct shrinker workingset_shadow_shrinker =3D {
> -	.count_objects =3D count_shadow_nodes,
> -	.scan_objects =3D scan_shadow_nodes,
> -	.seeks =3D 0, /* ->count reports only fully expendable nodes */
> -	.flags =3D SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
> -};
> +static struct shrinker *workingset_shadow_shrinker;


Same as patch #17.=

