Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23E762D73
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570130.891573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYwA-0007Ci-Ut; Wed, 26 Jul 2023 07:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570130.891573; Wed, 26 Jul 2023 07:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYwA-0007Ab-Rc; Wed, 26 Jul 2023 07:27:58 +0000
Received: by outflank-mailman (input) for mailman id 570130;
 Wed, 26 Jul 2023 07:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOYw9-0007AK-3t
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:27:57 +0000
Received: from out-17.mta0.migadu.com (out-17.mta0.migadu.com
 [2001:41d0:1004:224b::11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f02c2c96-2b85-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 09:27:56 +0200 (CEST)
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
X-Inumbo-ID: f02c2c96-2b85-11ee-b242-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690356475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kddOZo1OB/dnx2Sd2Hp9HvVcJFH2vK8XN/l3RDrCzYA=;
	b=a/sL/5lBqKAXrNPPoGDoF4xs326hzfVSG6fDcE24LmH82hZ/SqypmSeuU9lQJ3KTx+xcp1
	7al1E8o2xtQTLBYQCCJl5EzU27s8InsUsoNIWntcSz8ycucQarnPdtrwtOYnknCdh1RCgu
	fJXvZ2Nwuby67i5oc/L72SWSvxqIPXA=
MIME-Version: 1.0
Subject: Re: [PATCH v2 27/47] md/raid5: dynamically allocate the md-raid5
 shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-28-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:27:13 +0800
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
Message-Id: <8A1603B9-570E-45DE-9597-90C3E2825A7A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-28-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the md-raid5 shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct r5conf.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



