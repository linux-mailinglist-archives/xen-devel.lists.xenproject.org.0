Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2F7607F1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569328.889934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9bE-0001XW-Lb; Tue, 25 Jul 2023 04:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569328.889934; Tue, 25 Jul 2023 04:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9bE-0001Vq-Ft; Tue, 25 Jul 2023 04:24:40 +0000
Received: by outflank-mailman (input) for mailman id 569328;
 Tue, 25 Jul 2023 02:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZC3=DL=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qO7u2-0005Dc-MA
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 02:35:59 +0000
Received: from out-41.mta1.migadu.com (out-41.mta1.migadu.com [95.215.58.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fba84dce-2a93-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 04:35:56 +0200 (CEST)
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
X-Inumbo-ID: fba84dce-2a93-11ee-b23c-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690252555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+VnVPZa4UeOCG7Yrfiew8gKr6k3ViuPV5Oe7aKEwA0=;
	b=OouSnERnVUq8t87+qMJi+ElF1O+pkB5HJ/XjlEV4XPIdaL5qKz/r9JLMMUeUfOnb3ZMOdj
	khOpzTQ2idnb6S4y6b+9cHD3wy9I4UTOUPXGpsseW4bB+Gm8jsDjdu3ImL8BlNp++kk+K8
	DDellGRauVWKhKhaf7FrGB51gwHD7wU=
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-2-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 10:35:01 +0800
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
Message-Id: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> The mm/vmscan.c file is too large, so separate the shrinker-related
> code from it into a separate file. No functional changes.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> include/linux/shrinker.h |   3 +
> mm/Makefile              |   4 +-
> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
> mm/vmscan.c              | 701 --------------------------------------
> 4 files changed, 712 insertions(+), 703 deletions(-)
> create mode 100644 mm/shrinker.c
>=20
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 224293b2dd06..961cb84e51f5 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -96,6 +96,9 @@ struct shrinker {
>  */
> #define SHRINKER_NONSLAB (1 << 3)
>=20
> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup =
*memcg,
> +			   int priority);

A good cleanup, vmscan.c is so huge.

I'd like to introduce a new header in mm/ directory and contains those
declarations of functions (like this and other debug function in
shrinker_debug.c) since they are used internally across mm.

Thanks.


