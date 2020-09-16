Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B320A26C2F9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:52:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWvY-0001q5-T5; Wed, 16 Sep 2020 12:52:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vwKx=CZ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kIWvX-0001pu-MQ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:52:47 +0000
X-Inumbo-ID: 6b06f330-d877-4884-ab9a-88bd693b4378
Received: from out30-45.freemail.mail.aliyun.com (unknown [115.124.30.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b06f330-d877-4884-ab9a-88bd693b4378;
 Wed, 16 Sep 2020 12:52:46 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R811e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0U97x1PB_1600260761; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U97x1PB_1600260761) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Sep 2020 20:52:41 +0800
Date: Wed, 16 Sep 2020 20:52:41 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>,
 Andrew Morton <akpmt@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH v4 7/8] xen/balloon: try to merge system ram resources
Message-ID: <20200916125241.GA48127@L-31X9LVDL-1304.local>
References: <20200911103459.10306-1-david@redhat.com>
 <20200911103459.10306-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200911103459.10306-8-david@redhat.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 11, 2020 at 12:34:58PM +0200, David Hildenbrand wrote:
>Let's try to merge system ram resources we add, to minimize the number
>of resources in /proc/iomem. We don't care about the boundaries of
>individual chunks we added.
>
>Reviewed-by: Juergen Gross <jgross@suse.com>
>Cc: Andrew Morton <akpmt@linux-foundation.org>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>Cc: Juergen Gross <jgross@suse.com>
>Cc: Stefano Stabellini <sstabellini@kernel.org>
>Cc: Roger Pau Monné <roger.pau@citrix.com>
>Cc: Julien Grall <julien@xen.org>
>Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>Cc: Baoquan He <bhe@redhat.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

>---
> drivers/xen/balloon.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
>index 9f40a294d398d..b57b2067ecbfb 100644
>--- a/drivers/xen/balloon.c
>+++ b/drivers/xen/balloon.c
>@@ -331,7 +331,7 @@ static enum bp_state reserve_additional_memory(void)
> 	mutex_unlock(&balloon_mutex);
> 	/* add_memory_resource() requires the device_hotplug lock */
> 	lock_device_hotplug();
>-	rc = add_memory_resource(nid, resource, MHP_NONE);
>+	rc = add_memory_resource(nid, resource, MEMHP_MERGE_RESOURCE);
> 	unlock_device_hotplug();
> 	mutex_lock(&balloon_mutex);
> 
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

