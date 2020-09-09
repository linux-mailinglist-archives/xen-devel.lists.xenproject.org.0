Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59F2626B6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 07:19:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFsVc-0007cT-2Z; Wed, 09 Sep 2020 05:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c0kD=CS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFsVa-0007cK-Sh
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 05:19:02 +0000
X-Inumbo-ID: c3e82905-d1ef-45ac-804c-d46c0ed607d7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3e82905-d1ef-45ac-804c-d46c0ed607d7;
 Wed, 09 Sep 2020 05:19:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8F73ACBA;
 Wed,  9 Sep 2020 05:19:00 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] xen/balloon: try to merge system ram resources
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-7-david@redhat.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <64d7a2ce-e3b5-3525-d977-76a4bb06e52d@suse.com>
Date: Wed, 9 Sep 2020 07:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908201012.44168-7-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.09.20 22:10, David Hildenbrand wrote:
> Let's try to merge system ram resources we add, to minimize the number
> of resources in /proc/iomem. We don't care about the boundaries of
> individual chunks we added.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juergen Gross <jgross@suse.com>

Juergen

> ---
>   drivers/xen/balloon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index 7bac38764513d..b57b2067ecbfb 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -331,7 +331,7 @@ static enum bp_state reserve_additional_memory(void)
>   	mutex_unlock(&balloon_mutex);
>   	/* add_memory_resource() requires the device_hotplug lock */
>   	lock_device_hotplug();
> -	rc = add_memory_resource(nid, resource, 0);
> +	rc = add_memory_resource(nid, resource, MEMHP_MERGE_RESOURCE);
>   	unlock_device_hotplug();
>   	mutex_lock(&balloon_mutex);
>   
> 


