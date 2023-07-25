Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2378760E69
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 11:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569581.890444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOEDT-0001Dj-Oh; Tue, 25 Jul 2023 09:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569581.890444; Tue, 25 Jul 2023 09:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOEDT-0001BY-Ly; Tue, 25 Jul 2023 09:20:27 +0000
Received: by outflank-mailman (input) for mailman id 569581;
 Tue, 25 Jul 2023 09:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZC3=DL=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOEDS-0001BR-SY
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 09:20:26 +0000
Received: from out-26.mta0.migadu.com (out-26.mta0.migadu.com
 [2001:41d0:1004:224b::1a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ca1e757-2acc-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 11:20:25 +0200 (CEST)
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
X-Inumbo-ID: 7ca1e757-2acc-11ee-b23d-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690276823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWqqPzpNBtB6jTVVrWh0b/e9soljzkJiIrV3enhBysE=;
	b=hQXVvzFcrWWWpy9SLwyFzJJZuDADbBS2OdiYg60cVhz1X3iYVafxnHWqF9F5gbQE+t5rUv
	I46fSuLx9fxRRB/KaBl036o5sGpNNMaguRBPQls2fbyMfQnAsVHD21W1LE1DjorXmO7V65
	cgmVLn1Ua4w1+HIDSsYSdCmvQqociDo=
MIME-Version: 1.0
Subject: Re: [PATCH v2 06/47] drm/ttm: dynamically allocate the drm-ttm_pool
 shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-7-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 17:19:40 +0800
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
Content-Transfer-Encoding: 7bit
Message-Id: <1A349AE9-C4B3-42EB-B2D6-018583CCB102@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-7-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the drm-ttm_pool shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.


