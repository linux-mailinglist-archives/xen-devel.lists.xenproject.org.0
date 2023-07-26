Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70029762C8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570098.891473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYb4-00087N-1d; Wed, 26 Jul 2023 07:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570098.891473; Wed, 26 Jul 2023 07:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYb3-00085N-UR; Wed, 26 Jul 2023 07:06:09 +0000
Received: by outflank-mailman (input) for mailman id 570098;
 Wed, 26 Jul 2023 07:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOYb1-00085E-Ty
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:06:07 +0000
Received: from out-7.mta1.migadu.com (out-7.mta1.migadu.com
 [2001:41d0:203:375::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b6cf1b-2b82-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 09:06:07 +0200 (CEST)
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
X-Inumbo-ID: e3b6cf1b-2b82-11ee-b242-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690355165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qP6Rsnsz9/WW+azSq2vXZZSPSLEyAJb/Z8peE40gYgo=;
	b=vw9dtxapJigzblTo3NGynfsv+/mQB1bNWjl6Q4rEAUF9PXc7LtA8X1zBeOoHG+17byUEV5
	rePGXHXPmPLeGOzGrE1/eqTwEdZgvDm17pzQtihT75dgxUeL35Q3sxqIVQekgyvV9/7bXJ
	pXhSlPCuY6BK9bze6xRNH/dP9jDuXVc=
MIME-Version: 1.0
Subject: Re: [PATCH v2 18/47] rcu: dynamically allocate the rcu-kfree shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-19-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:05:26 +0800
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
 senozhatsky@chromium.org,
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
Message-Id: <07191509-5186-487B-96D5-F859498CB93E@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-19-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> kernel/rcu/tree.c | 21 +++++++++++++--------
> 1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 1449cb69a0e0..d068ce3567fc 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3445,12 +3445,7 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, =
struct shrink_control *sc)
> return freed =3D=3D 0 ? SHRINK_STOP : freed;
> }
>=20
> -static struct shrinker kfree_rcu_shrinker =3D {
> -	.count_objects =3D kfree_rcu_shrink_count,
> -	.scan_objects =3D kfree_rcu_shrink_scan,
> -	.batch =3D 0,
> -	.seeks =3D DEFAULT_SEEKS,
> -};
> +static struct shrinker *kfree_rcu_shrinker;

Same as patch #17.=

