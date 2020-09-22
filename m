Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A54E273B9B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKcYz-0006HW-3O; Tue, 22 Sep 2020 07:18:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKcYx-0006HR-Uk
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:18:07 +0000
X-Inumbo-ID: 27a6a41c-292c-4962-b880-414f042e96c5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27a6a41c-292c-4962-b880-414f042e96c5;
 Tue, 22 Sep 2020 07:18:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600759086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwSXYB3yBaaHs8kEF7Qgm7/JHKCd5+0qrfjd7HktPc8=;
 b=bbIOHY+NVQZY9mBhhRLvhsbkScTSwLr0LAYX8KY11ZYRhoeKPo4sIoy4lXgMzYqc938qzU
 h87KFyMOpZpFVAm+awMD7Ge0y3sE0fx3xc5MHvZAXqbFw5RBmc13X/NJ3Vzee9DE/dbeXk
 4lNGdmSbE7c+5YshhXpsCQcrlYnBMb8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD668AB54;
 Tue, 22 Sep 2020 07:18:42 +0000 (UTC)
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
To: SeongJae Park <sjpark@amazon.com>, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Cc: SeongJae Park <sjpark@amazon.de>, axboe@kernel.dk, aliguori@amazon.com,
 amit@kernel.org, mheyne@amazon.de, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20200922070125.27251-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5fd34475-c296-c4f3-2bac-180c166449fe@suse.com>
Date: Tue, 22 Sep 2020 09:18:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922070125.27251-1-sjpark@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 22.09.20 09:01, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> Persistent grants feature provides high scalability.  On some small
> systems, however, it could incur data copy overhead[1] and thus it is
> required to be disabled.  But, there is no option to disable it.  For
> the reason, this commit adds a module parameter for disabling of the
> feature.
> 
> [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> 
> Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> ---
>   .../ABI/testing/sysfs-driver-xen-blkback        |  8 ++++++++
>   drivers/block/xen-blkback/xenbus.c              | 17 ++++++++++++++---
>   2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> index ecb7942ff146..0c42285c75ee 100644
> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> @@ -35,3 +35,11 @@ Description:
>                   controls the duration in milliseconds that blkback will not
>                   cache any page not backed by a grant mapping.
>                   The default is 10ms.
> +
> +What:           /sys/module/xen_blkback/parameters/feature_persistent
> +Date:           September 2020
> +KernelVersion:  5.10
> +Contact:        SeongJae Park <sjpark@amazon.de>
> +Description:
> +                Whether to enable the persistent grants feature or not.
> +                The default is 1 (enable).
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index b9aa5d1ac10b..9c03d70469f4 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
>   
>   /* ** Connection ** */
>   
> +/* Enable the persistent grants feature. */
> +static unsigned int feature_persistent = 1;

Use bool, please.

> +module_param_named(feature_persistent, feature_persistent, int, 0644);

module_param()

> +MODULE_PARM_DESC(feature_persistent,
> +		"Enables the persistent grants feature");
> +
>   /*
>    * Write the physical details regarding the block device to the store, and
>    * switch to Connected state.
> @@ -906,7 +912,8 @@ static void connect(struct backend_info *be)
>   
>   	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
>   
> -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> +	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> +			feature_persistent ? 1 : 0);

Using bool above should allow to just use the value of
feature_persistent here.


Juergen

